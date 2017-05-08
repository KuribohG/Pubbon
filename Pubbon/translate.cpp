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

StructType *PyObjectTy, *PyCodeObjectTy, *PyFrameObjectTy;
PointerType *PyObjectPtrTy, *PyCodeObjectPtrTy, *PyFrameObjectPtrTy;
FunctionType *funcType;

Function *PyIncref;
Function *PyDecref;
Function *BinaryAdd;

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

    PyIncref = M->getFunction("PyIncref");
    PyDecref = M->getFunction("PyDecref");
    BinaryAdd = M->getFunction("BinaryAdd");
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
        case BINARY_ADD: {
            Value *right = stack[--stackDepth];
            Value *left = stack[--stackDepth];
            stack[stackDepth++] = Builder.CreateCall(BinaryAdd, std::vector<Value *>{left, right});
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
        newFunc->dump();
    }
    return flag;
}
