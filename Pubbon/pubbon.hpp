#ifndef PUBBON_HPP
#define PUBBON_HPP

extern PyTypeObject PubbonJittedCode_Type;

typedef PyObject * (*Py_EvalFunc)(std::string, struct _frame *);

struct PubbonJittedCode
{
    PyObject_HEAD
    PY_UINT64_T j_run_count;
    bool j_failed;
    Py_EvalFunc j_evalfunc;
    char* j_evalstate;
    PY_UINT64_T j_specialization_threshold;
};

PubbonJittedCode *jittedcode_new_direct();

#endif // PuBBON_HPP
