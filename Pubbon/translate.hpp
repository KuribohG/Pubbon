#ifndef TRANSLATE_H
#define TRANSLATE_H

#include <Python.h>

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

LLVMContext TheContext;
IRBuilder<> Builder(TheContext);
std::unique_ptr<Module> TheModule;
std::unique_ptr<LlvmEnv> TheJIT;

void InitializeModule() {
    TheModule = std::make_unique<Module>("pyjit", TheContext);
    TheModule->setDataLayout(TheJIT->getTargetMachine().createDataLayout());
}

void translate(PyCodeObject *code);

#endif
