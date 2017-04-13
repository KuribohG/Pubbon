#ifndef LLVM_ENV_H
#define LLVM_ENV_H

#include "llvm/ADT/STLExtras.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/JITSymbol.h"
#include "llvm/ExecutionEngine/RuntimeDyld.h"
#include "llvm/ExecutionEngine/SectionMemoryManager.h"
#include "llvm/ExecutionEngine/Orc/CompileUtils.h"
#include "llvm/ExecutionEngine/Orc/IRCompileLayer.h"
#include "llvm/ExecutionEngine/Orc/LambdaResolver.h"
#include "llvm/ExecutionEngine/Orc/ObjectLinkingLayer.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Mangler.h"
#include "llvm/Support/DynamicLibrary.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetMachine.h"
#include <algorithm>
#include <memory>
#include <string>
#include <vector>

namespace llvm {
namespace orc {

class LlvmEnv {
    private:
        std::unique_ptr<TargetMachine> TM;
        const DataLayout DL;
        ObjectLinkingLayer<> ObjectLayer;
        IRCompileLayer<decltype(ObjectLayer)> CompileLayer;

    public:
        typedef decltype(CompileLayer)::ModuleSetHandleT ModuleHandle;

        LlvmEnv()
            : TM(EngineBuilder().selectTarget()), DL(TM->createDataLayout()),
              CompileLayer(ObjectLayer, SimpleCompiler(*TM)) {
            llvm::sys::DynamicLibrary::LoadLibraryPermanently(nullptr);
        }

        TargetMachine &getTargetMachine() { return *TM; }

        ModuleHandle addModule(std::unique_ptr<Module> M) {
            auto Resolver = createLambdaResolver(
                [&](const std::string &Name) {
                  if (auto Sym = CompileLayer.findSymbol(Name, false))
                    return Sym;
                  return JITSymbol(nullptr);
                },
                [](const std::string &Name) {
                  if (auto SymAddr =
                        RTDyldMemoryManager::getSymbolAddressInProcess(Name))
                    return JITSymbol(SymAddr, JITSymbolFlags::Exported);
                  return JITSymbol(nullptr);
                });
            
            std::vector<std::unique_ptr<Module> > Ms;
            Ms.push_back(std::move(M));

            return CompileLayer.addModuleSet(std::move(Ms),
                                             make_unique<SectionMemoryManager>(),
                                             std::move(Resolver));
        }

        JITSymbol findSymbol(const std::string Name) {
            std::string MangledName;
            raw_string_ostream MangledNameStream(MangledName);
            Mangler::getNameWithPrefix(MangledNameStream, Name, DL);
            return CompileLayer.findSymbol(MangledNameStream.str(), true);
        }

        void removeModule(ModuleHandle H) {
            CompileLayer.removeModuleSet(H);
        }
};

}
}

#endif
