#include "Python.h"
#include "frameobject.h"

#include <stdarg.h>

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

extern "C" PyObject *BinaryMultiply(PyObject *left, PyObject *right) {
    PyObject *res;
    res = PyNumber_Multiply(left, right);
    Py_DECREF(left);
    Py_DECREF(right);
    return res;
}

extern "C" PyObject *BinaryModulo(PyObject *dividend, PyObject *divisor) {
    PyObject *res;
    if (PyUnicode_CheckExact(dividend) && (!PyUnicode_Check(divisor) || PyUnicode_CheckExact(divisor))) res = PyUnicode_Format(dividend, divisor);
    else res = PyNumber_Remainder(dividend, divisor);
    Py_DECREF(dividend);
    Py_DECREF(divisor);
    return res;
}

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

extern "C" void StoreSubscr(PyObject *container, PyObject *sub, PyObject *v) {
    PyObject_SetItem(container, sub, v);
    Py_DECREF(container);
    Py_DECREF(sub);
    Py_DECREF(v);
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
    if (res == nullptr) {
        PyErr_Clear();
        res = PyObject_GetItem(builtins, name);
    }
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

extern "C" PyObject *UnaryPositive(PyObject *val)
{
    PyObject *res = PyNumber_Positive(val);
    Py_DECREF(val);
    return res;
}

extern "C" PyObject *UnaryNegative(PyObject *val)
{
    PyObject *res = PyNumber_Negative(val);
    Py_DECREF(val);
    return res;
}

extern "C" PyObject *UnaryNot(PyObject *val)
{
    int err = PyObject_IsTrue(val);
    Py_DECREF(val);
    if (err == 0) {
        Py_INCREF(Py_True);
        return Py_True;
    }
    else if (err > 0)
    {
        Py_INCREF(Py_False);
        return Py_False;
    }
}

extern "C" PyObject *UnaryInvert(PyObject *val)
{
    PyObject *res = PyNumber_Invert(val);
    Py_DECREF(val);
    return res;
}

extern "C" PyObject *CallFunction(PyObject *func, int nargs, ...)
{
    PyObject *args = PyTuple_New(nargs);    
    va_list argList;
    va_start(argList, nargs);
    for (int i = 0; i < nargs; ++i) {
        PyObject *arg = va_arg(argList, PyObject *);
        PyTuple_SET_ITEM(args, i, arg);
    }
    va_end(argList);
    PyObject *res = PyObject_Call(func, args, nullptr);
    Py_DECREF(func);
    Py_DECREF(args);
    return res;
}
