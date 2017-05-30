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
#include <algorithm>
#include <memory>
#include <string>
#include <vector>
#include <cstring>

typedef PyObject *(*JittedFunc)(PyFrameObject *);

extern llvm::LLVMContext TheContext;
extern llvm::IRBuilder<> Builder;
extern std::unique_ptr<llvm::Module> TheModule;

namespace llvm {
namespace orc {

class LlvmEnv {
    private:
        ExecutionEngine *EE;

    public:
        LlvmEnv() {
            std::string errStr;
            EE = EngineBuilder(std::move(TheModule))
                .setErrorStr(&errStr)
                .create();
        }

        JittedFunc get(PyObject *name, bool special=false) {
            char *str = PyUnicode_AsUTF8(name);
            JittedFunc func;
            if (special) {
                int len = strlen(str);
                char *prefix = new char[len + 20];
                strcpy(prefix, str);
                const char *suffix = "_special";
                strcat(prefix, suffix);
                func = (JittedFunc)EE->getFunctionAddress(prefix);
            }
            else func = (JittedFunc)EE->getFunctionAddress(str);
            return func;
        }
};

}
}

#endif
