; ModuleID = 'function.cpp'
source_filename = "function.cpp"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc18.0.0"

%struct._typeobject = type { %struct.PyVarObject, i8*, i64, i64, void (%struct._object*)*, i32 (%struct._object*, %struct._iobuf*, i32)*, %struct._object* (%struct._object*, i8*)*, i32 (%struct._object*, i8*, %struct._object*)*, %struct.PyAsyncMethods*, %struct._object* (%struct._object*)*, %struct.PyNumberMethods*, %struct.PySequenceMethods*, %struct.PyMappingMethods*, i64 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, i32 (%struct._object*, %struct._object*, %struct._object*)*, %struct.PyBufferProcs*, i32, i8*, i32 (%struct._object*, i32 (%struct._object*, i8*)*, i8*)*, i32 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*, i32)*, i64, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, %struct.PyMethodDef*, %struct.PyMemberDef*, %struct.PyGetSetDef*, %struct._typeobject*, %struct._object*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, i32 (%struct._object*, %struct._object*, %struct._object*)*, i64, i32 (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._typeobject*, i64)*, %struct._object* (%struct._typeobject*, %struct._object*, %struct._object*)*, void (i8*)*, i32 (%struct._object*)*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, void (%struct._object*)*, i32, void (%struct._object*)* }
%struct.PyVarObject = type { %struct._object, i64 }
%struct._object = type { i64, %struct._typeobject* }
%struct._iobuf = type { i8* }
%struct.PyAsyncMethods = type { %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)* }
%struct.PyNumberMethods = type { %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, i32 (%struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, i8*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)* }
%struct.PySequenceMethods = type { i64 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, i64)*, %struct._object* (%struct._object*, i64)*, i8*, i32 (%struct._object*, i64, %struct._object*)*, i8*, i32 (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, i64)* }
%struct.PyMappingMethods = type { i64 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, i32 (%struct._object*, %struct._object*, %struct._object*)* }
%struct.PyBufferProcs = type { i32 (%struct._object*, %struct.bufferinfo*, i32)*, void (%struct._object*, %struct.bufferinfo*)* }
%struct.bufferinfo = type { i8*, %struct._object*, i64, i64, i32, i32, i8*, i64*, i64*, i64*, i8* }
%struct.PyMethodDef = type { i8*, %struct._object* (%struct._object*, %struct._object*)*, i32, i8* }
%struct.PyMemberDef = type opaque
%struct.PyGetSetDef = type { i8*, %struct._object* (%struct._object*, i8*)*, i32 (%struct._object*, %struct._object*, i8*)*, i8*, i8* }
%struct._longobject = type { %struct.PyVarObject, [1 x i32] }
%struct.PyCodeObject = type { %struct._object, i32, i32, i32, i32, i32, i32, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, i8*, %struct._object*, %struct._object*, %struct._object*, i8*, %struct._object*, i8* }
%struct.PyFloatObject = type { %struct._object, double }
%struct._frame = type { %struct.PyVarObject, %struct._frame*, %struct.PyCodeObject*, %struct._object*, %struct._object*, %struct._object*, %struct._object**, %struct._object**, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, i32, i32, i32, i8, [20 x %struct.PyTryBlock], [1 x %struct._object*] }
%struct.PyTryBlock = type { i32, i32, i32 }
%struct.PyTupleObject = type { %struct.PyVarObject, [1 x %struct._object*] }

@PyUnicode_Type = external dllimport global %struct._typeobject, align 8
@_Py_TrueStruct = external dllimport global %struct._longobject, align 8
@_Py_FalseStruct = external dllimport global %struct._longobject, align 8

; Function Attrs: noinline nounwind uwtable
define %struct.PyCodeObject* @TempFunc1() #0 {
  ret %struct.PyCodeObject* null
}

; Function Attrs: noinline nounwind uwtable
define double @ToDouble(%struct._object*) #0 {
  %2 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  %3 = load %struct._object*, %struct._object** %2, align 8
  %4 = bitcast %struct._object* %3 to %struct.PyFloatObject*
  %5 = getelementptr inbounds %struct.PyFloatObject, %struct.PyFloatObject* %4, i32 0, i32 1
  %6 = load double, double* %5, align 8
  ret double %6
}

; Function Attrs: noinline uwtable
define %struct._object* @FromDouble(double) #1 {
  %2 = alloca double, align 8
  store double %0, double* %2, align 8
  %3 = load double, double* %2, align 8
  %4 = call %struct._object* @PyFloat_FromDouble(double %3)
  ret %struct._object* %4
}

declare dllimport %struct._object* @PyFloat_FromDouble(double) #2

; Function Attrs: noinline nounwind uwtable
define void @PyIncref(%struct._object*) #0 {
  %2 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  %3 = load %struct._object*, %struct._object** %2, align 8
  %4 = getelementptr inbounds %struct._object, %struct._object* %3, i32 0, i32 0
  %5 = load i64, i64* %4, align 8
  %6 = add nsw i64 %5, 1
  store i64 %6, i64* %4, align 8
  ret void
}

; Function Attrs: noinline uwtable
define void @PyDecref(%struct._object*) #1 {
  %2 = alloca %struct._object*, align 8
  %3 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  br label %4

; <label>:4:                                      ; preds = %1
  %5 = load %struct._object*, %struct._object** %2, align 8
  store %struct._object* %5, %struct._object** %3, align 8
  %6 = load %struct._object*, %struct._object** %3, align 8
  %7 = getelementptr inbounds %struct._object, %struct._object* %6, i32 0, i32 0
  %8 = load i64, i64* %7, align 8
  %9 = add nsw i64 %8, -1
  store i64 %9, i64* %7, align 8
  %10 = icmp ne i64 %9, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %4
  br label %19

; <label>:12:                                     ; preds = %4
  %13 = load %struct._object*, %struct._object** %3, align 8
  %14 = getelementptr inbounds %struct._object, %struct._object* %13, i32 0, i32 1
  %15 = load %struct._typeobject*, %struct._typeobject** %14, align 8
  %16 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %15, i32 0, i32 4
  %17 = load void (%struct._object*)*, void (%struct._object*)** %16, align 8
  %18 = load %struct._object*, %struct._object** %3, align 8
  call void %17(%struct._object* %18)
  br label %19

; <label>:19:                                     ; preds = %12, %11
  br label %20

; <label>:20:                                     ; preds = %19
  ret void
}

; Function Attrs: noinline uwtable
define void @PyXDecref(%struct._object*) #1 {
  %2 = alloca %struct._object*, align 8
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  br label %5

; <label>:5:                                      ; preds = %1
  %6 = load %struct._object*, %struct._object** %2, align 8
  store %struct._object* %6, %struct._object** %3, align 8
  %7 = load %struct._object*, %struct._object** %3, align 8
  %8 = icmp ne %struct._object* %7, null
  br i1 %8, label %9, label %27

; <label>:9:                                      ; preds = %5
  br label %10

; <label>:10:                                     ; preds = %9
  %11 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %11, %struct._object** %4, align 8
  %12 = load %struct._object*, %struct._object** %4, align 8
  %13 = getelementptr inbounds %struct._object, %struct._object* %12, i32 0, i32 0
  %14 = load i64, i64* %13, align 8
  %15 = add nsw i64 %14, -1
  store i64 %15, i64* %13, align 8
  %16 = icmp ne i64 %15, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %10
  br label %25

; <label>:18:                                     ; preds = %10
  %19 = load %struct._object*, %struct._object** %4, align 8
  %20 = getelementptr inbounds %struct._object, %struct._object* %19, i32 0, i32 1
  %21 = load %struct._typeobject*, %struct._typeobject** %20, align 8
  %22 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %21, i32 0, i32 4
  %23 = load void (%struct._object*)*, void (%struct._object*)** %22, align 8
  %24 = load %struct._object*, %struct._object** %4, align 8
  call void %23(%struct._object* %24)
  br label %25

; <label>:25:                                     ; preds = %18, %17
  br label %26

; <label>:26:                                     ; preds = %25
  br label %27

; <label>:27:                                     ; preds = %26, %5
  br label %28

; <label>:28:                                     ; preds = %27
  ret void
}

; Function Attrs: noinline uwtable
define %struct._object* @BinaryAdd(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %8 = load %struct._object*, %struct._object** %4, align 8
  %9 = getelementptr inbounds %struct._object, %struct._object* %8, i32 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8
  %11 = icmp eq %struct._typeobject* %10, @PyUnicode_Type
  br i1 %11, label %12, label %21

; <label>:12:                                     ; preds = %2
  %13 = load %struct._object*, %struct._object** %3, align 8
  %14 = getelementptr inbounds %struct._object, %struct._object* %13, i32 0, i32 1
  %15 = load %struct._typeobject*, %struct._typeobject** %14, align 8
  %16 = icmp eq %struct._typeobject* %15, @PyUnicode_Type
  br i1 %16, label %17, label %21

; <label>:17:                                     ; preds = %12
  %18 = load %struct._object*, %struct._object** %3, align 8
  %19 = load %struct._object*, %struct._object** %4, align 8
  %20 = call %struct._object* @PyUnicode_Concat(%struct._object* %19, %struct._object* %18)
  store %struct._object* %20, %struct._object** %5, align 8
  br label %25

; <label>:21:                                     ; preds = %12, %2
  %22 = load %struct._object*, %struct._object** %3, align 8
  %23 = load %struct._object*, %struct._object** %4, align 8
  %24 = call %struct._object* @PyNumber_Add(%struct._object* %23, %struct._object* %22)
  store %struct._object* %24, %struct._object** %5, align 8
  br label %25

; <label>:25:                                     ; preds = %21, %17
  br label %26

; <label>:26:                                     ; preds = %25
  %27 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %27, %struct._object** %6, align 8
  %28 = load %struct._object*, %struct._object** %6, align 8
  %29 = getelementptr inbounds %struct._object, %struct._object* %28, i32 0, i32 0
  %30 = load i64, i64* %29, align 8
  %31 = add nsw i64 %30, -1
  store i64 %31, i64* %29, align 8
  %32 = icmp ne i64 %31, 0
  br i1 %32, label %33, label %34

; <label>:33:                                     ; preds = %26
  br label %41

; <label>:34:                                     ; preds = %26
  %35 = load %struct._object*, %struct._object** %6, align 8
  %36 = getelementptr inbounds %struct._object, %struct._object* %35, i32 0, i32 1
  %37 = load %struct._typeobject*, %struct._typeobject** %36, align 8
  %38 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %37, i32 0, i32 4
  %39 = load void (%struct._object*)*, void (%struct._object*)** %38, align 8
  %40 = load %struct._object*, %struct._object** %6, align 8
  call void %39(%struct._object* %40)
  br label %41

; <label>:41:                                     ; preds = %34, %33
  br label %42

; <label>:42:                                     ; preds = %41
  br label %43

; <label>:43:                                     ; preds = %42
  %44 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %44, %struct._object** %7, align 8
  %45 = load %struct._object*, %struct._object** %7, align 8
  %46 = getelementptr inbounds %struct._object, %struct._object* %45, i32 0, i32 0
  %47 = load i64, i64* %46, align 8
  %48 = add nsw i64 %47, -1
  store i64 %48, i64* %46, align 8
  %49 = icmp ne i64 %48, 0
  br i1 %49, label %50, label %51

; <label>:50:                                     ; preds = %43
  br label %58

; <label>:51:                                     ; preds = %43
  %52 = load %struct._object*, %struct._object** %7, align 8
  %53 = getelementptr inbounds %struct._object, %struct._object* %52, i32 0, i32 1
  %54 = load %struct._typeobject*, %struct._typeobject** %53, align 8
  %55 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %54, i32 0, i32 4
  %56 = load void (%struct._object*)*, void (%struct._object*)** %55, align 8
  %57 = load %struct._object*, %struct._object** %7, align 8
  call void %56(%struct._object* %57)
  br label %58

; <label>:58:                                     ; preds = %51, %50
  br label %59

; <label>:59:                                     ; preds = %58
  %60 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %60
}

declare dllimport %struct._object* @PyUnicode_Concat(%struct._object*, %struct._object*) #2

declare dllimport %struct._object* @PyNumber_Add(%struct._object*, %struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @BinarySubtract(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %8 = load %struct._object*, %struct._object** %3, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = call %struct._object* @PyNumber_Subtract(%struct._object* %9, %struct._object* %8)
  store %struct._object* %10, %struct._object** %5, align 8
  br label %11

; <label>:11:                                     ; preds = %2
  %12 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %12, %struct._object** %6, align 8
  %13 = load %struct._object*, %struct._object** %6, align 8
  %14 = getelementptr inbounds %struct._object, %struct._object* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %11
  br label %26

; <label>:19:                                     ; preds = %11
  %20 = load %struct._object*, %struct._object** %6, align 8
  %21 = getelementptr inbounds %struct._object, %struct._object* %20, i32 0, i32 1
  %22 = load %struct._typeobject*, %struct._typeobject** %21, align 8
  %23 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %22, i32 0, i32 4
  %24 = load void (%struct._object*)*, void (%struct._object*)** %23, align 8
  %25 = load %struct._object*, %struct._object** %6, align 8
  call void %24(%struct._object* %25)
  br label %26

; <label>:26:                                     ; preds = %19, %18
  br label %27

; <label>:27:                                     ; preds = %26
  br label %28

; <label>:28:                                     ; preds = %27
  %29 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %29, %struct._object** %7, align 8
  %30 = load %struct._object*, %struct._object** %7, align 8
  %31 = getelementptr inbounds %struct._object, %struct._object* %30, i32 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, -1
  store i64 %33, i64* %31, align 8
  %34 = icmp ne i64 %33, 0
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %28
  br label %43

; <label>:36:                                     ; preds = %28
  %37 = load %struct._object*, %struct._object** %7, align 8
  %38 = getelementptr inbounds %struct._object, %struct._object* %37, i32 0, i32 1
  %39 = load %struct._typeobject*, %struct._typeobject** %38, align 8
  %40 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %39, i32 0, i32 4
  %41 = load void (%struct._object*)*, void (%struct._object*)** %40, align 8
  %42 = load %struct._object*, %struct._object** %7, align 8
  call void %41(%struct._object* %42)
  br label %43

; <label>:43:                                     ; preds = %36, %35
  br label %44

; <label>:44:                                     ; preds = %43
  %45 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %45
}

declare dllimport %struct._object* @PyNumber_Subtract(%struct._object*, %struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @BinarySubscr(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %8 = load %struct._object*, %struct._object** %3, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = call %struct._object* @PyObject_GetItem(%struct._object* %9, %struct._object* %8)
  store %struct._object* %10, %struct._object** %5, align 8
  br label %11

; <label>:11:                                     ; preds = %2
  %12 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %12, %struct._object** %6, align 8
  %13 = load %struct._object*, %struct._object** %6, align 8
  %14 = getelementptr inbounds %struct._object, %struct._object* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %11
  br label %26

; <label>:19:                                     ; preds = %11
  %20 = load %struct._object*, %struct._object** %6, align 8
  %21 = getelementptr inbounds %struct._object, %struct._object* %20, i32 0, i32 1
  %22 = load %struct._typeobject*, %struct._typeobject** %21, align 8
  %23 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %22, i32 0, i32 4
  %24 = load void (%struct._object*)*, void (%struct._object*)** %23, align 8
  %25 = load %struct._object*, %struct._object** %6, align 8
  call void %24(%struct._object* %25)
  br label %26

; <label>:26:                                     ; preds = %19, %18
  br label %27

; <label>:27:                                     ; preds = %26
  br label %28

; <label>:28:                                     ; preds = %27
  %29 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %29, %struct._object** %7, align 8
  %30 = load %struct._object*, %struct._object** %7, align 8
  %31 = getelementptr inbounds %struct._object, %struct._object* %30, i32 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, -1
  store i64 %33, i64* %31, align 8
  %34 = icmp ne i64 %33, 0
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %28
  br label %43

; <label>:36:                                     ; preds = %28
  %37 = load %struct._object*, %struct._object** %7, align 8
  %38 = getelementptr inbounds %struct._object, %struct._object* %37, i32 0, i32 1
  %39 = load %struct._typeobject*, %struct._typeobject** %38, align 8
  %40 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %39, i32 0, i32 4
  %41 = load void (%struct._object*)*, void (%struct._object*)** %40, align 8
  %42 = load %struct._object*, %struct._object** %7, align 8
  call void %41(%struct._object* %42)
  br label %43

; <label>:43:                                     ; preds = %36, %35
  br label %44

; <label>:44:                                     ; preds = %43
  %45 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %45
}

declare dllimport %struct._object* @PyObject_GetItem(%struct._object*, %struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @BinaryLshift(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %8 = load %struct._object*, %struct._object** %3, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = call %struct._object* @PyNumber_Lshift(%struct._object* %9, %struct._object* %8)
  store %struct._object* %10, %struct._object** %5, align 8
  br label %11

; <label>:11:                                     ; preds = %2
  %12 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %12, %struct._object** %6, align 8
  %13 = load %struct._object*, %struct._object** %6, align 8
  %14 = getelementptr inbounds %struct._object, %struct._object* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %11
  br label %26

; <label>:19:                                     ; preds = %11
  %20 = load %struct._object*, %struct._object** %6, align 8
  %21 = getelementptr inbounds %struct._object, %struct._object* %20, i32 0, i32 1
  %22 = load %struct._typeobject*, %struct._typeobject** %21, align 8
  %23 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %22, i32 0, i32 4
  %24 = load void (%struct._object*)*, void (%struct._object*)** %23, align 8
  %25 = load %struct._object*, %struct._object** %6, align 8
  call void %24(%struct._object* %25)
  br label %26

; <label>:26:                                     ; preds = %19, %18
  br label %27

; <label>:27:                                     ; preds = %26
  br label %28

; <label>:28:                                     ; preds = %27
  %29 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %29, %struct._object** %7, align 8
  %30 = load %struct._object*, %struct._object** %7, align 8
  %31 = getelementptr inbounds %struct._object, %struct._object* %30, i32 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, -1
  store i64 %33, i64* %31, align 8
  %34 = icmp ne i64 %33, 0
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %28
  br label %43

; <label>:36:                                     ; preds = %28
  %37 = load %struct._object*, %struct._object** %7, align 8
  %38 = getelementptr inbounds %struct._object, %struct._object* %37, i32 0, i32 1
  %39 = load %struct._typeobject*, %struct._typeobject** %38, align 8
  %40 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %39, i32 0, i32 4
  %41 = load void (%struct._object*)*, void (%struct._object*)** %40, align 8
  %42 = load %struct._object*, %struct._object** %7, align 8
  call void %41(%struct._object* %42)
  br label %43

; <label>:43:                                     ; preds = %36, %35
  br label %44

; <label>:44:                                     ; preds = %43
  %45 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %45
}

declare dllimport %struct._object* @PyNumber_Lshift(%struct._object*, %struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @BinaryRshift(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %8 = load %struct._object*, %struct._object** %3, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = call %struct._object* @PyNumber_Rshift(%struct._object* %9, %struct._object* %8)
  store %struct._object* %10, %struct._object** %5, align 8
  br label %11

; <label>:11:                                     ; preds = %2
  %12 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %12, %struct._object** %6, align 8
  %13 = load %struct._object*, %struct._object** %6, align 8
  %14 = getelementptr inbounds %struct._object, %struct._object* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %11
  br label %26

; <label>:19:                                     ; preds = %11
  %20 = load %struct._object*, %struct._object** %6, align 8
  %21 = getelementptr inbounds %struct._object, %struct._object* %20, i32 0, i32 1
  %22 = load %struct._typeobject*, %struct._typeobject** %21, align 8
  %23 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %22, i32 0, i32 4
  %24 = load void (%struct._object*)*, void (%struct._object*)** %23, align 8
  %25 = load %struct._object*, %struct._object** %6, align 8
  call void %24(%struct._object* %25)
  br label %26

; <label>:26:                                     ; preds = %19, %18
  br label %27

; <label>:27:                                     ; preds = %26
  br label %28

; <label>:28:                                     ; preds = %27
  %29 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %29, %struct._object** %7, align 8
  %30 = load %struct._object*, %struct._object** %7, align 8
  %31 = getelementptr inbounds %struct._object, %struct._object* %30, i32 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, -1
  store i64 %33, i64* %31, align 8
  %34 = icmp ne i64 %33, 0
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %28
  br label %43

; <label>:36:                                     ; preds = %28
  %37 = load %struct._object*, %struct._object** %7, align 8
  %38 = getelementptr inbounds %struct._object, %struct._object* %37, i32 0, i32 1
  %39 = load %struct._typeobject*, %struct._typeobject** %38, align 8
  %40 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %39, i32 0, i32 4
  %41 = load void (%struct._object*)*, void (%struct._object*)** %40, align 8
  %42 = load %struct._object*, %struct._object** %7, align 8
  call void %41(%struct._object* %42)
  br label %43

; <label>:43:                                     ; preds = %36, %35
  br label %44

; <label>:44:                                     ; preds = %43
  %45 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %45
}

declare dllimport %struct._object* @PyNumber_Rshift(%struct._object*, %struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @BinaryAnd(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %8 = load %struct._object*, %struct._object** %3, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = call %struct._object* @PyNumber_And(%struct._object* %9, %struct._object* %8)
  store %struct._object* %10, %struct._object** %5, align 8
  br label %11

; <label>:11:                                     ; preds = %2
  %12 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %12, %struct._object** %6, align 8
  %13 = load %struct._object*, %struct._object** %6, align 8
  %14 = getelementptr inbounds %struct._object, %struct._object* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %11
  br label %26

; <label>:19:                                     ; preds = %11
  %20 = load %struct._object*, %struct._object** %6, align 8
  %21 = getelementptr inbounds %struct._object, %struct._object* %20, i32 0, i32 1
  %22 = load %struct._typeobject*, %struct._typeobject** %21, align 8
  %23 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %22, i32 0, i32 4
  %24 = load void (%struct._object*)*, void (%struct._object*)** %23, align 8
  %25 = load %struct._object*, %struct._object** %6, align 8
  call void %24(%struct._object* %25)
  br label %26

; <label>:26:                                     ; preds = %19, %18
  br label %27

; <label>:27:                                     ; preds = %26
  br label %28

; <label>:28:                                     ; preds = %27
  %29 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %29, %struct._object** %7, align 8
  %30 = load %struct._object*, %struct._object** %7, align 8
  %31 = getelementptr inbounds %struct._object, %struct._object* %30, i32 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, -1
  store i64 %33, i64* %31, align 8
  %34 = icmp ne i64 %33, 0
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %28
  br label %43

; <label>:36:                                     ; preds = %28
  %37 = load %struct._object*, %struct._object** %7, align 8
  %38 = getelementptr inbounds %struct._object, %struct._object* %37, i32 0, i32 1
  %39 = load %struct._typeobject*, %struct._typeobject** %38, align 8
  %40 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %39, i32 0, i32 4
  %41 = load void (%struct._object*)*, void (%struct._object*)** %40, align 8
  %42 = load %struct._object*, %struct._object** %7, align 8
  call void %41(%struct._object* %42)
  br label %43

; <label>:43:                                     ; preds = %36, %35
  br label %44

; <label>:44:                                     ; preds = %43
  %45 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %45
}

declare dllimport %struct._object* @PyNumber_And(%struct._object*, %struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @BinaryXor(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %8 = load %struct._object*, %struct._object** %3, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = call %struct._object* @PyNumber_Xor(%struct._object* %9, %struct._object* %8)
  store %struct._object* %10, %struct._object** %5, align 8
  br label %11

; <label>:11:                                     ; preds = %2
  %12 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %12, %struct._object** %6, align 8
  %13 = load %struct._object*, %struct._object** %6, align 8
  %14 = getelementptr inbounds %struct._object, %struct._object* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %11
  br label %26

; <label>:19:                                     ; preds = %11
  %20 = load %struct._object*, %struct._object** %6, align 8
  %21 = getelementptr inbounds %struct._object, %struct._object* %20, i32 0, i32 1
  %22 = load %struct._typeobject*, %struct._typeobject** %21, align 8
  %23 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %22, i32 0, i32 4
  %24 = load void (%struct._object*)*, void (%struct._object*)** %23, align 8
  %25 = load %struct._object*, %struct._object** %6, align 8
  call void %24(%struct._object* %25)
  br label %26

; <label>:26:                                     ; preds = %19, %18
  br label %27

; <label>:27:                                     ; preds = %26
  br label %28

; <label>:28:                                     ; preds = %27
  %29 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %29, %struct._object** %7, align 8
  %30 = load %struct._object*, %struct._object** %7, align 8
  %31 = getelementptr inbounds %struct._object, %struct._object* %30, i32 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, -1
  store i64 %33, i64* %31, align 8
  %34 = icmp ne i64 %33, 0
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %28
  br label %43

; <label>:36:                                     ; preds = %28
  %37 = load %struct._object*, %struct._object** %7, align 8
  %38 = getelementptr inbounds %struct._object, %struct._object* %37, i32 0, i32 1
  %39 = load %struct._typeobject*, %struct._typeobject** %38, align 8
  %40 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %39, i32 0, i32 4
  %41 = load void (%struct._object*)*, void (%struct._object*)** %40, align 8
  %42 = load %struct._object*, %struct._object** %7, align 8
  call void %41(%struct._object* %42)
  br label %43

; <label>:43:                                     ; preds = %36, %35
  br label %44

; <label>:44:                                     ; preds = %43
  %45 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %45
}

declare dllimport %struct._object* @PyNumber_Xor(%struct._object*, %struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @BinaryOr(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %8 = load %struct._object*, %struct._object** %3, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = call %struct._object* @PyNumber_Or(%struct._object* %9, %struct._object* %8)
  store %struct._object* %10, %struct._object** %5, align 8
  br label %11

; <label>:11:                                     ; preds = %2
  %12 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %12, %struct._object** %6, align 8
  %13 = load %struct._object*, %struct._object** %6, align 8
  %14 = getelementptr inbounds %struct._object, %struct._object* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %11
  br label %26

; <label>:19:                                     ; preds = %11
  %20 = load %struct._object*, %struct._object** %6, align 8
  %21 = getelementptr inbounds %struct._object, %struct._object* %20, i32 0, i32 1
  %22 = load %struct._typeobject*, %struct._typeobject** %21, align 8
  %23 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %22, i32 0, i32 4
  %24 = load void (%struct._object*)*, void (%struct._object*)** %23, align 8
  %25 = load %struct._object*, %struct._object** %6, align 8
  call void %24(%struct._object* %25)
  br label %26

; <label>:26:                                     ; preds = %19, %18
  br label %27

; <label>:27:                                     ; preds = %26
  br label %28

; <label>:28:                                     ; preds = %27
  %29 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %29, %struct._object** %7, align 8
  %30 = load %struct._object*, %struct._object** %7, align 8
  %31 = getelementptr inbounds %struct._object, %struct._object* %30, i32 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, -1
  store i64 %33, i64* %31, align 8
  %34 = icmp ne i64 %33, 0
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %28
  br label %43

; <label>:36:                                     ; preds = %28
  %37 = load %struct._object*, %struct._object** %7, align 8
  %38 = getelementptr inbounds %struct._object, %struct._object* %37, i32 0, i32 1
  %39 = load %struct._typeobject*, %struct._typeobject** %38, align 8
  %40 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %39, i32 0, i32 4
  %41 = load void (%struct._object*)*, void (%struct._object*)** %40, align 8
  %42 = load %struct._object*, %struct._object** %7, align 8
  call void %41(%struct._object* %42)
  br label %43

; <label>:43:                                     ; preds = %36, %35
  br label %44

; <label>:44:                                     ; preds = %43
  %45 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %45
}

declare dllimport %struct._object* @PyNumber_Or(%struct._object*, %struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @InplaceAdd(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %8 = load %struct._object*, %struct._object** %4, align 8
  %9 = getelementptr inbounds %struct._object, %struct._object* %8, i32 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8
  %11 = icmp eq %struct._typeobject* %10, @PyUnicode_Type
  br i1 %11, label %12, label %21

; <label>:12:                                     ; preds = %2
  %13 = load %struct._object*, %struct._object** %3, align 8
  %14 = getelementptr inbounds %struct._object, %struct._object* %13, i32 0, i32 1
  %15 = load %struct._typeobject*, %struct._typeobject** %14, align 8
  %16 = icmp eq %struct._typeobject* %15, @PyUnicode_Type
  br i1 %16, label %17, label %21

; <label>:17:                                     ; preds = %12
  %18 = load %struct._object*, %struct._object** %3, align 8
  %19 = load %struct._object*, %struct._object** %4, align 8
  %20 = call %struct._object* @PyUnicode_Concat(%struct._object* %19, %struct._object* %18)
  store %struct._object* %20, %struct._object** %5, align 8
  br label %25

; <label>:21:                                     ; preds = %12, %2
  %22 = load %struct._object*, %struct._object** %3, align 8
  %23 = load %struct._object*, %struct._object** %4, align 8
  %24 = call %struct._object* @PyNumber_InPlaceAdd(%struct._object* %23, %struct._object* %22)
  store %struct._object* %24, %struct._object** %5, align 8
  br label %25

; <label>:25:                                     ; preds = %21, %17
  br label %26

; <label>:26:                                     ; preds = %25
  %27 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %27, %struct._object** %6, align 8
  %28 = load %struct._object*, %struct._object** %6, align 8
  %29 = getelementptr inbounds %struct._object, %struct._object* %28, i32 0, i32 0
  %30 = load i64, i64* %29, align 8
  %31 = add nsw i64 %30, -1
  store i64 %31, i64* %29, align 8
  %32 = icmp ne i64 %31, 0
  br i1 %32, label %33, label %34

; <label>:33:                                     ; preds = %26
  br label %41

; <label>:34:                                     ; preds = %26
  %35 = load %struct._object*, %struct._object** %6, align 8
  %36 = getelementptr inbounds %struct._object, %struct._object* %35, i32 0, i32 1
  %37 = load %struct._typeobject*, %struct._typeobject** %36, align 8
  %38 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %37, i32 0, i32 4
  %39 = load void (%struct._object*)*, void (%struct._object*)** %38, align 8
  %40 = load %struct._object*, %struct._object** %6, align 8
  call void %39(%struct._object* %40)
  br label %41

; <label>:41:                                     ; preds = %34, %33
  br label %42

; <label>:42:                                     ; preds = %41
  br label %43

; <label>:43:                                     ; preds = %42
  %44 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %44, %struct._object** %7, align 8
  %45 = load %struct._object*, %struct._object** %7, align 8
  %46 = getelementptr inbounds %struct._object, %struct._object* %45, i32 0, i32 0
  %47 = load i64, i64* %46, align 8
  %48 = add nsw i64 %47, -1
  store i64 %48, i64* %46, align 8
  %49 = icmp ne i64 %48, 0
  br i1 %49, label %50, label %51

; <label>:50:                                     ; preds = %43
  br label %58

; <label>:51:                                     ; preds = %43
  %52 = load %struct._object*, %struct._object** %7, align 8
  %53 = getelementptr inbounds %struct._object, %struct._object* %52, i32 0, i32 1
  %54 = load %struct._typeobject*, %struct._typeobject** %53, align 8
  %55 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %54, i32 0, i32 4
  %56 = load void (%struct._object*)*, void (%struct._object*)** %55, align 8
  %57 = load %struct._object*, %struct._object** %7, align 8
  call void %56(%struct._object* %57)
  br label %58

; <label>:58:                                     ; preds = %51, %50
  br label %59

; <label>:59:                                     ; preds = %58
  %60 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %60
}

declare dllimport %struct._object* @PyNumber_InPlaceAdd(%struct._object*, %struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @InplaceSubtract(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %8 = load %struct._object*, %struct._object** %3, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = call %struct._object* @PyNumber_InPlaceSubtract(%struct._object* %9, %struct._object* %8)
  store %struct._object* %10, %struct._object** %5, align 8
  br label %11

; <label>:11:                                     ; preds = %2
  %12 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %12, %struct._object** %6, align 8
  %13 = load %struct._object*, %struct._object** %6, align 8
  %14 = getelementptr inbounds %struct._object, %struct._object* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %11
  br label %26

; <label>:19:                                     ; preds = %11
  %20 = load %struct._object*, %struct._object** %6, align 8
  %21 = getelementptr inbounds %struct._object, %struct._object* %20, i32 0, i32 1
  %22 = load %struct._typeobject*, %struct._typeobject** %21, align 8
  %23 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %22, i32 0, i32 4
  %24 = load void (%struct._object*)*, void (%struct._object*)** %23, align 8
  %25 = load %struct._object*, %struct._object** %6, align 8
  call void %24(%struct._object* %25)
  br label %26

; <label>:26:                                     ; preds = %19, %18
  br label %27

; <label>:27:                                     ; preds = %26
  br label %28

; <label>:28:                                     ; preds = %27
  %29 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %29, %struct._object** %7, align 8
  %30 = load %struct._object*, %struct._object** %7, align 8
  %31 = getelementptr inbounds %struct._object, %struct._object* %30, i32 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, -1
  store i64 %33, i64* %31, align 8
  %34 = icmp ne i64 %33, 0
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %28
  br label %43

; <label>:36:                                     ; preds = %28
  %37 = load %struct._object*, %struct._object** %7, align 8
  %38 = getelementptr inbounds %struct._object, %struct._object* %37, i32 0, i32 1
  %39 = load %struct._typeobject*, %struct._typeobject** %38, align 8
  %40 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %39, i32 0, i32 4
  %41 = load void (%struct._object*)*, void (%struct._object*)** %40, align 8
  %42 = load %struct._object*, %struct._object** %7, align 8
  call void %41(%struct._object* %42)
  br label %43

; <label>:43:                                     ; preds = %36, %35
  br label %44

; <label>:44:                                     ; preds = %43
  %45 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %45
}

declare dllimport %struct._object* @PyNumber_InPlaceSubtract(%struct._object*, %struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @SequenceContains(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %6 = load %struct._object*, %struct._object** %3, align 8
  %7 = load %struct._object*, %struct._object** %4, align 8
  %8 = call i32 @PySequence_Contains(%struct._object* %7, %struct._object* %6)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %2
  br label %12

; <label>:11:                                     ; preds = %2
  br label %12

; <label>:12:                                     ; preds = %11, %10
  %13 = phi %struct._object* [ getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_TrueStruct, i32 0, i32 0, i32 0), %10 ], [ getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_FalseStruct, i32 0, i32 0, i32 0), %11 ]
  store %struct._object* %13, %struct._object** %5, align 8
  %14 = load %struct._object*, %struct._object** %5, align 8
  %15 = getelementptr inbounds %struct._object, %struct._object* %14, i32 0, i32 0
  %16 = load i64, i64* %15, align 8
  %17 = add nsw i64 %16, 1
  store i64 %17, i64* %15, align 8
  %18 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %18
}

declare dllimport i32 @PySequence_Contains(%struct._object*, %struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @SequenceNotContains(%struct._object*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  %6 = load %struct._object*, %struct._object** %3, align 8
  %7 = load %struct._object*, %struct._object** %4, align 8
  %8 = call i32 @PySequence_Contains(%struct._object* %7, %struct._object* %6)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %2
  br label %12

; <label>:11:                                     ; preds = %2
  br label %12

; <label>:12:                                     ; preds = %11, %10
  %13 = phi %struct._object* [ getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_FalseStruct, i32 0, i32 0, i32 0), %10 ], [ getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_TrueStruct, i32 0, i32 0, i32 0), %11 ]
  store %struct._object* %13, %struct._object** %5, align 8
  %14 = load %struct._object*, %struct._object** %5, align 8
  %15 = getelementptr inbounds %struct._object, %struct._object* %14, i32 0, i32 0
  %16 = load i64, i64* %15, align 8
  %17 = add nsw i64 %16, 1
  store i64 %17, i64* %15, align 8
  %18 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %18
}

; Function Attrs: noinline uwtable
define %struct._object* @RichCompare(%struct._object*, %struct._object*, i32) #1 {
  %4 = alloca i32, align 4
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  store i32 %2, i32* %4, align 4
  store %struct._object* %1, %struct._object** %5, align 8
  store %struct._object* %0, %struct._object** %6, align 8
  %7 = load i32, i32* %4, align 4
  %8 = load %struct._object*, %struct._object** %5, align 8
  %9 = load %struct._object*, %struct._object** %6, align 8
  %10 = call %struct._object* @PyObject_RichCompare(%struct._object* %9, %struct._object* %8, i32 %7)
  ret %struct._object* %10
}

declare dllimport %struct._object* @PyObject_RichCompare(%struct._object*, %struct._object*, i32) #2

; Function Attrs: noinline uwtable
define zeroext i1 @AsCond(%struct._object*) #1 {
  %2 = alloca i1, align 1
  %3 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %3, align 8
  %4 = load %struct._object*, %struct._object** %3, align 8
  %5 = icmp eq %struct._object* %4, getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_TrueStruct, i32 0, i32 0, i32 0)
  br i1 %5, label %6, label %7

; <label>:6:                                      ; preds = %1
  store i1 true, i1* %2, align 1
  br label %15

; <label>:7:                                      ; preds = %1
  %8 = load %struct._object*, %struct._object** %3, align 8
  %9 = icmp eq %struct._object* %8, getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_FalseStruct, i32 0, i32 0, i32 0)
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %7
  store i1 false, i1* %2, align 1
  br label %15

; <label>:11:                                     ; preds = %7
  %12 = load %struct._object*, %struct._object** %3, align 8
  %13 = call i32 @PyObject_IsTrue(%struct._object* %12)
  %14 = icmp sgt i32 %13, 0
  store i1 %14, i1* %2, align 1
  br label %15

; <label>:15:                                     ; preds = %11, %10, %6
  %16 = load i1, i1* %2, align 1
  ret i1 %16
}

declare dllimport i32 @PyObject_IsTrue(%struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @LoadGlobal(%struct._frame*, %struct._object*) #1 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._frame*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %1, %struct._object** %3, align 8
  store %struct._frame* %0, %struct._frame** %4, align 8
  %8 = load %struct._frame*, %struct._frame** %4, align 8
  %9 = getelementptr inbounds %struct._frame, %struct._frame* %8, i32 0, i32 4
  %10 = load %struct._object*, %struct._object** %9, align 8
  store %struct._object* %10, %struct._object** %5, align 8
  %11 = load %struct._frame*, %struct._frame** %4, align 8
  %12 = getelementptr inbounds %struct._frame, %struct._frame* %11, i32 0, i32 3
  %13 = load %struct._object*, %struct._object** %12, align 8
  store %struct._object* %13, %struct._object** %6, align 8
  %14 = load %struct._object*, %struct._object** %3, align 8
  %15 = load %struct._object*, %struct._object** %5, align 8
  %16 = call %struct._object* @PyObject_GetItem(%struct._object* %15, %struct._object* %14)
  store %struct._object* %16, %struct._object** %7, align 8
  %17 = load %struct._object*, %struct._object** %7, align 8
  %18 = icmp eq %struct._object* %17, null
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %2
  call void @PyErr_Clear()
  %20 = load %struct._object*, %struct._object** %3, align 8
  %21 = load %struct._object*, %struct._object** %6, align 8
  %22 = call %struct._object* @PyObject_GetItem(%struct._object* %21, %struct._object* %20)
  store %struct._object* %22, %struct._object** %7, align 8
  br label %23

; <label>:23:                                     ; preds = %19, %2
  %24 = load %struct._object*, %struct._object** %7, align 8
  ret %struct._object* %24
}

declare dllimport void @PyErr_Clear() #2

; Function Attrs: noinline nounwind uwtable
define %struct._object* @LoadFast(%struct._frame*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._frame*, align 8
  %5 = alloca %struct._object*, align 8
  store i32 %1, i32* %3, align 4
  store %struct._frame* %0, %struct._frame** %4, align 8
  %6 = load %struct._frame*, %struct._frame** %4, align 8
  %7 = getelementptr inbounds %struct._frame, %struct._frame* %6, i32 0, i32 18
  %8 = load i32, i32* %3, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [1 x %struct._object*], [1 x %struct._object*]* %7, i64 0, i64 %9
  %11 = load %struct._object*, %struct._object** %10, align 8
  store %struct._object* %11, %struct._object** %5, align 8
  %12 = load %struct._object*, %struct._object** %5, align 8
  %13 = getelementptr inbounds %struct._object, %struct._object* %12, i32 0, i32 0
  %14 = load i64, i64* %13, align 8
  %15 = add nsw i64 %14, 1
  store i64 %15, i64* %13, align 8
  %16 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %16
}

; Function Attrs: noinline uwtable
define void @StoreFast(%struct._frame*, i32, %struct._object*) #1 {
  %4 = alloca %struct._object*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct._frame*, align 8
  %7 = alloca %struct._object*, align 8
  %8 = alloca %struct._object*, align 8
  %9 = alloca %struct._object*, align 8
  store %struct._object* %2, %struct._object** %4, align 8
  store i32 %1, i32* %5, align 4
  store %struct._frame* %0, %struct._frame** %6, align 8
  %10 = load %struct._frame*, %struct._frame** %6, align 8
  %11 = getelementptr inbounds %struct._frame, %struct._frame* %10, i32 0, i32 18
  %12 = load i32, i32* %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1 x %struct._object*], [1 x %struct._object*]* %11, i64 0, i64 %13
  %15 = load %struct._object*, %struct._object** %14, align 8
  store %struct._object* %15, %struct._object** %7, align 8
  %16 = load %struct._object*, %struct._object** %4, align 8
  %17 = load %struct._frame*, %struct._frame** %6, align 8
  %18 = getelementptr inbounds %struct._frame, %struct._frame* %17, i32 0, i32 18
  %19 = load i32, i32* %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [1 x %struct._object*], [1 x %struct._object*]* %18, i64 0, i64 %20
  store %struct._object* %16, %struct._object** %21, align 8
  br label %22

; <label>:22:                                     ; preds = %3
  %23 = load %struct._object*, %struct._object** %7, align 8
  store %struct._object* %23, %struct._object** %8, align 8
  %24 = load %struct._object*, %struct._object** %8, align 8
  %25 = icmp ne %struct._object* %24, null
  br i1 %25, label %26, label %44

; <label>:26:                                     ; preds = %22
  br label %27

; <label>:27:                                     ; preds = %26
  %28 = load %struct._object*, %struct._object** %8, align 8
  store %struct._object* %28, %struct._object** %9, align 8
  %29 = load %struct._object*, %struct._object** %9, align 8
  %30 = getelementptr inbounds %struct._object, %struct._object* %29, i32 0, i32 0
  %31 = load i64, i64* %30, align 8
  %32 = add nsw i64 %31, -1
  store i64 %32, i64* %30, align 8
  %33 = icmp ne i64 %32, 0
  br i1 %33, label %34, label %35

; <label>:34:                                     ; preds = %27
  br label %42

; <label>:35:                                     ; preds = %27
  %36 = load %struct._object*, %struct._object** %9, align 8
  %37 = getelementptr inbounds %struct._object, %struct._object* %36, i32 0, i32 1
  %38 = load %struct._typeobject*, %struct._typeobject** %37, align 8
  %39 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %38, i32 0, i32 4
  %40 = load void (%struct._object*)*, void (%struct._object*)** %39, align 8
  %41 = load %struct._object*, %struct._object** %9, align 8
  call void %40(%struct._object* %41)
  br label %42

; <label>:42:                                     ; preds = %35, %34
  br label %43

; <label>:43:                                     ; preds = %42
  br label %44

; <label>:44:                                     ; preds = %43, %22
  br label %45

; <label>:45:                                     ; preds = %44
  ret void
}

; Function Attrs: noinline uwtable
define %struct._object* @UnaryPositive(%struct._object*) #1 {
  %2 = alloca %struct._object*, align 8
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  %5 = load %struct._object*, %struct._object** %2, align 8
  %6 = call %struct._object* @PyNumber_Positive(%struct._object* %5)
  store %struct._object* %6, %struct._object** %3, align 8
  br label %7

; <label>:7:                                      ; preds = %1
  %8 = load %struct._object*, %struct._object** %2, align 8
  store %struct._object* %8, %struct._object** %4, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = getelementptr inbounds %struct._object, %struct._object* %9, i32 0, i32 0
  %11 = load i64, i64* %10, align 8
  %12 = add nsw i64 %11, -1
  store i64 %12, i64* %10, align 8
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %7
  br label %22

; <label>:15:                                     ; preds = %7
  %16 = load %struct._object*, %struct._object** %4, align 8
  %17 = getelementptr inbounds %struct._object, %struct._object* %16, i32 0, i32 1
  %18 = load %struct._typeobject*, %struct._typeobject** %17, align 8
  %19 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %18, i32 0, i32 4
  %20 = load void (%struct._object*)*, void (%struct._object*)** %19, align 8
  %21 = load %struct._object*, %struct._object** %4, align 8
  call void %20(%struct._object* %21)
  br label %22

; <label>:22:                                     ; preds = %15, %14
  br label %23

; <label>:23:                                     ; preds = %22
  %24 = load %struct._object*, %struct._object** %3, align 8
  ret %struct._object* %24
}

declare dllimport %struct._object* @PyNumber_Positive(%struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @UnaryNegative(%struct._object*) #1 {
  %2 = alloca %struct._object*, align 8
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  %5 = load %struct._object*, %struct._object** %2, align 8
  %6 = call %struct._object* @PyNumber_Negative(%struct._object* %5)
  store %struct._object* %6, %struct._object** %3, align 8
  br label %7

; <label>:7:                                      ; preds = %1
  %8 = load %struct._object*, %struct._object** %2, align 8
  store %struct._object* %8, %struct._object** %4, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = getelementptr inbounds %struct._object, %struct._object* %9, i32 0, i32 0
  %11 = load i64, i64* %10, align 8
  %12 = add nsw i64 %11, -1
  store i64 %12, i64* %10, align 8
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %7
  br label %22

; <label>:15:                                     ; preds = %7
  %16 = load %struct._object*, %struct._object** %4, align 8
  %17 = getelementptr inbounds %struct._object, %struct._object* %16, i32 0, i32 1
  %18 = load %struct._typeobject*, %struct._typeobject** %17, align 8
  %19 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %18, i32 0, i32 4
  %20 = load void (%struct._object*)*, void (%struct._object*)** %19, align 8
  %21 = load %struct._object*, %struct._object** %4, align 8
  call void %20(%struct._object* %21)
  br label %22

; <label>:22:                                     ; preds = %15, %14
  br label %23

; <label>:23:                                     ; preds = %22
  %24 = load %struct._object*, %struct._object** %3, align 8
  ret %struct._object* %24
}

declare dllimport %struct._object* @PyNumber_Negative(%struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @UnaryNot(%struct._object*) #1 {
  %2 = alloca %struct._object*, align 8
  %3 = alloca %struct._object*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %3, align 8
  %6 = load %struct._object*, %struct._object** %3, align 8
  %7 = call i32 @PyObject_IsTrue(%struct._object* %6)
  store i32 %7, i32* %4, align 4
  br label %8

; <label>:8:                                      ; preds = %1
  %9 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %9, %struct._object** %5, align 8
  %10 = load %struct._object*, %struct._object** %5, align 8
  %11 = getelementptr inbounds %struct._object, %struct._object* %10, i32 0, i32 0
  %12 = load i64, i64* %11, align 8
  %13 = add nsw i64 %12, -1
  store i64 %13, i64* %11, align 8
  %14 = icmp ne i64 %13, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %8
  br label %23

; <label>:16:                                     ; preds = %8
  %17 = load %struct._object*, %struct._object** %5, align 8
  %18 = getelementptr inbounds %struct._object, %struct._object* %17, i32 0, i32 1
  %19 = load %struct._typeobject*, %struct._typeobject** %18, align 8
  %20 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %19, i32 0, i32 4
  %21 = load void (%struct._object*)*, void (%struct._object*)** %20, align 8
  %22 = load %struct._object*, %struct._object** %5, align 8
  call void %21(%struct._object* %22)
  br label %23

; <label>:23:                                     ; preds = %16, %15
  br label %24

; <label>:24:                                     ; preds = %23
  %25 = load i32, i32* %4, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %30

; <label>:27:                                     ; preds = %24
  %28 = load i64, i64* getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_TrueStruct, i32 0, i32 0, i32 0, i32 0), align 8
  %29 = add nsw i64 %28, 1
  store i64 %29, i64* getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_TrueStruct, i32 0, i32 0, i32 0, i32 0), align 8
  store %struct._object* getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_TrueStruct, i32 0, i32 0, i32 0), %struct._object** %2, align 8
  br label %38

; <label>:30:                                     ; preds = %24
  %31 = load i32, i32* %4, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %33, label %36

; <label>:33:                                     ; preds = %30
  %34 = load i64, i64* getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_FalseStruct, i32 0, i32 0, i32 0, i32 0), align 8
  %35 = add nsw i64 %34, 1
  store i64 %35, i64* getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_FalseStruct, i32 0, i32 0, i32 0, i32 0), align 8
  store %struct._object* getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_FalseStruct, i32 0, i32 0, i32 0), %struct._object** %2, align 8
  br label %38

; <label>:36:                                     ; preds = %30
  br label %37

; <label>:37:                                     ; preds = %36
  call void @llvm.trap()
  unreachable

; <label>:38:                                     ; preds = %33, %27
  %39 = load %struct._object*, %struct._object** %2, align 8
  ret %struct._object* %39
}

; Function Attrs: noreturn nounwind
declare void @llvm.trap() #3

; Function Attrs: noinline uwtable
define %struct._object* @UnaryInvert(%struct._object*) #1 {
  %2 = alloca %struct._object*, align 8
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  %5 = load %struct._object*, %struct._object** %2, align 8
  %6 = call %struct._object* @PyNumber_Invert(%struct._object* %5)
  store %struct._object* %6, %struct._object** %3, align 8
  br label %7

; <label>:7:                                      ; preds = %1
  %8 = load %struct._object*, %struct._object** %2, align 8
  store %struct._object* %8, %struct._object** %4, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = getelementptr inbounds %struct._object, %struct._object* %9, i32 0, i32 0
  %11 = load i64, i64* %10, align 8
  %12 = add nsw i64 %11, -1
  store i64 %12, i64* %10, align 8
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %7
  br label %22

; <label>:15:                                     ; preds = %7
  %16 = load %struct._object*, %struct._object** %4, align 8
  %17 = getelementptr inbounds %struct._object, %struct._object* %16, i32 0, i32 1
  %18 = load %struct._typeobject*, %struct._typeobject** %17, align 8
  %19 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %18, i32 0, i32 4
  %20 = load void (%struct._object*)*, void (%struct._object*)** %19, align 8
  %21 = load %struct._object*, %struct._object** %4, align 8
  call void %20(%struct._object* %21)
  br label %22

; <label>:22:                                     ; preds = %15, %14
  br label %23

; <label>:23:                                     ; preds = %22
  %24 = load %struct._object*, %struct._object** %3, align 8
  ret %struct._object* %24
}

declare dllimport %struct._object* @PyNumber_Invert(%struct._object*) #2

; Function Attrs: noinline uwtable
define %struct._object* @CallFunction(%struct._object*, i32, ...) #1 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct._object*, align 8
  %9 = alloca %struct._object*, align 8
  %10 = alloca %struct._object*, align 8
  %11 = alloca %struct._object*, align 8
  store i32 %1, i32* %3, align 4
  store %struct._object* %0, %struct._object** %4, align 8
  %12 = load i32, i32* %3, align 4
  %13 = sext i32 %12 to i64
  %14 = call %struct._object* @PyTuple_New(i64 %13)
  store %struct._object* %14, %struct._object** %5, align 8
  %15 = bitcast i8** %6 to i8*
  call void @llvm.va_start(i8* %15)
  store i32 0, i32* %7, align 4
  br label %16

; <label>:16:                                     ; preds = %32, %2
  %17 = load i32, i32* %7, align 4
  %18 = load i32, i32* %3, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %35

; <label>:20:                                     ; preds = %16
  %21 = load i8*, i8** %6, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 8
  store i8* %22, i8** %6, align 8
  %23 = bitcast i8* %21 to %struct._object**
  %24 = load %struct._object*, %struct._object** %23, align 8
  store %struct._object* %24, %struct._object** %8, align 8
  %25 = load %struct._object*, %struct._object** %8, align 8
  %26 = load %struct._object*, %struct._object** %5, align 8
  %27 = bitcast %struct._object* %26 to %struct.PyTupleObject*
  %28 = getelementptr inbounds %struct.PyTupleObject, %struct.PyTupleObject* %27, i32 0, i32 1
  %29 = load i32, i32* %7, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [1 x %struct._object*], [1 x %struct._object*]* %28, i64 0, i64 %30
  store %struct._object* %25, %struct._object** %31, align 8
  br label %32

; <label>:32:                                     ; preds = %20
  %33 = load i32, i32* %7, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %7, align 4
  br label %16

; <label>:35:                                     ; preds = %16
  %36 = bitcast i8** %6 to i8*
  call void @llvm.va_end(i8* %36)
  %37 = load %struct._object*, %struct._object** %5, align 8
  %38 = load %struct._object*, %struct._object** %4, align 8
  %39 = call %struct._object* @PyObject_Call(%struct._object* %38, %struct._object* %37, %struct._object* null)
  store %struct._object* %39, %struct._object** %9, align 8
  br label %40

; <label>:40:                                     ; preds = %35
  %41 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %41, %struct._object** %10, align 8
  %42 = load %struct._object*, %struct._object** %10, align 8
  %43 = getelementptr inbounds %struct._object, %struct._object* %42, i32 0, i32 0
  %44 = load i64, i64* %43, align 8
  %45 = add nsw i64 %44, -1
  store i64 %45, i64* %43, align 8
  %46 = icmp ne i64 %45, 0
  br i1 %46, label %47, label %48

; <label>:47:                                     ; preds = %40
  br label %55

; <label>:48:                                     ; preds = %40
  %49 = load %struct._object*, %struct._object** %10, align 8
  %50 = getelementptr inbounds %struct._object, %struct._object* %49, i32 0, i32 1
  %51 = load %struct._typeobject*, %struct._typeobject** %50, align 8
  %52 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %51, i32 0, i32 4
  %53 = load void (%struct._object*)*, void (%struct._object*)** %52, align 8
  %54 = load %struct._object*, %struct._object** %10, align 8
  call void %53(%struct._object* %54)
  br label %55

; <label>:55:                                     ; preds = %48, %47
  br label %56

; <label>:56:                                     ; preds = %55
  br label %57

; <label>:57:                                     ; preds = %56
  %58 = load %struct._object*, %struct._object** %5, align 8
  store %struct._object* %58, %struct._object** %11, align 8
  %59 = load %struct._object*, %struct._object** %11, align 8
  %60 = getelementptr inbounds %struct._object, %struct._object* %59, i32 0, i32 0
  %61 = load i64, i64* %60, align 8
  %62 = add nsw i64 %61, -1
  store i64 %62, i64* %60, align 8
  %63 = icmp ne i64 %62, 0
  br i1 %63, label %64, label %65

; <label>:64:                                     ; preds = %57
  br label %72

; <label>:65:                                     ; preds = %57
  %66 = load %struct._object*, %struct._object** %11, align 8
  %67 = getelementptr inbounds %struct._object, %struct._object* %66, i32 0, i32 1
  %68 = load %struct._typeobject*, %struct._typeobject** %67, align 8
  %69 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %68, i32 0, i32 4
  %70 = load void (%struct._object*)*, void (%struct._object*)** %69, align 8
  %71 = load %struct._object*, %struct._object** %11, align 8
  call void %70(%struct._object* %71)
  br label %72

; <label>:72:                                     ; preds = %65, %64
  br label %73

; <label>:73:                                     ; preds = %72
  %74 = load %struct._object*, %struct._object** %9, align 8
  ret %struct._object* %74
}

declare dllimport %struct._object* @PyTuple_New(i64) #2

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #4

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #4

declare dllimport %struct._object* @PyObject_Call(%struct._object*, %struct._object*, %struct._object*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !4}
!llvm.ident = !{!5}

!0 = !{i32 6, !"Linker Options", !1}
!1 = !{!2, !3}
!2 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!3 = !{!"/DEFAULTLIB:python36.lib"}
!4 = !{i32 1, !"PIC Level", i32 2}
!5 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
