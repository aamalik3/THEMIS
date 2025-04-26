; ModuleID = 'C:/Users/aamalik3/Desktop/IPs/gemm/Blocked_HLS/Blocked_HLS/Blocked_HLS/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_bbgemm_ir(double* %m1, double* %m2, double* %prod) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 32768)
  %m1_copy = bitcast i8* %malloccall to [4096 x double]*
  %malloccall1 = tail call i8* @malloc(i64 32768)
  %m2_copy = bitcast i8* %malloccall1 to [4096 x double]*
  %malloccall2 = tail call i8* @malloc(i64 32768)
  %prod_copy = bitcast i8* %malloccall2 to [4096 x double]*
  %0 = bitcast double* %m1 to [4096 x double]*
  %1 = bitcast double* %m2 to [4096 x double]*
  %2 = bitcast double* %prod to [4096 x double]*
  call fastcc void @copy_in([4096 x double]* %0, [4096 x double]* %m1_copy, [4096 x double]* %1, [4096 x double]* %m2_copy, [4096 x double]* %2, [4096 x double]* %prod_copy)
  %3 = getelementptr inbounds [4096 x double], [4096 x double]* %m1_copy, i32 0, i32 0
  %4 = getelementptr inbounds [4096 x double], [4096 x double]* %m2_copy, i32 0, i32 0
  %5 = getelementptr inbounds [4096 x double], [4096 x double]* %prod_copy, i32 0, i32 0
  call void @apatb_bbgemm_hw(double* %3, double* %4, double* %5)
  call fastcc void @copy_out([4096 x double]* %0, [4096 x double]* %m1_copy, [4096 x double]* %1, [4096 x double]* %m2_copy, [4096 x double]* %2, [4096 x double]* %prod_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([4096 x double]* readonly, [4096 x double]* noalias, [4096 x double]* readonly, [4096 x double]* noalias, [4096 x double]* readonly, [4096 x double]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %1, [4096 x double]* %0)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %3, [4096 x double]* %2)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %5, [4096 x double]* %4)
  ret void
}

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

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([4096 x double]*, [4096 x double]* noalias readonly, [4096 x double]*, [4096 x double]* noalias readonly, [4096 x double]*, [4096 x double]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %0, [4096 x double]* %1)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %2, [4096 x double]* %3)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %4, [4096 x double]* %5)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_bbgemm_hw(double*, double*, double*)

define void @bbgemm_hw_stub_wrapper(double*, double*, double*) #5 {
entry:
  %3 = bitcast double* %0 to [4096 x double]*
  %4 = bitcast double* %1 to [4096 x double]*
  %5 = bitcast double* %2 to [4096 x double]*
  call void @copy_out([4096 x double]* null, [4096 x double]* %3, [4096 x double]* null, [4096 x double]* %4, [4096 x double]* null, [4096 x double]* %5)
  %6 = bitcast [4096 x double]* %3 to double*
  %7 = bitcast [4096 x double]* %4 to double*
  %8 = bitcast [4096 x double]* %5 to double*
  call void @bbgemm_hw_stub(double* %6, double* %7, double* %8)
  call void @copy_in([4096 x double]* null, [4096 x double]* %3, [4096 x double]* null, [4096 x double]* %4, [4096 x double]* null, [4096 x double]* %5)
  ret void
}

declare void @bbgemm_hw_stub(double*, double*, double*)

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
