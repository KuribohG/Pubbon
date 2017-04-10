#define PY_SSIZE_T_CLEAN

#include <Python.h>
#include <frameobject.h>
#include <cassert>

#include "pyjit.h"

#if PY_MAJOR_VERSION >= 3
  #define MOD_ERROR_VAL NULL
  #define MOD_SUCCESS_VAL(val) val
  #define MOD_INIT(name) PyMODINIT_FUNC PyInit_##name(void)
  #define MOD_DEF(ob, name, doc, methods) { \
          static struct PyModuleDef moduledef = { \
            PyModuleDef_HEAD_INIT, name, doc, -1, methods, }; \
          ob = PyModule_Create(&moduledef); }
  #define MOD_INIT_EXEC(name) PyInit_##name();
#else
  #define MOD_ERROR_VAL
  #define MOD_SUCCESS_VAL(val)
  #define MOD_INIT(name) PyMODINIT_FUNC init##name(void)
  #define MOD_DEF(ob, name, doc, methods) \
          ob = Py_InitModule3(name, methods, doc);
  #define MOD_INIT_EXEC(name) init##name();
#endif

static Py_ssize_t coIdx;

PyObject *Jit_EvalHelper(void *state, PyFrameObject *frame) {
    return _PyEval_EvalFrameDefault(frame, 0);
}

PubbonJittedCode *jittedcode_new_direct() {
    PubbonJittedCode *new_ob = PyObject_New(PubbonJittedCode, &PubbonJittedCode_Type);
//    PubbonJittedCode *new_ob = (PubbonJittedCode *)PubbonJittedCode_Type.tp_alloc(&PubbonJittedCode_Type, 0);
    assert(new_ob != nullptr);
    new_ob->j_run_count = 0;
    new_ob->j_failed = false;
    new_ob->j_evalfunc = nullptr;
    new_ob->j_evalstate = nullptr;
    new_ob->j_specialization_threshold = 500;

    return new_ob;
}

static PyObject *
jittedcode_new(PyTypeObject *type, PyObject *args, PyObject *kwargs) {
    if (PyTuple_GET_SIZE(args) || (kwargs && PyDict_Size(kwargs))) {
        PyErr_SetString(PyExc_TypeError, "JittedCode takes no arguments");
        return nullptr;
    }

    return (PyObject *)jittedcode_new_direct();
}

void PubbonJitFree(PubbonJittedCode *function) {
    return;
}

static void
jittedcode_dealloc(PyObject *co) {
    PubbonJitFree((PubbonJittedCode *)co);
}

bool jit_compile(PyCodeObject *code) {
    if (strcmp(PyUnicode_AsUTF8(code->co_name), "<module>") == 0) {
        return false;
    }

    PyObject *extra = nullptr;
    _PyCode_GetExtra((PyObject *)code, coIdx, (void **)&extra);
    PubbonJittedCode *jittedCode = (PubbonJittedCode *)extra;

    jittedCode->j_evalfunc = &Jit_EvalHelper;
    jittedCode->j_evalstate = nullptr;
    
    return true;
}

static PY_UINT64_T HOT_CODE = 1000;

PyObject*
eval_frame(PyFrameObject *frame, int throwflag) {
    printf("** myjit is evaluating frame=%p lasti=%d lineno=%d throwflag=%d\n",
           frame, frame->f_lasti, frame->f_lineno, throwflag);
    PyObject *extra = nullptr;
    _PyCode_GetExtra((PyObject *)frame->f_code, coIdx, (void **)&extra);
    if (extra == nullptr) {
        PubbonJittedCode *jitted = jittedcode_new_direct();
        assert(jitted != nullptr);
        _PyCode_SetExtra((PyObject *)frame->f_code, coIdx, (PyObject *)jitted);
        jitted->j_run_count++;
        printf("jitted run_count: %llu\n", jitted->j_run_count);
    }
    else if (!throwflag) {
        PubbonJittedCode *jitted = (PubbonJittedCode *)extra;
        if (Py_TYPE(jitted) == &PubbonJittedCode_Type && !jitted->j_failed) {
            if (jitted->j_evalfunc != nullptr) {
                return jitted->j_evalfunc(jitted->j_evalstate, frame);
            } else if (jitted->j_run_count++ > HOT_CODE) {
                if (jit_compile(frame->f_code)) {
                    return jitted->j_evalfunc(jitted->j_evalstate, frame);
                } else {
                    jitted->j_failed = true;
                }
            }
        }
    }
    return _PyEval_EvalFrameDefault(frame, throwflag);
}

PyObject*
install_jit(PyObject *self) {
    PyThreadState *tstate = PyThreadState_GET();
    tstate->interp->eval_frame = eval_frame;
    Py_RETURN_NONE;
}


static PyMethodDef ext_methods[] = {
    { "install_jit", (PyCFunction) install_jit, METH_NOARGS, NULL },
    { NULL },
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

MOD_INIT(pyjit) {
    PyObject *m;
    if (PyType_Ready(&PubbonJittedCode_Type) < 0)
        return MOD_ERROR_VAL;
    MOD_DEF(m, "pyjit", "No docs", ext_methods)
    if (m == NULL)
        return MOD_ERROR_VAL;
    Py_INCREF(&PubbonJittedCode_Type);
    coIdx = _PyEval_RequestCodeExtraIndex((freefunc)jittedcode_dealloc);
    return MOD_SUCCESS_VAL(m);
}
