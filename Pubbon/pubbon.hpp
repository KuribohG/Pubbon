#ifndef PUBBON_HPP
#define PUBBON_HPP

extern PyTypeObject PubbonJittedCode_Type;

typedef PyObject * (*Py_EvalFunc)(std::string, struct _frame *);

struct PubbonJittedCode
{
    PyObject_HEAD
    //how many times this code already run
    PY_UINT64_T j_run_count;
    //if failed, interpret this code and do not try to compile again
    bool j_failed;
    //JIT eval function
    Py_EvalFunc j_evalfunc;
    //maybe name in LLVM module
    char* j_evalstate;
    PY_UINT64_T j_specialization_threshold;
};

PubbonJittedCode *jittedcode_new_direct();

#endif // PuBBON_HPP
