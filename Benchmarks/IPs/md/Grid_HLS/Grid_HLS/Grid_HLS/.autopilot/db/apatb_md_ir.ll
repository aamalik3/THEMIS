; ModuleID = 'C:/Users/aamalik3/Desktop/IPs/md/Grid_HLS/Grid_HLS/Grid_HLS/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.dvector_t = type { double, double, double }

; Function Attrs: noinline
define void @apatb_md_ir([4 x [4 x i32]]* %n_points, [4 x [4 x [10 x %struct.dvector_t]]]* %force, [4 x [4 x [10 x %struct.dvector_t]]]* %position) local_unnamed_addr #0 {
entry:
  %n_points_copy = alloca [4 x [4 x [4 x i32]]], align 512
  %malloccall = tail call i8* @malloc(i64 15360)
  %force_copy = bitcast i8* %malloccall to [4 x [4 x [4 x [10 x %struct.dvector_t]]]]*
  %malloccall1 = tail call i8* @malloc(i64 15360)
  %position_copy = bitcast i8* %malloccall1 to [4 x [4 x [4 x [10 x %struct.dvector_t]]]]*
  %0 = bitcast [4 x [4 x i32]]* %n_points to [4 x [4 x [4 x i32]]]*
  %1 = bitcast [4 x [4 x [10 x %struct.dvector_t]]]* %force to [4 x [4 x [4 x [10 x %struct.dvector_t]]]]*
  %2 = bitcast [4 x [4 x [10 x %struct.dvector_t]]]* %position to [4 x [4 x [4 x [10 x %struct.dvector_t]]]]*
  call fastcc void @copy_in([4 x [4 x [4 x i32]]]* %0, [4 x [4 x [4 x i32]]]* nonnull align 512 %n_points_copy, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %1, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %force_copy, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %2, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %position_copy)
  %3 = getelementptr inbounds [4 x [4 x [4 x i32]]], [4 x [4 x [4 x i32]]]* %n_points_copy, i32 0, i32 0
  %4 = getelementptr inbounds [4 x [4 x [4 x [10 x %struct.dvector_t]]]], [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %force_copy, i32 0, i32 0
  %5 = getelementptr inbounds [4 x [4 x [4 x [10 x %struct.dvector_t]]]], [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %position_copy, i32 0, i32 0
  call void @apatb_md_hw([4 x [4 x i32]]* %3, [4 x [4 x [10 x %struct.dvector_t]]]* %4, [4 x [4 x [10 x %struct.dvector_t]]]* %5)
  call fastcc void @copy_out([4 x [4 x [4 x i32]]]* %0, [4 x [4 x [4 x i32]]]* nonnull align 512 %n_points_copy, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %1, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %force_copy, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %2, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %position_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([4 x [4 x [4 x i32]]]* readonly, [4 x [4 x [4 x i32]]]* noalias align 512, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* readonly, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* noalias, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* readonly, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4a4a4i32([4 x [4 x [4 x i32]]]* align 512 %1, [4 x [4 x [4 x i32]]]* %0)
  call fastcc void @onebyonecpy_hls.p0a4a4a4a10struct.dvector_t([4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %3, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %2)
  call fastcc void @onebyonecpy_hls.p0a4a4a4a10struct.dvector_t([4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %5, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %4)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a4a4a4i32([4 x [4 x [4 x i32]]]* noalias align 512, [4 x [4 x [4 x i32]]]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [4 x [4 x [4 x i32]]]* %0, null
  %3 = icmp eq [4 x [4 x [4 x i32]]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx21 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2.split, %for.loop
  %for.loop.idx320 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2.split ]
  br label %for.loop8

for.loop8:                                        ; preds = %for.loop8, %for.loop2
  %for.loop.idx919 = phi i64 [ 0, %for.loop2 ], [ %for.loop.idx9.next, %for.loop8 ]
  %dst.addr1115.gep17 = getelementptr [4 x [4 x [4 x i32]]], [4 x [4 x [4 x i32]]]* %0, i64 0, i64 %for.loop.idx21, i64 %for.loop.idx320, i64 %for.loop.idx919
  %5 = bitcast i32* %dst.addr1115.gep17 to i8*
  %src.addr1216.gep18 = getelementptr [4 x [4 x [4 x i32]]], [4 x [4 x [4 x i32]]]* %1, i64 0, i64 %for.loop.idx21, i64 %for.loop.idx320, i64 %for.loop.idx919
  %6 = bitcast i32* %src.addr1216.gep18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx9.next = add nuw nsw i64 %for.loop.idx919, 1
  %exitcond = icmp ne i64 %for.loop.idx9.next, 4
  br i1 %exitcond, label %for.loop8, label %for.loop2.split

for.loop2.split:                                  ; preds = %for.loop8
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx320, 1
  %exitcond22 = icmp ne i64 %for.loop.idx3.next, 4
  br i1 %exitcond22, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2.split
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx21, 1
  %exitcond23 = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond23, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a4a4a4a10struct.dvector_t([4 x [4 x [4 x [10 x %struct.dvector_t]]]]* noalias, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %0, null
  %3 = icmp eq [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx40 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2.split, %for.loop
  %for.loop.idx339 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2.split ]
  br label %for.loop8

for.loop8:                                        ; preds = %for.loop8.split, %for.loop2
  %for.loop.idx938 = phi i64 [ 0, %for.loop2 ], [ %for.loop.idx9.next, %for.loop8.split ]
  br label %for.loop14

for.loop14:                                       ; preds = %for.loop14, %for.loop8
  %for.loop.idx1537 = phi i64 [ 0, %for.loop8 ], [ %for.loop.idx15.next, %for.loop14 ]
  %dst.addr17.026.gep31 = getelementptr [4 x [4 x [4 x [10 x %struct.dvector_t]]]], [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %0, i64 0, i64 %for.loop.idx40, i64 %for.loop.idx339, i64 %for.loop.idx938, i64 %for.loop.idx1537, i32 0
  %5 = bitcast double* %dst.addr17.026.gep31 to i8*
  %src.addr18.025.gep32 = getelementptr [4 x [4 x [4 x [10 x %struct.dvector_t]]]], [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %1, i64 0, i64 %for.loop.idx40, i64 %for.loop.idx339, i64 %for.loop.idx938, i64 %for.loop.idx1537, i32 0
  %6 = bitcast double* %src.addr18.025.gep32 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 8, i1 false)
  %dst.addr17.128.gep33 = getelementptr [4 x [4 x [4 x [10 x %struct.dvector_t]]]], [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %0, i64 0, i64 %for.loop.idx40, i64 %for.loop.idx339, i64 %for.loop.idx938, i64 %for.loop.idx1537, i32 1
  %7 = bitcast double* %dst.addr17.128.gep33 to i8*
  %src.addr18.127.gep34 = getelementptr [4 x [4 x [4 x [10 x %struct.dvector_t]]]], [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %1, i64 0, i64 %for.loop.idx40, i64 %for.loop.idx339, i64 %for.loop.idx938, i64 %for.loop.idx1537, i32 1
  %8 = bitcast double* %src.addr18.127.gep34 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %8, i64 8, i1 false)
  %dst.addr17.230.gep35 = getelementptr [4 x [4 x [4 x [10 x %struct.dvector_t]]]], [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %0, i64 0, i64 %for.loop.idx40, i64 %for.loop.idx339, i64 %for.loop.idx938, i64 %for.loop.idx1537, i32 2
  %9 = bitcast double* %dst.addr17.230.gep35 to i8*
  %src.addr18.229.gep36 = getelementptr [4 x [4 x [4 x [10 x %struct.dvector_t]]]], [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %1, i64 0, i64 %for.loop.idx40, i64 %for.loop.idx339, i64 %for.loop.idx938, i64 %for.loop.idx1537, i32 2
  %10 = bitcast double* %src.addr18.229.gep36 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %9, i8* align 1 %10, i64 8, i1 false)
  %for.loop.idx15.next = add nuw nsw i64 %for.loop.idx1537, 1
  %exitcond = icmp ne i64 %for.loop.idx15.next, 10
  br i1 %exitcond, label %for.loop14, label %for.loop8.split

for.loop8.split:                                  ; preds = %for.loop14
  %for.loop.idx9.next = add nuw nsw i64 %for.loop.idx938, 1
  %exitcond41 = icmp ne i64 %for.loop.idx9.next, 4
  br i1 %exitcond41, label %for.loop8, label %for.loop2.split

for.loop2.split:                                  ; preds = %for.loop8.split
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx339, 1
  %exitcond42 = icmp ne i64 %for.loop.idx3.next, 4
  br i1 %exitcond42, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2.split
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx40, 1
  %exitcond43 = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond43, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([4 x [4 x [4 x i32]]]*, [4 x [4 x [4 x i32]]]* noalias readonly align 512, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]*, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* noalias readonly, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]*, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4a4a4i32([4 x [4 x [4 x i32]]]* %0, [4 x [4 x [4 x i32]]]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a4a4a4a10struct.dvector_t([4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %2, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %3)
  call fastcc void @onebyonecpy_hls.p0a4a4a4a10struct.dvector_t([4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %4, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %5)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_md_hw([4 x [4 x i32]]*, [4 x [4 x [10 x %struct.dvector_t]]]*, [4 x [4 x [10 x %struct.dvector_t]]]*)

define void @md_hw_stub_wrapper([4 x [4 x i32]]*, [4 x [4 x [10 x %struct.dvector_t]]]*, [4 x [4 x [10 x %struct.dvector_t]]]*) #5 {
entry:
  %3 = bitcast [4 x [4 x i32]]* %0 to [4 x [4 x [4 x i32]]]*
  %4 = bitcast [4 x [4 x [10 x %struct.dvector_t]]]* %1 to [4 x [4 x [4 x [10 x %struct.dvector_t]]]]*
  %5 = bitcast [4 x [4 x [10 x %struct.dvector_t]]]* %2 to [4 x [4 x [4 x [10 x %struct.dvector_t]]]]*
  call void @copy_out([4 x [4 x [4 x i32]]]* null, [4 x [4 x [4 x i32]]]* %3, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* null, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %4, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* null, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %5)
  %6 = bitcast [4 x [4 x [4 x i32]]]* %3 to [4 x [4 x i32]]*
  %7 = bitcast [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %4 to [4 x [4 x [10 x %struct.dvector_t]]]*
  %8 = bitcast [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %5 to [4 x [4 x [10 x %struct.dvector_t]]]*
  call void @md_hw_stub([4 x [4 x i32]]* %6, [4 x [4 x [10 x %struct.dvector_t]]]* %7, [4 x [4 x [10 x %struct.dvector_t]]]* %8)
  call void @copy_in([4 x [4 x [4 x i32]]]* null, [4 x [4 x [4 x i32]]]* %3, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* null, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %4, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* null, [4 x [4 x [4 x [10 x %struct.dvector_t]]]]* %5)
  ret void
}

declare void @md_hw_stub([4 x [4 x i32]]*, [4 x [4 x [10 x %struct.dvector_t]]]*, [4 x [4 x [10 x %struct.dvector_t]]]*)

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
