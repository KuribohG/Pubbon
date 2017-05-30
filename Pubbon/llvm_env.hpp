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
        LlvmEnv(std::unique_ptr<Module> module) {
            std::string ErrStr;
            ExecutionEngine *EE = EngineBuilder(std::move(module))
                                               .setErrorStr(&ErrStr)
                                               .create();
            Engines.push_back(EE);
            EE->finalizeObject();
        }

        llvm::Function *getFunction(const std::string Name) {
            for (auto it = Modules.begin(); it != Modules.end(); ++it) {
                llvm::Function *F = (*it)->getFunction(Name);
                if (F) {
                    if (*it == OpenModule.get()) {
                        return F;
                    }
                    llvm::Function *PF = OpenModule->getFunction(Name);
                    if (!PF) {
                        PF = llvm::Function::Create(F->getFunctionType(),
                                Function::ExternalLinkage, Name, OpenModule.get());
                        return PF;
                    }
                }
            }
            return nullptr;
        }

        JittedFunc get(llvm::Function *F) {
            for (auto it = Engines.begin(); it != Engines.end(); ++it) {
                JittedFunc func = (JittedFunc)(*it)->getPointerToFunction(F);
                if (func) {
                    return func;
                }
            }
            if (OpenModule.get()) {
                std::string ErrStr;
                Module *M = OpenModule.get();
                ExecutionEngine *NewEngine = EngineBuilder(std::move(OpenModule))
                                                          .setErrorStr(&ErrStr)
                                                          .create();

                auto fpm = new llvm::legacy::FunctionPassManager(OpenModule.get());
                //fpm->add(new DataLayout(*NewEngine->getDataLayout()));
    			//fpm->add(createBasicAAWrapperPass());
    			//fpm->add(createPromoteMemoryToRegisterPass());
    			fpm->add(createInstructionCombiningPass());
    			fpm->add(createReassociatePass());
    			fpm->add(createGVNPass());
    			fpm->add(createCFGSimplificationPass());
    			fpm->doInitialization();
                for (auto it = M->begin(); it != M->end(); ++it) {
                    fpm->run(*it);
                }
                delete fpm;
                M->dump();
                
                OpenModule = nullptr;
                Engines.push_back(NewEngine);
                NewEngine->finalizeObject();
                return (JittedFunc)NewEngine->getPointerToFunction(F);
            }
            return nullptr;
        }

        Module *getModuleForNewFunction(std::string name) {
            if (OpenModule.get()) {
                return OpenModule.get();
            }
            OpenModule = std::unique_ptr<Module>(new Module(name, TheContext));
            Module *M = OpenModule.get();
            Modules.push_back(M);
            return M;
        }

};

}
}

#endif
