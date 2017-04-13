#ifndef TRANSLATE_H
#define TRANSLATE_H

#include <string>
#include "Python.h"

#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"

#include "llvm_env.hpp"

using namespace llvm;
using namespace llvm::orc;

PyObject* BinaryAdd(PyObject *left, PyObject *right);

PyObject* BinarySubscr(PyObject *left, PyObject *right);

PyObject* BinaryMultiply(PyObject *left, PyObject *right);

PyObject* BinaryTrueDivide(PyObject *left, PyObject *right);

PyObject* BinaryFloorDivide(PyObject *left, PyObject *right);

PyObject* BinaryPower(PyObject *left, PyObject *right);

PyObject* BinaryModulo(PyObject *left, PyObject *right);

PyObject* BinarySubtract(PyObject *left, PyObject *right);

PyObject* LoadAttr(PyObject *owner, PyObject *name);

PyObject *BinaryLshift(PyObject *left, PyObject *right);

PyObject *BinaryRshift(PyObject *left, PyObject *right);

PyObject *BinaryAnd(PyObject *left, PyObject *right);

PyObject *BinaryXor(PyObject *left, PyObject *right);

PyObject *BinaryOr(PyObject *left, PyObject *right);

PyObject *BinaryMatrixMultiply(PyObject *left, PyObject *right);

void InitializeModule();

void CompiletoIR(PyCodeObject *code);

Function *getFunction(std::string Name);

void translate(PyCodeObject *code);

#endif
