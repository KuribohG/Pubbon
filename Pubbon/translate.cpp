#include "translate.hpp"

#include <string>
#include <vector>

using namespace llvm;
using namespace llvm::orc;

LLVMContext TheContext;
IRBuilder<> Builder(TheContext);
std::unique_ptr<Module> TheModule;
std::unique_ptr<LlvmEnv> TheJIT;

PyObject *BinaryAdd(PyObject *left, PyObject *right) {
	PyObject *sum;
	if (PyUnicode_CheckExact(left) && PyUnicode_CheckExact(right)) {
		sum = PyUnicode_Concat(left, right);
	}
	else {
		sum = PyNumber_Add(left, right);
		Py_DECREF(left);
	}
    Py_DECREF(right);
	return sum;
}

PyObject *BinarySubscr(PyObject *left, PyObject *right) {
	auto res = PyObject_GetItem(left, right);
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

PyObject *BinaryMultiply(PyObject *left, PyObject *right) {
	auto res = PyNumber_Multiply(left, right);
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

PyObject *BinaryTrueDivide(PyObject *left, PyObject *right) {
	auto res = PyNumber_TrueDivide(left, right);
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

PyObject *BinaryFloorDivide(PyObject *left, PyObject *right) {
	auto res = PyNumber_FloorDivide(left, right);
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

PyObject *BinaryPower(PyObject *left, PyObject *right) {
	auto res = PyNumber_Power(left, right, Py_None);
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

PyObject *BinaryModulo(PyObject *left, PyObject *right) {
	auto res = PyUnicode_CheckExact(left) ?
		PyUnicode_Format(left, right) :
		PyNumber_Remainder(left, right); 
	
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

PyObject *BinarySubtract(PyObject *left, PyObject *right) {
	auto res = PyNumber_Subtract(left, right);
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

PyObject *LoadAttr(PyObject *owner, PyObject *name) {
	PyObject *res = PyObject_GetAttr(owner, name);
	Py_DECREF(owner);
	return res;
}

PyObject *BinaryLshift(PyObject *left, PyObject *right) {
	PyObject *res = PyNumber_Lshift(left, right);
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

PyObject *BinaryRshift(PyObject *left, PyObject *right) {
	PyObject *res = PyNumber_Rshift(left, right);
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

PyObject *BinaryAnd(PyObject *left, PyObject *right) {
	PyObject *res = PyNumber_And(left, right);
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

PyObject *BinaryXor(PyObject *left, PyObject *right) {
	PyObject *res = PyNumber_Xor(left, right);
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

PyObject *BinaryOr(PyObject *left, PyObject *right) {
	PyObject *res = PyNumber_Or(left, right);
	Py_DECREF(left);
	Py_DECREF(right);
	return res;
}

void InitializeModule() {
    TheModule = std::make_unique<Module>("pyjit", TheContext);
    TheModule->setDataLayout(TheJIT->getTargetMachine().createDataLayout());
}

void CompiletoIR(PyCodeObject *code) {
}

Function *getFunction(std::string Name) {
    if (auto *F = TheModule->getFunction(Name))
        return F;
    return nullptr;
}

void translate(PyCodeObject *code) {
    InitializeModule();
    CompiletoIR(code);
    std::string Name = PyUnicode_AsUTF8(code->co_name);
    std::vector<Type *> ArgTypes{Type::getDoubleTy(TheContext)};
    Type *ResType = Type::getDoubleTy(TheContext);
    FunctionType *FT = FunctionType::get(ResType, ArgTypes, false);
    Function *F = Function::Create(FT, Function::ExternalLinkage, Name, TheModule.get());

    Function *TheFunction = getFunction(Name);

    BasicBlock *BB = BasicBlock::Create(TheContext, "entry", TheFunction);
    Builder.SetInsertPoint(BB);

    Value *RetVal = nullptr;//something return

    Builder.CreateRet(RetVal);

    TheJIT->addModule(std::move(TheModule));
}
