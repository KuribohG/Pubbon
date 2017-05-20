; ModuleID = 'function.cpp'
source_filename = "function.cpp"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%struct._typeobject = type { %struct.PyVarObject, i8*, i64, i64, void (%struct._object*)*, i32 (%struct._object*, %struct.__sFILE*, i32)*, %struct._object* (%struct._object*, i8*)*, i32 (%struct._object*, i8*, %struct._object*)*, %struct.PyAsyncMethods*, %struct._object* (%struct._object*)*, %struct.PyNumberMethods*, %struct.PySequenceMethods*, %struct.PyMappingMethods*, i64 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, i32 (%struct._object*, %struct._object*, %struct._object*)*, %struct.PyBufferProcs*, i64, i8*, i32 (%struct._object*, i32 (%struct._object*, i8*)*, i8*)*, i32 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*, i32)*, i64, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, %struct.PyMethodDef*, %struct.PyMemberDef*, %struct.PyGetSetDef*, %struct._typeobject*, %struct._object*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, i32 (%struct._object*, %struct._object*, %struct._object*)*, i64, i32 (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._typeobject*, i64)*, %struct._object* (%struct._typeobject*, %struct._object*, %struct._object*)*, void (i8*)*, i32 (%struct._object*)*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, void (%struct._object*)*, i32, void (%struct._object*)* }
%struct.PyVarObject = type { %struct._object, i64 }
%struct._object = type { i64, %struct._typeobject* }
%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%struct.PyAsyncMethods = type { %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)* }
%struct.PyNumberMethods = type { %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, i32 (%struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, i8*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)* }
%struct.PySequenceMethods = type { i64 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, i64)*, %struct._object* (%struct._object*, i64)*, i8*, i32 (%struct._object*, i64, %struct._object*)*, i8*, i32 (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, i64)* }
%struct.PyMappingMethods = type { i64 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, i32 (%struct._object*, %struct._object*, %struct._object*)* }
%struct.PyBufferProcs = type { i32 (%struct._object*, %struct.bufferinfo*, i32)*, void (%struct._object*, %struct.bufferinfo*)* }
%struct.bufferinfo = type { i8*, %struct._object*, i64, i64, i32, i32, i8*, i64*, i64*, i64*, i8* }
%struct.PyMethodDef = type { i8*, %struct._object* (%struct._object*, %struct._object*)*, i32, i8* }
%struct.PyMemberDef = type opaque
%struct.PyGetSetDef = type { i8*, %struct._object* (%struct._object*, i8*)*, i32 (%struct._object*, %struct._object*, i8*)*, i8*, i8* }
%struct.PyCodeObject = type { %struct._object, i32, i32, i32, i32, i32, i32, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, i8*, %struct._object*, %struct._object*, %struct._object*, i8*, %struct._object*, i8* }
%struct._frame = type { %struct.PyVarObject, %struct._frame*, %struct.PyCodeObject*, %struct._object*, %struct._object*, %struct._object*, %struct._object**, %struct._object**, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, i32, i32, i32, i8, [20 x %struct.PyTryBlock], [1 x %struct._object*] }
%struct.PyTryBlock = type { i32, i32, i32 }

@PyUnicode_Type = external global %struct._typeobject, align 8

; Function Attrs: norecurse nounwind readnone ssp uwtable
define noalias %struct.PyCodeObject* @TempFunc1() #0 {
  ret %struct.PyCodeObject* null
}

; Function Attrs: norecurse nounwind readnone ssp uwtable
define noalias %struct._frame* @TempFunc2() #0 {
  ret %struct._frame* null
}

; Function Attrs: norecurse nounwind readonly ssp uwtable
define double @ToDouble(%struct._object* nocapture readonly) #1 {
  %2 = getelementptr inbounds %struct._object, %struct._object* %0, i64 1
  %3 = bitcast %struct._object* %2 to double*
  %4 = load double, double* %3, align 8, !tbaa !2
  ret double %4
}

; Function Attrs: ssp uwtable
define %struct._object* @FromDouble(double) #2 {
  %2 = tail call %struct._object* @PyFloat_FromDouble(double %0)
  ret %struct._object* %2
}

declare %struct._object* @PyFloat_FromDouble(double) #3

; Function Attrs: norecurse nounwind ssp uwtable
define void @PyIncref(%struct._object* nocapture) #4 {
  %2 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %3 = load i64, i64* %2, align 8, !tbaa !10
  %4 = add nsw i64 %3, 1
  store i64 %4, i64* %2, align 8, !tbaa !10
  ret void
}

; Function Attrs: ssp uwtable
define void @PyDecref(%struct._object*) #2 {
  %2 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %3 = load i64, i64* %2, align 8, !tbaa !10
  %4 = add nsw i64 %3, -1
  store i64 %4, i64* %2, align 8, !tbaa !10
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %1
  %7 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %8 = load %struct._typeobject*, %struct._typeobject** %7, align 8, !tbaa !11
  %9 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %8, i64 0, i32 4
  %10 = load void (%struct._object*)*, void (%struct._object*)** %9, align 8, !tbaa !12
  tail call void %10(%struct._object* nonnull %0)
  br label %11

; <label>:11                                      ; preds = %1, %6
  ret void
}

; Function Attrs: ssp uwtable
define void @PyXDecref(%struct._object*) #2 {
  %2 = icmp eq %struct._object* %0, null
  br i1 %2, label %13, label %3

; <label>:3                                       ; preds = %1
  %4 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !10
  %6 = add nsw i64 %5, -1
  store i64 %6, i64* %4, align 8, !tbaa !10
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8, !tbaa !11
  %11 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %10, i64 0, i32 4
  %12 = load void (%struct._object*)*, void (%struct._object*)** %11, align 8, !tbaa !12
  tail call void %12(%struct._object* nonnull %0)
  br label %13

; <label>:13                                      ; preds = %8, %3, %1
  ret void
}

; Function Attrs: ssp uwtable
define %struct._object* @BinaryAdd(%struct._object*, %struct._object*) #2 {
  %3 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %4 = load %struct._typeobject*, %struct._typeobject** %3, align 8, !tbaa !11
  %5 = icmp eq %struct._typeobject* %4, @PyUnicode_Type
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %2
  %7 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %8 = load %struct._typeobject*, %struct._typeobject** %7, align 8, !tbaa !11
  %9 = icmp eq %struct._typeobject* %8, @PyUnicode_Type
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = tail call %struct._object* @PyUnicode_Concat(%struct._object* nonnull %0, %struct._object* nonnull %1)
  br label %14

; <label>:12                                      ; preds = %6, %2
  %13 = tail call %struct._object* @PyNumber_Add(%struct._object* nonnull %0, %struct._object* %1)
  br label %14

; <label>:14                                      ; preds = %10, %12
  %15 = phi %struct._object* [ %11, %10 ], [ %13, %12 ]
  %16 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %17 = load i64, i64* %16, align 8, !tbaa !10
  %18 = add nsw i64 %17, -1
  store i64 %18, i64* %16, align 8, !tbaa !10
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %24

; <label>:20                                      ; preds = %14
  %21 = load %struct._typeobject*, %struct._typeobject** %3, align 8, !tbaa !11
  %22 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %21, i64 0, i32 4
  %23 = load void (%struct._object*)*, void (%struct._object*)** %22, align 8, !tbaa !12
  tail call void %23(%struct._object* nonnull %0)
  br label %24

; <label>:24                                      ; preds = %14, %20
  %25 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 0
  %26 = load i64, i64* %25, align 8, !tbaa !10
  %27 = add nsw i64 %26, -1
  store i64 %27, i64* %25, align 8, !tbaa !10
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %34

; <label>:29                                      ; preds = %24
  %30 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %31 = load %struct._typeobject*, %struct._typeobject** %30, align 8, !tbaa !11
  %32 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %31, i64 0, i32 4
  %33 = load void (%struct._object*)*, void (%struct._object*)** %32, align 8, !tbaa !12
  tail call void %33(%struct._object* nonnull %1)
  br label %34

; <label>:34                                      ; preds = %24, %29
  ret %struct._object* %15
}

declare %struct._object* @PyUnicode_Concat(%struct._object*, %struct._object*) #3

declare %struct._object* @PyNumber_Add(%struct._object*, %struct._object*) #3

; Function Attrs: ssp uwtable
define %struct._object* @BinarySubtract(%struct._object*, %struct._object*) #2 {
  %3 = tail call %struct._object* @PyNumber_Subtract(%struct._object* %0, %struct._object* %1)
  %4 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !10
  %6 = add nsw i64 %5, -1
  store i64 %6, i64* %4, align 8, !tbaa !10
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %2
  %9 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8, !tbaa !11
  %11 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %10, i64 0, i32 4
  %12 = load void (%struct._object*)*, void (%struct._object*)** %11, align 8, !tbaa !12
  tail call void %12(%struct._object* nonnull %0)
  br label %13

; <label>:13                                      ; preds = %2, %8
  %14 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !10
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8, !tbaa !10
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %23

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %20 = load %struct._typeobject*, %struct._typeobject** %19, align 8, !tbaa !11
  %21 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %20, i64 0, i32 4
  %22 = load void (%struct._object*)*, void (%struct._object*)** %21, align 8, !tbaa !12
  tail call void %22(%struct._object* nonnull %1)
  br label %23

; <label>:23                                      ; preds = %13, %18
  ret %struct._object* %3
}

declare %struct._object* @PyNumber_Subtract(%struct._object*, %struct._object*) #3

; Function Attrs: ssp uwtable
define %struct._object* @BinarySubscr(%struct._object*, %struct._object*) #2 {
  %3 = tail call %struct._object* @PyObject_GetItem(%struct._object* %0, %struct._object* %1)
  %4 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !10
  %6 = add nsw i64 %5, -1
  store i64 %6, i64* %4, align 8, !tbaa !10
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %2
  %9 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8, !tbaa !11
  %11 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %10, i64 0, i32 4
  %12 = load void (%struct._object*)*, void (%struct._object*)** %11, align 8, !tbaa !12
  tail call void %12(%struct._object* nonnull %0)
  br label %13

; <label>:13                                      ; preds = %2, %8
  %14 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !10
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8, !tbaa !10
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %23

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %20 = load %struct._typeobject*, %struct._typeobject** %19, align 8, !tbaa !11
  %21 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %20, i64 0, i32 4
  %22 = load void (%struct._object*)*, void (%struct._object*)** %21, align 8, !tbaa !12
  tail call void %22(%struct._object* nonnull %1)
  br label %23

; <label>:23                                      ; preds = %13, %18
  ret %struct._object* %3
}

declare %struct._object* @PyObject_GetItem(%struct._object*, %struct._object*) #3

; Function Attrs: ssp uwtable
define %struct._object* @BinaryLshift(%struct._object*, %struct._object*) #2 {
  %3 = tail call %struct._object* @PyNumber_Lshift(%struct._object* %0, %struct._object* %1)
  %4 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !10
  %6 = add nsw i64 %5, -1
  store i64 %6, i64* %4, align 8, !tbaa !10
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %2
  %9 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8, !tbaa !11
  %11 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %10, i64 0, i32 4
  %12 = load void (%struct._object*)*, void (%struct._object*)** %11, align 8, !tbaa !12
  tail call void %12(%struct._object* nonnull %0)
  br label %13

; <label>:13                                      ; preds = %2, %8
  %14 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !10
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8, !tbaa !10
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %23

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %20 = load %struct._typeobject*, %struct._typeobject** %19, align 8, !tbaa !11
  %21 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %20, i64 0, i32 4
  %22 = load void (%struct._object*)*, void (%struct._object*)** %21, align 8, !tbaa !12
  tail call void %22(%struct._object* nonnull %1)
  br label %23

; <label>:23                                      ; preds = %13, %18
  ret %struct._object* %3
}

declare %struct._object* @PyNumber_Lshift(%struct._object*, %struct._object*) #3

; Function Attrs: ssp uwtable
define %struct._object* @BinaryRshift(%struct._object*, %struct._object*) #2 {
  %3 = tail call %struct._object* @PyNumber_Rshift(%struct._object* %0, %struct._object* %1)
  %4 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !10
  %6 = add nsw i64 %5, -1
  store i64 %6, i64* %4, align 8, !tbaa !10
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %2
  %9 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8, !tbaa !11
  %11 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %10, i64 0, i32 4
  %12 = load void (%struct._object*)*, void (%struct._object*)** %11, align 8, !tbaa !12
  tail call void %12(%struct._object* nonnull %0)
  br label %13

; <label>:13                                      ; preds = %2, %8
  %14 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !10
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8, !tbaa !10
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %23

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %20 = load %struct._typeobject*, %struct._typeobject** %19, align 8, !tbaa !11
  %21 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %20, i64 0, i32 4
  %22 = load void (%struct._object*)*, void (%struct._object*)** %21, align 8, !tbaa !12
  tail call void %22(%struct._object* nonnull %1)
  br label %23

; <label>:23                                      ; preds = %13, %18
  ret %struct._object* %3
}

declare %struct._object* @PyNumber_Rshift(%struct._object*, %struct._object*) #3

; Function Attrs: ssp uwtable
define %struct._object* @BinaryAnd(%struct._object*, %struct._object*) #2 {
  %3 = tail call %struct._object* @PyNumber_And(%struct._object* %0, %struct._object* %1)
  %4 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !10
  %6 = add nsw i64 %5, -1
  store i64 %6, i64* %4, align 8, !tbaa !10
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %2
  %9 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8, !tbaa !11
  %11 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %10, i64 0, i32 4
  %12 = load void (%struct._object*)*, void (%struct._object*)** %11, align 8, !tbaa !12
  tail call void %12(%struct._object* nonnull %0)
  br label %13

; <label>:13                                      ; preds = %2, %8
  %14 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !10
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8, !tbaa !10
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %23

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %20 = load %struct._typeobject*, %struct._typeobject** %19, align 8, !tbaa !11
  %21 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %20, i64 0, i32 4
  %22 = load void (%struct._object*)*, void (%struct._object*)** %21, align 8, !tbaa !12
  tail call void %22(%struct._object* nonnull %1)
  br label %23

; <label>:23                                      ; preds = %13, %18
  ret %struct._object* %3
}

declare %struct._object* @PyNumber_And(%struct._object*, %struct._object*) #3

; Function Attrs: ssp uwtable
define %struct._object* @BinaryXor(%struct._object*, %struct._object*) #2 {
  %3 = tail call %struct._object* @PyNumber_Xor(%struct._object* %0, %struct._object* %1)
  %4 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !10
  %6 = add nsw i64 %5, -1
  store i64 %6, i64* %4, align 8, !tbaa !10
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %2
  %9 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8, !tbaa !11
  %11 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %10, i64 0, i32 4
  %12 = load void (%struct._object*)*, void (%struct._object*)** %11, align 8, !tbaa !12
  tail call void %12(%struct._object* nonnull %0)
  br label %13

; <label>:13                                      ; preds = %2, %8
  %14 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !10
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8, !tbaa !10
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %23

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %20 = load %struct._typeobject*, %struct._typeobject** %19, align 8, !tbaa !11
  %21 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %20, i64 0, i32 4
  %22 = load void (%struct._object*)*, void (%struct._object*)** %21, align 8, !tbaa !12
  tail call void %22(%struct._object* nonnull %1)
  br label %23

; <label>:23                                      ; preds = %13, %18
  ret %struct._object* %3
}

declare %struct._object* @PyNumber_Xor(%struct._object*, %struct._object*) #3

; Function Attrs: ssp uwtable
define %struct._object* @BinaryOr(%struct._object*, %struct._object*) #2 {
  %3 = tail call %struct._object* @PyNumber_Or(%struct._object* %0, %struct._object* %1)
  %4 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !10
  %6 = add nsw i64 %5, -1
  store i64 %6, i64* %4, align 8, !tbaa !10
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %2
  %9 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8, !tbaa !11
  %11 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %10, i64 0, i32 4
  %12 = load void (%struct._object*)*, void (%struct._object*)** %11, align 8, !tbaa !12
  tail call void %12(%struct._object* nonnull %0)
  br label %13

; <label>:13                                      ; preds = %2, %8
  %14 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !10
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8, !tbaa !10
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %23

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %20 = load %struct._typeobject*, %struct._typeobject** %19, align 8, !tbaa !11
  %21 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %20, i64 0, i32 4
  %22 = load void (%struct._object*)*, void (%struct._object*)** %21, align 8, !tbaa !12
  tail call void %22(%struct._object* nonnull %1)
  br label %23

; <label>:23                                      ; preds = %13, %18
  ret %struct._object* %3
}

declare %struct._object* @PyNumber_Or(%struct._object*, %struct._object*) #3

; Function Attrs: ssp uwtable
define %struct._object* @InplaceAdd(%struct._object*, %struct._object*) #2 {
  %3 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %4 = load %struct._typeobject*, %struct._typeobject** %3, align 8, !tbaa !11
  %5 = icmp eq %struct._typeobject* %4, @PyUnicode_Type
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %2
  %7 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %8 = load %struct._typeobject*, %struct._typeobject** %7, align 8, !tbaa !11
  %9 = icmp eq %struct._typeobject* %8, @PyUnicode_Type
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = tail call %struct._object* @PyUnicode_Concat(%struct._object* nonnull %0, %struct._object* nonnull %1)
  br label %14

; <label>:12                                      ; preds = %6, %2
  %13 = tail call %struct._object* @PyNumber_InPlaceAdd(%struct._object* nonnull %0, %struct._object* %1)
  br label %14

; <label>:14                                      ; preds = %10, %12
  %15 = phi %struct._object* [ %11, %10 ], [ %13, %12 ]
  %16 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %17 = load i64, i64* %16, align 8, !tbaa !10
  %18 = add nsw i64 %17, -1
  store i64 %18, i64* %16, align 8, !tbaa !10
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %24

; <label>:20                                      ; preds = %14
  %21 = load %struct._typeobject*, %struct._typeobject** %3, align 8, !tbaa !11
  %22 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %21, i64 0, i32 4
  %23 = load void (%struct._object*)*, void (%struct._object*)** %22, align 8, !tbaa !12
  tail call void %23(%struct._object* nonnull %0)
  br label %24

; <label>:24                                      ; preds = %14, %20
  %25 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 0
  %26 = load i64, i64* %25, align 8, !tbaa !10
  %27 = add nsw i64 %26, -1
  store i64 %27, i64* %25, align 8, !tbaa !10
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %34

; <label>:29                                      ; preds = %24
  %30 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %31 = load %struct._typeobject*, %struct._typeobject** %30, align 8, !tbaa !11
  %32 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %31, i64 0, i32 4
  %33 = load void (%struct._object*)*, void (%struct._object*)** %32, align 8, !tbaa !12
  tail call void %33(%struct._object* nonnull %1)
  br label %34

; <label>:34                                      ; preds = %24, %29
  ret %struct._object* %15
}

declare %struct._object* @PyNumber_InPlaceAdd(%struct._object*, %struct._object*) #3

; Function Attrs: ssp uwtable
define %struct._object* @InplaceSubtract(%struct._object*, %struct._object*) #2 {
  %3 = tail call %struct._object* @PyNumber_InPlaceSubtract(%struct._object* %0, %struct._object* %1)
  %4 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !10
  %6 = add nsw i64 %5, -1
  store i64 %6, i64* %4, align 8, !tbaa !10
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %2
  %9 = getelementptr inbounds %struct._object, %struct._object* %0, i64 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8, !tbaa !11
  %11 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %10, i64 0, i32 4
  %12 = load void (%struct._object*)*, void (%struct._object*)** %11, align 8, !tbaa !12
  tail call void %12(%struct._object* nonnull %0)
  br label %13

; <label>:13                                      ; preds = %2, %8
  %14 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !10
  %16 = add nsw i64 %15, -1
  store i64 %16, i64* %14, align 8, !tbaa !10
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %23

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %struct._object, %struct._object* %1, i64 0, i32 1
  %20 = load %struct._typeobject*, %struct._typeobject** %19, align 8, !tbaa !11
  %21 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %20, i64 0, i32 4
  %22 = load void (%struct._object*)*, void (%struct._object*)** %21, align 8, !tbaa !12
  tail call void %22(%struct._object* nonnull %1)
  br label %23

; <label>:23                                      ; preds = %13, %18
  ret %struct._object* %3
}

declare %struct._object* @PyNumber_InPlaceSubtract(%struct._object*, %struct._object*) #3

attributes #0 = { norecurse nounwind readnone ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readonly ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 8.0.0 (clang-800.0.42.1)"}
!2 = !{!3, !9, i64 16}
!3 = !{!"_ZTS13PyFloatObject", !4, i64 0, !9, i64 16}
!4 = !{!"_ZTS7_object", !5, i64 0, !8, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"double", !6, i64 0}
!10 = !{!4, !5, i64 0}
!11 = !{!4, !8, i64 8}
!12 = !{!13, !8, i64 48}
!13 = !{!"_ZTS11_typeobject", !14, i64 0, !8, i64 24, !5, i64 32, !5, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !8, i64 96, !8, i64 104, !8, i64 112, !8, i64 120, !8, i64 128, !8, i64 136, !8, i64 144, !8, i64 152, !8, i64 160, !5, i64 168, !8, i64 176, !8, i64 184, !8, i64 192, !8, i64 200, !5, i64 208, !8, i64 216, !8, i64 224, !8, i64 232, !8, i64 240, !8, i64 248, !8, i64 256, !8, i64 264, !8, i64 272, !8, i64 280, !5, i64 288, !8, i64 296, !8, i64 304, !8, i64 312, !8, i64 320, !8, i64 328, !8, i64 336, !8, i64 344, !8, i64 352, !8, i64 360, !8, i64 368, !8, i64 376, !15, i64 384, !8, i64 392}
!14 = !{!"_ZTS11PyVarObject", !4, i64 0, !5, i64 16}
!15 = !{!"int", !6, i64 0}
