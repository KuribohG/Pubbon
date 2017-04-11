#ifndef PUBBON_HPP
#define PUBBON_HPP

#include <string>

extern PyTypeObject PubbonJittedCode_Type;

typedef PyObject * (*Py_EvalFunc)(std::string, struct _frame *);

struct PubbonJittedCode
{
    PyObject_HEAD
    PY_UINT64_T j_run_count;
    bool j_failed;
    Py_EvalFunc j_evalfunc;
    std::string j_evalstate;
    PY_UINT64_T j_specialization_threshold;
};

PubbonJittedCode *jittedcode_new_direct();

#endif // PuBBON_HPP
