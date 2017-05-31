#include "llvm_env.hpp"

using namespace llvm;
using namespace llvm::orc;

namespace llvm {
namespace orc {

LlvmEnv::LlvmEnv(std::unique_ptr<Module> module) {
    std::string ErrStr;
    Modules.push_back(module.get());
    OpenModule = std::move(module);
}

llvm::Function *LlvmEnv::getFunction(const std::string Name) {
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
            }
            return PF;
        }
    }
    return nullptr;
}

void *LlvmEnv::getPointerToNamedFunction(const std::string &Name, bool AbortOnFailure) {
    llvm::Function *func = getFunction(Name);
    return getPointerToFunction(func);
}

JittedFunc LlvmEnv::get(llvm::Function *F) {
    return JittedFunc(getPointerToFunction(F));
}

Module *LlvmEnv::getModuleForNewFunction(std::string name) {
    if (OpenModule.get()) {
        return OpenModule.get();
    }
    OpenModule = std::unique_ptr<Module>(new Module(name, TheContext));
    Module *M = OpenModule.get();
    Modules.push_back(M);
    return M;
}

void *HelpingMemoryManager::getPointerToNamedFunction(const std::string &Name, bool AbortOnFailure)
{
	void *pfn = SectionMemoryManager::getPointerToNamedFunction(Name, false);
	if (pfn)
    	return pfn;

  	pfn = MasterHelper->getPointerToNamedFunction(Name);
    if (!pfn && AbortOnFailure) {
        report_fatal_error("Not found function in IR");
    }
  	return pfn;
}


void *LlvmEnv::getPointerToFunction(llvm::Function *F) {
    for (auto it = Engines.begin(); it != Engines.end(); ++it) {
        void *func = (*it)->getPointerToFunction(F);
        if (func) {
            return func;
        }
    }
    if (OpenModule.get()) {
        std::string ErrStr;
        Module *M = OpenModule.get();
        ExecutionEngine *NewEngine = EngineBuilder(std::move(OpenModule))
                                                  .setErrorStr(&ErrStr)
										          .setMCJITMemoryManager(std::unique_ptr<HelpingMemoryManager>(new HelpingMemoryManager(this)))
                                                  .create();

        auto fpm = new llvm::legacy::FunctionPassManager(OpenModule.get());
        //fpm->add(new DataLayout(*NewEngine->getDataLayout()));
        fpm->add(createBasicAAWrapperPass());
        fpm->add(createPromoteMemoryToRegisterPass());
        fpm->add(createInstructionCombiningPass());
        fpm->add(createReassociatePass());
        fpm->add(createGVNPass());
        fpm->add(createCFGSimplificationPass());
        fpm->doInitialization();
        for (auto it = M->begin(); it != M->end(); ++it) {
            fpm->run(*it);
        }
        delete fpm;
        //M->dump();

        OpenModule = nullptr;
        Engines.push_back(NewEngine);
        NewEngine->finalizeObject();
        return NewEngine->getPointerToFunction(F);
    }
    return nullptr;
}


}
}

