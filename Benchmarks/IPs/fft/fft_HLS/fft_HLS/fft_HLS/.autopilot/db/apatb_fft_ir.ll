; ModuleID = 'C:/Users/aamalik3/Desktop/IPs/fft/fft_HLS/fft_HLS/fft_HLS/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_fft_ir(double* %real, double* %img, double* %real_twid, double* %img_twid) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 8192)
  %real_copy = bitcast i8* %malloccall to [1024 x double]*
  %malloccall1 = tail call i8* @malloc(i64 8192)
  %img_copy = bitcast i8* %malloccall1 to [1024 x double]*
  %malloccall2 = tail call i8* @malloc(i64 4096)
  %real_twid_copy = bitcast i8* %malloccall2 to [512 x double]*
  %malloccall3 = tail call i8* @malloc(i64 4096)
  %img_twid_copy = bitcast i8* %malloccall3 to [512 x double]*
  %0 = bitcast double* %real to [1024 x double]*
  %1 = bitcast double* %img to [1024 x double]*
  %2 = bitcast double* %real_twid to [512 x double]*
  %3 = bitcast double* %img_twid to [512 x double]*
  call fastcc void @copy_in([1024 x double]* %0, [1024 x double]* %real_copy, [1024 x double]* %1, [1024 x double]* %img_copy, [512 x double]* %2, [512 x double]* %real_twid_copy, [512 x double]* %3, [512 x double]* %img_twid_copy)
  %4 = getelementptr inbounds [1024 x double], [1024 x double]* %real_copy, i32 0, i32 0
  %5 = getelementptr inbounds [1024 x double], [1024 x double]* %img_copy, i32 0, i32 0
  %6 = getelementptr inbounds [512 x double], [512 x double]* %real_twid_copy, i32 0, i32 0
  %7 = getelementptr inbounds [512 x double], [512 x double]* %img_twid_copy, i32 0, i32 0
  call void @apatb_fft_hw(double* %4, double* %5, double* %6, double* %7)
  call fastcc void @copy_out([1024 x double]* %0, [1024 x double]* %real_copy, [1024 x double]* %1, [1024 x double]* %img_copy, [512 x double]* %2, [512 x double]* %real_twid_copy, [512 x double]* %3, [512 x double]* %img_twid_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  tail call void @free(i8* %malloccall3)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([1024 x double]* readonly, [1024 x double]* noalias, [1024 x double]* readonly, [1024 x double]* noalias, [512 x double]* readonly, [512 x double]* noalias, [512 x double]* readonly, [512 x double]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %1, [1024 x double]* %0)
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %3, [1024 x double]* %2)
  call fastcc void @onebyonecpy_hls.p0a512f64([512 x double]* %5, [512 x double]* %4)
  call fastcc void @onebyonecpy_hls.p0a512f64([512 x double]* %7, [512 x double]* %6)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* noalias, [1024 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1024 x double]* %0, null
  %3 = icmp eq [1024 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [1024 x double], [1024 x double]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast double* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [1024 x double], [1024 x double]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast double* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 1024
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a512f64([512 x double]* noalias, [512 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [512 x double]* %0, null
  %3 = icmp eq [512 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [512 x double], [512 x double]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast double* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [512 x double], [512 x double]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast double* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 512
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([1024 x double]*, [1024 x double]* noalias readonly, [1024 x double]*, [1024 x double]* noalias readonly, [512 x double]*, [512 x double]* noalias readonly, [512 x double]*, [512 x double]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %0, [1024 x double]* %1)
  call fastcc void @onebyonecpy_hls.p0a1024f64([1024 x double]* %2, [1024 x double]* %3)
  call fastcc void @onebyonecpy_hls.p0a512f64([512 x double]* %4, [512 x double]* %5)
  call fastcc void @onebyonecpy_hls.p0a512f64([512 x double]* %6, [512 x double]* %7)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_fft_hw(double*, double*, double*, double*)

define void @fft_hw_stub_wrapper(double*, double*, double*, double*) #5 {
entry:
  %4 = bitcast double* %0 to [1024 x double]*
  %5 = bitcast double* %1 to [1024 x double]*
  %6 = bitcast double* %2 to [512 x double]*
  %7 = bitcast double* %3 to [512 x double]*
  call void @copy_out([1024 x double]* null, [1024 x double]* %4, [1024 x double]* null, [1024 x double]* %5, [512 x double]* null, [512 x double]* %6, [512 x double]* null, [512 x double]* %7)
  %8 = bitcast [1024 x double]* %4 to double*
  %9 = bitcast [1024 x double]* %5 to double*
  %10 = bitcast [512 x double]* %6 to double*
  %11 = bitcast [512 x double]* %7 to double*
  call void @fft_hw_stub(double* %8, double* %9, double* %10, double* %11)
  call void @copy_in([1024 x double]* null, [1024 x double]* %4, [1024 x double]* null, [1024 x double]* %5, [512 x double]* null, [512 x double]* %6, [512 x double]* null, [512 x double]* %7)
  ret void
}

declare void @fft_hw_stub(double*, double*, double*, double*)

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
