#include "Python.h"
#include "frameobject.h"
extern "C" PyCodeObject *TempFunc1() { return nullptr; }
extern "C" PyFrameObject *TempFunc2() { return nullptr; }
extern "C" void PyIncref(PyObject *obj) { Py_INCREF(obj); }
extern "C" void PyDecref(PyObject *obj) { Py_DECREF(obj); }
extern "C" void PyXDecref(PyObject *obj) { Py_XDECREF(obj); }
extern "C" PyObject *BinaryAdd(PyObject *left, PyObject *right) {
    PyObject *sum;
    if (PyUnicode_CheckExact(left) && PyUnicode_CheckExact(right)) sum = PyUnicode_Concat(left, right);
    else sum = PyNumber_Add(left, right);
    Py_DECREF(left);
    Py_DECREF(right);
    return sum;
}
extern "C" PyObject *InplaceAdd(PyObject *left, PyObject *right) {
    PyObject *sum;
    if (PyUnicode_CheckExact(left) && PyUnicode_CheckExact(right)) sum = PyUnicode_Concat(left, right);
    else sum = PyNumber_InPlaceAdd(left, right);
    Py_DECREF(left);
    Py_DECREF(right);
    return sum;
}
