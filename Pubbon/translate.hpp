#ifndef TRANSLATE_H
#define TRANSLATE_H

#include <string>
#include "Python.h"
#include "frameobject.h"

#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/IRReader/IRReader.h"
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
#include "llvm/Support/SourceMgr.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"

#include "llvm_env.hpp"

using namespace llvm;
using namespace llvm::orc;

struct Block {
	int type;
	int handler;
	int level;
	Block(int _type, int _handler, int _level): type(_type), handler(_handler), level(_level) { }
};

extern LlvmEnv *TheJIT;

void InitializeModule();

bool Translate(PyFrameObject *frame);

bool TranslateSpecial(PyFrameObject *frame);


#endif
