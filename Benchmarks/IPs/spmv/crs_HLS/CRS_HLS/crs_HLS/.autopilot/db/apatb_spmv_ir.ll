; ModuleID = 'C:/Users/aamalik3/Desktop/GitHub/Scheduling-PR/IPs/spmv/crs_HLS/CRS_HLS/crs_HLS/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_spmv_ir(double* %val, i32* %cols, i32* %rowDelimiters, double* %vec, double* %out) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 13328)
  %val_copy = bitcast i8* %malloccall to [1666 x double]*
  %malloccall1 = tail call i8* @malloc(i64 6664)
  %cols_copy = bitcast i8* %malloccall1 to [1666 x i32]*
  %rowDelimiters_copy = alloca [495 x i32], align 512
  %vec_copy = alloca [494 x double], align 512
  %out_copy = alloca [494 x double], align 512
  %0 = bitcast double* %val to [1666 x double]*
  %1 = bitcast i32* %cols to [1666 x i32]*
  %2 = bitcast i32* %rowDelimiters to [495 x i32]*
  %3 = bitcast double* %vec to [494 x double]*
  %4 = bitcast double* %out to [494 x double]*
  call fastcc void @copy_in([1666 x double]* %0, [1666 x double]* %val_copy, [1666 x i32]* %1, [1666 x i32]* %cols_copy, [495 x i32]* %2, [495 x i32]* nonnull align 512 %rowDelimiters_copy, [494 x double]* %3, [494 x double]* nonnull align 512 %vec_copy, [494 x double]* %4, [494 x double]* nonnull align 512 %out_copy)
  %5 = getelementptr inbounds [1666 x double], [1666 x double]* %val_copy, i32 0, i32 0
  %6 = getelementptr inbounds [1666 x i32], [1666 x i32]* %cols_copy, i32 0, i32 0
  %7 = getelementptr inbounds [495 x i32], [495 x i32]* %rowDelimiters_copy, i32 0, i32 0
  %8 = getelementptr inbounds [494 x double], [494 x double]* %vec_copy, i32 0, i32 0
  %9 = getelementptr inbounds [494 x double], [494 x double]* %out_copy, i32 0, i32 0
  call void @apatb_spmv_hw(double* %5, i32* %6, i32* %7, double* %8, double* %9)
  call fastcc void @copy_out([1666 x double]* %0, [1666 x double]* %val_copy, [1666 x i32]* %1, [1666 x i32]* %cols_copy, [495 x i32]* %2, [495 x i32]* nonnull align 512 %rowDelimiters_copy, [494 x double]* %3, [494 x double]* nonnull align 512 %vec_copy, [494 x double]* %4, [494 x double]* nonnull align 512 %out_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([1666 x double]* readonly, [1666 x double]* noalias, [1666 x i32]* readonly, [1666 x i32]* noalias, [495 x i32]* readonly, [495 x i32]* noalias align 512, [494 x double]* readonly, [494 x double]* noalias align 512, [494 x double]* readonly, [494 x double]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1666f64([1666 x double]* %1, [1666 x double]* %0)
  call fastcc void @onebyonecpy_hls.p0a1666i32([1666 x i32]* %3, [1666 x i32]* %2)
  call fastcc void @onebyonecpy_hls.p0a495i32([495 x i32]* align 512 %5, [495 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a494f64([494 x double]* align 512 %7, [494 x double]* %6)
  call fastcc void @onebyonecpy_hls.p0a494f64([494 x double]* align 512 %9, [494 x double]* %8)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a1666f64([1666 x double]* noalias, [1666 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1666 x double]* %0, null
  %3 = icmp eq [1666 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [1666 x double], [1666 x double]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast double* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [1666 x double], [1666 x double]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast double* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 1666
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a1666i32([1666 x i32]* noalias, [1666 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1666 x i32]* %0, null
  %3 = icmp eq [1666 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [1666 x i32], [1666 x i32]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i32* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [1666 x i32], [1666 x i32]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i32* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 1666
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a495i32([495 x i32]* noalias align 512, [495 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [495 x i32]* %0, null
  %3 = icmp eq [495 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [495 x i32], [495 x i32]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i32* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [495 x i32], [495 x i32]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i32* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 495
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a494f64([494 x double]* noalias align 512, [494 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [494 x double]* %0, null
  %3 = icmp eq [494 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [494 x double], [494 x double]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast double* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [494 x double], [494 x double]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast double* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 494
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([1666 x double]*, [1666 x double]* noalias readonly, [1666 x i32]*, [1666 x i32]* noalias readonly, [495 x i32]*, [495 x i32]* noalias readonly align 512, [494 x double]*, [494 x double]* noalias readonly align 512, [494 x double]*, [494 x double]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1666f64([1666 x double]* %0, [1666 x double]* %1)
  call fastcc void @onebyonecpy_hls.p0a1666i32([1666 x i32]* %2, [1666 x i32]* %3)
  call fastcc void @onebyonecpy_hls.p0a495i32([495 x i32]* %4, [495 x i32]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a494f64([494 x double]* %6, [494 x double]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a494f64([494 x double]* %8, [494 x double]* align 512 %9)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_spmv_hw(double*, i32*, i32*, double*, double*)

define void @spmv_hw_stub_wrapper(double*, i32*, i32*, double*, double*) #5 {
entry:
  %5 = bitcast double* %0 to [1666 x double]*
  %6 = bitcast i32* %1 to [1666 x i32]*
  %7 = bitcast i32* %2 to [495 x i32]*
  %8 = bitcast double* %3 to [494 x double]*
  %9 = bitcast double* %4 to [494 x double]*
  call void @copy_out([1666 x double]* null, [1666 x double]* %5, [1666 x i32]* null, [1666 x i32]* %6, [495 x i32]* null, [495 x i32]* %7, [494 x double]* null, [494 x double]* %8, [494 x double]* null, [494 x double]* %9)
  %10 = bitcast [1666 x double]* %5 to double*
  %11 = bitcast [1666 x i32]* %6 to i32*
  %12 = bitcast [495 x i32]* %7 to i32*
  %13 = bitcast [494 x double]* %8 to double*
  %14 = bitcast [494 x double]* %9 to double*
  call void @spmv_hw_stub(double* %10, i32* %11, i32* %12, double* %13, double* %14)
  call void @copy_in([1666 x double]* null, [1666 x double]* %5, [1666 x i32]* null, [1666 x i32]* %6, [495 x i32]* null, [495 x i32]* %7, [494 x double]* null, [494 x double]* %8, [494 x double]* null, [494 x double]* %9)
  ret void
}

declare void @spmv_hw_stub(double*, i32*, i32*, double*, double*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
