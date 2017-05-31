#include "llvm_env.hpp"

using namespace llvm;
using namespace llvm::orc;

namespace llvm {
namespace orc {

LlvmEnv::LlvmEnv(std::unique_ptr<Module> module) {
    std::string ErrStr;
    EE = EngineBuilder(std::move(module))
                      .setErrorStr(&ErrStr)
                      .setOptLevel(CodeGenOpt::Aggressive)
                      .create();
}

JittedFunc LlvmEnv::get(const std::string Name) {
    if (OpenModule) {
        EE->addModule(std::move(OpenModule));
        EE->finalizeObject();
        OpenModule = nullptr;
    }
    return (JittedFunc)EE->getFunctionAddress(Name);
}

Module *LlvmEnv::getModuleForNewFunction(const std::string name) {
    if (OpenModule) {
        return OpenModule.get();
    }
    OpenModule = std::unique_ptr<Module>(new Module(name, TheContext));
    return OpenModule.get();
}

Function *LlvmEnv::getFunction(const std::string Name) {
    Function *F = EE->FindFunctionNamed(Name);
    Function *PF = OpenModule->getFunction(Name);
    if (!PF) {
        PF = Function::Create(F->getFunctionType(),
                Function::ExternalLinkage, Name, OpenModule.get());
        return PF;
    }
    return nullptr;
}

}
}

