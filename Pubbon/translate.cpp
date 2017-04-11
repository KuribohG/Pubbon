#include "translate.hpp"

#include <string>
#include <vector>

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
