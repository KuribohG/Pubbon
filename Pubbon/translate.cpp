#include "translate.hpp"

#include <string>
#include <vector>

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

Function *getFunction(std::string Name) {
    if (auto *F = TheModule->getFunction(Name))
        return F;
    return nullptr;
}

void translate(PyCodeObject *code) {
    InitializeModule();
    std::string Name = "name";
    std::vector<Type*> ArgTypes{Type::getDoubleTy(TheContext)};
    Type* ResType = Type::getDoubleTy(TheContext);
    FunctionType *FT = FunctionType::get(ResType, ArgTypes, false);
    Function *F = Function::Create(FT, Function::ExternalLinkage, Name, TheModule.get());

    Function *TheFunction = getFunction(Name);

    BasicBlock *BB = BasicBlock::Create(TheContext, "entry", TheFunction);
    Builder.SetInsertPoint(BB);

    Value *RetVal = nullptr;//something return

    Builder.CreateRet(RetVal);

    TheJIT->addModule(std::move(TheModule));
}
