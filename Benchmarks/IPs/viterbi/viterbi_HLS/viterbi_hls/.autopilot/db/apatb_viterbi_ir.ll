; ModuleID = 'C:/Users/aamalik3/Desktop/IPs/viterbi/viterbi_HLS/viterbi_hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define i32 @apatb_viterbi_ir(i8* %obs, double* %init, double* %transition, double* %emission, i8* %path) local_unnamed_addr #0 {
entry:
  %obs_copy = alloca [140 x i8], align 512
  %init_copy = alloca [64 x double], align 512
  %malloccall = tail call i8* @malloc(i64 32768)
  %transition_copy = bitcast i8* %malloccall to [4096 x double]*
  %malloccall1 = tail call i8* @malloc(i64 32768)
  %emission_copy = bitcast i8* %malloccall1 to [4096 x double]*
  %path_copy = alloca [140 x i8], align 512
  %0 = bitcast i8* %obs to [140 x i8]*
  %1 = bitcast double* %init to [64 x double]*
  %2 = bitcast double* %transition to [4096 x double]*
  %3 = bitcast double* %emission to [4096 x double]*
  %4 = bitcast i8* %path to [140 x i8]*
  call fastcc void @copy_in([140 x i8]* %0, [140 x i8]* nonnull align 512 %obs_copy, [64 x double]* %1, [64 x double]* nonnull align 512 %init_copy, [4096 x double]* %2, [4096 x double]* %transition_copy, [4096 x double]* %3, [4096 x double]* %emission_copy, [140 x i8]* %4, [140 x i8]* nonnull align 512 %path_copy)
  %5 = getelementptr inbounds [140 x i8], [140 x i8]* %obs_copy, i32 0, i32 0
  %6 = getelementptr inbounds [64 x double], [64 x double]* %init_copy, i32 0, i32 0
  %7 = getelementptr inbounds [4096 x double], [4096 x double]* %transition_copy, i32 0, i32 0
  %8 = getelementptr inbounds [4096 x double], [4096 x double]* %emission_copy, i32 0, i32 0
  %9 = getelementptr inbounds [140 x i8], [140 x i8]* %path_copy, i32 0, i32 0
  %10 = call i32 @apatb_viterbi_hw(i8* %5, double* %6, double* %7, double* %8, i8* %9)
  call fastcc void @copy_out([140 x i8]* %0, [140 x i8]* nonnull align 512 %obs_copy, [64 x double]* %1, [64 x double]* nonnull align 512 %init_copy, [4096 x double]* %2, [4096 x double]* %transition_copy, [4096 x double]* %3, [4096 x double]* %emission_copy, [140 x i8]* %4, [140 x i8]* nonnull align 512 %path_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret i32 %10
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([140 x i8]* readonly, [140 x i8]* noalias align 512, [64 x double]* readonly, [64 x double]* noalias align 512, [4096 x double]* readonly, [4096 x double]* noalias, [4096 x double]* readonly, [4096 x double]* noalias, [140 x i8]* readonly, [140 x i8]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a140i8([140 x i8]* align 512 %1, [140 x i8]* %0)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* align 512 %3, [64 x double]* %2)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %5, [4096 x double]* %4)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %7, [4096 x double]* %6)
  call fastcc void @onebyonecpy_hls.p0a140i8([140 x i8]* align 512 %9, [140 x i8]* %8)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a140i8([140 x i8]* noalias align 512, [140 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [140 x i8]* %0, null
  %3 = icmp eq [140 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [140 x i8], [140 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [140 x i8], [140 x i8]* %1, i64 0, i64 %for.loop.idx1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr, i8* align 1 %src.addr, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 140
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

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
define internal fastcc void @copy_out([140 x i8]*, [140 x i8]* noalias readonly align 512, [64 x double]*, [64 x double]* noalias readonly align 512, [4096 x double]*, [4096 x double]* noalias readonly, [4096 x double]*, [4096 x double]* noalias readonly, [140 x i8]*, [140 x i8]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a140i8([140 x i8]* %0, [140 x i8]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* %2, [64 x double]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %4, [4096 x double]* %5)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %6, [4096 x double]* %7)
  call fastcc void @onebyonecpy_hls.p0a140i8([140 x i8]* %8, [140 x i8]* align 512 %9)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare i32 @apatb_viterbi_hw(i8*, double*, double*, double*, i8*)

define i32 @viterbi_hw_stub_wrapper(i8*, double*, double*, double*, i8*) #5 {
entry:
  %5 = bitcast i8* %0 to [140 x i8]*
  %6 = bitcast double* %1 to [64 x double]*
  %7 = bitcast double* %2 to [4096 x double]*
  %8 = bitcast double* %3 to [4096 x double]*
  %9 = bitcast i8* %4 to [140 x i8]*
  call void @copy_out([140 x i8]* null, [140 x i8]* %5, [64 x double]* null, [64 x double]* %6, [4096 x double]* null, [4096 x double]* %7, [4096 x double]* null, [4096 x double]* %8, [140 x i8]* null, [140 x i8]* %9)
  %10 = bitcast [140 x i8]* %5 to i8*
  %11 = bitcast [64 x double]* %6 to double*
  %12 = bitcast [4096 x double]* %7 to double*
  %13 = bitcast [4096 x double]* %8 to double*
  %14 = bitcast [140 x i8]* %9 to i8*
  %15 = call i32 @viterbi_hw_stub(i8* %10, double* %11, double* %12, double* %13, i8* %14)
  call void @copy_in([140 x i8]* null, [140 x i8]* %5, [64 x double]* null, [64 x double]* %6, [4096 x double]* null, [4096 x double]* %7, [4096 x double]* null, [4096 x double]* %8, [140 x i8]* null, [140 x i8]* %9)
  ret i32 %15
}

declare i32 @viterbi_hw_stub(i8*, double*, double*, double*, i8*)

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
