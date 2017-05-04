#ifndef PUBBON_HPP
#define PUBBON_HPP

extern PyTypeObject PubbonJittedCode_Type;

struct PubbonJittedCode
{
    PyObject_HEAD
    // how many times this code already run
    PY_UINT64_T j_run_count;
    // if failed, interpret this code and do not try to compile again
    bool j_failed;
    // JIT eval function
    JittedFunc j_evalfunc;
    // char* j_evalstate;
    // PY_UINT64_T j_specialization_threshold;
};

PubbonJittedCode *jittedcode_new_direct();

#endif // PuBBON_HPP
