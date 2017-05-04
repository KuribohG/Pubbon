#include <Python.h>
#include <frameobject.h>
#include <cassert>
#include <cwchar>

#include "llvm_env.hpp"
#include "translate.hpp"
#include "pubbon.hpp"

static Py_ssize_t coIdx;

/*
PyObject *Jit_EvalHelper(PyFrameObject *frame) {
    return _PyEval_EvalFrameDefault(frame, 0);
}
*/

PubbonJittedCode *jittedcode_new_direct() {
    PubbonJittedCode *new_ob = (PubbonJittedCode *)PubbonJittedCode_Type.tp_alloc(&PubbonJittedCode_Type, 0);
    assert(new_ob != nullptr);

    new_ob->j_run_count = 0;
    new_ob->j_failed = false;
    new_ob->j_evalfunc = nullptr;
//  new_ob->j_evalstate = nullptr;
//  new_ob->j_specialization_threshold = 500;

    return new_ob;
}

static PyObject *jittedcode_new(PyTypeObject *type, PyObject *args, PyObject *kwargs) {
    if (PyTuple_GET_SIZE(args) || (kwargs && PyDict_Size(kwargs))) {
        PyErr_SetString(PyExc_TypeError, "JittedCode takes no arguments");
        return nullptr;
    }

    return (PyObject *)jittedcode_new_direct();
}

void PubbonJitFree(PubbonJittedCode *function) {
    // TODO: maybe need Py_XDECREF(function->j_evalstate)
}

static void jittedcode_dealloc(PyObject *co) {
    PubbonJitFree((PubbonJittedCode *)co);
    Py_TYPE(co)->tp_free(co);
}

bool jit_compile(PyCodeObject *code) {
    if (strcmp(PyUnicode_AsUTF8(code->co_name), "<module>") == 0) return false;
    PyObject *extra = nullptr;
    // use CPython API, otherwise it produce segfault
    _PyCode_GetExtra((PyObject *)code, coIdx, (void **)&extra);
    PubbonJittedCode *jittedCode = (PubbonJittedCode *)extra;

    if (Translate(code))
    {
        jittedCode->j_evalfunc = TheJIT->get(code);
        // jittedCode->j_evalstate = nullptr;
        printf("** Compiled and succeeded!\n");
        return true;
    }
    else
    {
        printf("** Compiled and failed!\n");
        return false;
    }
}

static PY_UINT64_T HOT_CODE = 4;

PyObject *eval_frame(PyFrameObject *frame, int throwflag) {
    // frame information
    printf("** Pubbon is evaluating frame = %p, lasti = %d, lineno = %d, throwflag = %d\n", frame, frame->f_lasti, frame->f_lineno, throwflag);
    wchar_t *str = PyUnicode_AsWideCharString(frame->f_code->co_name, nullptr);
    printf("** name = %ls, argcount = %d, kwonlyargcount = %d, co_nlocals = %d\n", str, frame->f_code->co_argcount, frame->f_code->co_kwonlyargcount, frame->f_code->co_nlocals);
    PyMem_Free(str);

    PyObject *extra = nullptr;
    _PyCode_GetExtra((PyObject *)frame->f_code, coIdx, (void **)&extra);

    if (extra == nullptr) {
        PubbonJittedCode *jitted = jittedcode_new_direct();
        assert(jitted != nullptr);
        _PyCode_SetExtra((PyObject *)frame->f_code, coIdx, (PyObject *)jitted);

        jitted->j_run_count++;
        printf("** jitted run_count: %llu\n", jitted->j_run_count);
    }
    else if (!throwflag) {
        PubbonJittedCode *jitted = (PubbonJittedCode *)extra;
        printf("** jitted run_count: %llu\n", jitted->j_run_count);

        if (Py_TYPE(jitted) == &PubbonJittedCode_Type && !jitted->j_failed) {
            if (jitted->j_evalfunc != nullptr) return jitted->j_evalfunc(frame->f_code);
            else if (jitted->j_run_count++ > HOT_CODE) {
                if (jit_compile(frame->f_code)) return jitted->j_evalfunc(frame->f_code);
                else jitted->j_failed = true;
            }
        }
    }
    return _PyEval_EvalFrameDefault(frame, throwflag);
}

PyObject *install_jit(PyObject *self)
{
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();
    llvm::InitializeNativeTargetAsmParser();
    InitializeModule();

    PyThreadState *tstate = PyThreadState_GET();
    tstate->interp->eval_frame = eval_frame;
    Py_RETURN_NONE;
}


static PyMethodDef ext_methods[] = {
    { "install_jit", (PyCFunction)install_jit, METH_NOARGS, NULL },
    { NULL }
};

static PyModuleDef pubbonModule = {
    PyModuleDef_HEAD_INIT,
    "pubbon",
    "A module that provides python with jit.",
    -1,
    ext_methods
};

PyTypeObject PubbonJittedCode_Type = {
    PyVarObject_HEAD_INIT(&PyType_Type, 0)
    "pubbonjittedcode",                 /* tp_name */
    sizeof(PubbonJittedCode),           /* tp_basicsize */
    0,                                  /* tp_itemsize */
    jittedcode_dealloc,                 /* tp_dealloc */
    0,                                  /* tp_print */
    0,                                  /* tp_getattr */
    0,                                  /* tp_setattr */
    0,                                  /* tp_reserved */
    0,                                  /* tp_repr */
    0,                                  /* tp_as_number */
    0,                                  /* tp_as_sequence */
    0,                                  /* tp_as_mapping */
    0,                                  /* tp_hash */
    0,                                  /* tp_call */
    0,                                  /* tp_str */
    0,                                  /* tp_getattro */
    0,                                  /* tp_setattro */
    0,                                  /* tp_as_buffer */
    Py_TPFLAGS_DEFAULT,                 /* tp_flags */
    0,                                  /* tp_doc */
    0,                                  /* tp_traverse */
    0,                                  /* tp_clear */
    0,                                  /* tp_richcompare */
    0,                                  /* tp_weaklistoffset */
    0,                                  /* tp_iter */
    0,                                  /* tp_iternext */
    0,                                  /* tp_methods */
    0,                                  /* tp_members */
    0,                                  /* tp_getset */
    0,                                  /* tp_base */
    0,                                  /* tp_dict */
    0,                                  /* tp_descr_get */
    0,                                  /* tp_descr_set */
    0,                                  /* tp_dictoffset */
    0,                                  /* tp_init */
    0,                                  /* tp_alloc */
    jittedcode_new,                     /* tp_new */
};

PyMODINIT_FUNC PyInit_pubbon(void) {
//  PubbonJittedCode_Type.tp_dealloc = jittedcode_dealloc;
//  PubbonJittedCode_Type.tp_flags = Py_TPFLAGS_DEFAULT;
//  PubbonJittedCode_Type.tp_new = jittedcode_new;

    PyObject *m;
    if (PyType_Ready(&PubbonJittedCode_Type) < 0) return NULL;
    m = PyModule_Create(&pubbonModule);
    if (m == NULL) return NULL;
    Py_INCREF(&PubbonJittedCode_Type);
    coIdx = _PyEval_RequestCodeExtraIndex((freefunc)jittedcode_dealloc);
    return m;
}
