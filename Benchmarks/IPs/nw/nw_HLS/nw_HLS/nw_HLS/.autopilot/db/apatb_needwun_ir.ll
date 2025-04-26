; ModuleID = 'C:/Users/aamalik3/Desktop/IPs/nw/nw_HLS/nw_HLS/nw_HLS/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_needwun_ir(i8* %SEQA, i8* %SEQB, i8* %alignedA, i8* %alignedB, i32* %M, i8* %ptr) local_unnamed_addr #0 {
entry:
  %SEQA_copy = alloca [128 x i8], align 512
  %SEQB_copy = alloca [128 x i8], align 512
  %alignedA_copy = alloca [256 x i8], align 512
  %alignedB_copy = alloca [256 x i8], align 512
  %malloccall = tail call i8* @malloc(i64 66564)
  %M_copy = bitcast i8* %malloccall to [16641 x i32]*
  %malloccall1 = tail call i8* @malloc(i64 16641)
  %ptr_copy = bitcast i8* %malloccall1 to [16641 x i8]*
  %0 = bitcast i8* %SEQA to [128 x i8]*
  %1 = bitcast i8* %SEQB to [128 x i8]*
  %2 = bitcast i8* %alignedA to [256 x i8]*
  %3 = bitcast i8* %alignedB to [256 x i8]*
  %4 = bitcast i32* %M to [16641 x i32]*
  %5 = bitcast i8* %ptr to [16641 x i8]*
  call fastcc void @copy_in([128 x i8]* %0, [128 x i8]* nonnull align 512 %SEQA_copy, [128 x i8]* %1, [128 x i8]* nonnull align 512 %SEQB_copy, [256 x i8]* %2, [256 x i8]* nonnull align 512 %alignedA_copy, [256 x i8]* %3, [256 x i8]* nonnull align 512 %alignedB_copy, [16641 x i32]* %4, [16641 x i32]* %M_copy, [16641 x i8]* %5, [16641 x i8]* %ptr_copy)
  %6 = getelementptr inbounds [128 x i8], [128 x i8]* %SEQA_copy, i32 0, i32 0
  %7 = getelementptr inbounds [128 x i8], [128 x i8]* %SEQB_copy, i32 0, i32 0
  %8 = getelementptr inbounds [256 x i8], [256 x i8]* %alignedA_copy, i32 0, i32 0
  %9 = getelementptr inbounds [256 x i8], [256 x i8]* %alignedB_copy, i32 0, i32 0
  %10 = getelementptr inbounds [16641 x i32], [16641 x i32]* %M_copy, i32 0, i32 0
  call void @apatb_needwun_hw(i8* %6, i8* %7, i8* %8, i8* %9, i32* %10, i8* %malloccall1)
  call fastcc void @copy_out([128 x i8]* %0, [128 x i8]* nonnull align 512 %SEQA_copy, [128 x i8]* %1, [128 x i8]* nonnull align 512 %SEQB_copy, [256 x i8]* %2, [256 x i8]* nonnull align 512 %alignedA_copy, [256 x i8]* %3, [256 x i8]* nonnull align 512 %alignedB_copy, [16641 x i32]* %4, [16641 x i32]* %M_copy, [16641 x i8]* %5, [16641 x i8]* %ptr_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([128 x i8]* readonly, [128 x i8]* noalias align 512, [128 x i8]* readonly, [128 x i8]* noalias align 512, [256 x i8]* readonly, [256 x i8]* noalias align 512, [256 x i8]* readonly, [256 x i8]* noalias align 512, [16641 x i32]* readonly, [16641 x i32]* noalias, [16641 x i8]* readonly, [16641 x i8]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a128i8([128 x i8]* align 512 %1, [128 x i8]* %0)
  call fastcc void @onebyonecpy_hls.p0a128i8([128 x i8]* align 512 %3, [128 x i8]* %2)
  call fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* align 512 %5, [256 x i8]* %4)
  call fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* align 512 %7, [256 x i8]* %6)
  call fastcc void @onebyonecpy_hls.p0a16641i32([16641 x i32]* %9, [16641 x i32]* %8)
  call fastcc void @onebyonecpy_hls.p0a16641i8([16641 x i8]* %11, [16641 x i8]* %10)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a128i8([128 x i8]* noalias align 512, [128 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [128 x i8]* %0, null
  %3 = icmp eq [128 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [128 x i8], [128 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [128 x i8], [128 x i8]* %1, i64 0, i64 %for.loop.idx1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr, i8* align 1 %src.addr, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 128
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* noalias align 512, [256 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [256 x i8]* %0, null
  %3 = icmp eq [256 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [256 x i8], [256 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [256 x i8], [256 x i8]* %1, i64 0, i64 %for.loop.idx1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr, i8* align 1 %src.addr, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 256
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a16641i32([16641 x i32]* noalias, [16641 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [16641 x i32]* %0, null
  %3 = icmp eq [16641 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [16641 x i32], [16641 x i32]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i32* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [16641 x i32], [16641 x i32]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i32* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 16641
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a16641i8([16641 x i8]* noalias, [16641 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [16641 x i8]* %0, null
  %3 = icmp eq [16641 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [16641 x i8], [16641 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [16641 x i8], [16641 x i8]* %1, i64 0, i64 %for.loop.idx1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr, i8* align 1 %src.addr, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 16641
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([128 x i8]*, [128 x i8]* noalias readonly align 512, [128 x i8]*, [128 x i8]* noalias readonly align 512, [256 x i8]*, [256 x i8]* noalias readonly align 512, [256 x i8]*, [256 x i8]* noalias readonly align 512, [16641 x i32]*, [16641 x i32]* noalias readonly, [16641 x i8]*, [16641 x i8]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a128i8([128 x i8]* %0, [128 x i8]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a128i8([128 x i8]* %2, [128 x i8]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* %4, [256 x i8]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* %6, [256 x i8]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a16641i32([16641 x i32]* %8, [16641 x i32]* %9)
  call fastcc void @onebyonecpy_hls.p0a16641i8([16641 x i8]* %10, [16641 x i8]* %11)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_needwun_hw(i8*, i8*, i8*, i8*, i32*, i8*)

define void @needwun_hw_stub_wrapper(i8*, i8*, i8*, i8*, i32*, i8*) #5 {
entry:
  %6 = bitcast i8* %0 to [128 x i8]*
  %7 = bitcast i8* %1 to [128 x i8]*
  %8 = bitcast i8* %2 to [256 x i8]*
  %9 = bitcast i8* %3 to [256 x i8]*
  %10 = bitcast i32* %4 to [16641 x i32]*
  %11 = bitcast i8* %5 to [16641 x i8]*
  call void @copy_out([128 x i8]* null, [128 x i8]* %6, [128 x i8]* null, [128 x i8]* %7, [256 x i8]* null, [256 x i8]* %8, [256 x i8]* null, [256 x i8]* %9, [16641 x i32]* null, [16641 x i32]* %10, [16641 x i8]* null, [16641 x i8]* %11)
  %12 = bitcast [128 x i8]* %6 to i8*
  %13 = bitcast [128 x i8]* %7 to i8*
  %14 = bitcast [256 x i8]* %8 to i8*
  %15 = bitcast [256 x i8]* %9 to i8*
  %16 = bitcast [16641 x i32]* %10 to i32*
  %17 = bitcast [16641 x i8]* %11 to i8*
  call void @needwun_hw_stub(i8* %12, i8* %13, i8* %14, i8* %15, i32* %16, i8* %17)
  call void @copy_in([128 x i8]* null, [128 x i8]* %6, [128 x i8]* null, [128 x i8]* %7, [256 x i8]* null, [256 x i8]* %8, [256 x i8]* null, [256 x i8]* %9, [16641 x i32]* null, [16641 x i32]* %10, [16641 x i8]* null, [16641 x i8]* %11)
  ret void
}

declare void @needwun_hw_stub(i8*, i8*, i8*, i8*, i32*, i8*)

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
