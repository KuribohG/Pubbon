#include "llvm_env.hpp"
#include "translate.hpp"
#include "opcode.h"
#include "code.h"

#include <iostream>
#include <string>
#include <vector>
#include <stack>
#include <memory>

#include "llvm/IR/Verifier.h"

using namespace llvm;
using namespace llvm::orc;

LLVMContext TheContext;
IRBuilder<> Builder(TheContext);
std::unique_ptr<Module> TheModule;
LlvmEnv *TheJIT;

StructType *PyObjectTy, *PyCodeObjectTy, *PyFrameObjectTy;
PointerType *PyObjectPtrTy, *PyCodeObjectPtrTy, *PyFrameObjectPtrTy;
FunctionType *funcType;

Value *TrueCnst, *FalseCnst;

Function *PyIncref;
Function *PyDecref;
Function *PyXDecref;
Function *BinaryAdd;
Function *BinarySubtract;
Function *BinarySubscr;
Function *BinaryLshift;
Function *BinaryRshift;
Function *BinaryAnd;
Function *BinaryXor;
Function *BinaryOr;
Function *InplaceAdd;
Function *InplaceSubtract;
Function *SequenceContains;
Function *SequenceNotContains;
Function *RichCompare;
Function *AsCond;
Function *LoadGlobal;
Function *LoadFast;
Function *StoreFast;
Function *CallFunction;

Function *ToDouble;
Function *FromDouble;

void InitializeModule() {
    SMDiagnostic err;
    std::string source_file("/Users/zouyuheng/workspace/Pubbon/Pubbon/function.ll");
    TheModule = parseIRFile(source_file, err, TheContext);
    PyObjectTy = TheModule->getTypeByName("struct._object");
    PyObjectPtrTy = PyObjectTy->getPointerTo();
    PyCodeObjectTy = TheModule->getTypeByName("struct.PyCodeObject");
    PyCodeObjectPtrTy = PyCodeObjectTy->getPointerTo();
    PyFrameObjectTy = TheModule->getTypeByName("struct._frame");
    PyFrameObjectPtrTy = PyFrameObjectTy->getPointerTo();
    std::vector<Type*> param(1, PyFrameObjectPtrTy);
    funcType = FunctionType::get(PyObjectPtrTy, param, false);
    TheJIT = new LlvmEnv(std::move(TheModule));

    TrueCnst = ConstantExpr::getIntToPtr(ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)Py_True), PyObjectPtrTy);;
    FalseCnst = ConstantExpr::getIntToPtr(ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)Py_False), PyObjectPtrTy);;
	/*
    PyIncref = TheJIT->getFunction("PyIncref");
    PyDecref = TheJIT->getFunction("PyDecref");
    PyXDecref = TheJIT->getFunction("PyXDecref");
    BinaryAdd = TheJIT->getFunction("BinaryAdd");
    BinarySubtract = TheJIT->getFunction("BinarySubtract");
    BinarySubscr = TheJIT->getFunction("BinarySubscr");
    BinaryLshift = TheJIT->getFunction("BinaryLshift");
    BinaryRshift = TheJIT->getFunction("BinaryRshift");
    BinaryAnd = TheJIT->getFunction("BinaryAnd");
    BinaryXor = TheJIT->getFunction("BinaryXor");
    BinaryOr = TheJIT->getFunction("BinaryOr");
    InplaceAdd = TheJIT->getFunction("InplaceAdd");
    InplaceSubtract = TheJIT->getFunction("InplaceSubtract");
    SequenceContains = TheJIT->getFunction("SequenceContains");
    SequenceNotContains = TheJIT->getFunction("SequenceNotContains");
    RichCompare = TheJIT->getFunction("RichCompare");
    AsCond = TheJIT->getFunction("AsCond");
    LoadGlobal = TheJIT->getFunction("LoadGlobal");
    LoadFast = TheJIT->getFunction("LoadFast");
    StoreFast = TheJIT->getFunction("StoreFast");
    CallFunction = TheJIT->getFunction("CallFunction");
    */
    ToDouble = TheJIT->getFunction("ToDouble");
    FromDouble = TheJIT->getFunction("FromDouble");
}

inline Value *AsConstantPtr(PyObject *val)
{
    ConstantInt *addressInt = ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)val);
    return ConstantExpr::getIntToPtr(addressInt, PyObjectPtrTy);
}

bool Translate(PyFrameObject *frame) {
    PyCodeObject *code = frame->f_code;
    PyObject *names = code->co_names;
    PyObject *consts = code->co_consts;

    bool flag = true;
    Value **stack = new Value *[code->co_stacksize];
    int stackDepth = 0;
	auto byteCode = (_Py_CODEUNIT *)PyBytes_AsString(code->co_code);
    auto size = PyBytes_Size(code->co_code) / sizeof(_Py_CODEUNIT);
    BasicBlock **label = new BasicBlock *[size];
    for (int i = 0; i < size; ++i) label[i] = BasicBlock::Create(TheContext);
    std::stack<Block> blockStack;

    char *str = PyUnicode_AsUTF8(code->co_name);
    Module *M = TheJIT->getModuleForNewFunction(str);

    PyIncref = TheJIT->getFunction("PyIncref");
    PyDecref = TheJIT->getFunction("PyDecref");
    PyXDecref = TheJIT->getFunction("PyXDecref");
    BinaryAdd = TheJIT->getFunction("BinaryAdd");
    BinarySubtract = TheJIT->getFunction("BinarySubtract");
    BinarySubscr = TheJIT->getFunction("BinarySubscr");
    BinaryLshift = TheJIT->getFunction("BinaryLshift");
    BinaryRshift = TheJIT->getFunction("BinaryRshift");
    BinaryAnd = TheJIT->getFunction("BinaryAnd");
    BinaryXor = TheJIT->getFunction("BinaryXor");
    BinaryOr = TheJIT->getFunction("BinaryOr");
    InplaceAdd = TheJIT->getFunction("InplaceAdd");
    InplaceSubtract = TheJIT->getFunction("InplaceSubtract");
    SequenceContains = TheJIT->getFunction("SequenceContains");
    SequenceNotContains = TheJIT->getFunction("SequenceNotContains");
    RichCompare = TheJIT->getFunction("RichCompare");
    AsCond = TheJIT->getFunction("AsCond");
    LoadGlobal = TheJIT->getFunction("LoadGlobal");
    LoadFast = TheJIT->getFunction("LoadFast");
    StoreFast = TheJIT->getFunction("StoreFast");
    CallFunction = TheJIT->getFunction("CallFunction");

    Function *newFunc = Function::Create(funcType, Function::ExternalLinkage, str, M);
    // BasicBlock *BB = BasicBlock::Create(TheContext, "entry", newFunc);
    // Builder.SetInsertPoint(BB);
    Argument *runFrame = &*newFunc->arg_begin();
    runFrame->setName("frame");

    for (int i = 0; i < size; ++i) {
        auto opcode = _Py_OPCODE(byteCode[i]);
        auto oparg = _Py_OPARG(byteCode[i]);
        // printf("-- %u %u\n", opcode, oparg);
        bool continuity = true;
        label[i]->insertInto(newFunc);
        Builder.SetInsertPoint(label[i]);
        switch (opcode) {
        case LOAD_GLOBAL: {
            PyObject *name = PyTuple_GetItem(names, oparg);
            Value *val = Builder.CreateCall(LoadGlobal, std::vector<Value *>{runFrame, AsConstantPtr(name)});
            stack[stackDepth++] = val;
            break;
        }
        case LOAD_CONST: {
            Value *val = AsConstantPtr(PyTuple_GetItem(consts, oparg));
            Builder.CreateCall(PyIncref, std::vector<Value *>{val});
            stack[stackDepth++] = val;
            break;
        }
        case LOAD_FAST: {
            ConstantInt *idx = ConstantInt::get(Type::getInt32Ty(TheContext), (int32_t)oparg);
            Value *val = Builder.CreateCall(LoadFast, std::vector<Value *>{runFrame, idx});
            stack[stackDepth++] = val;
            break;
        }
        case STORE_FAST: {
            ConstantInt *idx = ConstantInt::get(Type::getInt32Ty(TheContext), (int32_t)oparg);
            Value *val = stack[--stackDepth];
            Builder.CreateCall(StoreFast, std::vector<Value *>{runFrame, idx, val});
            break;
        }
        case JUMP_FORWARD: {
            Builder.CreateBr(label[i + oparg / sizeof(_Py_CODEUNIT) + 1]);
            continuity = false;
            break;
        }
        case POP_JUMP_IF_FALSE: {
            Value *val = stack[--stackDepth];
            Value *cond = Builder.CreateCall(AsCond, std::vector<Value *>{val});
            cond = Builder.CreateTrunc(cond, Type::getInt1Ty(TheContext));
            Builder.CreateCall(PyDecref, std::vector<Value *>{val});
            Builder.CreateCondBr(cond, label[i + 1], label[oparg / sizeof(_Py_CODEUNIT)]);
            continuity = false;
            break;
        }
        case POP_JUMP_IF_TRUE: {
            Value *val = stack[--stackDepth];
            Value *cond = Builder.CreateCall(AsCond, std::vector<Value *>{val});
            cond = Builder.CreateTrunc(cond, Type::getInt1Ty(TheContext));
            Builder.CreateCall(PyDecref, std::vector<Value *>{val});
            Builder.CreateCondBr(cond, label[oparg / sizeof(_Py_CODEUNIT)], label[i + 1]);
            continuity = false;
            break;
        }
        case SETUP_LOOP: {
            blockStack.push(Block(opcode, i + oparg / sizeof(_Py_CODEUNIT) + 1, stackDepth));
            break;
        }
        case BREAK_LOOP: {
            Block block = blockStack.top();
            for (int tempDepth = stackDepth; tempDepth > block.level; --tempDepth) {
                Value *val = stack[tempDepth - 1];
                Builder.CreateCall(PyXDecref, std::vector<Value *>{val});
            }
            Builder.CreateBr(label[block.handler]);
            continuity = false;
            break;
        }
        case CONTINUE_LOOP:
        case JUMP_ABSOLUTE: {
            Builder.CreateBr(label[oparg / sizeof(_Py_CODEUNIT)]);
            continuity = false;
            break;
        }
        case POP_BLOCK: {
            Block block = blockStack.top();
            blockStack.pop();
            while (stackDepth > block.level) {
                Value *val = stack[--stackDepth];
                Builder.CreateCall(PyXDecref, std::vector<Value *>{val});
            }
            break;
        }
        case COMPARE_OP: {
            if (oparg == PyCmp_EXC_MATCH) {
                flag = false;
                break;
            }
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            Value *cond, *res, *op;
            switch (oparg) {
            case PyCmp_IS:
                cond = Builder.CreateICmpEQ(left, right);
                res = Builder.CreateSelect(cond, TrueCnst, FalseCnst);
                Builder.CreateCall(PyIncref, std::vector<Value *>{res});
                break;
            case PyCmp_IS_NOT:
                cond = Builder.CreateICmpNE(left, right);
                res = Builder.CreateSelect(cond, TrueCnst, FalseCnst);
                Builder.CreateCall(PyIncref, std::vector<Value *>{res});
                break;
            case PyCmp_IN:
                res = Builder.CreateCall(SequenceContains, std::vector<Value *>{right, left});
                break;
            case PyCmp_NOT_IN:
                res = Builder.CreateCall(SequenceNotContains, std::vector<Value *>{right, left});
                break;
            default:
                op = ConstantInt::get(Type::getInt32Ty(TheContext), (int32_t)oparg);
                res = Builder.CreateCall(RichCompare, std::vector<Value *>{left, right, op});
                break;
            }
            Builder.CreateCall(PyDecref, std::vector<Value *>{left});
            Builder.CreateCall(PyDecref, std::vector<Value *>{right});
            stack[stackDepth++] = res;
            break;
        }
        case BINARY_ADD: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateCall(BinaryAdd, std::vector<Value *>{left, right});
            break;
        }
        case BINARY_SUBTRACT: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateCall(BinarySubtract, std::vector<Value *>{left, right});
            break;
        }
        case BINARY_SUBSCR: {
            Value *sub = stack[--stackDepth];
            Value *container = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateCall(BinarySubscr, std::vector<Value *>{container, sub});
            break;
        }
        case BINARY_LSHIFT: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateCall(BinaryLshift, std::vector<Value *>{left, right});
            break;
        }
        case BINARY_RSHIFT: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateCall(BinaryRshift, std::vector<Value *>{left, right});
            break;
        }
        case BINARY_AND: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateCall(BinaryAnd, std::vector<Value *>{left, right});
            break;
        }
        case BINARY_XOR: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateCall(BinaryXor, std::vector<Value *>{left, right});
            break;
        }
        case BINARY_OR: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateCall(BinaryOr, std::vector<Value *>{left, right});
            break;
        }
        case INPLACE_ADD: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateCall(InplaceAdd, std::vector<Value *>{left, right});
            break;
        }
        case INPLACE_SUBTRACT: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateCall(InplaceSubtract, std::vector<Value *>{left, right});
            break;
        }
        case POP_TOP: {
            Value *val = stack[--stackDepth];
            Builder.CreateCall(PyDecref, std::vector<Value *>{val});
            break;
        }
        case CALL_FUNCTION: {
            std::vector<Value *> args(oparg + 2, nullptr);
            args[0] = stack[stackDepth - oparg - 1];
            args[1] = ConstantInt::get(Type::getInt32Ty(TheContext), (int32_t)oparg);
            for (int j = 0; j < oparg; ++j)
                args[j + 2] = stack[stackDepth - oparg + j];
            stackDepth -= oparg + 1;
            stack[stackDepth++] = Builder.CreateCall(CallFunction, args);
            break;
        }
        case RETURN_VALUE: {
            Builder.CreateRet(stack[--stackDepth]);
            break;
        }
        default: {
            flag = false;
            break;
        }
        }
        if (!flag) break;
        if (i != size - 1 && continuity) Builder.CreateBr(label[i + 1]);
    }
    delete[] stack;
    if (!flag) newFunc->eraseFromParent();
    else
    {
        //newFunc->dump();
    }
    return flag;
}

bool TranslateSpecial(PyFrameObject *frame) {
    PyCodeObject *code = frame->f_code;
    PyObject **fastlocals = frame->f_localsplus;
    PyObject **freevars = frame->f_localsplus + code->co_nlocals;
    PyObject *names = code->co_names;
    PyObject *consts = code->co_consts;

    bool flag = true;
    Value **stack = new Value *[code->co_stacksize];
    int stackDepth = 0;
    auto byteCode = (_Py_CODEUNIT *)PyBytes_AsString(code->co_code);
    auto size = PyBytes_Size(code->co_code) / sizeof(_Py_CODEUNIT);

    char *str = PyUnicode_AsUTF8(code->co_name);
    Module *M = TheJIT->getModuleForNewFunction(str);
    int len = strlen(str);
    char *prefix = new char[len + 20];
    strcpy(prefix, str);
    const char *suffix = "_special";
    strcat(prefix, suffix);
    Function *newFunc = Function::Create(funcType, Function::ExternalLinkage, prefix, M);
    BasicBlock *BB = BasicBlock::Create(TheContext, "entry", newFunc);
    Builder.SetInsertPoint(BB);

    Value **fastlocals_value = new Value *[code->co_nlocals];
    ConstantInt *localsInt = ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)fastlocals);
    for (int i = 0; i < code->co_nlocals; i++) {
        ConstantInt *idx = ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)i);
        Constant *ptr = ConstantExpr::getGetElementPtr(PyObjectPtrTy, ConstantExpr::getIntToPtr(localsInt, PyObjectPtrTy->getPointerTo()), idx);
        Value *val = Builder.CreateLoad(ptr);
        Value *x = Builder.CreateCall(ToDouble, std::vector<Value *>{val});
        fastlocals_value[i] = x;
    }

    for (int i = 0; i < size; i++) {
        auto opcode = _Py_OPCODE(byteCode[i]);
        auto oparg = _Py_OPARG(byteCode[i]);
        switch (opcode) {
        case LOAD_CONST: {
            ConstantInt *addressInt = ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)PyTuple_GetItem(consts, oparg));
            Value *val = ConstantExpr::getIntToPtr(addressInt, PyObjectPtrTy);
            Value *x = Builder.CreateCall(ToDouble, std::vector<Value *>{val});
            stack[stackDepth++] = x;
            break;
        }
        case LOAD_FAST: {
            auto DoublePtrTy = Type::getDoubleTy(TheContext)->getPointerTo();
            ConstantInt *idx = ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)oparg);
            ConstantInt *addressInt = ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)fastlocals_value);
            Constant *ptr = ConstantExpr::getGetElementPtr(DoublePtrTy, ConstantExpr::getIntToPtr(addressInt, DoublePtrTy), idx);
            Value *val = Builder.CreateLoad(ptr);
            stack[stackDepth++] = val;
            break;
        }
        case BINARY_ADD: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateFAdd(left, right);
            break;
        }
        case BINARY_SUBTRACT: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateFSub(left, right);
            break;
        }
        case RETURN_VALUE: {
            Value *val = stack[--stackDepth];
            Value *x = Builder.CreateCall(FromDouble, std::vector<Value *>{val});
            Builder.CreateRet(x);
            break;
        }
        default: {
            flag = false;
            break;
        }
        }
        if(!flag) break;
    }
    delete[] stack;
    delete[] prefix;
    if (!flag) newFunc->eraseFromParent();
    else
    {
        //newFunc->dump();
    }
    return flag;
}
