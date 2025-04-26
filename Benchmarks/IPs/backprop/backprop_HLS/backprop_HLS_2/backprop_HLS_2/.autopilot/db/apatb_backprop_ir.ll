; ModuleID = 'C:/Users/aamalik3/Desktop/GitHub/Scheduling-PR/IPs/backprop/backprop_HLS_2/backprop_HLS_2/backprop_HLS_2/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_backprop_ir(double* %weights1, double* %weights2, double* %weights3, double* %biases1, double* %biases2, double* %biases3, double* %training_data, double* %training_targets) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 6656)
  %weights1_copy = bitcast i8* %malloccall to [832 x double]*
  %malloccall1 = tail call i8* @malloc(i64 32768)
  %weights2_copy = bitcast i8* %malloccall1 to [4096 x double]*
  %weights3_copy = alloca [192 x double], align 512
  %biases1_copy = alloca [64 x double], align 512
  %biases2_copy = alloca [64 x double], align 512
  %biases3_copy = alloca [3 x double], align 512
  %malloccall2 = tail call i8* @malloc(i64 16952)
  %training_data_copy = bitcast i8* %malloccall2 to [2119 x double]*
  %training_targets_copy = alloca [489 x double], align 512
  %0 = bitcast double* %weights1 to [832 x double]*
  %1 = bitcast double* %weights2 to [4096 x double]*
  %2 = bitcast double* %weights3 to [192 x double]*
  %3 = bitcast double* %biases1 to [64 x double]*
  %4 = bitcast double* %biases2 to [64 x double]*
  %5 = bitcast double* %biases3 to [3 x double]*
  %6 = bitcast double* %training_data to [2119 x double]*
  %7 = bitcast double* %training_targets to [489 x double]*
  call fastcc void @copy_in([832 x double]* %0, [832 x double]* %weights1_copy, [4096 x double]* %1, [4096 x double]* %weights2_copy, [192 x double]* %2, [192 x double]* nonnull align 512 %weights3_copy, [64 x double]* %3, [64 x double]* nonnull align 512 %biases1_copy, [64 x double]* %4, [64 x double]* nonnull align 512 %biases2_copy, [3 x double]* %5, [3 x double]* nonnull align 512 %biases3_copy, [2119 x double]* %6, [2119 x double]* %training_data_copy, [489 x double]* %7, [489 x double]* nonnull align 512 %training_targets_copy)
  %8 = getelementptr inbounds [832 x double], [832 x double]* %weights1_copy, i32 0, i32 0
  %9 = getelementptr inbounds [4096 x double], [4096 x double]* %weights2_copy, i32 0, i32 0
  %10 = getelementptr inbounds [192 x double], [192 x double]* %weights3_copy, i32 0, i32 0
  %11 = getelementptr inbounds [64 x double], [64 x double]* %biases1_copy, i32 0, i32 0
  %12 = getelementptr inbounds [64 x double], [64 x double]* %biases2_copy, i32 0, i32 0
  %13 = getelementptr inbounds [3 x double], [3 x double]* %biases3_copy, i32 0, i32 0
  %14 = getelementptr inbounds [2119 x double], [2119 x double]* %training_data_copy, i32 0, i32 0
  %15 = getelementptr inbounds [489 x double], [489 x double]* %training_targets_copy, i32 0, i32 0
  call void @apatb_backprop_hw(double* %8, double* %9, double* %10, double* %11, double* %12, double* %13, double* %14, double* %15)
  call fastcc void @copy_out([832 x double]* %0, [832 x double]* %weights1_copy, [4096 x double]* %1, [4096 x double]* %weights2_copy, [192 x double]* %2, [192 x double]* nonnull align 512 %weights3_copy, [64 x double]* %3, [64 x double]* nonnull align 512 %biases1_copy, [64 x double]* %4, [64 x double]* nonnull align 512 %biases2_copy, [3 x double]* %5, [3 x double]* nonnull align 512 %biases3_copy, [2119 x double]* %6, [2119 x double]* %training_data_copy, [489 x double]* %7, [489 x double]* nonnull align 512 %training_targets_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([832 x double]* readonly, [832 x double]* noalias, [4096 x double]* readonly, [4096 x double]* noalias, [192 x double]* readonly, [192 x double]* noalias align 512, [64 x double]* readonly, [64 x double]* noalias align 512, [64 x double]* readonly, [64 x double]* noalias align 512, [3 x double]* readonly, [3 x double]* noalias align 512, [2119 x double]* readonly, [2119 x double]* noalias, [489 x double]* readonly, [489 x double]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a832f64([832 x double]* %1, [832 x double]* %0)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %3, [4096 x double]* %2)
  call fastcc void @onebyonecpy_hls.p0a192f64([192 x double]* align 512 %5, [192 x double]* %4)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* align 512 %7, [64 x double]* %6)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* align 512 %9, [64 x double]* %8)
  call fastcc void @onebyonecpy_hls.p0a3f64([3 x double]* align 512 %11, [3 x double]* %10)
  call fastcc void @onebyonecpy_hls.p0a2119f64([2119 x double]* %13, [2119 x double]* %12)
  call fastcc void @onebyonecpy_hls.p0a489f64([489 x double]* align 512 %15, [489 x double]* %14)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a832f64([832 x double]* noalias, [832 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [832 x double]* %0, null
  %3 = icmp eq [832 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [832 x double], [832 x double]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast double* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [832 x double], [832 x double]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast double* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 832
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* noalias, [4096 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [4096 x double]* %0, null
  %3 = icmp eq [4096 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [4096 x double], [4096 x double]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast double* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [4096 x double], [4096 x double]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast double* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4096
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a192f64([192 x double]* noalias align 512, [192 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [192 x double]* %0, null
  %3 = icmp eq [192 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [192 x double], [192 x double]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast double* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [192 x double], [192 x double]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast double* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 192
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* noalias align 512, [64 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [64 x double]* %0, null
  %3 = icmp eq [64 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [64 x double], [64 x double]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast double* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [64 x double], [64 x double]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast double* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 64
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a3f64([3 x double]* noalias align 512, [3 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [3 x double]* %0, null
  %3 = icmp eq [3 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [3 x double], [3 x double]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast double* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [3 x double], [3 x double]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast double* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 3
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a2119f64([2119 x double]* noalias, [2119 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [2119 x double]* %0, null
  %3 = icmp eq [2119 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [2119 x double], [2119 x double]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast double* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [2119 x double], [2119 x double]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast double* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 2119
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a489f64([489 x double]* noalias align 512, [489 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [489 x double]* %0, null
  %3 = icmp eq [489 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [489 x double], [489 x double]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast double* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [489 x double], [489 x double]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast double* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 489
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([832 x double]*, [832 x double]* noalias readonly, [4096 x double]*, [4096 x double]* noalias readonly, [192 x double]*, [192 x double]* noalias readonly align 512, [64 x double]*, [64 x double]* noalias readonly align 512, [64 x double]*, [64 x double]* noalias readonly align 512, [3 x double]*, [3 x double]* noalias readonly align 512, [2119 x double]*, [2119 x double]* noalias readonly, [489 x double]*, [489 x double]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a832f64([832 x double]* %0, [832 x double]* %1)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %2, [4096 x double]* %3)
  call fastcc void @onebyonecpy_hls.p0a192f64([192 x double]* %4, [192 x double]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* %6, [64 x double]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* %8, [64 x double]* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0a3f64([3 x double]* %10, [3 x double]* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0a2119f64([2119 x double]* %12, [2119 x double]* %13)
  call fastcc void @onebyonecpy_hls.p0a489f64([489 x double]* %14, [489 x double]* align 512 %15)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_backprop_hw(double*, double*, double*, double*, double*, double*, double*, double*)

define void @backprop_hw_stub_wrapper(double*, double*, double*, double*, double*, double*, double*, double*) #5 {
entry:
  %8 = bitcast double* %0 to [832 x double]*
  %9 = bitcast double* %1 to [4096 x double]*
  %10 = bitcast double* %2 to [192 x double]*
  %11 = bitcast double* %3 to [64 x double]*
  %12 = bitcast double* %4 to [64 x double]*
  %13 = bitcast double* %5 to [3 x double]*
  %14 = bitcast double* %6 to [2119 x double]*
  %15 = bitcast double* %7 to [489 x double]*
  call void @copy_out([832 x double]* null, [832 x double]* %8, [4096 x double]* null, [4096 x double]* %9, [192 x double]* null, [192 x double]* %10, [64 x double]* null, [64 x double]* %11, [64 x double]* null, [64 x double]* %12, [3 x double]* null, [3 x double]* %13, [2119 x double]* null, [2119 x double]* %14, [489 x double]* null, [489 x double]* %15)
  %16 = bitcast [832 x double]* %8 to double*
  %17 = bitcast [4096 x double]* %9 to double*
  %18 = bitcast [192 x double]* %10 to double*
  %19 = bitcast [64 x double]* %11 to double*
  %20 = bitcast [64 x double]* %12 to double*
  %21 = bitcast [3 x double]* %13 to double*
  %22 = bitcast [2119 x double]* %14 to double*
  %23 = bitcast [489 x double]* %15 to double*
  call void @backprop_hw_stub(double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22, double* %23)
  call void @copy_in([832 x double]* null, [832 x double]* %8, [4096 x double]* null, [4096 x double]* %9, [192 x double]* null, [192 x double]* %10, [64 x double]* null, [64 x double]* %11, [64 x double]* null, [64 x double]* %12, [3 x double]* null, [3 x double]* %13, [2119 x double]* null, [2119 x double]* %14, [489 x double]* null, [489 x double]* %15)
  ret void
}

declare void @backprop_hw_stub(double*, double*, double*, double*, double*, double*, double*, double*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
