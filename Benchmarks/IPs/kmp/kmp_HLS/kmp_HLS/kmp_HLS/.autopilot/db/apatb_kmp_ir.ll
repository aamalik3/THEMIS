; ModuleID = 'C:/Users/aamalik3/Desktop/IPs/kmp/kmp_HLS/kmp_HLS/kmp_HLS/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define i32 @apatb_kmp_ir(i8* %pattern, i8* %input, i32* %kmpNext, i32* %n_matches) local_unnamed_addr #0 {
entry:
  %pattern_copy = alloca [4 x i8], align 512
  %malloccall = tail call i8* @malloc(i64 32411)
  %input_copy = bitcast i8* %malloccall to [32411 x i8]*
  %kmpNext_copy = alloca [4 x i32], align 512
  %n_matches_copy = alloca [1 x i32], align 512
  %0 = bitcast i8* %pattern to [4 x i8]*
  %1 = bitcast i8* %input to [32411 x i8]*
  %2 = bitcast i32* %kmpNext to [4 x i32]*
  %3 = bitcast i32* %n_matches to [1 x i32]*
  call fastcc void @copy_in([4 x i8]* %0, [4 x i8]* nonnull align 512 %pattern_copy, [32411 x i8]* %1, [32411 x i8]* %input_copy, [4 x i32]* %2, [4 x i32]* nonnull align 512 %kmpNext_copy, [1 x i32]* %3, [1 x i32]* nonnull align 512 %n_matches_copy)
  %4 = getelementptr inbounds [4 x i8], [4 x i8]* %pattern_copy, i32 0, i32 0
  %5 = getelementptr inbounds [4 x i32], [4 x i32]* %kmpNext_copy, i32 0, i32 0
  %6 = getelementptr inbounds [1 x i32], [1 x i32]* %n_matches_copy, i32 0, i32 0
  %7 = call i32 @apatb_kmp_hw(i8* %4, i8* %malloccall, i32* %5, i32* %6)
  call fastcc void @copy_out([4 x i8]* %0, [4 x i8]* nonnull align 512 %pattern_copy, [32411 x i8]* %1, [32411 x i8]* %input_copy, [4 x i32]* %2, [4 x i32]* nonnull align 512 %kmpNext_copy, [1 x i32]* %3, [1 x i32]* nonnull align 512 %n_matches_copy)
  tail call void @free(i8* %malloccall)
  ret i32 %7
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([4 x i8]* readonly, [4 x i8]* noalias align 512, [32411 x i8]* readonly, [32411 x i8]* noalias, [4 x i32]* readonly, [4 x i32]* noalias align 512, [1 x i32]* readonly, [1 x i32]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4i8([4 x i8]* align 512 %1, [4 x i8]* %0)
  call fastcc void @onebyonecpy_hls.p0a32411i8([32411 x i8]* %3, [32411 x i8]* %2)
  call fastcc void @onebyonecpy_hls.p0a4i32([4 x i32]* align 512 %5, [4 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a1i32([1 x i32]* align 512 %7, [1 x i32]* %6)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a4i8([4 x i8]* noalias align 512, [4 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [4 x i8]* %0, null
  %3 = icmp eq [4 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4 x i8], [4 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [4 x i8], [4 x i8]* %1, i64 0, i64 %for.loop.idx1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr, i8* align 1 %src.addr, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a32411i8([32411 x i8]* noalias, [32411 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [32411 x i8]* %0, null
  %3 = icmp eq [32411 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32411 x i8], [32411 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [32411 x i8], [32411 x i8]* %1, i64 0, i64 %for.loop.idx1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr, i8* align 1 %src.addr, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 32411
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a4i32([4 x i32]* noalias align 512, [4 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [4 x i32]* %0, null
  %3 = icmp eq [4 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [4 x i32], [4 x i32]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i32* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [4 x i32], [4 x i32]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i32* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a1i32([1 x i32]* noalias align 512, [1 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1 x i32]* %0, null
  %3 = icmp eq [1 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %for.loop

for.loop:                                         ; preds = %entry
  %5 = bitcast [1 x i32]* %0 to i8*
  %6 = bitcast [1 x i32]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  br label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([4 x i8]*, [4 x i8]* noalias readonly align 512, [32411 x i8]*, [32411 x i8]* noalias readonly, [4 x i32]*, [4 x i32]* noalias readonly align 512, [1 x i32]*, [1 x i32]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4i8([4 x i8]* %0, [4 x i8]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a32411i8([32411 x i8]* %2, [32411 x i8]* %3)
  call fastcc void @onebyonecpy_hls.p0a4i32([4 x i32]* %4, [4 x i32]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a1i32([1 x i32]* %6, [1 x i32]* align 512 %7)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare i32 @apatb_kmp_hw(i8*, i8*, i32*, i32*)

define i32 @kmp_hw_stub_wrapper(i8*, i8*, i32*, i32*) #5 {
entry:
  %4 = bitcast i8* %0 to [4 x i8]*
  %5 = bitcast i8* %1 to [32411 x i8]*
  %6 = bitcast i32* %2 to [4 x i32]*
  %7 = bitcast i32* %3 to [1 x i32]*
  call void @copy_out([4 x i8]* null, [4 x i8]* %4, [32411 x i8]* null, [32411 x i8]* %5, [4 x i32]* null, [4 x i32]* %6, [1 x i32]* null, [1 x i32]* %7)
  %8 = bitcast [4 x i8]* %4 to i8*
  %9 = bitcast [32411 x i8]* %5 to i8*
  %10 = bitcast [4 x i32]* %6 to i32*
  %11 = bitcast [1 x i32]* %7 to i32*
  %12 = call i32 @kmp_hw_stub(i8* %8, i8* %9, i32* %10, i32* %11)
  call void @copy_in([4 x i8]* null, [4 x i8]* %4, [32411 x i8]* null, [32411 x i8]* %5, [4 x i32]* null, [4 x i32]* %6, [1 x i32]* null, [1 x i32]* %7)
  ret i32 %12
}

declare i32 @kmp_hw_stub(i8*, i8*, i32*, i32*)

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
