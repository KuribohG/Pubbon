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
%struct.PyCodeObject = type { %struct._object, i32, i32, i32, i32, i32, i32, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, i8*, %struct._object*, %struct._object*, %struct._object*, i8*, %struct._object*, i8* }

@PyUnicode_Type = external dllimport global %struct._typeobject, align 8

; Function Attrs: noinline nounwind uwtable
define %struct.PyCodeObject* @TempFunc() #0 {
  ret %struct.PyCodeObject* null
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
  br label %42

; <label>:21:                                     ; preds = %12, %2
  %22 = load %struct._object*, %struct._object** %3, align 8
  %23 = load %struct._object*, %struct._object** %4, align 8
  %24 = call %struct._object* @PyNumber_Add(%struct._object* %23, %struct._object* %22)
  store %struct._object* %24, %struct._object** %5, align 8
  br label %25

; <label>:25:                                     ; preds = %21
  %26 = load %struct._object*, %struct._object** %4, align 8
  store %struct._object* %26, %struct._object** %6, align 8
  %27 = load %struct._object*, %struct._object** %6, align 8
  %28 = getelementptr inbounds %struct._object, %struct._object* %27, i32 0, i32 0
  %29 = load i64, i64* %28, align 8
  %30 = add nsw i64 %29, -1
  store i64 %30, i64* %28, align 8
  %31 = icmp ne i64 %30, 0
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %25
  br label %40

; <label>:33:                                     ; preds = %25
  %34 = load %struct._object*, %struct._object** %6, align 8
  %35 = getelementptr inbounds %struct._object, %struct._object* %34, i32 0, i32 1
  %36 = load %struct._typeobject*, %struct._typeobject** %35, align 8
  %37 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %36, i32 0, i32 4
  %38 = load void (%struct._object*)*, void (%struct._object*)** %37, align 8
  %39 = load %struct._object*, %struct._object** %6, align 8
  call void %38(%struct._object* %39)
  br label %40

; <label>:40:                                     ; preds = %33, %32
  br label %41

; <label>:41:                                     ; preds = %40
  br label %42

; <label>:42:                                     ; preds = %41, %17
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !4}
!llvm.ident = !{!5}

!0 = !{i32 6, !"Linker Options", !1}
!1 = !{!2, !3}
!2 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!3 = !{!"/DEFAULTLIB:python36.lib"}
!4 = !{i32 1, !"PIC Level", i32 2}
!5 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
