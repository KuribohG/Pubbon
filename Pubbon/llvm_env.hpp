#ifndef LLVM_ENV_H
#define LLVM_ENV_H

#include <Python.h>
#include "frameobject.h"

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
#include "llvm/IR/Verifier.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/JITSymbol.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/ExecutionEngine/RuntimeDyld.h"
#include "llvm/ExecutionEngine/SectionMemoryManager.h"
#include "llvm/ExecutionEngine/MCJIT.h"
#include "llvm/ExecutionEngine/Orc/CompileUtils.h"
#include "llvm/ExecutionEngine/Orc/IRCompileLayer.h"
#include "llvm/ExecutionEngine/Orc/LambdaResolver.h"
#include "llvm/ExecutionEngine/Orc/ObjectLinkingLayer.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Mangler.h"
#include "llvm/Support/DynamicLibrary.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Analysis/BasicAliasAnalysis.h"
#include <algorithm>
#include <memory>
#include <string>
#include <vector>
#include <cstring>

typedef PyObject *(*JittedFunc)(PyFrameObject *);

extern llvm::LLVMContext TheContext;

using namespace llvm;
using namespace llvm::orc;

namespace llvm {
namespace orc {

class LlvmEnv {
    private:
        llvm::LLVMContext TheContext;
        std::vector<llvm::Module *> Modules;
        std::vector<ExecutionEngine *> Engines;
        std::unique_ptr<Module> OpenModule;

    public:
        LlvmEnv(std::unique_ptr<Module> module);

        llvm::Function *getFunction(const std::string Name);
        
        void *getPointerToNamedFunction(const std::string &Name, bool AbortOnFailure = true);

        void *getPointerToFunction(llvm::Function *F);

        JittedFunc get(llvm::Function *F);

        Module *getModuleForNewFunction(std::string name);
};

class HelpingMemoryManager : public SectionMemoryManager {
    HelpingMemoryManager(const HelpingMemoryManager&) = delete;
    void operator=(const HelpingMemoryManager&) = delete;

public:
	HelpingMemoryManager(LlvmEnv *Helper) : MasterHelper(Helper) {}
    virtual ~HelpingMemoryManager() {}
    virtual void *getPointerToNamedFunction(const std::string &Name, bool AbortOnFailure = true);

private:
    LlvmEnv *MasterHelper;
};

}
}

#endif
