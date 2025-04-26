; ModuleID = 'C:/Users/ekarabu/Desktop/Aydin_amro/DMA_Prefetch_Sch/HLS_IPs/aes/aes_hls_project/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.aes256_context = type { [32 x i8], [32 x i8], [32 x i8] }

; Function Attrs: argmemonly noinline
define void @apatb_aes256_encrypt_ecb_ir(%struct.aes256_context* %ctx, i8* %k, i8* %buf) local_unnamed_addr #0 {
entry:
  %ctx_copy = alloca %struct.aes256_context, align 512
  %k_copy = alloca [32 x i8], align 512
  %buf_copy = alloca [16 x i8], align 512
  %0 = bitcast i8* %k to [32 x i8]*
  %1 = bitcast i8* %buf to [16 x i8]*
  call fastcc void @copy_in(%struct.aes256_context* %ctx, %struct.aes256_context* nonnull align 512 %ctx_copy, [32 x i8]* %0, [32 x i8]* nonnull align 512 %k_copy, [16 x i8]* %1, [16 x i8]* nonnull align 512 %buf_copy)
  %2 = getelementptr inbounds [32 x i8], [32 x i8]* %k_copy, i32 0, i32 0
  %3 = getelementptr inbounds [16 x i8], [16 x i8]* %buf_copy, i32 0, i32 0
  call void @apatb_aes256_encrypt_ecb_hw(%struct.aes256_context* %ctx_copy, i8* %2, i8* %3)
  call fastcc void @copy_out(%struct.aes256_context* %ctx, %struct.aes256_context* nonnull align 512 %ctx_copy, [32 x i8]* %0, [32 x i8]* nonnull align 512 %k_copy, [16 x i8]* %1, [16 x i8]* nonnull align 512 %buf_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%struct.aes256_context* readonly, %struct.aes256_context* noalias align 512, [32 x i8]* readonly, [32 x i8]* noalias align 512, [16 x i8]* readonly, [16 x i8]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.aes256_context(%struct.aes256_context* align 512 %1, %struct.aes256_context* %0)
  call fastcc void @onebyonecpy_hls.p0a32i8([32 x i8]* align 512 %3, [32 x i8]* %2)
  call fastcc void @onebyonecpy_hls.p0a16i8([16 x i8]* align 512 %5, [16 x i8]* %4)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0struct.aes256_context(%struct.aes256_context* noalias align 512, %struct.aes256_context* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq %struct.aes256_context* %0, null
  %3 = icmp eq %struct.aes256_context* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx24 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr20 = getelementptr %struct.aes256_context, %struct.aes256_context* %0, i32 0, i32 0, i64 %for.loop.idx24
  %src.addr21 = getelementptr %struct.aes256_context, %struct.aes256_context* %1, i32 0, i32 0, i64 %for.loop.idx24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr20, i8* align 1 %src.addr21, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx24, 1
  %exitcond26 = icmp ne i64 %for.loop.idx.next, 32
  br i1 %exitcond26, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop
  br label %for.loop4

for.loop4:                                        ; preds = %for.loop4, %copy.split
  %for.loop.idx523 = phi i64 [ 0, %copy.split ], [ %for.loop.idx5.next, %for.loop4 ]
  %dst.addr718 = getelementptr %struct.aes256_context, %struct.aes256_context* %0, i32 0, i32 1, i64 %for.loop.idx523
  %src.addr819 = getelementptr %struct.aes256_context, %struct.aes256_context* %1, i32 0, i32 1, i64 %for.loop.idx523
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr718, i8* align 1 %src.addr819, i64 1, i1 false)
  %for.loop.idx5.next = add nuw nsw i64 %for.loop.idx523, 1
  %exitcond25 = icmp ne i64 %for.loop.idx5.next, 32
  br i1 %exitcond25, label %for.loop4, label %copy.split.split

copy.split.split:                                 ; preds = %for.loop4
  br label %for.loop11

for.loop11:                                       ; preds = %for.loop11, %copy.split.split
  %for.loop.idx1222 = phi i64 [ 0, %copy.split.split ], [ %for.loop.idx12.next, %for.loop11 ]
  %dst.addr1416 = getelementptr %struct.aes256_context, %struct.aes256_context* %0, i32 0, i32 2, i64 %for.loop.idx1222
  %src.addr1517 = getelementptr %struct.aes256_context, %struct.aes256_context* %1, i32 0, i32 2, i64 %for.loop.idx1222
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr1416, i8* align 1 %src.addr1517, i64 1, i1 false)
  %for.loop.idx12.next = add nuw nsw i64 %for.loop.idx1222, 1
  %exitcond = icmp ne i64 %for.loop.idx12.next, 32
  br i1 %exitcond, label %for.loop11, label %ret

ret:                                              ; preds = %for.loop11, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a32i8([32 x i8]* noalias align 512, [32 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [32 x i8]* %0, null
  %3 = icmp eq [32 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x i8], [32 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [32 x i8], [32 x i8]* %1, i64 0, i64 %for.loop.idx1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr, i8* align 1 %src.addr, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 32
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a16i8([16 x i8]* noalias align 512, [16 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [16 x i8]* %0, null
  %3 = icmp eq [16 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [16 x i8], [16 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [16 x i8], [16 x i8]* %1, i64 0, i64 %for.loop.idx1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr, i8* align 1 %src.addr, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 16
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%struct.aes256_context*, %struct.aes256_context* noalias readonly align 512, [32 x i8]*, [32 x i8]* noalias readonly align 512, [16 x i8]*, [16 x i8]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.aes256_context(%struct.aes256_context* %0, %struct.aes256_context* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a32i8([32 x i8]* %2, [32 x i8]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a16i8([16 x i8]* %4, [16 x i8]* align 512 %5)
  ret void
}

declare void @apatb_aes256_encrypt_ecb_hw(%struct.aes256_context*, i8*, i8*)

define void @aes256_encrypt_ecb_hw_stub_wrapper(%struct.aes256_context*, i8*, i8*) #5 {
entry:
  %3 = bitcast i8* %1 to [32 x i8]*
  %4 = bitcast i8* %2 to [16 x i8]*
  call void @copy_out(%struct.aes256_context* null, %struct.aes256_context* %0, [32 x i8]* null, [32 x i8]* %3, [16 x i8]* null, [16 x i8]* %4)
  %5 = bitcast [32 x i8]* %3 to i8*
  %6 = bitcast [16 x i8]* %4 to i8*
  call void @aes256_encrypt_ecb_hw_stub(%struct.aes256_context* %0, i8* %5, i8* %6)
  call void @copy_in(%struct.aes256_context* null, %struct.aes256_context* %0, [32 x i8]* null, [32 x i8]* %3, [16 x i8]* null, [16 x i8]* %4)
  ret void
}

declare void @aes256_encrypt_ecb_hw_stub(%struct.aes256_context*, i8*, i8*)

attributes #0 = { argmemonly noinline "fpga.wrapper.func"="wrapper" }
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
