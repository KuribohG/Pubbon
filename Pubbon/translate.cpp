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

void InitializeModule() {
    SMDiagnostic err;
    std::string source_file("/Users/zouyuheng/workspace/Pubbon/Pubbon/function.ll");
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

    char *str = PyUnicode_AsUTF8(code->co_name);
    Function *newFunc = Function::Create(funcType, Function::ExternalLinkage, str, M);
    BasicBlock *BB = BasicBlock::Create(TheContext, "entry", newFunc);
    Builder.SetInsertPoint(BB);

    for (int i = 0; i < size; ++i) {
        auto opcode = _Py_OPCODE(byteCode[i]);
        auto oparg = _Py_OPARG(byteCode[i]);
        // printf("-- %u %u\n", opcode, oparg);
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
    }
    delete[] stack;
    if (!flag) newFunc->eraseFromParent();
    else
    {
        fpm->run(*newFunc);
        newFunc->dump();
    }
    return flag;
}
