#include "llvm_env.hpp"
#include "translate.hpp"
#include "opcode.h"
#include "code.h"

#include <string>
#include <vector>
#include <stack>
#include <memory>

using namespace llvm;
using namespace llvm::orc;

LLVMContext TheContext;
IRBuilder<> Builder(TheContext);
std::unique_ptr<Module> TheModule;
std::unique_ptr<LlvmEnv> TheJIT;
Module *M;
std::unique_ptr<legacy::FunctionPassManager> fpm;

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

void InitializeModule() {
    SMDiagnostic err;
    std::string source_file("F:\\Programming\\Python Compiler\\Pubbon\\Pubbon\\function.ll");
    TheModule = parseIRFile(source_file, err, TheContext);
    M = TheModule.get();
    PyObjectTy = TheModule->getTypeByName("struct._object");
    PyObjectPtrTy = PyObjectTy->getPointerTo();
    PyCodeObjectTy = TheModule->getTypeByName("struct.PyCodeObject");
    PyCodeObjectPtrTy = PyCodeObjectTy->getPointerTo();
    PyFrameObjectTy = TheModule->getTypeByName("struct._frame");
    PyFrameObjectPtrTy = PyFrameObjectTy->getPointerTo();
    std::vector<Type*> param(1, PyFrameObjectPtrTy);
    funcType = FunctionType::get(PyObjectPtrTy, param, false);
    TheJIT = make_unique<LlvmEnv>();

    fpm = make_unique<legacy::FunctionPassManager>(M);
    fpm->add(createInstructionCombiningPass());
    fpm->add(createReassociatePass());
    fpm->add(createGVNPass());
    fpm->add(createCFGSimplificationPass());
    fpm->doInitialization();

    TrueCnst = ConstantExpr::getIntToPtr(ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)Py_True), PyObjectPtrTy);;
    FalseCnst = ConstantExpr::getIntToPtr(ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)Py_False), PyObjectPtrTy);;

    PyIncref = M->getFunction("PyIncref");
    fpm->run(*PyIncref);
    PyDecref = M->getFunction("PyDecref");
    fpm->run(*PyDecref);
    PyXDecref = M->getFunction("PyXDecref");
    fpm->run(*PyXDecref);
    BinaryAdd = M->getFunction("BinaryAdd");
    fpm->run(*BinaryAdd);
    BinarySubtract = M->getFunction("BinarySubtract");
    fpm->run(*BinarySubtract);
    BinarySubscr = M->getFunction("BinarySubscr");
    fpm->run(*BinarySubscr);
    BinaryLshift = M->getFunction("BinaryLshift");
    fpm->run(*BinaryLshift);
    BinaryRshift = M->getFunction("BinaryRshift");
    fpm->run(*BinaryRshift);
    BinaryAnd = M->getFunction("BinaryAnd");
    fpm->run(*BinaryAnd);
    BinaryXor = M->getFunction("BinaryXor");
    fpm->run(*BinaryXor);
    BinaryOr = M->getFunction("BinaryOr");
    fpm->run(*BinaryOr);
    InplaceAdd = M->getFunction("InplaceAdd");
    fpm->run(*InplaceAdd);
    InplaceSubtract = M->getFunction("InplaceSubtract");
    fpm->run(*InplaceSubtract);
    SequenceContains = M->getFunction("SequenceContains");
    fpm->run(*SequenceContains);
    SequenceNotContains = M->getFunction("SequenceNotContains");
    fpm->run(*SequenceNotContains);
    RichCompare = M->getFunction("RichCompare");
    fpm->run(*RichCompare);
    AsCond = M->getFunction("AsCond");
    fpm->run(*AsCond);
}

bool Translate(PyFrameObject *frame) {
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
    BasicBlock **label = new BasicBlock *[size];
    for (int i = 0; i < size; ++i) label[i] = BasicBlock::Create(TheContext);
    std::stack<Block> blockStack;

    char *str = PyUnicode_AsUTF8(code->co_name);
    Function *newFunc = Function::Create(funcType, Function::ExternalLinkage, str, M);
    // BasicBlock *BB = BasicBlock::Create(TheContext, "entry", newFunc);
    // Builder.SetInsertPoint(BB);

    for (int i = 0; i < size; ++i) {
        auto opcode = _Py_OPCODE(byteCode[i]);
        auto oparg = _Py_OPARG(byteCode[i]);
        // printf("-- %u %u\n", opcode, oparg);
        bool continuity = true;
        label[i]->insertInto(newFunc);
        Builder.SetInsertPoint(label[i]);
        switch (opcode) {
        case LOAD_CONST: {
            ConstantInt *addressInt = ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)PyTuple_GetItem(consts, oparg));
            Value *val = ConstantExpr::getIntToPtr(addressInt, PyObjectPtrTy);
            Builder.CreateCall(PyIncref, std::vector<Value *>{val});
            stack[stackDepth++] = val;
            break;
        }
        case LOAD_FAST: {
            ConstantInt *idx = ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)oparg);
            ConstantInt *addressInt = ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)fastlocals);
            Constant *ptr = ConstantExpr::getGetElementPtr(PyObjectPtrTy, ConstantExpr::getIntToPtr(addressInt, PyObjectPtrTy->getPointerTo()), idx);
            Value *val = Builder.CreateLoad(ptr);
            Builder.CreateCall(PyIncref, std::vector<Value *>{val});
            stack[stackDepth++] = val;
            break;
        }
        case STORE_FAST: {
            ConstantInt *idx = ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)oparg);
            ConstantInt *addressInt = ConstantInt::get(Type::getInt64Ty(TheContext), (int64_t)fastlocals);
            Constant *ptr = ConstantExpr::getGetElementPtr(PyObjectPtrTy, ConstantExpr::getIntToPtr(addressInt, PyObjectPtrTy->getPointerTo()), idx);
            Value *last = Builder.CreateLoad(ptr);
            Value *val = stack[--stackDepth];
            Builder.CreateStore(val, ptr);
            Builder.CreateCall(PyXDecref, std::vector<Value *>{last});
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
        newFunc->dump();
        fpm->run(*newFunc);
        newFunc->dump();
    }
    return flag;
}
