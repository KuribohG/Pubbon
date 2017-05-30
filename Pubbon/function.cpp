#include "Python.h"
#include "frameobject.h"

extern "C" PyCodeObject *TempFunc1() { return nullptr; }

extern "C" double ToDouble(PyObject *obj) {
    return ((PyFloatObject *)(obj))->ob_fval;
}

extern "C" PyObject *FromDouble(double x) {
    return PyFloat_FromDouble(x);
}

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

extern "C" PyObject *BinarySubtract(PyObject *left, PyObject *right) {
    PyObject *diff;
    diff = PyNumber_Subtract(left, right);
    Py_DECREF(left);
    Py_DECREF(right);
    return diff;
}

extern "C" PyObject *BinarySubscr(PyObject *container, PyObject *sub) {
    PyObject *res;
    res = PyObject_GetItem(container, sub);
    Py_DECREF(container);
    Py_DECREF(sub);
    return res;
}

extern "C" PyObject *BinaryLshift(PyObject *left, PyObject *right) {
    PyObject *res;
    res = PyNumber_Lshift(left, right);
    Py_DECREF(left);
    Py_DECREF(right);
    return res;
}

extern "C" PyObject *BinaryRshift(PyObject *left, PyObject *right) {
    PyObject *res;
    res = PyNumber_Rshift(left, right);
    Py_DECREF(left);
    Py_DECREF(right);
    return res;
}

extern "C" PyObject *BinaryAnd(PyObject *left, PyObject *right) {
    PyObject *res;
    res = PyNumber_And(left, right);
    Py_DECREF(left);
    Py_DECREF(right);
    return res;
}

extern "C" PyObject *BinaryXor(PyObject *left, PyObject *right) {
    PyObject *res;
    res = PyNumber_Xor(left, right);
    Py_DECREF(left);
    Py_DECREF(right);
    return res;
}

extern "C" PyObject *BinaryOr(PyObject *left, PyObject *right) {
    PyObject *res;
    res = PyNumber_Or(left, right);
    Py_DECREF(left);
    Py_DECREF(right);
    return res;
}

extern "C" PyObject *InplaceAdd(PyObject *left, PyObject *right) {
    PyObject *sum;
    if (PyUnicode_CheckExact(left) && PyUnicode_CheckExact(right)) sum = PyUnicode_Concat(left, right);
    else sum = PyNumber_InPlaceAdd(left, right);
    Py_DECREF(left);
    Py_DECREF(right);
    return sum;
}

extern "C" PyObject *InplaceSubtract(PyObject *left, PyObject *right) {
    PyObject *diff;
    diff = PyNumber_InPlaceSubtract(left, right);
    Py_DECREF(left);
    Py_DECREF(right);
    return diff;
}

extern "C" PyObject *SequenceContains(PyObject *container, PyObject *sub) {
    PyObject *res = PySequence_Contains(container, sub) ? Py_True : Py_False;
    Py_INCREF(res);
    return res;
}

extern "C" PyObject *SequenceNotContains(PyObject *container, PyObject *sub) {
    PyObject *res = PySequence_Contains(container, sub) ? Py_False : Py_True;
    Py_INCREF(res);
    return res;
}

extern "C" PyObject *RichCompare(PyObject *left, PyObject *right, int op) {
    return PyObject_RichCompare(left, right, op);
}

extern "C" bool AsCond(PyObject *cond)
{
    if (cond == Py_True) return true;
    else if (cond == Py_False) return false;
    else return PyObject_IsTrue(cond) > 0;
}

extern "C" PyObject *LoadGlobal(PyFrameObject *frame, PyObject *name)
{
    PyObject *globals = frame->f_globals;
    PyObject *builtins = frame->f_builtins;
    PyObject *res = PyObject_GetItem(globals, name);
    if (res == nullptr) res = PyObject_GetItem(builtins, name);
    return res;
}

extern "C" PyObject *LoadFast(PyFrameObject *frame, int idx)
{
    PyObject *res = frame->f_localsplus[idx];
    Py_INCREF(res);
    return res;
}

extern "C" void StoreFast(PyFrameObject *frame, int idx, PyObject *val)
{
    PyObject *last = frame->f_localsplus[idx];
    frame->f_localsplus[idx] = val;
    Py_XDECREF(last);
}

extern "C" PyObject *CallFunction_0(PyObject *func)
{
    PyObject *args = PyTuple_Pack(0);
    PyObject *res = PyObject_Call(func, args, nullptr);
    Py_DECREF(func);
    return res;
}

extern "C" PyObject *CallFunction_1(PyObject *func, PyObject *arg1)
{
    PyObject *args = PyTuple_Pack(1, arg1);
    PyObject *res = PyObject_Call(func, args, nullptr);
    Py_DECREF(func);
    return res;
}

extern "C" PyObject *CallFunction_2(PyObject *func, PyObject *arg1, PyObject *arg2)
{
    PyObject *args = PyTuple_Pack(2, arg1, arg2);
    PyObject *res  = PyObject_Call(func, args, nullptr);
    Py_DECREF(func);
    return res;
}
