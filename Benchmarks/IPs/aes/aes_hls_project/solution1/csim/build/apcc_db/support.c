/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#ifdef NEED_CBEAPINT
#include <autopilot_cbe.h>
#else
#define aesl_fopen fopen
#define aesl_freopen freopen
#define aesl_tmpfile tmpfile
#endif
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#ifdef __STRICT_ANSI__
#define inline __inline__
#define typeof __typeof__ 
#endif
#define __isoc99_fscanf fscanf
#define __isoc99_sscanf sscanf
#undef ferror
#undef feof
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && (defined(__APPLE_CC__) || defined(__CYGWIN__) || defined(__MINGW32__))
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if __GNUC__ && __LP64__ /* 128-bit integer types */
typedef int __attribute__((mode(TI))) llvmInt128;
typedef unsigned __attribute__((mode(TI))) llvmUInt128;
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;
/* Structure forward decls */
typedef struct l_struct_OC_stat l_struct_OC_stat;
typedef struct l_struct_OC__iobuf l_struct_OC__iobuf;

/* Structure contents */
struct l_struct_OC_stat {
  unsigned int field0;
  unsigned short field1;
  unsigned short field2;
  unsigned short field3;
  unsigned short field4;
  unsigned short field5;
  unsigned int field6;
  unsigned int field7;
  unsigned long long field8;
  unsigned long long field9;
  unsigned long long field10;
};

struct l_struct_OC__iobuf {
   char *field0;
  unsigned int field1;
   char *field2;
  unsigned int field3;
  unsigned int field4;
  unsigned int field5;
  unsigned int field6;
   char *field7;
};


/* External Global Variable Declarations */

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
 char *readfile(signed int llvm_cbe_fd);
signed int fstat(signed int , l_struct_OC_stat *);
signed int read(signed int ,  char *, signed int );
signed int close(signed int );
 char *find_section_start( char *llvm_cbe_s, signed int llvm_cbe_n);
signed int parse_string( char *llvm_cbe_s,  char *llvm_cbe_arr, signed int llvm_cbe_n);
signed int parse_uint8_t_array( char *llvm_cbe_s,  char *llvm_cbe_arr, signed int llvm_cbe_n);
signed int parse_uint16_t_array( char *llvm_cbe_s, signed short *llvm_cbe_arr, signed int llvm_cbe_n);
signed int parse_uint32_t_array( char *llvm_cbe_s, signed int *llvm_cbe_arr, signed int llvm_cbe_n);
signed int parse_uint64_t_array( char *llvm_cbe_s, signed long long *llvm_cbe_arr, signed int llvm_cbe_n);
signed int parse_int8_t_array( char *llvm_cbe_s,  char *llvm_cbe_arr, signed int llvm_cbe_n);
signed int parse_int16_t_array( char *llvm_cbe_s, signed short *llvm_cbe_arr, signed int llvm_cbe_n);
signed int parse_int32_t_array( char *llvm_cbe_s, signed int *llvm_cbe_arr, signed int llvm_cbe_n);
signed int parse_int64_t_array( char *llvm_cbe_s, signed long long *llvm_cbe_arr, signed int llvm_cbe_n);
signed int parse_float_array( char *llvm_cbe_s, float *llvm_cbe_arr, signed int llvm_cbe_n);
signed int parse_double_array( char *llvm_cbe_s, double *llvm_cbe_arr, signed int llvm_cbe_n);
double __strtod( char *,  char **);
signed int write_string(signed int llvm_cbe_fd,  char *llvm_cbe_arr, signed int llvm_cbe_n);
signed int write(signed int ,  char *, signed int );
signed int write_uint8_t_array(signed int llvm_cbe_fd,  char *llvm_cbe_arr, signed int llvm_cbe_n);
static void aesl_internal_fd_printf(signed int llvm_cbe_fd,  char *llvm_cbe_format, ...);
signed int write_uint16_t_array(signed int llvm_cbe_fd, signed short *llvm_cbe_arr, signed int llvm_cbe_n);
signed int write_uint32_t_array(signed int llvm_cbe_fd, signed int *llvm_cbe_arr, signed int llvm_cbe_n);
signed int write_uint64_t_array(signed int llvm_cbe_fd, signed long long *llvm_cbe_arr, signed int llvm_cbe_n);
signed int write_int8_t_array(signed int llvm_cbe_fd,  char *llvm_cbe_arr, signed int llvm_cbe_n);
signed int write_int16_t_array(signed int llvm_cbe_fd, signed short *llvm_cbe_arr, signed int llvm_cbe_n);
signed int write_int32_t_array(signed int llvm_cbe_fd, signed int *llvm_cbe_arr, signed int llvm_cbe_n);
signed int write_int64_t_array(signed int llvm_cbe_fd, signed long long *llvm_cbe_arr, signed int llvm_cbe_n);
signed int write_float_array(signed int llvm_cbe_fd, float *llvm_cbe_arr, signed int llvm_cbe_n);
signed int write_double_array(signed int llvm_cbe_fd, double *llvm_cbe_arr, signed int llvm_cbe_n);
signed int write_section_header(signed int llvm_cbe_fd);
signed int vsnprintf( char *, signed long long ,  char *,  char *);


/* Global Variable Definitions and Initialization */
static  char aesl_internal__OC_str1[34] = "fd>1 && \"Invalid file descriptor\"";
static  char aesl_internal__OC_str2[26] = "../../../../aes/support.c";
static  char aesl_internal__OC_str4[51] = "0==fstat(fd, &s) && \"Couldn't determine file size\"";
static  char aesl_internal__OC_str6[25] = "len>0 && \"File is empty\"";
static  char aesl_internal__OC_str8[29] = "status>=0 && \"read() failed\"";
static  char aesl_internal__OC_str17[4] = "%u\n";
static  char aesl_internal__OC_str10[33] = "n>=0 && \"Invalid section number\"";
static  char aesl_internal__OC_str12[34] = "s!=NULL && \"Invalid input string\"";
static  char aesl_internal__OC_str13[2] = "\n";
static  char aesl_internal__OC_str14[35] = "Invalid input: line %d of section\n";
static  char aesl_internal__OC_str16[28] = "status>=0 && \"Write failed\"";
static  char aesl_internal__OC_str18[7] = "%I64u\n";
static  char aesl_internal__OC_str19[4] = "%d\n";
static  char aesl_internal__OC_str22[6] = "%%%%\n";
static  char aesl_internal__OC_str21[7] = "%.16f\n";
static  char aesl_internal__OC_str24[90] = "buffered<SUFFICIENT_SPRINTF_SPACE && \"Overran fd_printf buffer---output possibly corrupt\"";
static  char aesl_internal__OC_str20[7] = "%I64d\n";
static  char aesl_internal__OC_str26[50] = "written==buffered && \"Wrote more data than given\"";


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }

 char *readfile(signed int llvm_cbe_fd) {
  static  unsigned long long aesl_llvm_cbe_s_count = 0;
  l_struct_OC_stat llvm_cbe_s;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  unsigned int llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  signed int *llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  unsigned int llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  unsigned int llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  unsigned long long llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
   char *llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  unsigned long long llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned long long llvm_cbe_storemerge1;
  unsigned long long llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
   char *llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  unsigned int llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  unsigned int llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  unsigned long long llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  unsigned long long llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
   char *llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  unsigned int llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @readfile\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__16;
  } else {
    goto llvm_cbe_tmp__17;
  }

llvm_cbe_tmp__17:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 40) nounwind, !dbg !21 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_9_count);
  _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 40u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",40u);
}
  goto llvm_cbe_tmp__16;

llvm_cbe_tmp__16:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i32 @fstat(i32 %%fd, %%struct.stat* %%s) nounwind, !dbg !22 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_11_count);
  llvm_cbe_tmp__1 = (unsigned int )fstat(llvm_cbe_fd, (l_struct_OC_stat *)(&llvm_cbe_s));
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__1);
}
  if (((llvm_cbe_tmp__1&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__18;
  } else {
    goto llvm_cbe_tmp__19;
  }

llvm_cbe_tmp__19:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([51 x i8]* @aesl_internal_.str4, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 41) nounwind, !dbg !22 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_14_count);
  _assert(( char *)((&aesl_internal__OC_str4[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 51
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 41u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",41u);
}
  goto llvm_cbe_tmp__18;

llvm_cbe_tmp__18:
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = getelementptr inbounds %%struct.stat* %%s, i64 0, i32 7, !dbg !24 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_16_count);
  llvm_cbe_tmp__2 = (signed int *)(&llvm_cbe_s.field7);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = load i32* %%8, align 4, !dbg !24 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_17_count);
  llvm_cbe_tmp__3 = (unsigned int )*llvm_cbe_tmp__2;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__3);
  if ((((signed int )llvm_cbe_tmp__3) > ((signed int )0u))) {
    goto llvm_cbe_tmp__20;
  } else {
    goto llvm_cbe_tmp__21;
  }

llvm_cbe_tmp__21:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([25 x i8]* @aesl_internal_.str6, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 43) nounwind, !dbg !24 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_26_count);
  _assert(( char *)((&aesl_internal__OC_str6[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 25
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 43u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",43u);
}
  goto llvm_cbe_tmp__20;

llvm_cbe_tmp__20:
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = add nsw i32 %%9, 1, !dbg !25 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_28_count);
  llvm_cbe_tmp__4 = (unsigned int )((unsigned int )(llvm_cbe_tmp__3&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__4&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = sext i32 %%13 to i64, !dbg !25 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_29_count);
  llvm_cbe_tmp__5 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__4);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = call i8* @malloc(i64 %%14), !dbg !25 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_30_count);
  llvm_cbe_tmp__6 = ( char *)( char *)malloc(llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%I64X",llvm_cbe_tmp__5);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__6);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = sext i32 %%9 to i64, !dbg !25 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_40_count);
  llvm_cbe_tmp__7 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__3);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__7);
  if ((((signed int )llvm_cbe_tmp__3) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i64 [ %%25, %%24 ], [ 0, %%12  for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned long long )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%I64X",llvm_cbe_storemerge1);
printf("\n = 0x%I64X",llvm_cbe_tmp__13);
printf("\n = 0x%I64X",0ull);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = getelementptr inbounds i8* %%15, i64 %%storemerge1, !dbg !22 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_42_count);
  llvm_cbe_tmp__8 = ( char *)(&llvm_cbe_tmp__6[(((signed long long )llvm_cbe_storemerge1))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%I64X",((signed long long )llvm_cbe_storemerge1));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = trunc i64 %%storemerge1 to i32, !dbg !22 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_43_count);
  llvm_cbe_tmp__9 = (unsigned int )((unsigned int )llvm_cbe_storemerge1&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__9);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = sub i32 %%9, %%18, !dbg !22 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_44_count);
  llvm_cbe_tmp__10 = (unsigned int )((unsigned int )(llvm_cbe_tmp__3&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__9&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__10&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = call i32 @read(i32 %%fd, i8* %%17, i32 %%19) nounwind, !dbg !22 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_45_count);
  llvm_cbe_tmp__11 = (unsigned int )read(llvm_cbe_fd, ( char *)llvm_cbe_tmp__8, llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__10);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__11);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = sext i32 %%20 to i64, !dbg !22 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_46_count);
  llvm_cbe_tmp__12 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__11);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__12);
  if ((((signed int )llvm_cbe_tmp__11) > ((signed int )4294967295u))) {
    goto llvm_cbe_tmp__22;
  } else {
    goto llvm_cbe_tmp__23;
  }

llvm_cbe_tmp__22:
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = add nsw i64 %%21, %%storemerge1, !dbg !25 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_54_count);
  llvm_cbe_tmp__13 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__12&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_storemerge1&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", ((unsigned long long )(llvm_cbe_tmp__13&18446744073709551615ull)));
  if ((((signed long long )llvm_cbe_tmp__13) < ((signed long long )llvm_cbe_tmp__7))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__13;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

llvm_cbe_tmp__23:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([29 x i8]* @aesl_internal_.str8, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 48) nounwind, !dbg !26 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_52_count);
  _assert(( char *)((&aesl_internal__OC_str8[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 29
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 48u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",48u);
}
  goto llvm_cbe_tmp__22;

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = getelementptr inbounds i8* %%15, i64 %%16, !dbg !25 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_62_count);
  llvm_cbe_tmp__14 = ( char *)(&llvm_cbe_tmp__6[(((signed long long )llvm_cbe_tmp__7))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__7));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 0, i8* %%27, align 1, !dbg !25 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_63_count);
  *llvm_cbe_tmp__14 = ((unsigned char )0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )0));
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = call i32 @close(i32 %%fd) nounwind, !dbg !22 for 0x%I64xth hint within @readfile  --> \n", ++aesl_llvm_cbe_64_count);
  close(llvm_cbe_fd);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__15);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @readfile}\n");
  return llvm_cbe_tmp__6;
}


 char *find_section_start( char *llvm_cbe_s, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  unsigned int llvm_cbe_tmp__24;
  unsigned int llvm_cbe_tmp__24__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe__2e_rec_count = 0;
  unsigned long long llvm_cbe__2e_rec;
  unsigned long long llvm_cbe__2e_rec__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
   char *llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  unsigned char llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum4_count = 0;
  unsigned long long llvm_cbe__2e_sum4;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
   char *llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
  unsigned char llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum5_count = 0;
  unsigned long long llvm_cbe__2e_sum5;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
   char *llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  unsigned char llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  unsigned int llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  unsigned int llvm_cbe_tmp__32;
  unsigned int llvm_cbe_tmp__32__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe__2e_rec3_count = 0;
  unsigned long long llvm_cbe__2e_rec3;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_pr_count = 0;
  unsigned char llvm_cbe__2e_pr;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum_count = 0;
  unsigned long long llvm_cbe__2e_sum;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
   char *llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
   char *llvm_cbe_tmp__34;
   char *llvm_cbe_tmp__34__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @find_section_start\n");
  if ((((signed int )llvm_cbe_n) > ((signed int )4294967295u))) {
    goto llvm_cbe_tmp__35;
  } else {
    goto llvm_cbe__2e_thread;
  }

llvm_cbe__2e_thread:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([33 x i8]* @aesl_internal_.str10, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 59) nounwind, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_85_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str10[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 33
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 59u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",59u);
}
  goto llvm_cbe__2e_preheader;

llvm_cbe_tmp__35:
  if (((llvm_cbe_n&4294967295U) == (0u&4294967295U))) {
    llvm_cbe_tmp__34__PHI_TEMPORARY = ( char *)llvm_cbe_s;   /* for PHI node */
    goto llvm_cbe_tmp__36;
  } else {
    goto llvm_cbe__2e_preheader;
  }

llvm_cbe__2e_preheader:
  llvm_cbe_tmp__24__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe__2e_rec__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  goto llvm_cbe_tmp__37;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__37:
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = phi i32 [ %%23, %%22 ], [ 0, %%.preheader  for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_90_count);
  llvm_cbe_tmp__24 = (unsigned int )llvm_cbe_tmp__24__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__24);
printf("\n = 0x%X",llvm_cbe_tmp__32);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec = phi i64 [ %%.rec3, %%22 ], [ 0, %%.preheader  for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe__2e_rec_count);
  llvm_cbe__2e_rec = (unsigned long long )llvm_cbe__2e_rec__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.rec = 0x%I64X",llvm_cbe__2e_rec);
printf("\n.rec3 = 0x%I64X",llvm_cbe__2e_rec3);
printf("\n = 0x%I64X",0ull);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr i8* %%s, i64 %%.re for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_91_count);
  llvm_cbe_tmp__25 = ( char *)(&llvm_cbe_s[(((signed long long )llvm_cbe__2e_rec))]);
if (AESL_DEBUG_TRACE) {
printf("\n.rec = 0x%I64X",((signed long long )llvm_cbe__2e_rec));
}
  if ((((signed int )llvm_cbe_tmp__24) < ((signed int )llvm_cbe_n))) {
    goto llvm_cbe_tmp__38;
  } else {
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__39:
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = phi i32 [ %%5, %%13 ], [ %%5, %%11 ], [ %%., %%17  for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_111_count);
  llvm_cbe_tmp__32 = (unsigned int )llvm_cbe_tmp__32__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__32);
printf("\n = 0x%X",llvm_cbe_tmp__24);
printf("\n = 0x%X",llvm_cbe_tmp__24);
printf("\n. = 0x%X",llvm_cbe__2e_);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec3 = add i64 %%.rec, 1, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe__2e_rec3_count);
  llvm_cbe__2e_rec3 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.rec3 = 0x%I64X\n", ((unsigned long long )(llvm_cbe__2e_rec3&18446744073709551615ull)));
  llvm_cbe_tmp__24__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__32;   /* for PHI node */
  llvm_cbe__2e_rec__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_rec3;   /* for PHI node */
  goto llvm_cbe_tmp__37;

llvm_cbe_tmp__40:
  if (((llvm_cbe_tmp__26&255U) == (((unsigned char )37)&255U))) {
    goto llvm_cbe_tmp__41;
  } else {
    llvm_cbe_tmp__32__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__24;   /* for PHI node */
    goto llvm_cbe_tmp__39;
  }

llvm_cbe_tmp__38:
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = load i8* %%6, align 1, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_94_count);
  llvm_cbe_tmp__26 = (unsigned char )*llvm_cbe_tmp__25;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__26);
  if (((llvm_cbe_tmp__26&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__40;
  }

llvm_cbe_tmp__41:
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum4 = add i64 %%.rec, 1, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe__2e_sum4_count);
  llvm_cbe__2e_sum4 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum4 = 0x%I64X\n", ((unsigned long long )(llvm_cbe__2e_sum4&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = getelementptr inbounds i8* %%s, i64 %%.sum4, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_99_count);
  llvm_cbe_tmp__27 = ( char *)(&llvm_cbe_s[(((signed long long )llvm_cbe__2e_sum4))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum4 = 0x%I64X",((signed long long )llvm_cbe__2e_sum4));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = load i8* %%14, align 1, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_100_count);
  llvm_cbe_tmp__28 = (unsigned char )*llvm_cbe_tmp__27;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__28);
  if (((llvm_cbe_tmp__28&255U) == (((unsigned char )37)&255U))) {
    goto llvm_cbe_tmp__42;
  } else {
    llvm_cbe_tmp__32__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__24;   /* for PHI node */
    goto llvm_cbe_tmp__39;
  }

llvm_cbe_tmp__42:
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum5 = add i64 %%.rec, 2, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe__2e_sum5_count);
  llvm_cbe__2e_sum5 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull)) + ((unsigned long long )(2ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum5 = 0x%I64X\n", ((unsigned long long )(llvm_cbe__2e_sum5&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds i8* %%s, i64 %%.sum5, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_103_count);
  llvm_cbe_tmp__29 = ( char *)(&llvm_cbe_s[(((signed long long )llvm_cbe__2e_sum5))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum5 = 0x%I64X",((signed long long )llvm_cbe__2e_sum5));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = load i8* %%18, align 1, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_104_count);
  llvm_cbe_tmp__30 = (unsigned char )*llvm_cbe_tmp__29;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = add nsw i32 %%5, 1, !dbg !23 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_106_count);
  llvm_cbe_tmp__31 = (unsigned int )((unsigned int )(llvm_cbe_tmp__24&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__31&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%20, i32 %%21, i32 %%5, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )((((llvm_cbe_tmp__30&255U) == (((unsigned char )10)&255U))) ? ((unsigned int )llvm_cbe_tmp__31) : ((unsigned int )llvm_cbe_tmp__24));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
  llvm_cbe_tmp__32__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
  goto llvm_cbe_tmp__39;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%.pr = load i8* %%6, align 1, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe__2e_pr_count);
  llvm_cbe__2e_pr = (unsigned char )*llvm_cbe_tmp__25;
if (AESL_DEBUG_TRACE)
printf("\n.pr = 0x%X\n", llvm_cbe__2e_pr);
  if (((llvm_cbe__2e_pr&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__43;
  }

llvm_cbe_tmp__43:
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum = add i64 %%.rec, 2, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe__2e_sum_count);
  llvm_cbe__2e_sum = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull)) + ((unsigned long long )(2ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum = 0x%I64X\n", ((unsigned long long )(llvm_cbe__2e_sum&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = getelementptr inbounds i8* %%s, i64 %%.sum, !dbg !22 for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_115_count);
  llvm_cbe_tmp__33 = ( char *)(&llvm_cbe_s[(((signed long long )llvm_cbe__2e_sum))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum = 0x%I64X",((signed long long )llvm_cbe__2e_sum));
}
  llvm_cbe_tmp__34__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__33;   /* for PHI node */
  goto llvm_cbe_tmp__36;

llvm_cbe__2e_critedge_2e_thread:
  llvm_cbe_tmp__34__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__25;   /* for PHI node */
  goto llvm_cbe_tmp__36;

llvm_cbe_tmp__36:
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = phi i8* [ %%6, %%.critedge.thread ], [ %%26, %%25 ], [ %%s, %%2  for 0x%I64xth hint within @find_section_start  --> \n", ++aesl_llvm_cbe_118_count);
  llvm_cbe_tmp__34 = ( char *)llvm_cbe_tmp__34__PHI_TEMPORARY;
  if (AESL_DEBUG_TRACE)
      printf("\nEND @find_section_start}\n");
  return llvm_cbe_tmp__34;
}


signed int parse_string( char *llvm_cbe_s,  char *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  unsigned long long llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
   char *llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned int llvm_cbe_storemerge;
  unsigned int llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  unsigned long long llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
   char *llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  unsigned char llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  unsigned int llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  unsigned long long llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
   char *llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  unsigned char llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  unsigned int llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  unsigned long long llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
   char *llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  unsigned char llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  static  unsigned long long aesl_llvm_cbe_notlhs_count = 0;
  static  unsigned long long aesl_llvm_cbe_notrhs_count = 0;
  static  unsigned long long aesl_llvm_cbe_or_2e_cond_2e_not_count = 0;
  bool llvm_cbe_or_2e_cond_2e_not;
  static  unsigned long long aesl_llvm_cbe_phitmp_count = 0;
  static  unsigned long long aesl_llvm_cbe_or_2e_cond6_count = 0;
  bool llvm_cbe_or_2e_cond6;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
   char *llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
   char *llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @parse_string\n");
  if (((llvm_cbe_s) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__59;
  } else {
    goto llvm_cbe_tmp__60;
  }

llvm_cbe_tmp__59:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str12, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 79) nounwind, !dbg !21 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_138_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str12[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 79u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",79u);
}
  goto llvm_cbe_tmp__60;

llvm_cbe_tmp__60:
  if ((((signed int )llvm_cbe_n) < ((signed int )0u))) {
    llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_critedge3;
  } else {
    goto llvm_cbe__2e_thread;
  }

llvm_cbe__2e_thread:
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%n to i64, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_142_count);
  llvm_cbe_tmp__44 = (unsigned long long )((signed long long )(signed int )llvm_cbe_n);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__44);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = call i8* @memcpy(i8* %%arr, i8* %%s, i64 %%5 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_143_count);
  ( char *)memcpy(( char *)llvm_cbe_arr, ( char *)llvm_cbe_s, llvm_cbe_tmp__44);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%I64X",llvm_cbe_tmp__44);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__45);
}
  goto llvm_cbe_tmp__61;

  do {     /* Syntactic loop '.critedge3' to make GCC happy */
llvm_cbe__2e_critedge3:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i32 [ %%12, %%23 ], [ 0, %%3  for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned int )llvm_cbe_storemerge__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%X",llvm_cbe_storemerge);
printf("\n = 0x%X",llvm_cbe_tmp__49);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = sext i32 %%storemerge to i64, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_154_count);
  llvm_cbe_tmp__46 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__46);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = getelementptr inbounds i8* %%s, i64 %%7, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_155_count);
  llvm_cbe_tmp__47 = ( char *)(&llvm_cbe_s[(((signed long long )llvm_cbe_tmp__46))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__46));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = load i8* %%8, align 1, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_156_count);
  llvm_cbe_tmp__48 = (unsigned char )*llvm_cbe_tmp__47;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__48);
  if (((llvm_cbe_tmp__48&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__62;
  } else {
    goto llvm_cbe_tmp__63;
  }

llvm_cbe_tmp__64:
if (AESL_DEBUG_TRACE)
printf("\n  %%or.cond.not = or i1 %%notrhs, %%notlhs, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_or_2e_cond_2e_not_count);
  llvm_cbe_or_2e_cond_2e_not = (bool )((((llvm_cbe_tmp__52&255U) != (((unsigned char )37)&255U)) | ((llvm_cbe_tmp__48&255U) != (((unsigned char )10)&255U)))&1);
if (AESL_DEBUG_TRACE)
printf("\nor.cond.not = 0x%X\n", llvm_cbe_or_2e_cond_2e_not);
if (AESL_DEBUG_TRACE)
printf("\n  %%or.cond6 = or i1 %%or.cond.not, %%phitm for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_or_2e_cond6_count);
  llvm_cbe_or_2e_cond6 = (bool )((llvm_cbe_or_2e_cond_2e_not | ((llvm_cbe_tmp__56&255U) != (((unsigned char )37)&255U)))&1);
if (AESL_DEBUG_TRACE)
printf("\nor.cond6 = 0x%X\n", llvm_cbe_or_2e_cond6);
  if (llvm_cbe_or_2e_cond6) {
    llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__49;   /* for PHI node */
    goto llvm_cbe__2e_critedge3;
  } else {
    goto llvm_cbe_tmp__62;
  }

llvm_cbe_tmp__65:
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = add nsw i32 %%storemerge, 2, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_166_count);
  llvm_cbe_tmp__53 = (unsigned int )((unsigned int )(llvm_cbe_storemerge&4294967295ull)) + ((unsigned int )(2u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__53&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = sext i32 %%18 to i64, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_167_count);
  llvm_cbe_tmp__54 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__53);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = getelementptr inbounds i8* %%s, i64 %%19, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_168_count);
  llvm_cbe_tmp__55 = ( char *)(&llvm_cbe_s[(((signed long long )llvm_cbe_tmp__54))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__54));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = load i8* %%20, align 1, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_169_count);
  llvm_cbe_tmp__56 = (unsigned char )*llvm_cbe_tmp__55;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__56);
  if (((llvm_cbe_tmp__56&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__62;
  } else {
    goto llvm_cbe_tmp__64;
  }

llvm_cbe_tmp__63:
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = add nsw i32 %%storemerge, 1, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_159_count);
  llvm_cbe_tmp__49 = (unsigned int )((unsigned int )(llvm_cbe_storemerge&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__49&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = sext i32 %%12 to i64, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_161_count);
  llvm_cbe_tmp__50 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__49);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__50);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = getelementptr inbounds i8* %%s, i64 %%13, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_162_count);
  llvm_cbe_tmp__51 = ( char *)(&llvm_cbe_s[(((signed long long )llvm_cbe_tmp__50))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__50));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = load i8* %%14, align 1, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_163_count);
  llvm_cbe_tmp__52 = (unsigned char )*llvm_cbe_tmp__51;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__52);
  if (((llvm_cbe_tmp__52&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__62;
  } else {
    goto llvm_cbe_tmp__65;
  }

  } while (1); /* end of syntactic loop '.critedge3' */
llvm_cbe_tmp__62:
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = call i8* @memcpy(i8* %%arr, i8* %%s, i64 %%7 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_173_count);
  ( char *)memcpy(( char *)llvm_cbe_arr, ( char *)llvm_cbe_s, llvm_cbe_tmp__46);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%I64X",llvm_cbe_tmp__46);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__57);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = getelementptr inbounds i8* %%arr, i64 %%7, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_174_count);
  llvm_cbe_tmp__58 = ( char *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__46))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__46));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 0, i8* %%26, align 1, !dbg !22 for 0x%I64xth hint within @parse_string  --> \n", ++aesl_llvm_cbe_175_count);
  *llvm_cbe_tmp__58 = ((unsigned char )0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )0));
  goto llvm_cbe_tmp__61;

llvm_cbe_tmp__61:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @parse_string}\n");
  return 0u;
}


signed int parse_uint8_t_array( char *llvm_cbe_s,  char *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_endptr_count = 0;
   char *llvm_cbe_endptr;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
   char *llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  unsigned int llvm_cbe_tmp__67;
  unsigned int llvm_cbe_tmp__67__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
   char *llvm_cbe_storemerge;
   char *llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  unsigned int llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  unsigned char llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
   char *llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  unsigned char llvm_cbe_tmp__71;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__72;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__73;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  unsigned int llvm_cbe_tmp__74;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
  unsigned long long llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
   char *llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  unsigned int llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  unsigned long long llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
   char *llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
   char *llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  unsigned long long llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
   char *llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @parse_uint8_t_array\n");
  if (((llvm_cbe_s) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__83;
  } else {
    goto llvm_cbe_tmp__84;
  }

llvm_cbe_tmp__83:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str12, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 132) nounwind, !dbg !21 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_193_count);
  _assert(( char *)((&aesl_internal__OC_str12[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 132u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",132u);
}
  goto llvm_cbe_tmp__84;

llvm_cbe_tmp__84:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i8* @strtok(i8* %%s, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !21 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_195_count);
  llvm_cbe_tmp__66 = ( char *)( char *)strtok(( char *)llvm_cbe_s, ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__66);
}
  llvm_cbe_tmp__67__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__66;   /* for PHI node */
  goto llvm_cbe_tmp__85;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__85:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i32 [ 0, %%3 ], [ %%23, %%20  for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_198_count);
  llvm_cbe_tmp__67 = (unsigned int )llvm_cbe_tmp__67__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__67);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__77);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i8* [ %%4, %%3 ], [ %%26, %%20  for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = ( char *)llvm_cbe_storemerge__PHI_TEMPORARY;
  if (((llvm_cbe_storemerge) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__86;
  }

llvm_cbe_tmp__87:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = sext i32 %%6 to i64, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_236_count);
  llvm_cbe_tmp__75 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__67);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__75);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds i8* %%arr, i64 %%21, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_237_count);
  llvm_cbe_tmp__76 = ( char *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__75))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__75));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%12, i8* %%22, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_238_count);
  *llvm_cbe_tmp__76 = llvm_cbe_tmp__69;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__69);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = add nsw i32 %%6, 1, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_239_count);
  llvm_cbe_tmp__77 = (unsigned int )((unsigned int )(llvm_cbe_tmp__67&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__77&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_245_count);
  llvm_cbe_tmp__78 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__78);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds i8* %%storemerge, i64 %%24, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_246_count);
  llvm_cbe_tmp__79 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__78))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__78));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%25, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_247_count);
  *llvm_cbe_tmp__79 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_248_count);
  llvm_cbe_tmp__80 = ( char *)( char *)strtok(( char *)(( char *)/*NULL*/0), ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__80);
}
  llvm_cbe_tmp__67__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__77;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__80;   /* for PHI node */
  goto llvm_cbe_tmp__85;

llvm_cbe_tmp__88:
if (AESL_DEBUG_TRACE)
printf("\n  store i8* %%storemerge, i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_217_count);
  *(&llvm_cbe_endptr) = ( char *)llvm_cbe_storemerge;
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = call i32 @strtol(i8* %%storemerge, i8** %%endptr, i32 10) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_218_count);
  llvm_cbe_tmp__68 = (unsigned int )strtol(( char *)llvm_cbe_storemerge, ( char **)(&llvm_cbe_endptr), 10u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",10u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__68);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = trunc i32 %%11 to i8, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_219_count);
  llvm_cbe_tmp__69 = (unsigned char )((unsigned char )llvm_cbe_tmp__68&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__69);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_228_count);
  llvm_cbe_tmp__70 = ( char *)*(&llvm_cbe_endptr);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load i8* %%13, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_229_count);
  llvm_cbe_tmp__71 = (unsigned char )*llvm_cbe_tmp__70;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__71);
  if (((llvm_cbe_tmp__71&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__87;
  } else {
    goto llvm_cbe_tmp__89;
  }

llvm_cbe_tmp__86:
  if ((((signed int )llvm_cbe_tmp__67) < ((signed int )llvm_cbe_n))) {
    goto llvm_cbe_tmp__88;
  } else {
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__89:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = call %%struct._iobuf* @__iob_func() nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_232_count);
  llvm_cbe_tmp__72 = (l_struct_OC__iobuf *)__iob_func();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__72);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds %%struct._iobuf* %%17, i64 2, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_233_count);
  llvm_cbe_tmp__73 = (l_struct_OC__iobuf *)(&llvm_cbe_tmp__72[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%18, i8* getelementptr inbounds ([35 x i8]* @aesl_internal_.str14, i64 0, i64 0), i32 %%6) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_234_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__73, ( char *)((&aesl_internal__OC_str14[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 35
#endif
])), llvm_cbe_tmp__67);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__67);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__74);
}
  goto llvm_cbe_tmp__87;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_251_count);
  llvm_cbe_tmp__81 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__81);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = getelementptr inbounds i8* %%storemerge, i64 %%27, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_252_count);
  llvm_cbe_tmp__82 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__81))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__81));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%28, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint8_t_array  --> \n", ++aesl_llvm_cbe_253_count);
  *llvm_cbe_tmp__82 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
  goto llvm_cbe__2e_critedge_2e_thread;

llvm_cbe__2e_critedge_2e_thread:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @parse_uint8_t_array}\n");
  return 0u;
}


signed int parse_uint16_t_array( char *llvm_cbe_s, signed short *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_endptr_count = 0;
   char *llvm_cbe_endptr;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
   char *llvm_cbe_tmp__90;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  static  unsigned long long aesl_llvm_cbe_276_count = 0;
  unsigned int llvm_cbe_tmp__91;
  unsigned int llvm_cbe_tmp__91__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
   char *llvm_cbe_storemerge;
   char *llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_277_count = 0;
  static  unsigned long long aesl_llvm_cbe_278_count = 0;
  static  unsigned long long aesl_llvm_cbe_279_count = 0;
  static  unsigned long long aesl_llvm_cbe_280_count = 0;
  static  unsigned long long aesl_llvm_cbe_281_count = 0;
  static  unsigned long long aesl_llvm_cbe_282_count = 0;
  static  unsigned long long aesl_llvm_cbe_283_count = 0;
  static  unsigned long long aesl_llvm_cbe_284_count = 0;
  static  unsigned long long aesl_llvm_cbe_285_count = 0;
  static  unsigned long long aesl_llvm_cbe_286_count = 0;
  static  unsigned long long aesl_llvm_cbe_287_count = 0;
  static  unsigned long long aesl_llvm_cbe_288_count = 0;
  static  unsigned long long aesl_llvm_cbe_289_count = 0;
  static  unsigned long long aesl_llvm_cbe_290_count = 0;
  static  unsigned long long aesl_llvm_cbe_291_count = 0;
  static  unsigned long long aesl_llvm_cbe_292_count = 0;
  static  unsigned long long aesl_llvm_cbe_293_count = 0;
  static  unsigned long long aesl_llvm_cbe_294_count = 0;
  static  unsigned long long aesl_llvm_cbe_295_count = 0;
  static  unsigned long long aesl_llvm_cbe_296_count = 0;
  unsigned int llvm_cbe_tmp__92;
  static  unsigned long long aesl_llvm_cbe_297_count = 0;
  unsigned short llvm_cbe_tmp__93;
  static  unsigned long long aesl_llvm_cbe_298_count = 0;
  static  unsigned long long aesl_llvm_cbe_299_count = 0;
  static  unsigned long long aesl_llvm_cbe_300_count = 0;
  static  unsigned long long aesl_llvm_cbe_301_count = 0;
  static  unsigned long long aesl_llvm_cbe_302_count = 0;
  static  unsigned long long aesl_llvm_cbe_303_count = 0;
  static  unsigned long long aesl_llvm_cbe_304_count = 0;
  static  unsigned long long aesl_llvm_cbe_305_count = 0;
  static  unsigned long long aesl_llvm_cbe_306_count = 0;
   char *llvm_cbe_tmp__94;
  static  unsigned long long aesl_llvm_cbe_307_count = 0;
  unsigned char llvm_cbe_tmp__95;
  static  unsigned long long aesl_llvm_cbe_308_count = 0;
  static  unsigned long long aesl_llvm_cbe_309_count = 0;
  static  unsigned long long aesl_llvm_cbe_310_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__96;
  static  unsigned long long aesl_llvm_cbe_311_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__97;
  static  unsigned long long aesl_llvm_cbe_312_count = 0;
  unsigned int llvm_cbe_tmp__98;
  static  unsigned long long aesl_llvm_cbe_313_count = 0;
  static  unsigned long long aesl_llvm_cbe_314_count = 0;
  unsigned long long llvm_cbe_tmp__99;
  static  unsigned long long aesl_llvm_cbe_315_count = 0;
  signed short *llvm_cbe_tmp__100;
  static  unsigned long long aesl_llvm_cbe_316_count = 0;
  static  unsigned long long aesl_llvm_cbe_317_count = 0;
  unsigned int llvm_cbe_tmp__101;
  static  unsigned long long aesl_llvm_cbe_318_count = 0;
  static  unsigned long long aesl_llvm_cbe_319_count = 0;
  static  unsigned long long aesl_llvm_cbe_320_count = 0;
  static  unsigned long long aesl_llvm_cbe_321_count = 0;
  static  unsigned long long aesl_llvm_cbe_322_count = 0;
  static  unsigned long long aesl_llvm_cbe_323_count = 0;
  unsigned long long llvm_cbe_tmp__102;
  static  unsigned long long aesl_llvm_cbe_324_count = 0;
   char *llvm_cbe_tmp__103;
  static  unsigned long long aesl_llvm_cbe_325_count = 0;
  static  unsigned long long aesl_llvm_cbe_326_count = 0;
   char *llvm_cbe_tmp__104;
  static  unsigned long long aesl_llvm_cbe_327_count = 0;
  static  unsigned long long aesl_llvm_cbe_328_count = 0;
  static  unsigned long long aesl_llvm_cbe_329_count = 0;
  unsigned long long llvm_cbe_tmp__105;
  static  unsigned long long aesl_llvm_cbe_330_count = 0;
   char *llvm_cbe_tmp__106;
  static  unsigned long long aesl_llvm_cbe_331_count = 0;
  static  unsigned long long aesl_llvm_cbe_332_count = 0;
  static  unsigned long long aesl_llvm_cbe_333_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @parse_uint16_t_array\n");
  if (((llvm_cbe_s) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__107;
  } else {
    goto llvm_cbe_tmp__108;
  }

llvm_cbe_tmp__107:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str12, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 133) nounwind, !dbg !21 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_271_count);
  _assert(( char *)((&aesl_internal__OC_str12[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 133u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",133u);
}
  goto llvm_cbe_tmp__108;

llvm_cbe_tmp__108:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i8* @strtok(i8* %%s, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !21 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_273_count);
  llvm_cbe_tmp__90 = ( char *)( char *)strtok(( char *)llvm_cbe_s, ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__90);
}
  llvm_cbe_tmp__91__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__90;   /* for PHI node */
  goto llvm_cbe_tmp__109;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__109:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i32 [ 0, %%3 ], [ %%23, %%20  for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_276_count);
  llvm_cbe_tmp__91 = (unsigned int )llvm_cbe_tmp__91__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__91);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__101);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i8* [ %%4, %%3 ], [ %%26, %%20  for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = ( char *)llvm_cbe_storemerge__PHI_TEMPORARY;
  if (((llvm_cbe_storemerge) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__110;
  }

llvm_cbe_tmp__111:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = sext i32 %%6 to i64, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_314_count);
  llvm_cbe_tmp__99 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__91);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__99);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds i16* %%arr, i64 %%21, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_315_count);
  llvm_cbe_tmp__100 = (signed short *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__99))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__99));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i16 %%12, i16* %%22, align 2, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_316_count);
  *llvm_cbe_tmp__100 = llvm_cbe_tmp__93;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__93);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = add nsw i32 %%6, 1, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_317_count);
  llvm_cbe_tmp__101 = (unsigned int )((unsigned int )(llvm_cbe_tmp__91&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__101&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_323_count);
  llvm_cbe_tmp__102 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__102);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds i8* %%storemerge, i64 %%24, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_324_count);
  llvm_cbe_tmp__103 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__102))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__102));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%25, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_325_count);
  *llvm_cbe_tmp__103 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_326_count);
  llvm_cbe_tmp__104 = ( char *)( char *)strtok(( char *)(( char *)/*NULL*/0), ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__104);
}
  llvm_cbe_tmp__91__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__101;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__104;   /* for PHI node */
  goto llvm_cbe_tmp__109;

llvm_cbe_tmp__112:
if (AESL_DEBUG_TRACE)
printf("\n  store i8* %%storemerge, i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_295_count);
  *(&llvm_cbe_endptr) = ( char *)llvm_cbe_storemerge;
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = call i32 @strtol(i8* %%storemerge, i8** %%endptr, i32 10) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_296_count);
  llvm_cbe_tmp__92 = (unsigned int )strtol(( char *)llvm_cbe_storemerge, ( char **)(&llvm_cbe_endptr), 10u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",10u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__92);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = trunc i32 %%11 to i16, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_297_count);
  llvm_cbe_tmp__93 = (unsigned short )((unsigned short )llvm_cbe_tmp__92&65535U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__93);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_306_count);
  llvm_cbe_tmp__94 = ( char *)*(&llvm_cbe_endptr);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load i8* %%13, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_307_count);
  llvm_cbe_tmp__95 = (unsigned char )*llvm_cbe_tmp__94;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__95);
  if (((llvm_cbe_tmp__95&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__111;
  } else {
    goto llvm_cbe_tmp__113;
  }

llvm_cbe_tmp__110:
  if ((((signed int )llvm_cbe_tmp__91) < ((signed int )llvm_cbe_n))) {
    goto llvm_cbe_tmp__112;
  } else {
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__113:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = call %%struct._iobuf* @__iob_func() nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_310_count);
  llvm_cbe_tmp__96 = (l_struct_OC__iobuf *)__iob_func();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__96);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds %%struct._iobuf* %%17, i64 2, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_311_count);
  llvm_cbe_tmp__97 = (l_struct_OC__iobuf *)(&llvm_cbe_tmp__96[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%18, i8* getelementptr inbounds ([35 x i8]* @aesl_internal_.str14, i64 0, i64 0), i32 %%6) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_312_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__97, ( char *)((&aesl_internal__OC_str14[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 35
#endif
])), llvm_cbe_tmp__91);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__91);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__98);
}
  goto llvm_cbe_tmp__111;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_329_count);
  llvm_cbe_tmp__105 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__105);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = getelementptr inbounds i8* %%storemerge, i64 %%27, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_330_count);
  llvm_cbe_tmp__106 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__105))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__105));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%28, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint16_t_array  --> \n", ++aesl_llvm_cbe_331_count);
  *llvm_cbe_tmp__106 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
  goto llvm_cbe__2e_critedge_2e_thread;

llvm_cbe__2e_critedge_2e_thread:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @parse_uint16_t_array}\n");
  return 0u;
}


signed int parse_uint32_t_array( char *llvm_cbe_s, signed int *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_endptr_count = 0;
   char *llvm_cbe_endptr;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_334_count = 0;
  static  unsigned long long aesl_llvm_cbe_335_count = 0;
  static  unsigned long long aesl_llvm_cbe_336_count = 0;
  static  unsigned long long aesl_llvm_cbe_337_count = 0;
  static  unsigned long long aesl_llvm_cbe_338_count = 0;
  static  unsigned long long aesl_llvm_cbe_339_count = 0;
  static  unsigned long long aesl_llvm_cbe_340_count = 0;
  static  unsigned long long aesl_llvm_cbe_341_count = 0;
  static  unsigned long long aesl_llvm_cbe_342_count = 0;
  static  unsigned long long aesl_llvm_cbe_343_count = 0;
  static  unsigned long long aesl_llvm_cbe_344_count = 0;
  static  unsigned long long aesl_llvm_cbe_345_count = 0;
  static  unsigned long long aesl_llvm_cbe_346_count = 0;
  static  unsigned long long aesl_llvm_cbe_347_count = 0;
  static  unsigned long long aesl_llvm_cbe_348_count = 0;
  static  unsigned long long aesl_llvm_cbe_349_count = 0;
  static  unsigned long long aesl_llvm_cbe_350_count = 0;
  static  unsigned long long aesl_llvm_cbe_351_count = 0;
   char *llvm_cbe_tmp__114;
  static  unsigned long long aesl_llvm_cbe_352_count = 0;
  static  unsigned long long aesl_llvm_cbe_353_count = 0;
  static  unsigned long long aesl_llvm_cbe_354_count = 0;
  unsigned int llvm_cbe_tmp__115;
  unsigned int llvm_cbe_tmp__115__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
   char *llvm_cbe_storemerge;
   char *llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_355_count = 0;
  static  unsigned long long aesl_llvm_cbe_356_count = 0;
  static  unsigned long long aesl_llvm_cbe_357_count = 0;
  static  unsigned long long aesl_llvm_cbe_358_count = 0;
  static  unsigned long long aesl_llvm_cbe_359_count = 0;
  static  unsigned long long aesl_llvm_cbe_360_count = 0;
  static  unsigned long long aesl_llvm_cbe_361_count = 0;
  static  unsigned long long aesl_llvm_cbe_362_count = 0;
  static  unsigned long long aesl_llvm_cbe_363_count = 0;
  static  unsigned long long aesl_llvm_cbe_364_count = 0;
  static  unsigned long long aesl_llvm_cbe_365_count = 0;
  static  unsigned long long aesl_llvm_cbe_366_count = 0;
  static  unsigned long long aesl_llvm_cbe_367_count = 0;
  static  unsigned long long aesl_llvm_cbe_368_count = 0;
  static  unsigned long long aesl_llvm_cbe_369_count = 0;
  static  unsigned long long aesl_llvm_cbe_370_count = 0;
  static  unsigned long long aesl_llvm_cbe_371_count = 0;
  static  unsigned long long aesl_llvm_cbe_372_count = 0;
  static  unsigned long long aesl_llvm_cbe_373_count = 0;
  static  unsigned long long aesl_llvm_cbe_374_count = 0;
  unsigned int llvm_cbe_tmp__116;
  static  unsigned long long aesl_llvm_cbe_375_count = 0;
  static  unsigned long long aesl_llvm_cbe_376_count = 0;
  static  unsigned long long aesl_llvm_cbe_377_count = 0;
  static  unsigned long long aesl_llvm_cbe_378_count = 0;
  static  unsigned long long aesl_llvm_cbe_379_count = 0;
  static  unsigned long long aesl_llvm_cbe_380_count = 0;
  static  unsigned long long aesl_llvm_cbe_381_count = 0;
  static  unsigned long long aesl_llvm_cbe_382_count = 0;
  static  unsigned long long aesl_llvm_cbe_383_count = 0;
   char *llvm_cbe_tmp__117;
  static  unsigned long long aesl_llvm_cbe_384_count = 0;
  unsigned char llvm_cbe_tmp__118;
  static  unsigned long long aesl_llvm_cbe_385_count = 0;
  static  unsigned long long aesl_llvm_cbe_386_count = 0;
  static  unsigned long long aesl_llvm_cbe_387_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__119;
  static  unsigned long long aesl_llvm_cbe_388_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__120;
  static  unsigned long long aesl_llvm_cbe_389_count = 0;
  unsigned int llvm_cbe_tmp__121;
  static  unsigned long long aesl_llvm_cbe_390_count = 0;
  static  unsigned long long aesl_llvm_cbe_391_count = 0;
  unsigned long long llvm_cbe_tmp__122;
  static  unsigned long long aesl_llvm_cbe_392_count = 0;
  signed int *llvm_cbe_tmp__123;
  static  unsigned long long aesl_llvm_cbe_393_count = 0;
  static  unsigned long long aesl_llvm_cbe_394_count = 0;
  unsigned int llvm_cbe_tmp__124;
  static  unsigned long long aesl_llvm_cbe_395_count = 0;
  static  unsigned long long aesl_llvm_cbe_396_count = 0;
  static  unsigned long long aesl_llvm_cbe_397_count = 0;
  static  unsigned long long aesl_llvm_cbe_398_count = 0;
  static  unsigned long long aesl_llvm_cbe_399_count = 0;
  static  unsigned long long aesl_llvm_cbe_400_count = 0;
  unsigned long long llvm_cbe_tmp__125;
  static  unsigned long long aesl_llvm_cbe_401_count = 0;
   char *llvm_cbe_tmp__126;
  static  unsigned long long aesl_llvm_cbe_402_count = 0;
  static  unsigned long long aesl_llvm_cbe_403_count = 0;
   char *llvm_cbe_tmp__127;
  static  unsigned long long aesl_llvm_cbe_404_count = 0;
  static  unsigned long long aesl_llvm_cbe_405_count = 0;
  static  unsigned long long aesl_llvm_cbe_406_count = 0;
  unsigned long long llvm_cbe_tmp__128;
  static  unsigned long long aesl_llvm_cbe_407_count = 0;
   char *llvm_cbe_tmp__129;
  static  unsigned long long aesl_llvm_cbe_408_count = 0;
  static  unsigned long long aesl_llvm_cbe_409_count = 0;
  static  unsigned long long aesl_llvm_cbe_410_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @parse_uint32_t_array\n");
  if (((llvm_cbe_s) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__130;
  } else {
    goto llvm_cbe_tmp__131;
  }

llvm_cbe_tmp__130:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str12, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 134) nounwind, !dbg !21 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_349_count);
  _assert(( char *)((&aesl_internal__OC_str12[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 134u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",134u);
}
  goto llvm_cbe_tmp__131;

llvm_cbe_tmp__131:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i8* @strtok(i8* %%s, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !21 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_351_count);
  llvm_cbe_tmp__114 = ( char *)( char *)strtok(( char *)llvm_cbe_s, ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__114);
}
  llvm_cbe_tmp__115__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__114;   /* for PHI node */
  goto llvm_cbe_tmp__132;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__132:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i32 [ 0, %%3 ], [ %%22, %%19  for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_354_count);
  llvm_cbe_tmp__115 = (unsigned int )llvm_cbe_tmp__115__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__115);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__124);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i8* [ %%4, %%3 ], [ %%25, %%19  for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = ( char *)llvm_cbe_storemerge__PHI_TEMPORARY;
  if (((llvm_cbe_storemerge) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__133;
  }

llvm_cbe_tmp__134:
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = sext i32 %%6 to i64, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_391_count);
  llvm_cbe_tmp__122 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__115);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__122);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds i32* %%arr, i64 %%20, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_392_count);
  llvm_cbe_tmp__123 = (signed int *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__122))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__122));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%11, i32* %%21, align 4, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_393_count);
  *llvm_cbe_tmp__123 = llvm_cbe_tmp__116;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__116);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = add nsw i32 %%6, 1, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_394_count);
  llvm_cbe_tmp__124 = (unsigned int )((unsigned int )(llvm_cbe_tmp__115&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__124&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_400_count);
  llvm_cbe_tmp__125 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__125);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = getelementptr inbounds i8* %%storemerge, i64 %%23, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_401_count);
  llvm_cbe_tmp__126 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__125))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__125));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%24, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_402_count);
  *llvm_cbe_tmp__126 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_403_count);
  llvm_cbe_tmp__127 = ( char *)( char *)strtok(( char *)(( char *)/*NULL*/0), ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__127);
}
  llvm_cbe_tmp__115__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__124;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__127;   /* for PHI node */
  goto llvm_cbe_tmp__132;

llvm_cbe_tmp__135:
if (AESL_DEBUG_TRACE)
printf("\n  store i8* %%storemerge, i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_373_count);
  *(&llvm_cbe_endptr) = ( char *)llvm_cbe_storemerge;
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = call i32 @strtol(i8* %%storemerge, i8** %%endptr, i32 10) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_374_count);
  llvm_cbe_tmp__116 = (unsigned int )strtol(( char *)llvm_cbe_storemerge, ( char **)(&llvm_cbe_endptr), 10u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",10u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__116);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_383_count);
  llvm_cbe_tmp__117 = ( char *)*(&llvm_cbe_endptr);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8* %%12, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_384_count);
  llvm_cbe_tmp__118 = (unsigned char )*llvm_cbe_tmp__117;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__118);
  if (((llvm_cbe_tmp__118&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__134;
  } else {
    goto llvm_cbe_tmp__136;
  }

llvm_cbe_tmp__133:
  if ((((signed int )llvm_cbe_tmp__115) < ((signed int )llvm_cbe_n))) {
    goto llvm_cbe_tmp__135;
  } else {
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__136:
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = call %%struct._iobuf* @__iob_func() nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_387_count);
  llvm_cbe_tmp__119 = (l_struct_OC__iobuf *)__iob_func();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__119);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = getelementptr inbounds %%struct._iobuf* %%16, i64 2, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_388_count);
  llvm_cbe_tmp__120 = (l_struct_OC__iobuf *)(&llvm_cbe_tmp__119[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%17, i8* getelementptr inbounds ([35 x i8]* @aesl_internal_.str14, i64 0, i64 0), i32 %%6) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_389_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__120, ( char *)((&aesl_internal__OC_str14[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 35
#endif
])), llvm_cbe_tmp__115);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__115);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__121);
}
  goto llvm_cbe_tmp__134;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_406_count);
  llvm_cbe_tmp__128 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__128);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = getelementptr inbounds i8* %%storemerge, i64 %%26, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_407_count);
  llvm_cbe_tmp__129 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__128))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__128));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%27, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint32_t_array  --> \n", ++aesl_llvm_cbe_408_count);
  *llvm_cbe_tmp__129 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
  goto llvm_cbe__2e_critedge_2e_thread;

llvm_cbe__2e_critedge_2e_thread:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @parse_uint32_t_array}\n");
  return 0u;
}


signed int parse_uint64_t_array( char *llvm_cbe_s, signed long long *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_endptr_count = 0;
   char *llvm_cbe_endptr;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_411_count = 0;
  static  unsigned long long aesl_llvm_cbe_412_count = 0;
  static  unsigned long long aesl_llvm_cbe_413_count = 0;
  static  unsigned long long aesl_llvm_cbe_414_count = 0;
  static  unsigned long long aesl_llvm_cbe_415_count = 0;
  static  unsigned long long aesl_llvm_cbe_416_count = 0;
  static  unsigned long long aesl_llvm_cbe_417_count = 0;
  static  unsigned long long aesl_llvm_cbe_418_count = 0;
  static  unsigned long long aesl_llvm_cbe_419_count = 0;
  static  unsigned long long aesl_llvm_cbe_420_count = 0;
  static  unsigned long long aesl_llvm_cbe_421_count = 0;
  static  unsigned long long aesl_llvm_cbe_422_count = 0;
  static  unsigned long long aesl_llvm_cbe_423_count = 0;
  static  unsigned long long aesl_llvm_cbe_424_count = 0;
  static  unsigned long long aesl_llvm_cbe_425_count = 0;
  static  unsigned long long aesl_llvm_cbe_426_count = 0;
  static  unsigned long long aesl_llvm_cbe_427_count = 0;
  static  unsigned long long aesl_llvm_cbe_428_count = 0;
   char *llvm_cbe_tmp__137;
  static  unsigned long long aesl_llvm_cbe_429_count = 0;
  static  unsigned long long aesl_llvm_cbe_430_count = 0;
  static  unsigned long long aesl_llvm_cbe_431_count = 0;
  unsigned int llvm_cbe_tmp__138;
  unsigned int llvm_cbe_tmp__138__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
   char *llvm_cbe_storemerge;
   char *llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_432_count = 0;
  static  unsigned long long aesl_llvm_cbe_433_count = 0;
  static  unsigned long long aesl_llvm_cbe_434_count = 0;
  static  unsigned long long aesl_llvm_cbe_435_count = 0;
  static  unsigned long long aesl_llvm_cbe_436_count = 0;
  static  unsigned long long aesl_llvm_cbe_437_count = 0;
  static  unsigned long long aesl_llvm_cbe_438_count = 0;
  static  unsigned long long aesl_llvm_cbe_439_count = 0;
  static  unsigned long long aesl_llvm_cbe_440_count = 0;
  static  unsigned long long aesl_llvm_cbe_441_count = 0;
  static  unsigned long long aesl_llvm_cbe_442_count = 0;
  static  unsigned long long aesl_llvm_cbe_443_count = 0;
  static  unsigned long long aesl_llvm_cbe_444_count = 0;
  static  unsigned long long aesl_llvm_cbe_445_count = 0;
  static  unsigned long long aesl_llvm_cbe_446_count = 0;
  static  unsigned long long aesl_llvm_cbe_447_count = 0;
  static  unsigned long long aesl_llvm_cbe_448_count = 0;
  static  unsigned long long aesl_llvm_cbe_449_count = 0;
  static  unsigned long long aesl_llvm_cbe_450_count = 0;
  static  unsigned long long aesl_llvm_cbe_451_count = 0;
  unsigned int llvm_cbe_tmp__139;
  static  unsigned long long aesl_llvm_cbe_452_count = 0;
  unsigned long long llvm_cbe_tmp__140;
  static  unsigned long long aesl_llvm_cbe_453_count = 0;
  static  unsigned long long aesl_llvm_cbe_454_count = 0;
  static  unsigned long long aesl_llvm_cbe_455_count = 0;
  static  unsigned long long aesl_llvm_cbe_456_count = 0;
  static  unsigned long long aesl_llvm_cbe_457_count = 0;
  static  unsigned long long aesl_llvm_cbe_458_count = 0;
  static  unsigned long long aesl_llvm_cbe_459_count = 0;
  static  unsigned long long aesl_llvm_cbe_460_count = 0;
  static  unsigned long long aesl_llvm_cbe_461_count = 0;
   char *llvm_cbe_tmp__141;
  static  unsigned long long aesl_llvm_cbe_462_count = 0;
  unsigned char llvm_cbe_tmp__142;
  static  unsigned long long aesl_llvm_cbe_463_count = 0;
  static  unsigned long long aesl_llvm_cbe_464_count = 0;
  static  unsigned long long aesl_llvm_cbe_465_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__143;
  static  unsigned long long aesl_llvm_cbe_466_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__144;
  static  unsigned long long aesl_llvm_cbe_467_count = 0;
  unsigned int llvm_cbe_tmp__145;
  static  unsigned long long aesl_llvm_cbe_468_count = 0;
  static  unsigned long long aesl_llvm_cbe_469_count = 0;
  unsigned long long llvm_cbe_tmp__146;
  static  unsigned long long aesl_llvm_cbe_470_count = 0;
  signed long long *llvm_cbe_tmp__147;
  static  unsigned long long aesl_llvm_cbe_471_count = 0;
  static  unsigned long long aesl_llvm_cbe_472_count = 0;
  unsigned int llvm_cbe_tmp__148;
  static  unsigned long long aesl_llvm_cbe_473_count = 0;
  static  unsigned long long aesl_llvm_cbe_474_count = 0;
  static  unsigned long long aesl_llvm_cbe_475_count = 0;
  static  unsigned long long aesl_llvm_cbe_476_count = 0;
  static  unsigned long long aesl_llvm_cbe_477_count = 0;
  static  unsigned long long aesl_llvm_cbe_478_count = 0;
  unsigned long long llvm_cbe_tmp__149;
  static  unsigned long long aesl_llvm_cbe_479_count = 0;
   char *llvm_cbe_tmp__150;
  static  unsigned long long aesl_llvm_cbe_480_count = 0;
  static  unsigned long long aesl_llvm_cbe_481_count = 0;
   char *llvm_cbe_tmp__151;
  static  unsigned long long aesl_llvm_cbe_482_count = 0;
  static  unsigned long long aesl_llvm_cbe_483_count = 0;
  static  unsigned long long aesl_llvm_cbe_484_count = 0;
  unsigned long long llvm_cbe_tmp__152;
  static  unsigned long long aesl_llvm_cbe_485_count = 0;
   char *llvm_cbe_tmp__153;
  static  unsigned long long aesl_llvm_cbe_486_count = 0;
  static  unsigned long long aesl_llvm_cbe_487_count = 0;
  static  unsigned long long aesl_llvm_cbe_488_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @parse_uint64_t_array\n");
  if (((llvm_cbe_s) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__154;
  } else {
    goto llvm_cbe_tmp__155;
  }

llvm_cbe_tmp__154:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str12, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 135) nounwind, !dbg !21 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_426_count);
  _assert(( char *)((&aesl_internal__OC_str12[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 135u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",135u);
}
  goto llvm_cbe_tmp__155;

llvm_cbe_tmp__155:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i8* @strtok(i8* %%s, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !21 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_428_count);
  llvm_cbe_tmp__137 = ( char *)( char *)strtok(( char *)llvm_cbe_s, ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__137);
}
  llvm_cbe_tmp__138__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__137;   /* for PHI node */
  goto llvm_cbe_tmp__156;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__156:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i32 [ 0, %%3 ], [ %%23, %%20  for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_431_count);
  llvm_cbe_tmp__138 = (unsigned int )llvm_cbe_tmp__138__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__138);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__148);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i8* [ %%4, %%3 ], [ %%26, %%20  for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = ( char *)llvm_cbe_storemerge__PHI_TEMPORARY;
  if (((llvm_cbe_storemerge) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__157;
  }

llvm_cbe_tmp__158:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = sext i32 %%6 to i64, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_469_count);
  llvm_cbe_tmp__146 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__138);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__146);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds i64* %%arr, i64 %%21, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_470_count);
  llvm_cbe_tmp__147 = (signed long long *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__146))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__146));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%12, i64* %%22, align 8, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_471_count);
  *llvm_cbe_tmp__147 = llvm_cbe_tmp__140;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__140);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = add nsw i32 %%6, 1, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_472_count);
  llvm_cbe_tmp__148 = (unsigned int )((unsigned int )(llvm_cbe_tmp__138&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__148&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_478_count);
  llvm_cbe_tmp__149 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__149);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds i8* %%storemerge, i64 %%24, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_479_count);
  llvm_cbe_tmp__150 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__149))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__149));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%25, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_480_count);
  *llvm_cbe_tmp__150 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_481_count);
  llvm_cbe_tmp__151 = ( char *)( char *)strtok(( char *)(( char *)/*NULL*/0), ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__151);
}
  llvm_cbe_tmp__138__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__148;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__151;   /* for PHI node */
  goto llvm_cbe_tmp__156;

llvm_cbe_tmp__159:
if (AESL_DEBUG_TRACE)
printf("\n  store i8* %%storemerge, i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_450_count);
  *(&llvm_cbe_endptr) = ( char *)llvm_cbe_storemerge;
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = call i32 @strtol(i8* %%storemerge, i8** %%endptr, i32 10) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_451_count);
  llvm_cbe_tmp__139 = (unsigned int )strtol(( char *)llvm_cbe_storemerge, ( char **)(&llvm_cbe_endptr), 10u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",10u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__139);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = sext i32 %%11 to i64, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_452_count);
  llvm_cbe_tmp__140 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__139);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__140);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_461_count);
  llvm_cbe_tmp__141 = ( char *)*(&llvm_cbe_endptr);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load i8* %%13, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_462_count);
  llvm_cbe_tmp__142 = (unsigned char )*llvm_cbe_tmp__141;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__142);
  if (((llvm_cbe_tmp__142&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__158;
  } else {
    goto llvm_cbe_tmp__160;
  }

llvm_cbe_tmp__157:
  if ((((signed int )llvm_cbe_tmp__138) < ((signed int )llvm_cbe_n))) {
    goto llvm_cbe_tmp__159;
  } else {
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__160:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = call %%struct._iobuf* @__iob_func() nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_465_count);
  llvm_cbe_tmp__143 = (l_struct_OC__iobuf *)__iob_func();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__143);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds %%struct._iobuf* %%17, i64 2, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_466_count);
  llvm_cbe_tmp__144 = (l_struct_OC__iobuf *)(&llvm_cbe_tmp__143[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%18, i8* getelementptr inbounds ([35 x i8]* @aesl_internal_.str14, i64 0, i64 0), i32 %%6) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_467_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__144, ( char *)((&aesl_internal__OC_str14[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 35
#endif
])), llvm_cbe_tmp__138);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__138);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__145);
}
  goto llvm_cbe_tmp__158;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_484_count);
  llvm_cbe_tmp__152 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__152);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = getelementptr inbounds i8* %%storemerge, i64 %%27, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_485_count);
  llvm_cbe_tmp__153 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__152))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__152));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%28, align 1, !dbg !22 for 0x%I64xth hint within @parse_uint64_t_array  --> \n", ++aesl_llvm_cbe_486_count);
  *llvm_cbe_tmp__153 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
  goto llvm_cbe__2e_critedge_2e_thread;

llvm_cbe__2e_critedge_2e_thread:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @parse_uint64_t_array}\n");
  return 0u;
}


signed int parse_int8_t_array( char *llvm_cbe_s,  char *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_endptr_count = 0;
   char *llvm_cbe_endptr;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_489_count = 0;
  static  unsigned long long aesl_llvm_cbe_490_count = 0;
  static  unsigned long long aesl_llvm_cbe_491_count = 0;
  static  unsigned long long aesl_llvm_cbe_492_count = 0;
  static  unsigned long long aesl_llvm_cbe_493_count = 0;
  static  unsigned long long aesl_llvm_cbe_494_count = 0;
  static  unsigned long long aesl_llvm_cbe_495_count = 0;
  static  unsigned long long aesl_llvm_cbe_496_count = 0;
  static  unsigned long long aesl_llvm_cbe_497_count = 0;
  static  unsigned long long aesl_llvm_cbe_498_count = 0;
  static  unsigned long long aesl_llvm_cbe_499_count = 0;
  static  unsigned long long aesl_llvm_cbe_500_count = 0;
  static  unsigned long long aesl_llvm_cbe_501_count = 0;
  static  unsigned long long aesl_llvm_cbe_502_count = 0;
  static  unsigned long long aesl_llvm_cbe_503_count = 0;
  static  unsigned long long aesl_llvm_cbe_504_count = 0;
  static  unsigned long long aesl_llvm_cbe_505_count = 0;
  static  unsigned long long aesl_llvm_cbe_506_count = 0;
   char *llvm_cbe_tmp__161;
  static  unsigned long long aesl_llvm_cbe_507_count = 0;
  static  unsigned long long aesl_llvm_cbe_508_count = 0;
  static  unsigned long long aesl_llvm_cbe_509_count = 0;
  unsigned int llvm_cbe_tmp__162;
  unsigned int llvm_cbe_tmp__162__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
   char *llvm_cbe_storemerge;
   char *llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_510_count = 0;
  static  unsigned long long aesl_llvm_cbe_511_count = 0;
  static  unsigned long long aesl_llvm_cbe_512_count = 0;
  static  unsigned long long aesl_llvm_cbe_513_count = 0;
  static  unsigned long long aesl_llvm_cbe_514_count = 0;
  static  unsigned long long aesl_llvm_cbe_515_count = 0;
  static  unsigned long long aesl_llvm_cbe_516_count = 0;
  static  unsigned long long aesl_llvm_cbe_517_count = 0;
  static  unsigned long long aesl_llvm_cbe_518_count = 0;
  static  unsigned long long aesl_llvm_cbe_519_count = 0;
  static  unsigned long long aesl_llvm_cbe_520_count = 0;
  static  unsigned long long aesl_llvm_cbe_521_count = 0;
  static  unsigned long long aesl_llvm_cbe_522_count = 0;
  static  unsigned long long aesl_llvm_cbe_523_count = 0;
  static  unsigned long long aesl_llvm_cbe_524_count = 0;
  static  unsigned long long aesl_llvm_cbe_525_count = 0;
  static  unsigned long long aesl_llvm_cbe_526_count = 0;
  static  unsigned long long aesl_llvm_cbe_527_count = 0;
  static  unsigned long long aesl_llvm_cbe_528_count = 0;
  static  unsigned long long aesl_llvm_cbe_529_count = 0;
  unsigned int llvm_cbe_tmp__163;
  static  unsigned long long aesl_llvm_cbe_530_count = 0;
  unsigned char llvm_cbe_tmp__164;
  static  unsigned long long aesl_llvm_cbe_531_count = 0;
  static  unsigned long long aesl_llvm_cbe_532_count = 0;
  static  unsigned long long aesl_llvm_cbe_533_count = 0;
  static  unsigned long long aesl_llvm_cbe_534_count = 0;
  static  unsigned long long aesl_llvm_cbe_535_count = 0;
  static  unsigned long long aesl_llvm_cbe_536_count = 0;
  static  unsigned long long aesl_llvm_cbe_537_count = 0;
  static  unsigned long long aesl_llvm_cbe_538_count = 0;
  static  unsigned long long aesl_llvm_cbe_539_count = 0;
   char *llvm_cbe_tmp__165;
  static  unsigned long long aesl_llvm_cbe_540_count = 0;
  unsigned char llvm_cbe_tmp__166;
  static  unsigned long long aesl_llvm_cbe_541_count = 0;
  static  unsigned long long aesl_llvm_cbe_542_count = 0;
  static  unsigned long long aesl_llvm_cbe_543_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__167;
  static  unsigned long long aesl_llvm_cbe_544_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__168;
  static  unsigned long long aesl_llvm_cbe_545_count = 0;
  unsigned int llvm_cbe_tmp__169;
  static  unsigned long long aesl_llvm_cbe_546_count = 0;
  static  unsigned long long aesl_llvm_cbe_547_count = 0;
  unsigned long long llvm_cbe_tmp__170;
  static  unsigned long long aesl_llvm_cbe_548_count = 0;
   char *llvm_cbe_tmp__171;
  static  unsigned long long aesl_llvm_cbe_549_count = 0;
  static  unsigned long long aesl_llvm_cbe_550_count = 0;
  unsigned int llvm_cbe_tmp__172;
  static  unsigned long long aesl_llvm_cbe_551_count = 0;
  static  unsigned long long aesl_llvm_cbe_552_count = 0;
  static  unsigned long long aesl_llvm_cbe_553_count = 0;
  static  unsigned long long aesl_llvm_cbe_554_count = 0;
  static  unsigned long long aesl_llvm_cbe_555_count = 0;
  static  unsigned long long aesl_llvm_cbe_556_count = 0;
  unsigned long long llvm_cbe_tmp__173;
  static  unsigned long long aesl_llvm_cbe_557_count = 0;
   char *llvm_cbe_tmp__174;
  static  unsigned long long aesl_llvm_cbe_558_count = 0;
  static  unsigned long long aesl_llvm_cbe_559_count = 0;
   char *llvm_cbe_tmp__175;
  static  unsigned long long aesl_llvm_cbe_560_count = 0;
  static  unsigned long long aesl_llvm_cbe_561_count = 0;
  static  unsigned long long aesl_llvm_cbe_562_count = 0;
  unsigned long long llvm_cbe_tmp__176;
  static  unsigned long long aesl_llvm_cbe_563_count = 0;
   char *llvm_cbe_tmp__177;
  static  unsigned long long aesl_llvm_cbe_564_count = 0;
  static  unsigned long long aesl_llvm_cbe_565_count = 0;
  static  unsigned long long aesl_llvm_cbe_566_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @parse_int8_t_array\n");
  if (((llvm_cbe_s) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__178;
  } else {
    goto llvm_cbe_tmp__179;
  }

llvm_cbe_tmp__178:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str12, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 136) nounwind, !dbg !21 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_504_count);
  _assert(( char *)((&aesl_internal__OC_str12[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 136u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",136u);
}
  goto llvm_cbe_tmp__179;

llvm_cbe_tmp__179:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i8* @strtok(i8* %%s, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !21 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_506_count);
  llvm_cbe_tmp__161 = ( char *)( char *)strtok(( char *)llvm_cbe_s, ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__161);
}
  llvm_cbe_tmp__162__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__161;   /* for PHI node */
  goto llvm_cbe_tmp__180;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__180:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i32 [ 0, %%3 ], [ %%23, %%20  for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_509_count);
  llvm_cbe_tmp__162 = (unsigned int )llvm_cbe_tmp__162__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__162);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__172);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i8* [ %%4, %%3 ], [ %%26, %%20  for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = ( char *)llvm_cbe_storemerge__PHI_TEMPORARY;
  if (((llvm_cbe_storemerge) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__181;
  }

llvm_cbe_tmp__182:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = sext i32 %%6 to i64, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_547_count);
  llvm_cbe_tmp__170 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__162);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__170);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds i8* %%arr, i64 %%21, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_548_count);
  llvm_cbe_tmp__171 = ( char *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__170))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__170));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%12, i8* %%22, align 1, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_549_count);
  *llvm_cbe_tmp__171 = llvm_cbe_tmp__164;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__164);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = add nsw i32 %%6, 1, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_550_count);
  llvm_cbe_tmp__172 = (unsigned int )((unsigned int )(llvm_cbe_tmp__162&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__172&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_556_count);
  llvm_cbe_tmp__173 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__173);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds i8* %%storemerge, i64 %%24, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_557_count);
  llvm_cbe_tmp__174 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__173))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__173));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%25, align 1, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_558_count);
  *llvm_cbe_tmp__174 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_559_count);
  llvm_cbe_tmp__175 = ( char *)( char *)strtok(( char *)(( char *)/*NULL*/0), ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__175);
}
  llvm_cbe_tmp__162__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__172;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__175;   /* for PHI node */
  goto llvm_cbe_tmp__180;

llvm_cbe_tmp__183:
if (AESL_DEBUG_TRACE)
printf("\n  store i8* %%storemerge, i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_528_count);
  *(&llvm_cbe_endptr) = ( char *)llvm_cbe_storemerge;
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = call i32 @strtol(i8* %%storemerge, i8** %%endptr, i32 10) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_529_count);
  llvm_cbe_tmp__163 = (unsigned int )strtol(( char *)llvm_cbe_storemerge, ( char **)(&llvm_cbe_endptr), 10u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",10u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__163);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = trunc i32 %%11 to i8, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_530_count);
  llvm_cbe_tmp__164 = (unsigned char )((unsigned char )llvm_cbe_tmp__163&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__164);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_539_count);
  llvm_cbe_tmp__165 = ( char *)*(&llvm_cbe_endptr);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load i8* %%13, align 1, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_540_count);
  llvm_cbe_tmp__166 = (unsigned char )*llvm_cbe_tmp__165;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__166);
  if (((llvm_cbe_tmp__166&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__182;
  } else {
    goto llvm_cbe_tmp__184;
  }

llvm_cbe_tmp__181:
  if ((((signed int )llvm_cbe_tmp__162) < ((signed int )llvm_cbe_n))) {
    goto llvm_cbe_tmp__183;
  } else {
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__184:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = call %%struct._iobuf* @__iob_func() nounwind, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_543_count);
  llvm_cbe_tmp__167 = (l_struct_OC__iobuf *)__iob_func();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__167);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds %%struct._iobuf* %%17, i64 2, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_544_count);
  llvm_cbe_tmp__168 = (l_struct_OC__iobuf *)(&llvm_cbe_tmp__167[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%18, i8* getelementptr inbounds ([35 x i8]* @aesl_internal_.str14, i64 0, i64 0), i32 %%6) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_545_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__168, ( char *)((&aesl_internal__OC_str14[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 35
#endif
])), llvm_cbe_tmp__162);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__162);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__169);
}
  goto llvm_cbe_tmp__182;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_562_count);
  llvm_cbe_tmp__176 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__176);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = getelementptr inbounds i8* %%storemerge, i64 %%27, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_563_count);
  llvm_cbe_tmp__177 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__176))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__176));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%28, align 1, !dbg !22 for 0x%I64xth hint within @parse_int8_t_array  --> \n", ++aesl_llvm_cbe_564_count);
  *llvm_cbe_tmp__177 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
  goto llvm_cbe__2e_critedge_2e_thread;

llvm_cbe__2e_critedge_2e_thread:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @parse_int8_t_array}\n");
  return 0u;
}


signed int parse_int16_t_array( char *llvm_cbe_s, signed short *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_endptr_count = 0;
   char *llvm_cbe_endptr;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_567_count = 0;
  static  unsigned long long aesl_llvm_cbe_568_count = 0;
  static  unsigned long long aesl_llvm_cbe_569_count = 0;
  static  unsigned long long aesl_llvm_cbe_570_count = 0;
  static  unsigned long long aesl_llvm_cbe_571_count = 0;
  static  unsigned long long aesl_llvm_cbe_572_count = 0;
  static  unsigned long long aesl_llvm_cbe_573_count = 0;
  static  unsigned long long aesl_llvm_cbe_574_count = 0;
  static  unsigned long long aesl_llvm_cbe_575_count = 0;
  static  unsigned long long aesl_llvm_cbe_576_count = 0;
  static  unsigned long long aesl_llvm_cbe_577_count = 0;
  static  unsigned long long aesl_llvm_cbe_578_count = 0;
  static  unsigned long long aesl_llvm_cbe_579_count = 0;
  static  unsigned long long aesl_llvm_cbe_580_count = 0;
  static  unsigned long long aesl_llvm_cbe_581_count = 0;
  static  unsigned long long aesl_llvm_cbe_582_count = 0;
  static  unsigned long long aesl_llvm_cbe_583_count = 0;
  static  unsigned long long aesl_llvm_cbe_584_count = 0;
   char *llvm_cbe_tmp__185;
  static  unsigned long long aesl_llvm_cbe_585_count = 0;
  static  unsigned long long aesl_llvm_cbe_586_count = 0;
  static  unsigned long long aesl_llvm_cbe_587_count = 0;
  unsigned int llvm_cbe_tmp__186;
  unsigned int llvm_cbe_tmp__186__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
   char *llvm_cbe_storemerge;
   char *llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_588_count = 0;
  static  unsigned long long aesl_llvm_cbe_589_count = 0;
  static  unsigned long long aesl_llvm_cbe_590_count = 0;
  static  unsigned long long aesl_llvm_cbe_591_count = 0;
  static  unsigned long long aesl_llvm_cbe_592_count = 0;
  static  unsigned long long aesl_llvm_cbe_593_count = 0;
  static  unsigned long long aesl_llvm_cbe_594_count = 0;
  static  unsigned long long aesl_llvm_cbe_595_count = 0;
  static  unsigned long long aesl_llvm_cbe_596_count = 0;
  static  unsigned long long aesl_llvm_cbe_597_count = 0;
  static  unsigned long long aesl_llvm_cbe_598_count = 0;
  static  unsigned long long aesl_llvm_cbe_599_count = 0;
  static  unsigned long long aesl_llvm_cbe_600_count = 0;
  static  unsigned long long aesl_llvm_cbe_601_count = 0;
  static  unsigned long long aesl_llvm_cbe_602_count = 0;
  static  unsigned long long aesl_llvm_cbe_603_count = 0;
  static  unsigned long long aesl_llvm_cbe_604_count = 0;
  static  unsigned long long aesl_llvm_cbe_605_count = 0;
  static  unsigned long long aesl_llvm_cbe_606_count = 0;
  static  unsigned long long aesl_llvm_cbe_607_count = 0;
  unsigned int llvm_cbe_tmp__187;
  static  unsigned long long aesl_llvm_cbe_608_count = 0;
  unsigned short llvm_cbe_tmp__188;
  static  unsigned long long aesl_llvm_cbe_609_count = 0;
  static  unsigned long long aesl_llvm_cbe_610_count = 0;
  static  unsigned long long aesl_llvm_cbe_611_count = 0;
  static  unsigned long long aesl_llvm_cbe_612_count = 0;
  static  unsigned long long aesl_llvm_cbe_613_count = 0;
  static  unsigned long long aesl_llvm_cbe_614_count = 0;
  static  unsigned long long aesl_llvm_cbe_615_count = 0;
  static  unsigned long long aesl_llvm_cbe_616_count = 0;
  static  unsigned long long aesl_llvm_cbe_617_count = 0;
   char *llvm_cbe_tmp__189;
  static  unsigned long long aesl_llvm_cbe_618_count = 0;
  unsigned char llvm_cbe_tmp__190;
  static  unsigned long long aesl_llvm_cbe_619_count = 0;
  static  unsigned long long aesl_llvm_cbe_620_count = 0;
  static  unsigned long long aesl_llvm_cbe_621_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__191;
  static  unsigned long long aesl_llvm_cbe_622_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__192;
  static  unsigned long long aesl_llvm_cbe_623_count = 0;
  unsigned int llvm_cbe_tmp__193;
  static  unsigned long long aesl_llvm_cbe_624_count = 0;
  static  unsigned long long aesl_llvm_cbe_625_count = 0;
  unsigned long long llvm_cbe_tmp__194;
  static  unsigned long long aesl_llvm_cbe_626_count = 0;
  signed short *llvm_cbe_tmp__195;
  static  unsigned long long aesl_llvm_cbe_627_count = 0;
  static  unsigned long long aesl_llvm_cbe_628_count = 0;
  unsigned int llvm_cbe_tmp__196;
  static  unsigned long long aesl_llvm_cbe_629_count = 0;
  static  unsigned long long aesl_llvm_cbe_630_count = 0;
  static  unsigned long long aesl_llvm_cbe_631_count = 0;
  static  unsigned long long aesl_llvm_cbe_632_count = 0;
  static  unsigned long long aesl_llvm_cbe_633_count = 0;
  static  unsigned long long aesl_llvm_cbe_634_count = 0;
  unsigned long long llvm_cbe_tmp__197;
  static  unsigned long long aesl_llvm_cbe_635_count = 0;
   char *llvm_cbe_tmp__198;
  static  unsigned long long aesl_llvm_cbe_636_count = 0;
  static  unsigned long long aesl_llvm_cbe_637_count = 0;
   char *llvm_cbe_tmp__199;
  static  unsigned long long aesl_llvm_cbe_638_count = 0;
  static  unsigned long long aesl_llvm_cbe_639_count = 0;
  static  unsigned long long aesl_llvm_cbe_640_count = 0;
  unsigned long long llvm_cbe_tmp__200;
  static  unsigned long long aesl_llvm_cbe_641_count = 0;
   char *llvm_cbe_tmp__201;
  static  unsigned long long aesl_llvm_cbe_642_count = 0;
  static  unsigned long long aesl_llvm_cbe_643_count = 0;
  static  unsigned long long aesl_llvm_cbe_644_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @parse_int16_t_array\n");
  if (((llvm_cbe_s) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__202;
  } else {
    goto llvm_cbe_tmp__203;
  }

llvm_cbe_tmp__202:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str12, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 137) nounwind, !dbg !21 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_582_count);
  _assert(( char *)((&aesl_internal__OC_str12[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 137u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",137u);
}
  goto llvm_cbe_tmp__203;

llvm_cbe_tmp__203:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i8* @strtok(i8* %%s, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !21 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_584_count);
  llvm_cbe_tmp__185 = ( char *)( char *)strtok(( char *)llvm_cbe_s, ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__185);
}
  llvm_cbe_tmp__186__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__185;   /* for PHI node */
  goto llvm_cbe_tmp__204;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__204:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i32 [ 0, %%3 ], [ %%23, %%20  for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_587_count);
  llvm_cbe_tmp__186 = (unsigned int )llvm_cbe_tmp__186__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__186);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__196);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i8* [ %%4, %%3 ], [ %%26, %%20  for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = ( char *)llvm_cbe_storemerge__PHI_TEMPORARY;
  if (((llvm_cbe_storemerge) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__205;
  }

llvm_cbe_tmp__206:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = sext i32 %%6 to i64, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_625_count);
  llvm_cbe_tmp__194 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__186);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__194);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds i16* %%arr, i64 %%21, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_626_count);
  llvm_cbe_tmp__195 = (signed short *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__194))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__194));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i16 %%12, i16* %%22, align 2, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_627_count);
  *llvm_cbe_tmp__195 = llvm_cbe_tmp__188;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__188);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = add nsw i32 %%6, 1, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_628_count);
  llvm_cbe_tmp__196 = (unsigned int )((unsigned int )(llvm_cbe_tmp__186&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__196&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_634_count);
  llvm_cbe_tmp__197 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__197);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds i8* %%storemerge, i64 %%24, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_635_count);
  llvm_cbe_tmp__198 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__197))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__197));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%25, align 1, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_636_count);
  *llvm_cbe_tmp__198 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_637_count);
  llvm_cbe_tmp__199 = ( char *)( char *)strtok(( char *)(( char *)/*NULL*/0), ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__199);
}
  llvm_cbe_tmp__186__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__196;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__199;   /* for PHI node */
  goto llvm_cbe_tmp__204;

llvm_cbe_tmp__207:
if (AESL_DEBUG_TRACE)
printf("\n  store i8* %%storemerge, i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_606_count);
  *(&llvm_cbe_endptr) = ( char *)llvm_cbe_storemerge;
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = call i32 @strtol(i8* %%storemerge, i8** %%endptr, i32 10) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_607_count);
  llvm_cbe_tmp__187 = (unsigned int )strtol(( char *)llvm_cbe_storemerge, ( char **)(&llvm_cbe_endptr), 10u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",10u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__187);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = trunc i32 %%11 to i16, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_608_count);
  llvm_cbe_tmp__188 = (unsigned short )((unsigned short )llvm_cbe_tmp__187&65535U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__188);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_617_count);
  llvm_cbe_tmp__189 = ( char *)*(&llvm_cbe_endptr);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load i8* %%13, align 1, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_618_count);
  llvm_cbe_tmp__190 = (unsigned char )*llvm_cbe_tmp__189;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__190);
  if (((llvm_cbe_tmp__190&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__206;
  } else {
    goto llvm_cbe_tmp__208;
  }

llvm_cbe_tmp__205:
  if ((((signed int )llvm_cbe_tmp__186) < ((signed int )llvm_cbe_n))) {
    goto llvm_cbe_tmp__207;
  } else {
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__208:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = call %%struct._iobuf* @__iob_func() nounwind, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_621_count);
  llvm_cbe_tmp__191 = (l_struct_OC__iobuf *)__iob_func();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__191);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds %%struct._iobuf* %%17, i64 2, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_622_count);
  llvm_cbe_tmp__192 = (l_struct_OC__iobuf *)(&llvm_cbe_tmp__191[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%18, i8* getelementptr inbounds ([35 x i8]* @aesl_internal_.str14, i64 0, i64 0), i32 %%6) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_623_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__192, ( char *)((&aesl_internal__OC_str14[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 35
#endif
])), llvm_cbe_tmp__186);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__186);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__193);
}
  goto llvm_cbe_tmp__206;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_640_count);
  llvm_cbe_tmp__200 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__200);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = getelementptr inbounds i8* %%storemerge, i64 %%27, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_641_count);
  llvm_cbe_tmp__201 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__200))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__200));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%28, align 1, !dbg !22 for 0x%I64xth hint within @parse_int16_t_array  --> \n", ++aesl_llvm_cbe_642_count);
  *llvm_cbe_tmp__201 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
  goto llvm_cbe__2e_critedge_2e_thread;

llvm_cbe__2e_critedge_2e_thread:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @parse_int16_t_array}\n");
  return 0u;
}


signed int parse_int32_t_array( char *llvm_cbe_s, signed int *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_endptr_count = 0;
   char *llvm_cbe_endptr;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_645_count = 0;
  static  unsigned long long aesl_llvm_cbe_646_count = 0;
  static  unsigned long long aesl_llvm_cbe_647_count = 0;
  static  unsigned long long aesl_llvm_cbe_648_count = 0;
  static  unsigned long long aesl_llvm_cbe_649_count = 0;
  static  unsigned long long aesl_llvm_cbe_650_count = 0;
  static  unsigned long long aesl_llvm_cbe_651_count = 0;
  static  unsigned long long aesl_llvm_cbe_652_count = 0;
  static  unsigned long long aesl_llvm_cbe_653_count = 0;
  static  unsigned long long aesl_llvm_cbe_654_count = 0;
  static  unsigned long long aesl_llvm_cbe_655_count = 0;
  static  unsigned long long aesl_llvm_cbe_656_count = 0;
  static  unsigned long long aesl_llvm_cbe_657_count = 0;
  static  unsigned long long aesl_llvm_cbe_658_count = 0;
  static  unsigned long long aesl_llvm_cbe_659_count = 0;
  static  unsigned long long aesl_llvm_cbe_660_count = 0;
  static  unsigned long long aesl_llvm_cbe_661_count = 0;
  static  unsigned long long aesl_llvm_cbe_662_count = 0;
   char *llvm_cbe_tmp__209;
  static  unsigned long long aesl_llvm_cbe_663_count = 0;
  static  unsigned long long aesl_llvm_cbe_664_count = 0;
  static  unsigned long long aesl_llvm_cbe_665_count = 0;
  unsigned int llvm_cbe_tmp__210;
  unsigned int llvm_cbe_tmp__210__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
   char *llvm_cbe_storemerge;
   char *llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_666_count = 0;
  static  unsigned long long aesl_llvm_cbe_667_count = 0;
  static  unsigned long long aesl_llvm_cbe_668_count = 0;
  static  unsigned long long aesl_llvm_cbe_669_count = 0;
  static  unsigned long long aesl_llvm_cbe_670_count = 0;
  static  unsigned long long aesl_llvm_cbe_671_count = 0;
  static  unsigned long long aesl_llvm_cbe_672_count = 0;
  static  unsigned long long aesl_llvm_cbe_673_count = 0;
  static  unsigned long long aesl_llvm_cbe_674_count = 0;
  static  unsigned long long aesl_llvm_cbe_675_count = 0;
  static  unsigned long long aesl_llvm_cbe_676_count = 0;
  static  unsigned long long aesl_llvm_cbe_677_count = 0;
  static  unsigned long long aesl_llvm_cbe_678_count = 0;
  static  unsigned long long aesl_llvm_cbe_679_count = 0;
  static  unsigned long long aesl_llvm_cbe_680_count = 0;
  static  unsigned long long aesl_llvm_cbe_681_count = 0;
  static  unsigned long long aesl_llvm_cbe_682_count = 0;
  static  unsigned long long aesl_llvm_cbe_683_count = 0;
  static  unsigned long long aesl_llvm_cbe_684_count = 0;
  static  unsigned long long aesl_llvm_cbe_685_count = 0;
  unsigned int llvm_cbe_tmp__211;
  static  unsigned long long aesl_llvm_cbe_686_count = 0;
  static  unsigned long long aesl_llvm_cbe_687_count = 0;
  static  unsigned long long aesl_llvm_cbe_688_count = 0;
  static  unsigned long long aesl_llvm_cbe_689_count = 0;
  static  unsigned long long aesl_llvm_cbe_690_count = 0;
  static  unsigned long long aesl_llvm_cbe_691_count = 0;
  static  unsigned long long aesl_llvm_cbe_692_count = 0;
  static  unsigned long long aesl_llvm_cbe_693_count = 0;
  static  unsigned long long aesl_llvm_cbe_694_count = 0;
   char *llvm_cbe_tmp__212;
  static  unsigned long long aesl_llvm_cbe_695_count = 0;
  unsigned char llvm_cbe_tmp__213;
  static  unsigned long long aesl_llvm_cbe_696_count = 0;
  static  unsigned long long aesl_llvm_cbe_697_count = 0;
  static  unsigned long long aesl_llvm_cbe_698_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__214;
  static  unsigned long long aesl_llvm_cbe_699_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__215;
  static  unsigned long long aesl_llvm_cbe_700_count = 0;
  unsigned int llvm_cbe_tmp__216;
  static  unsigned long long aesl_llvm_cbe_701_count = 0;
  static  unsigned long long aesl_llvm_cbe_702_count = 0;
  unsigned long long llvm_cbe_tmp__217;
  static  unsigned long long aesl_llvm_cbe_703_count = 0;
  signed int *llvm_cbe_tmp__218;
  static  unsigned long long aesl_llvm_cbe_704_count = 0;
  static  unsigned long long aesl_llvm_cbe_705_count = 0;
  unsigned int llvm_cbe_tmp__219;
  static  unsigned long long aesl_llvm_cbe_706_count = 0;
  static  unsigned long long aesl_llvm_cbe_707_count = 0;
  static  unsigned long long aesl_llvm_cbe_708_count = 0;
  static  unsigned long long aesl_llvm_cbe_709_count = 0;
  static  unsigned long long aesl_llvm_cbe_710_count = 0;
  static  unsigned long long aesl_llvm_cbe_711_count = 0;
  unsigned long long llvm_cbe_tmp__220;
  static  unsigned long long aesl_llvm_cbe_712_count = 0;
   char *llvm_cbe_tmp__221;
  static  unsigned long long aesl_llvm_cbe_713_count = 0;
  static  unsigned long long aesl_llvm_cbe_714_count = 0;
   char *llvm_cbe_tmp__222;
  static  unsigned long long aesl_llvm_cbe_715_count = 0;
  static  unsigned long long aesl_llvm_cbe_716_count = 0;
  static  unsigned long long aesl_llvm_cbe_717_count = 0;
  unsigned long long llvm_cbe_tmp__223;
  static  unsigned long long aesl_llvm_cbe_718_count = 0;
   char *llvm_cbe_tmp__224;
  static  unsigned long long aesl_llvm_cbe_719_count = 0;
  static  unsigned long long aesl_llvm_cbe_720_count = 0;
  static  unsigned long long aesl_llvm_cbe_721_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @parse_int32_t_array\n");
  if (((llvm_cbe_s) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__225;
  } else {
    goto llvm_cbe_tmp__226;
  }

llvm_cbe_tmp__225:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str12, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 138) nounwind, !dbg !21 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_660_count);
  _assert(( char *)((&aesl_internal__OC_str12[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 138u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",138u);
}
  goto llvm_cbe_tmp__226;

llvm_cbe_tmp__226:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i8* @strtok(i8* %%s, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !21 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_662_count);
  llvm_cbe_tmp__209 = ( char *)( char *)strtok(( char *)llvm_cbe_s, ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__209);
}
  llvm_cbe_tmp__210__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__209;   /* for PHI node */
  goto llvm_cbe_tmp__227;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__227:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i32 [ 0, %%3 ], [ %%22, %%19  for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_665_count);
  llvm_cbe_tmp__210 = (unsigned int )llvm_cbe_tmp__210__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__210);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__219);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i8* [ %%4, %%3 ], [ %%25, %%19  for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = ( char *)llvm_cbe_storemerge__PHI_TEMPORARY;
  if (((llvm_cbe_storemerge) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__228;
  }

llvm_cbe_tmp__229:
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = sext i32 %%6 to i64, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_702_count);
  llvm_cbe_tmp__217 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__210);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__217);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds i32* %%arr, i64 %%20, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_703_count);
  llvm_cbe_tmp__218 = (signed int *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__217))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__217));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%11, i32* %%21, align 4, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_704_count);
  *llvm_cbe_tmp__218 = llvm_cbe_tmp__211;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__211);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = add nsw i32 %%6, 1, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_705_count);
  llvm_cbe_tmp__219 = (unsigned int )((unsigned int )(llvm_cbe_tmp__210&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__219&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_711_count);
  llvm_cbe_tmp__220 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__220);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = getelementptr inbounds i8* %%storemerge, i64 %%23, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_712_count);
  llvm_cbe_tmp__221 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__220))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__220));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%24, align 1, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_713_count);
  *llvm_cbe_tmp__221 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_714_count);
  llvm_cbe_tmp__222 = ( char *)( char *)strtok(( char *)(( char *)/*NULL*/0), ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__222);
}
  llvm_cbe_tmp__210__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__219;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__222;   /* for PHI node */
  goto llvm_cbe_tmp__227;

llvm_cbe_tmp__230:
if (AESL_DEBUG_TRACE)
printf("\n  store i8* %%storemerge, i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_684_count);
  *(&llvm_cbe_endptr) = ( char *)llvm_cbe_storemerge;
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = call i32 @strtol(i8* %%storemerge, i8** %%endptr, i32 10) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_685_count);
  llvm_cbe_tmp__211 = (unsigned int )strtol(( char *)llvm_cbe_storemerge, ( char **)(&llvm_cbe_endptr), 10u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",10u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__211);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_694_count);
  llvm_cbe_tmp__212 = ( char *)*(&llvm_cbe_endptr);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8* %%12, align 1, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_695_count);
  llvm_cbe_tmp__213 = (unsigned char )*llvm_cbe_tmp__212;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__213);
  if (((llvm_cbe_tmp__213&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__229;
  } else {
    goto llvm_cbe_tmp__231;
  }

llvm_cbe_tmp__228:
  if ((((signed int )llvm_cbe_tmp__210) < ((signed int )llvm_cbe_n))) {
    goto llvm_cbe_tmp__230;
  } else {
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__231:
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = call %%struct._iobuf* @__iob_func() nounwind, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_698_count);
  llvm_cbe_tmp__214 = (l_struct_OC__iobuf *)__iob_func();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__214);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = getelementptr inbounds %%struct._iobuf* %%16, i64 2, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_699_count);
  llvm_cbe_tmp__215 = (l_struct_OC__iobuf *)(&llvm_cbe_tmp__214[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%17, i8* getelementptr inbounds ([35 x i8]* @aesl_internal_.str14, i64 0, i64 0), i32 %%6) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_700_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__215, ( char *)((&aesl_internal__OC_str14[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 35
#endif
])), llvm_cbe_tmp__210);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__210);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__216);
}
  goto llvm_cbe_tmp__229;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_717_count);
  llvm_cbe_tmp__223 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__223);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = getelementptr inbounds i8* %%storemerge, i64 %%26, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_718_count);
  llvm_cbe_tmp__224 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__223))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__223));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%27, align 1, !dbg !22 for 0x%I64xth hint within @parse_int32_t_array  --> \n", ++aesl_llvm_cbe_719_count);
  *llvm_cbe_tmp__224 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
  goto llvm_cbe__2e_critedge_2e_thread;

llvm_cbe__2e_critedge_2e_thread:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @parse_int32_t_array}\n");
  return 0u;
}


signed int parse_int64_t_array( char *llvm_cbe_s, signed long long *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_endptr_count = 0;
   char *llvm_cbe_endptr;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_722_count = 0;
  static  unsigned long long aesl_llvm_cbe_723_count = 0;
  static  unsigned long long aesl_llvm_cbe_724_count = 0;
  static  unsigned long long aesl_llvm_cbe_725_count = 0;
  static  unsigned long long aesl_llvm_cbe_726_count = 0;
  static  unsigned long long aesl_llvm_cbe_727_count = 0;
  static  unsigned long long aesl_llvm_cbe_728_count = 0;
  static  unsigned long long aesl_llvm_cbe_729_count = 0;
  static  unsigned long long aesl_llvm_cbe_730_count = 0;
  static  unsigned long long aesl_llvm_cbe_731_count = 0;
  static  unsigned long long aesl_llvm_cbe_732_count = 0;
  static  unsigned long long aesl_llvm_cbe_733_count = 0;
  static  unsigned long long aesl_llvm_cbe_734_count = 0;
  static  unsigned long long aesl_llvm_cbe_735_count = 0;
  static  unsigned long long aesl_llvm_cbe_736_count = 0;
  static  unsigned long long aesl_llvm_cbe_737_count = 0;
  static  unsigned long long aesl_llvm_cbe_738_count = 0;
  static  unsigned long long aesl_llvm_cbe_739_count = 0;
   char *llvm_cbe_tmp__232;
  static  unsigned long long aesl_llvm_cbe_740_count = 0;
  static  unsigned long long aesl_llvm_cbe_741_count = 0;
  static  unsigned long long aesl_llvm_cbe_742_count = 0;
  unsigned int llvm_cbe_tmp__233;
  unsigned int llvm_cbe_tmp__233__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
   char *llvm_cbe_storemerge;
   char *llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_743_count = 0;
  static  unsigned long long aesl_llvm_cbe_744_count = 0;
  static  unsigned long long aesl_llvm_cbe_745_count = 0;
  static  unsigned long long aesl_llvm_cbe_746_count = 0;
  static  unsigned long long aesl_llvm_cbe_747_count = 0;
  static  unsigned long long aesl_llvm_cbe_748_count = 0;
  static  unsigned long long aesl_llvm_cbe_749_count = 0;
  static  unsigned long long aesl_llvm_cbe_750_count = 0;
  static  unsigned long long aesl_llvm_cbe_751_count = 0;
  static  unsigned long long aesl_llvm_cbe_752_count = 0;
  static  unsigned long long aesl_llvm_cbe_753_count = 0;
  static  unsigned long long aesl_llvm_cbe_754_count = 0;
  static  unsigned long long aesl_llvm_cbe_755_count = 0;
  static  unsigned long long aesl_llvm_cbe_756_count = 0;
  static  unsigned long long aesl_llvm_cbe_757_count = 0;
  static  unsigned long long aesl_llvm_cbe_758_count = 0;
  static  unsigned long long aesl_llvm_cbe_759_count = 0;
  static  unsigned long long aesl_llvm_cbe_760_count = 0;
  static  unsigned long long aesl_llvm_cbe_761_count = 0;
  static  unsigned long long aesl_llvm_cbe_762_count = 0;
  unsigned int llvm_cbe_tmp__234;
  static  unsigned long long aesl_llvm_cbe_763_count = 0;
  unsigned long long llvm_cbe_tmp__235;
  static  unsigned long long aesl_llvm_cbe_764_count = 0;
  static  unsigned long long aesl_llvm_cbe_765_count = 0;
  static  unsigned long long aesl_llvm_cbe_766_count = 0;
  static  unsigned long long aesl_llvm_cbe_767_count = 0;
  static  unsigned long long aesl_llvm_cbe_768_count = 0;
  static  unsigned long long aesl_llvm_cbe_769_count = 0;
  static  unsigned long long aesl_llvm_cbe_770_count = 0;
  static  unsigned long long aesl_llvm_cbe_771_count = 0;
  static  unsigned long long aesl_llvm_cbe_772_count = 0;
   char *llvm_cbe_tmp__236;
  static  unsigned long long aesl_llvm_cbe_773_count = 0;
  unsigned char llvm_cbe_tmp__237;
  static  unsigned long long aesl_llvm_cbe_774_count = 0;
  static  unsigned long long aesl_llvm_cbe_775_count = 0;
  static  unsigned long long aesl_llvm_cbe_776_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__238;
  static  unsigned long long aesl_llvm_cbe_777_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__239;
  static  unsigned long long aesl_llvm_cbe_778_count = 0;
  unsigned int llvm_cbe_tmp__240;
  static  unsigned long long aesl_llvm_cbe_779_count = 0;
  static  unsigned long long aesl_llvm_cbe_780_count = 0;
  unsigned long long llvm_cbe_tmp__241;
  static  unsigned long long aesl_llvm_cbe_781_count = 0;
  signed long long *llvm_cbe_tmp__242;
  static  unsigned long long aesl_llvm_cbe_782_count = 0;
  static  unsigned long long aesl_llvm_cbe_783_count = 0;
  unsigned int llvm_cbe_tmp__243;
  static  unsigned long long aesl_llvm_cbe_784_count = 0;
  static  unsigned long long aesl_llvm_cbe_785_count = 0;
  static  unsigned long long aesl_llvm_cbe_786_count = 0;
  static  unsigned long long aesl_llvm_cbe_787_count = 0;
  static  unsigned long long aesl_llvm_cbe_788_count = 0;
  static  unsigned long long aesl_llvm_cbe_789_count = 0;
  unsigned long long llvm_cbe_tmp__244;
  static  unsigned long long aesl_llvm_cbe_790_count = 0;
   char *llvm_cbe_tmp__245;
  static  unsigned long long aesl_llvm_cbe_791_count = 0;
  static  unsigned long long aesl_llvm_cbe_792_count = 0;
   char *llvm_cbe_tmp__246;
  static  unsigned long long aesl_llvm_cbe_793_count = 0;
  static  unsigned long long aesl_llvm_cbe_794_count = 0;
  static  unsigned long long aesl_llvm_cbe_795_count = 0;
  unsigned long long llvm_cbe_tmp__247;
  static  unsigned long long aesl_llvm_cbe_796_count = 0;
   char *llvm_cbe_tmp__248;
  static  unsigned long long aesl_llvm_cbe_797_count = 0;
  static  unsigned long long aesl_llvm_cbe_798_count = 0;
  static  unsigned long long aesl_llvm_cbe_799_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @parse_int64_t_array\n");
  if (((llvm_cbe_s) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__249;
  } else {
    goto llvm_cbe_tmp__250;
  }

llvm_cbe_tmp__249:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str12, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 139) nounwind, !dbg !21 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_737_count);
  _assert(( char *)((&aesl_internal__OC_str12[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 139u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",139u);
}
  goto llvm_cbe_tmp__250;

llvm_cbe_tmp__250:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i8* @strtok(i8* %%s, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !21 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_739_count);
  llvm_cbe_tmp__232 = ( char *)( char *)strtok(( char *)llvm_cbe_s, ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__232);
}
  llvm_cbe_tmp__233__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__232;   /* for PHI node */
  goto llvm_cbe_tmp__251;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__251:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i32 [ 0, %%3 ], [ %%23, %%20  for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_742_count);
  llvm_cbe_tmp__233 = (unsigned int )llvm_cbe_tmp__233__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__233);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__243);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i8* [ %%4, %%3 ], [ %%26, %%20  for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = ( char *)llvm_cbe_storemerge__PHI_TEMPORARY;
  if (((llvm_cbe_storemerge) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__252;
  }

llvm_cbe_tmp__253:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = sext i32 %%6 to i64, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_780_count);
  llvm_cbe_tmp__241 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__233);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__241);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds i64* %%arr, i64 %%21, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_781_count);
  llvm_cbe_tmp__242 = (signed long long *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__241))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__241));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%12, i64* %%22, align 8, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_782_count);
  *llvm_cbe_tmp__242 = llvm_cbe_tmp__235;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__235);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = add nsw i32 %%6, 1, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_783_count);
  llvm_cbe_tmp__243 = (unsigned int )((unsigned int )(llvm_cbe_tmp__233&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__243&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_789_count);
  llvm_cbe_tmp__244 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__244);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds i8* %%storemerge, i64 %%24, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_790_count);
  llvm_cbe_tmp__245 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__244))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__244));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%25, align 1, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_791_count);
  *llvm_cbe_tmp__245 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_792_count);
  llvm_cbe_tmp__246 = ( char *)( char *)strtok(( char *)(( char *)/*NULL*/0), ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__246);
}
  llvm_cbe_tmp__233__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__243;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__246;   /* for PHI node */
  goto llvm_cbe_tmp__251;

llvm_cbe_tmp__254:
if (AESL_DEBUG_TRACE)
printf("\n  store i8* %%storemerge, i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_761_count);
  *(&llvm_cbe_endptr) = ( char *)llvm_cbe_storemerge;
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = call i32 @strtol(i8* %%storemerge, i8** %%endptr, i32 10) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_762_count);
  llvm_cbe_tmp__234 = (unsigned int )strtol(( char *)llvm_cbe_storemerge, ( char **)(&llvm_cbe_endptr), 10u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",10u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__234);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = sext i32 %%11 to i64, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_763_count);
  llvm_cbe_tmp__235 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__234);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__235);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_772_count);
  llvm_cbe_tmp__236 = ( char *)*(&llvm_cbe_endptr);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load i8* %%13, align 1, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_773_count);
  llvm_cbe_tmp__237 = (unsigned char )*llvm_cbe_tmp__236;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__237);
  if (((llvm_cbe_tmp__237&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__253;
  } else {
    goto llvm_cbe_tmp__255;
  }

llvm_cbe_tmp__252:
  if ((((signed int )llvm_cbe_tmp__233) < ((signed int )llvm_cbe_n))) {
    goto llvm_cbe_tmp__254;
  } else {
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__255:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = call %%struct._iobuf* @__iob_func() nounwind, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_776_count);
  llvm_cbe_tmp__238 = (l_struct_OC__iobuf *)__iob_func();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__238);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds %%struct._iobuf* %%17, i64 2, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_777_count);
  llvm_cbe_tmp__239 = (l_struct_OC__iobuf *)(&llvm_cbe_tmp__238[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%18, i8* getelementptr inbounds ([35 x i8]* @aesl_internal_.str14, i64 0, i64 0), i32 %%6) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_778_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__239, ( char *)((&aesl_internal__OC_str14[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 35
#endif
])), llvm_cbe_tmp__233);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__233);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__240);
}
  goto llvm_cbe_tmp__253;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_795_count);
  llvm_cbe_tmp__247 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__247);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = getelementptr inbounds i8* %%storemerge, i64 %%27, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_796_count);
  llvm_cbe_tmp__248 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__247))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__247));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%28, align 1, !dbg !22 for 0x%I64xth hint within @parse_int64_t_array  --> \n", ++aesl_llvm_cbe_797_count);
  *llvm_cbe_tmp__248 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
  goto llvm_cbe__2e_critedge_2e_thread;

llvm_cbe__2e_critedge_2e_thread:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @parse_int64_t_array}\n");
  return 0u;
}


signed int parse_float_array( char *llvm_cbe_s, float *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_endptr_count = 0;
   char *llvm_cbe_endptr;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_800_count = 0;
  static  unsigned long long aesl_llvm_cbe_801_count = 0;
  static  unsigned long long aesl_llvm_cbe_802_count = 0;
  static  unsigned long long aesl_llvm_cbe_803_count = 0;
  static  unsigned long long aesl_llvm_cbe_804_count = 0;
  static  unsigned long long aesl_llvm_cbe_805_count = 0;
  static  unsigned long long aesl_llvm_cbe_806_count = 0;
  static  unsigned long long aesl_llvm_cbe_807_count = 0;
  static  unsigned long long aesl_llvm_cbe_808_count = 0;
  static  unsigned long long aesl_llvm_cbe_809_count = 0;
  static  unsigned long long aesl_llvm_cbe_810_count = 0;
  static  unsigned long long aesl_llvm_cbe_811_count = 0;
  static  unsigned long long aesl_llvm_cbe_812_count = 0;
  static  unsigned long long aesl_llvm_cbe_813_count = 0;
  static  unsigned long long aesl_llvm_cbe_814_count = 0;
  static  unsigned long long aesl_llvm_cbe_815_count = 0;
  static  unsigned long long aesl_llvm_cbe_816_count = 0;
  static  unsigned long long aesl_llvm_cbe_817_count = 0;
   char *llvm_cbe_tmp__256;
  static  unsigned long long aesl_llvm_cbe_818_count = 0;
  static  unsigned long long aesl_llvm_cbe_819_count = 0;
  static  unsigned long long aesl_llvm_cbe_820_count = 0;
  unsigned int llvm_cbe_tmp__257;
  unsigned int llvm_cbe_tmp__257__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
   char *llvm_cbe_storemerge;
   char *llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_821_count = 0;
  static  unsigned long long aesl_llvm_cbe_822_count = 0;
  static  unsigned long long aesl_llvm_cbe_823_count = 0;
  static  unsigned long long aesl_llvm_cbe_824_count = 0;
  static  unsigned long long aesl_llvm_cbe_825_count = 0;
  static  unsigned long long aesl_llvm_cbe_826_count = 0;
  static  unsigned long long aesl_llvm_cbe_827_count = 0;
  static  unsigned long long aesl_llvm_cbe_828_count = 0;
  static  unsigned long long aesl_llvm_cbe_829_count = 0;
  static  unsigned long long aesl_llvm_cbe_830_count = 0;
  static  unsigned long long aesl_llvm_cbe_831_count = 0;
  static  unsigned long long aesl_llvm_cbe_832_count = 0;
  static  unsigned long long aesl_llvm_cbe_833_count = 0;
  static  unsigned long long aesl_llvm_cbe_834_count = 0;
  static  unsigned long long aesl_llvm_cbe_835_count = 0;
  static  unsigned long long aesl_llvm_cbe_836_count = 0;
  static  unsigned long long aesl_llvm_cbe_837_count = 0;
  static  unsigned long long aesl_llvm_cbe_838_count = 0;
  static  unsigned long long aesl_llvm_cbe_839_count = 0;
  static  unsigned long long aesl_llvm_cbe_840_count = 0;
  float llvm_cbe_tmp__258;
  static  unsigned long long aesl_llvm_cbe_841_count = 0;
  static  unsigned long long aesl_llvm_cbe_842_count = 0;
  static  unsigned long long aesl_llvm_cbe_843_count = 0;
  static  unsigned long long aesl_llvm_cbe_844_count = 0;
  static  unsigned long long aesl_llvm_cbe_845_count = 0;
  static  unsigned long long aesl_llvm_cbe_846_count = 0;
  static  unsigned long long aesl_llvm_cbe_847_count = 0;
  static  unsigned long long aesl_llvm_cbe_848_count = 0;
  static  unsigned long long aesl_llvm_cbe_849_count = 0;
   char *llvm_cbe_tmp__259;
  static  unsigned long long aesl_llvm_cbe_850_count = 0;
  unsigned char llvm_cbe_tmp__260;
  static  unsigned long long aesl_llvm_cbe_851_count = 0;
  static  unsigned long long aesl_llvm_cbe_852_count = 0;
  static  unsigned long long aesl_llvm_cbe_853_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__261;
  static  unsigned long long aesl_llvm_cbe_854_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__262;
  static  unsigned long long aesl_llvm_cbe_855_count = 0;
  unsigned int llvm_cbe_tmp__263;
  static  unsigned long long aesl_llvm_cbe_856_count = 0;
  static  unsigned long long aesl_llvm_cbe_857_count = 0;
  unsigned long long llvm_cbe_tmp__264;
  static  unsigned long long aesl_llvm_cbe_858_count = 0;
  float *llvm_cbe_tmp__265;
  static  unsigned long long aesl_llvm_cbe_859_count = 0;
  static  unsigned long long aesl_llvm_cbe_860_count = 0;
  unsigned int llvm_cbe_tmp__266;
  static  unsigned long long aesl_llvm_cbe_861_count = 0;
  static  unsigned long long aesl_llvm_cbe_862_count = 0;
  static  unsigned long long aesl_llvm_cbe_863_count = 0;
  static  unsigned long long aesl_llvm_cbe_864_count = 0;
  static  unsigned long long aesl_llvm_cbe_865_count = 0;
  static  unsigned long long aesl_llvm_cbe_866_count = 0;
  unsigned long long llvm_cbe_tmp__267;
  static  unsigned long long aesl_llvm_cbe_867_count = 0;
   char *llvm_cbe_tmp__268;
  static  unsigned long long aesl_llvm_cbe_868_count = 0;
  static  unsigned long long aesl_llvm_cbe_869_count = 0;
   char *llvm_cbe_tmp__269;
  static  unsigned long long aesl_llvm_cbe_870_count = 0;
  static  unsigned long long aesl_llvm_cbe_871_count = 0;
  static  unsigned long long aesl_llvm_cbe_872_count = 0;
  unsigned long long llvm_cbe_tmp__270;
  static  unsigned long long aesl_llvm_cbe_873_count = 0;
   char *llvm_cbe_tmp__271;
  static  unsigned long long aesl_llvm_cbe_874_count = 0;
  static  unsigned long long aesl_llvm_cbe_875_count = 0;
  static  unsigned long long aesl_llvm_cbe_876_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @parse_float_array\n");
  if (((llvm_cbe_s) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__272;
  } else {
    goto llvm_cbe_tmp__273;
  }

llvm_cbe_tmp__272:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str12, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 141) nounwind, !dbg !21 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_815_count);
  _assert(( char *)((&aesl_internal__OC_str12[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 141u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",141u);
}
  goto llvm_cbe_tmp__273;

llvm_cbe_tmp__273:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i8* @strtok(i8* %%s, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !21 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_817_count);
  llvm_cbe_tmp__256 = ( char *)( char *)strtok(( char *)llvm_cbe_s, ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__256);
}
  llvm_cbe_tmp__257__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__256;   /* for PHI node */
  goto llvm_cbe_tmp__274;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__274:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i32 [ 0, %%3 ], [ %%22, %%19  for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_820_count);
  llvm_cbe_tmp__257 = (unsigned int )llvm_cbe_tmp__257__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__257);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__266);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i8* [ %%4, %%3 ], [ %%25, %%19  for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = ( char *)llvm_cbe_storemerge__PHI_TEMPORARY;
  if (((llvm_cbe_storemerge) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__275;
  }

llvm_cbe_tmp__276:
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = sext i32 %%6 to i64, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_857_count);
  llvm_cbe_tmp__264 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__257);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__264);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds float* %%arr, i64 %%20, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_858_count);
  llvm_cbe_tmp__265 = (float *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__264))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__264));
}
if (AESL_DEBUG_TRACE)
printf("\n  store float %%11, float* %%21, align 4, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_859_count);
  *llvm_cbe_tmp__265 = llvm_cbe_tmp__258;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__258);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = add nsw i32 %%6, 1, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_860_count);
  llvm_cbe_tmp__266 = (unsigned int )((unsigned int )(llvm_cbe_tmp__257&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__266&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_866_count);
  llvm_cbe_tmp__267 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__267);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = getelementptr inbounds i8* %%storemerge, i64 %%23, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_867_count);
  llvm_cbe_tmp__268 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__267))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__267));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%24, align 1, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_868_count);
  *llvm_cbe_tmp__268 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_869_count);
  llvm_cbe_tmp__269 = ( char *)( char *)strtok(( char *)(( char *)/*NULL*/0), ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__269);
}
  llvm_cbe_tmp__257__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__266;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__269;   /* for PHI node */
  goto llvm_cbe_tmp__274;

llvm_cbe_tmp__277:
if (AESL_DEBUG_TRACE)
printf("\n  store i8* %%storemerge, i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_839_count);
  *(&llvm_cbe_endptr) = ( char *)llvm_cbe_storemerge;
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = call float @strtof(i8* %%storemerge, i8** %%endptr) nounwind, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_840_count);
  llvm_cbe_tmp__258 = (float )strtof(( char *)llvm_cbe_storemerge, ( char **)(&llvm_cbe_endptr));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = %f",llvm_cbe_tmp__258);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_849_count);
  llvm_cbe_tmp__259 = ( char *)*(&llvm_cbe_endptr);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8* %%12, align 1, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_850_count);
  llvm_cbe_tmp__260 = (unsigned char )*llvm_cbe_tmp__259;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__260);
  if (((llvm_cbe_tmp__260&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__276;
  } else {
    goto llvm_cbe_tmp__278;
  }

llvm_cbe_tmp__275:
  if ((((signed int )llvm_cbe_tmp__257) < ((signed int )llvm_cbe_n))) {
    goto llvm_cbe_tmp__277;
  } else {
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__278:
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = call %%struct._iobuf* @__iob_func() nounwind, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_853_count);
  llvm_cbe_tmp__261 = (l_struct_OC__iobuf *)__iob_func();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__261);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = getelementptr inbounds %%struct._iobuf* %%16, i64 2, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_854_count);
  llvm_cbe_tmp__262 = (l_struct_OC__iobuf *)(&llvm_cbe_tmp__261[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%17, i8* getelementptr inbounds ([35 x i8]* @aesl_internal_.str14, i64 0, i64 0), i32 %%6) nounwind, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_855_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__262, ( char *)((&aesl_internal__OC_str14[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 35
#endif
])), llvm_cbe_tmp__257);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__257);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__263);
}
  goto llvm_cbe_tmp__276;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_872_count);
  llvm_cbe_tmp__270 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__270);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = getelementptr inbounds i8* %%storemerge, i64 %%26, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_873_count);
  llvm_cbe_tmp__271 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__270))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__270));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%27, align 1, !dbg !22 for 0x%I64xth hint within @parse_float_array  --> \n", ++aesl_llvm_cbe_874_count);
  *llvm_cbe_tmp__271 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
  goto llvm_cbe__2e_critedge_2e_thread;

llvm_cbe__2e_critedge_2e_thread:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @parse_float_array}\n");
  return 0u;
}


signed int parse_double_array( char *llvm_cbe_s, double *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_endptr_count = 0;
   char *llvm_cbe_endptr;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_877_count = 0;
  static  unsigned long long aesl_llvm_cbe_878_count = 0;
  static  unsigned long long aesl_llvm_cbe_879_count = 0;
  static  unsigned long long aesl_llvm_cbe_880_count = 0;
  static  unsigned long long aesl_llvm_cbe_881_count = 0;
  static  unsigned long long aesl_llvm_cbe_882_count = 0;
  static  unsigned long long aesl_llvm_cbe_883_count = 0;
  static  unsigned long long aesl_llvm_cbe_884_count = 0;
  static  unsigned long long aesl_llvm_cbe_885_count = 0;
  static  unsigned long long aesl_llvm_cbe_886_count = 0;
  static  unsigned long long aesl_llvm_cbe_887_count = 0;
  static  unsigned long long aesl_llvm_cbe_888_count = 0;
  static  unsigned long long aesl_llvm_cbe_889_count = 0;
  static  unsigned long long aesl_llvm_cbe_890_count = 0;
  static  unsigned long long aesl_llvm_cbe_891_count = 0;
  static  unsigned long long aesl_llvm_cbe_892_count = 0;
  static  unsigned long long aesl_llvm_cbe_893_count = 0;
  static  unsigned long long aesl_llvm_cbe_894_count = 0;
   char *llvm_cbe_tmp__279;
  static  unsigned long long aesl_llvm_cbe_895_count = 0;
  static  unsigned long long aesl_llvm_cbe_896_count = 0;
  static  unsigned long long aesl_llvm_cbe_897_count = 0;
  unsigned int llvm_cbe_tmp__280;
  unsigned int llvm_cbe_tmp__280__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
   char *llvm_cbe_storemerge;
   char *llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_898_count = 0;
  static  unsigned long long aesl_llvm_cbe_899_count = 0;
  static  unsigned long long aesl_llvm_cbe_900_count = 0;
  static  unsigned long long aesl_llvm_cbe_901_count = 0;
  static  unsigned long long aesl_llvm_cbe_902_count = 0;
  static  unsigned long long aesl_llvm_cbe_903_count = 0;
  static  unsigned long long aesl_llvm_cbe_904_count = 0;
  static  unsigned long long aesl_llvm_cbe_905_count = 0;
  static  unsigned long long aesl_llvm_cbe_906_count = 0;
  static  unsigned long long aesl_llvm_cbe_907_count = 0;
  static  unsigned long long aesl_llvm_cbe_908_count = 0;
  static  unsigned long long aesl_llvm_cbe_909_count = 0;
  static  unsigned long long aesl_llvm_cbe_910_count = 0;
  static  unsigned long long aesl_llvm_cbe_911_count = 0;
  static  unsigned long long aesl_llvm_cbe_912_count = 0;
  static  unsigned long long aesl_llvm_cbe_913_count = 0;
  static  unsigned long long aesl_llvm_cbe_914_count = 0;
  static  unsigned long long aesl_llvm_cbe_915_count = 0;
  static  unsigned long long aesl_llvm_cbe_916_count = 0;
  static  unsigned long long aesl_llvm_cbe_917_count = 0;
  double llvm_cbe_tmp__281;
  static  unsigned long long aesl_llvm_cbe_918_count = 0;
  static  unsigned long long aesl_llvm_cbe_919_count = 0;
  static  unsigned long long aesl_llvm_cbe_920_count = 0;
  static  unsigned long long aesl_llvm_cbe_921_count = 0;
  static  unsigned long long aesl_llvm_cbe_922_count = 0;
  static  unsigned long long aesl_llvm_cbe_923_count = 0;
  static  unsigned long long aesl_llvm_cbe_924_count = 0;
  static  unsigned long long aesl_llvm_cbe_925_count = 0;
  static  unsigned long long aesl_llvm_cbe_926_count = 0;
   char *llvm_cbe_tmp__282;
  static  unsigned long long aesl_llvm_cbe_927_count = 0;
  unsigned char llvm_cbe_tmp__283;
  static  unsigned long long aesl_llvm_cbe_928_count = 0;
  static  unsigned long long aesl_llvm_cbe_929_count = 0;
  static  unsigned long long aesl_llvm_cbe_930_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__284;
  static  unsigned long long aesl_llvm_cbe_931_count = 0;
  l_struct_OC__iobuf *llvm_cbe_tmp__285;
  static  unsigned long long aesl_llvm_cbe_932_count = 0;
  unsigned int llvm_cbe_tmp__286;
  static  unsigned long long aesl_llvm_cbe_933_count = 0;
  static  unsigned long long aesl_llvm_cbe_934_count = 0;
  unsigned long long llvm_cbe_tmp__287;
  static  unsigned long long aesl_llvm_cbe_935_count = 0;
  double *llvm_cbe_tmp__288;
  static  unsigned long long aesl_llvm_cbe_936_count = 0;
  static  unsigned long long aesl_llvm_cbe_937_count = 0;
  unsigned int llvm_cbe_tmp__289;
  static  unsigned long long aesl_llvm_cbe_938_count = 0;
  static  unsigned long long aesl_llvm_cbe_939_count = 0;
  static  unsigned long long aesl_llvm_cbe_940_count = 0;
  static  unsigned long long aesl_llvm_cbe_941_count = 0;
  static  unsigned long long aesl_llvm_cbe_942_count = 0;
  static  unsigned long long aesl_llvm_cbe_943_count = 0;
  unsigned long long llvm_cbe_tmp__290;
  static  unsigned long long aesl_llvm_cbe_944_count = 0;
   char *llvm_cbe_tmp__291;
  static  unsigned long long aesl_llvm_cbe_945_count = 0;
  static  unsigned long long aesl_llvm_cbe_946_count = 0;
   char *llvm_cbe_tmp__292;
  static  unsigned long long aesl_llvm_cbe_947_count = 0;
  static  unsigned long long aesl_llvm_cbe_948_count = 0;
  static  unsigned long long aesl_llvm_cbe_949_count = 0;
  unsigned long long llvm_cbe_tmp__293;
  static  unsigned long long aesl_llvm_cbe_950_count = 0;
   char *llvm_cbe_tmp__294;
  static  unsigned long long aesl_llvm_cbe_951_count = 0;
  static  unsigned long long aesl_llvm_cbe_952_count = 0;
  static  unsigned long long aesl_llvm_cbe_953_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @parse_double_array\n");
  if (((llvm_cbe_s) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__295;
  } else {
    goto llvm_cbe_tmp__296;
  }

llvm_cbe_tmp__295:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str12, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 142) nounwind, !dbg !21 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_892_count);
  _assert(( char *)((&aesl_internal__OC_str12[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 142u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",142u);
}
  goto llvm_cbe_tmp__296;

llvm_cbe_tmp__296:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i8* @strtok(i8* %%s, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !21 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_894_count);
  llvm_cbe_tmp__279 = ( char *)( char *)strtok(( char *)llvm_cbe_s, ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__279);
}
  llvm_cbe_tmp__280__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__279;   /* for PHI node */
  goto llvm_cbe_tmp__297;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__297:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i32 [ 0, %%3 ], [ %%22, %%19  for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_897_count);
  llvm_cbe_tmp__280 = (unsigned int )llvm_cbe_tmp__280__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__280);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__289);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i8* [ %%4, %%3 ], [ %%25, %%19  for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = ( char *)llvm_cbe_storemerge__PHI_TEMPORARY;
  if (((llvm_cbe_storemerge) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe__2e_critedge_2e_thread;
  } else {
    goto llvm_cbe_tmp__298;
  }

llvm_cbe_tmp__299:
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = sext i32 %%6 to i64, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_934_count);
  llvm_cbe_tmp__287 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__280);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__287);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds double* %%arr, i64 %%20, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_935_count);
  llvm_cbe_tmp__288 = (double *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__287))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__287));
}
if (AESL_DEBUG_TRACE)
printf("\n  store double %%11, double* %%21, align 8, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_936_count);
  *llvm_cbe_tmp__288 = llvm_cbe_tmp__281;
if (AESL_DEBUG_TRACE)
printf("\n = %lf\n", llvm_cbe_tmp__281);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = add nsw i32 %%6, 1, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_937_count);
  llvm_cbe_tmp__289 = (unsigned int )((unsigned int )(llvm_cbe_tmp__280&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__289&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_943_count);
  llvm_cbe_tmp__290 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__290);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = getelementptr inbounds i8* %%storemerge, i64 %%23, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_944_count);
  llvm_cbe_tmp__291 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__290))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__290));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%24, align 1, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_945_count);
  *llvm_cbe_tmp__291 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0)) nounwind, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_946_count);
  llvm_cbe_tmp__292 = ( char *)( char *)strtok(( char *)(( char *)/*NULL*/0), ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__292);
}
  llvm_cbe_tmp__280__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__289;   /* for PHI node */
  llvm_cbe_storemerge__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__292;   /* for PHI node */
  goto llvm_cbe_tmp__297;

llvm_cbe_tmp__300:
if (AESL_DEBUG_TRACE)
printf("\n  store i8* %%storemerge, i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_916_count);
  *(&llvm_cbe_endptr) = ( char *)llvm_cbe_storemerge;
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = call double @__strtod(i8* %%storemerge, i8** %%endptr) nounwind, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_917_count);
  llvm_cbe_tmp__281 = (double )__strtod(( char *)llvm_cbe_storemerge, ( char **)(&llvm_cbe_endptr));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = %lf",llvm_cbe_tmp__281);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load i8** %%endptr, align 8, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_926_count);
  llvm_cbe_tmp__282 = ( char *)*(&llvm_cbe_endptr);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8* %%12, align 1, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_927_count);
  llvm_cbe_tmp__283 = (unsigned char )*llvm_cbe_tmp__282;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__283);
  if (((llvm_cbe_tmp__283&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__299;
  } else {
    goto llvm_cbe_tmp__301;
  }

llvm_cbe_tmp__298:
  if ((((signed int )llvm_cbe_tmp__280) < ((signed int )llvm_cbe_n))) {
    goto llvm_cbe_tmp__300;
  } else {
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__301:
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = call %%struct._iobuf* @__iob_func() nounwind, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_930_count);
  llvm_cbe_tmp__284 = (l_struct_OC__iobuf *)__iob_func();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__284);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = getelementptr inbounds %%struct._iobuf* %%16, i64 2, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_931_count);
  llvm_cbe_tmp__285 = (l_struct_OC__iobuf *)(&llvm_cbe_tmp__284[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = call i32 (%%struct._iobuf*, i8*, ...)* @fprintf(%%struct._iobuf* %%17, i8* getelementptr inbounds ([35 x i8]* @aesl_internal_.str14, i64 0, i64 0), i32 %%6) nounwind, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_932_count);
  fprintf((l_struct_OC__iobuf *)llvm_cbe_tmp__285, ( char *)((&aesl_internal__OC_str14[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 35
#endif
])), llvm_cbe_tmp__280);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__280);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__286);
}
  goto llvm_cbe_tmp__299;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = call i64 @strlen(i8* %%storemerge) nounwind, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_949_count);
  llvm_cbe_tmp__293 = (unsigned long long )strlen(( char *)llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__293);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = getelementptr inbounds i8* %%storemerge, i64 %%26, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_950_count);
  llvm_cbe_tmp__294 = ( char *)(&llvm_cbe_storemerge[(((signed long long )llvm_cbe_tmp__293))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__293));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 10, i8* %%27, align 1, !dbg !22 for 0x%I64xth hint within @parse_double_array  --> \n", ++aesl_llvm_cbe_951_count);
  *llvm_cbe_tmp__294 = ((unsigned char )10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )10));
  goto llvm_cbe__2e_critedge_2e_thread;

llvm_cbe__2e_critedge_2e_thread:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @parse_double_array}\n");
  return 0u;
}


signed int write_string(signed int llvm_cbe_fd,  char *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_954_count = 0;
  static  unsigned long long aesl_llvm_cbe_955_count = 0;
  static  unsigned long long aesl_llvm_cbe_956_count = 0;
  static  unsigned long long aesl_llvm_cbe_957_count = 0;
  static  unsigned long long aesl_llvm_cbe_958_count = 0;
  static  unsigned long long aesl_llvm_cbe_959_count = 0;
  static  unsigned long long aesl_llvm_cbe_960_count = 0;
  static  unsigned long long aesl_llvm_cbe_961_count = 0;
  static  unsigned long long aesl_llvm_cbe_962_count = 0;
  static  unsigned long long aesl_llvm_cbe_963_count = 0;
  static  unsigned long long aesl_llvm_cbe_964_count = 0;
  static  unsigned long long aesl_llvm_cbe_965_count = 0;
  static  unsigned long long aesl_llvm_cbe_966_count = 0;
  static  unsigned long long aesl_llvm_cbe_967_count = 0;
  static  unsigned long long aesl_llvm_cbe_968_count = 0;
  static  unsigned long long aesl_llvm_cbe_969_count = 0;
  static  unsigned long long aesl_llvm_cbe_970_count = 0;
  static  unsigned long long aesl_llvm_cbe_971_count = 0;
  unsigned long long llvm_cbe_tmp__302;
  static  unsigned long long aesl_llvm_cbe_972_count = 0;
  unsigned int llvm_cbe_tmp__303;
  static  unsigned long long aesl_llvm_cbe_973_count = 0;
  static  unsigned long long aesl_llvm_cbe_974_count = 0;
  static  unsigned long long aesl_llvm_cbe_975_count = 0;
  static  unsigned long long aesl_llvm_cbe_976_count = 0;
  static  unsigned long long aesl_llvm_cbe_977_count = 0;
  static  unsigned long long aesl_llvm_cbe_978_count = 0;
  unsigned int llvm_cbe_tmp__304;
  unsigned int llvm_cbe_tmp__304__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_979_count = 0;
  static  unsigned long long aesl_llvm_cbe_980_count = 0;
  static  unsigned long long aesl_llvm_cbe_981_count = 0;
  static  unsigned long long aesl_llvm_cbe_982_count = 0;
  static  unsigned long long aesl_llvm_cbe_983_count = 0;
  static  unsigned long long aesl_llvm_cbe_984_count = 0;
  static  unsigned long long aesl_llvm_cbe_985_count = 0;
  static  unsigned long long aesl_llvm_cbe_986_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_987_count = 0;
  unsigned long long llvm_cbe_tmp__305;
  static  unsigned long long aesl_llvm_cbe_988_count = 0;
   char *llvm_cbe_tmp__306;
  static  unsigned long long aesl_llvm_cbe_989_count = 0;
  unsigned int llvm_cbe_tmp__307;
  static  unsigned long long aesl_llvm_cbe_990_count = 0;
  unsigned int llvm_cbe_tmp__308;
  static  unsigned long long aesl_llvm_cbe_991_count = 0;
  static  unsigned long long aesl_llvm_cbe_992_count = 0;
  static  unsigned long long aesl_llvm_cbe_993_count = 0;
  static  unsigned long long aesl_llvm_cbe_994_count = 0;
  static  unsigned long long aesl_llvm_cbe_995_count = 0;
  static  unsigned long long aesl_llvm_cbe_996_count = 0;
  static  unsigned long long aesl_llvm_cbe_997_count = 0;
  static  unsigned long long aesl_llvm_cbe_998_count = 0;
  static  unsigned long long aesl_llvm_cbe_999_count = 0;
  static  unsigned long long aesl_llvm_cbe_1000_count = 0;
  unsigned int llvm_cbe_tmp__309;
  static  unsigned long long aesl_llvm_cbe_1001_count = 0;
  static  unsigned long long aesl_llvm_cbe_1002_count = 0;
  static  unsigned long long aesl_llvm_cbe_1003_count = 0;
  static  unsigned long long aesl_llvm_cbe_1004_count = 0;
  static  unsigned long long aesl_llvm_cbe_1005_count = 0;
  static  unsigned long long aesl_llvm_cbe_1006_count = 0;
  static  unsigned long long aesl_llvm_cbe_1007_count = 0;
  static  unsigned long long aesl_llvm_cbe_1008_count = 0;
  unsigned int llvm_cbe_tmp__310;
  static  unsigned long long aesl_llvm_cbe_1009_count = 0;
  static  unsigned long long aesl_llvm_cbe_1010_count = 0;
  static  unsigned long long aesl_llvm_cbe_1011_count = 0;
  static  unsigned long long aesl_llvm_cbe_1012_count = 0;
  static  unsigned long long aesl_llvm_cbe_1013_count = 0;
  static  unsigned long long aesl_llvm_cbe_1014_count = 0;
  static  unsigned long long aesl_llvm_cbe_1015_count = 0;
  static  unsigned long long aesl_llvm_cbe_1016_count = 0;
  static  unsigned long long aesl_llvm_cbe_1017_count = 0;
  static  unsigned long long aesl_llvm_cbe_1018_count = 0;
  static  unsigned long long aesl_llvm_cbe_1019_count = 0;
  static  unsigned long long aesl_llvm_cbe_1020_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_string\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__311;
  } else {
    goto llvm_cbe_tmp__312;
  }

llvm_cbe_tmp__312:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 147) nounwind, !dbg !21 for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_967_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 147u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",147u);
}
  goto llvm_cbe_tmp__311;

llvm_cbe_tmp__311:
  if ((((signed int )llvm_cbe_n) < ((signed int )0u))) {
    goto llvm_cbe_tmp__313;
  } else {
    llvm_cbe_tmp__304__PHI_TEMPORARY = (unsigned int )llvm_cbe_n;   /* for PHI node */
    goto llvm_cbe_tmp__314;
  }

llvm_cbe_tmp__313:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = tail call i64 @strlen(i8* %%arr) nounwind, !dbg !22 for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_971_count);
  llvm_cbe_tmp__302 = (unsigned long long ) /*tail*/ strlen(( char *)llvm_cbe_arr);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%I64X",llvm_cbe_tmp__302);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = trunc i64 %%6 to i32, !dbg !22 for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_972_count);
  llvm_cbe_tmp__303 = (unsigned int )((unsigned int )llvm_cbe_tmp__302&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__303);
  llvm_cbe_tmp__304__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__303;   /* for PHI node */
  goto llvm_cbe_tmp__314;

llvm_cbe_tmp__314:
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = phi i32 [ %%7, %%5 ], [ %%n, %%3  for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_978_count);
  llvm_cbe_tmp__304 = (unsigned int )llvm_cbe_tmp__304__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__304);
printf("\n = 0x%X",llvm_cbe_tmp__303);
printf("\nn = 0x%X",llvm_cbe_n);
}
  if ((((signed int )llvm_cbe_tmp__304) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e_preheader;
  }

llvm_cbe__2e_preheader:
  goto llvm_cbe_tmp__315;

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%18, %%17 ], [ 0, %%8  for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__309);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = sext i32 %%storemerge1 to i64, !dbg !22 for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_987_count);
  llvm_cbe_tmp__305 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__305);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds i8* %%arr, i64 %%11, !dbg !22 for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_988_count);
  llvm_cbe_tmp__306 = ( char *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__305))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__305));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = sub nsw i32 %%9, %%storemerge1, !dbg !22 for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_989_count);
  llvm_cbe_tmp__307 = (unsigned int )((unsigned int )(llvm_cbe_tmp__304&4294967295ull)) - ((unsigned int )(llvm_cbe_storemerge1&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__307&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = tail call i32 @write(i32 %%fd, i8* %%12, i32 %%13) nounwind, !dbg !22 for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_990_count);
  llvm_cbe_tmp__308 = (unsigned int ) /*tail*/ write(llvm_cbe_fd, ( char *)llvm_cbe_tmp__306, llvm_cbe_tmp__307);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__307);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__308);
}
  if ((((signed int )llvm_cbe_tmp__308) > ((signed int )4294967295u))) {
    goto llvm_cbe_tmp__316;
  } else {
    goto llvm_cbe_tmp__317;
  }

llvm_cbe_tmp__316:
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = add nsw i32 %%14, %%storemerge1, !dbg !23 for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_1000_count);
  llvm_cbe_tmp__309 = (unsigned int )((unsigned int )(llvm_cbe_tmp__308&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge1&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__309&4294967295ull)));
  if ((((signed int )llvm_cbe_tmp__309) < ((signed int )llvm_cbe_tmp__304))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__309;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e_preheader;
  }

llvm_cbe_tmp__317:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([28 x i8]* @aesl_internal_.str16, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 154) nounwind, !dbg !23 for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_998_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str16[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 28
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 154u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",154u);
}
  goto llvm_cbe_tmp__316;

  } while (1); /* end of syntactic loop '.lr.ph' */
  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__315:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = tail call i32 @write(i32 %%fd, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str13, i64 0, i64 0), i32 1) nounwind, !dbg !22 for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_1008_count);
  llvm_cbe_tmp__310 = (unsigned int ) /*tail*/ write(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str13[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])), 1u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%X",1u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__310);
}
  if ((((signed int )llvm_cbe_tmp__310) > ((signed int )4294967295u))) {
    goto llvm_cbe_tmp__318;
  } else {
    goto llvm_cbe_tmp__319;
  }

llvm_cbe_tmp__318:
  if (((llvm_cbe_tmp__310&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__315;
  } else {
    goto llvm_cbe_tmp__320;
  }

llvm_cbe_tmp__319:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([28 x i8]* @aesl_internal_.str16, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 160) nounwind, !dbg !23 for 0x%I64xth hint within @write_string  --> \n", ++aesl_llvm_cbe_1016_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str16[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 28
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 160u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",160u);
}
  goto llvm_cbe_tmp__318;

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__320:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_string}\n");
  return 0u;
}


signed int write_uint8_t_array(signed int llvm_cbe_fd,  char *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1021_count = 0;
  static  unsigned long long aesl_llvm_cbe_1022_count = 0;
  static  unsigned long long aesl_llvm_cbe_1023_count = 0;
  static  unsigned long long aesl_llvm_cbe_1024_count = 0;
  static  unsigned long long aesl_llvm_cbe_1025_count = 0;
  static  unsigned long long aesl_llvm_cbe_1026_count = 0;
  static  unsigned long long aesl_llvm_cbe_1027_count = 0;
  static  unsigned long long aesl_llvm_cbe_1028_count = 0;
  static  unsigned long long aesl_llvm_cbe_1029_count = 0;
  static  unsigned long long aesl_llvm_cbe_1030_count = 0;
  static  unsigned long long aesl_llvm_cbe_1031_count = 0;
  static  unsigned long long aesl_llvm_cbe_1032_count = 0;
  static  unsigned long long aesl_llvm_cbe_1033_count = 0;
  static  unsigned long long aesl_llvm_cbe_1034_count = 0;
  static  unsigned long long aesl_llvm_cbe_1035_count = 0;
  static  unsigned long long aesl_llvm_cbe_1036_count = 0;
  static  unsigned long long aesl_llvm_cbe_1037_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1038_count = 0;
  unsigned long long llvm_cbe_tmp__321;
  static  unsigned long long aesl_llvm_cbe_1039_count = 0;
   char *llvm_cbe_tmp__322;
  static  unsigned long long aesl_llvm_cbe_1040_count = 0;
  unsigned char llvm_cbe_tmp__323;
  static  unsigned long long aesl_llvm_cbe_1041_count = 0;
  unsigned int llvm_cbe_tmp__324;
  static  unsigned long long aesl_llvm_cbe_1042_count = 0;
  static  unsigned long long aesl_llvm_cbe_1043_count = 0;
  unsigned int llvm_cbe_tmp__325;
  static  unsigned long long aesl_llvm_cbe_1044_count = 0;
  static  unsigned long long aesl_llvm_cbe_1045_count = 0;
  static  unsigned long long aesl_llvm_cbe_1046_count = 0;
  static  unsigned long long aesl_llvm_cbe_1047_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_1048_count = 0;
  static  unsigned long long aesl_llvm_cbe_1049_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_uint8_t_array\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__326;
  } else {
    goto llvm_cbe_tmp__327;
  }

llvm_cbe_tmp__327:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 177) nounwind, !dbg !21 for 0x%I64xth hint within @write_uint8_t_array  --> \n", ++aesl_llvm_cbe_1030_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 177u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",177u);
}
  goto llvm_cbe_tmp__326;

llvm_cbe_tmp__326:
  if ((((signed int )llvm_cbe_n) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%9, %%.lr.ph ], [ 0, %%3  for 0x%I64xth hint within @write_uint8_t_array  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__325);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%storemerge1 to i64, !dbg !22 for 0x%I64xth hint within @write_uint8_t_array  --> \n", ++aesl_llvm_cbe_1038_count);
  llvm_cbe_tmp__321 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__321);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i8* %%arr, i64 %%5, !dbg !22 for 0x%I64xth hint within @write_uint8_t_array  --> \n", ++aesl_llvm_cbe_1039_count);
  llvm_cbe_tmp__322 = ( char *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__321))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__321));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i8* %%6, align 1, !dbg !22 for 0x%I64xth hint within @write_uint8_t_array  --> \n", ++aesl_llvm_cbe_1040_count);
  llvm_cbe_tmp__323 = (unsigned char )*llvm_cbe_tmp__322;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__323);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = zext i8 %%7 to i32, !dbg !22 for 0x%I64xth hint within @write_uint8_t_array  --> \n", ++aesl_llvm_cbe_1041_count);
  llvm_cbe_tmp__324 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__323&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__324);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (i32, i8*, ...)* @aesl_internal_fd_printf(i32 %%fd, i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str17, i64 0, i64 0), i32 %%8), !dbg !22 for 0x%I64xth hint within @write_uint8_t_array  --> \n", ++aesl_llvm_cbe_1042_count);
   /*tail*/ aesl_internal_fd_printf(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str17[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__324);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__324);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%storemerge1, 1, !dbg !22 for 0x%I64xth hint within @write_uint8_t_array  --> \n", ++aesl_llvm_cbe_1043_count);
  llvm_cbe_tmp__325 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__325&4294967295ull)));
  if (((llvm_cbe_tmp__325&4294967295U) == (llvm_cbe_n&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__325;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_uint8_t_array}\n");
  return 0u;
}


static void aesl_internal_fd_printf(signed int llvm_cbe_fd,  char *llvm_cbe_format, ...) {
  static  unsigned long long aesl_llvm_cbe_args_count = 0;
   char *llvm_cbe_args;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_buffer_count = 0;
   char llvm_cbe_buffer[256];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_1050_count = 0;
  static  unsigned long long aesl_llvm_cbe_1051_count = 0;
  static  unsigned long long aesl_llvm_cbe_1052_count = 0;
  static  unsigned long long aesl_llvm_cbe_1053_count = 0;
  static  unsigned long long aesl_llvm_cbe_1054_count = 0;
  static  unsigned long long aesl_llvm_cbe_1055_count = 0;
  static  unsigned long long aesl_llvm_cbe_1056_count = 0;
   char *llvm_cbe_tmp__328;
  static  unsigned long long aesl_llvm_cbe_1057_count = 0;
  static  unsigned long long aesl_llvm_cbe_1058_count = 0;
   char *llvm_cbe_tmp__329;
  static  unsigned long long aesl_llvm_cbe_1059_count = 0;
  static  unsigned long long aesl_llvm_cbe_1060_count = 0;
  static  unsigned long long aesl_llvm_cbe_1061_count = 0;
  static  unsigned long long aesl_llvm_cbe_1062_count = 0;
  static  unsigned long long aesl_llvm_cbe_1063_count = 0;
  static  unsigned long long aesl_llvm_cbe_1064_count = 0;
  static  unsigned long long aesl_llvm_cbe_1065_count = 0;
   char *llvm_cbe_tmp__330;
  static  unsigned long long aesl_llvm_cbe_1066_count = 0;
  unsigned int llvm_cbe_tmp__331;
  static  unsigned long long aesl_llvm_cbe_1067_count = 0;
  static  unsigned long long aesl_llvm_cbe_1068_count = 0;
  static  unsigned long long aesl_llvm_cbe_1069_count = 0;
  static  unsigned long long aesl_llvm_cbe_1070_count = 0;
  static  unsigned long long aesl_llvm_cbe_1071_count = 0;
  static  unsigned long long aesl_llvm_cbe_1072_count = 0;
  static  unsigned long long aesl_llvm_cbe_1073_count = 0;
  static  unsigned long long aesl_llvm_cbe_1074_count = 0;
  static  unsigned long long aesl_llvm_cbe_1075_count = 0;
  static  unsigned long long aesl_llvm_cbe_1076_count = 0;
  static  unsigned long long aesl_llvm_cbe_1077_count = 0;
  static  unsigned long long aesl_llvm_cbe_1078_count = 0;
  static  unsigned long long aesl_llvm_cbe_1079_count = 0;
  static  unsigned long long aesl_llvm_cbe_1080_count = 0;
  static  unsigned long long aesl_llvm_cbe_1081_count = 0;
  static  unsigned long long aesl_llvm_cbe_1082_count = 0;
  static  unsigned long long aesl_llvm_cbe_1083_count = 0;
  static  unsigned long long aesl_llvm_cbe_1084_count = 0;
  static  unsigned long long aesl_llvm_cbe_1085_count = 0;
  static  unsigned long long aesl_llvm_cbe_1086_count = 0;
  static  unsigned long long aesl_llvm_cbe_1087_count = 0;
  static  unsigned long long aesl_llvm_cbe_1088_count = 0;
  static  unsigned long long aesl_llvm_cbe_1089_count = 0;
  static  unsigned long long aesl_llvm_cbe_1090_count = 0;
  static  unsigned long long aesl_llvm_cbe_1091_count = 0;
  static  unsigned long long aesl_llvm_cbe_1092_count = 0;
  static  unsigned long long aesl_llvm_cbe_1093_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1094_count = 0;
  unsigned long long llvm_cbe_tmp__332;
  static  unsigned long long aesl_llvm_cbe_1095_count = 0;
   char *llvm_cbe_tmp__333;
  static  unsigned long long aesl_llvm_cbe_1096_count = 0;
  unsigned int llvm_cbe_tmp__334;
  static  unsigned long long aesl_llvm_cbe_1097_count = 0;
  unsigned int llvm_cbe_tmp__335;
  static  unsigned long long aesl_llvm_cbe_1098_count = 0;
  static  unsigned long long aesl_llvm_cbe_1099_count = 0;
  static  unsigned long long aesl_llvm_cbe_1100_count = 0;
  static  unsigned long long aesl_llvm_cbe_1101_count = 0;
  static  unsigned long long aesl_llvm_cbe_1102_count = 0;
  static  unsigned long long aesl_llvm_cbe_1103_count = 0;
  static  unsigned long long aesl_llvm_cbe_1104_count = 0;
  static  unsigned long long aesl_llvm_cbe_1105_count = 0;
  unsigned int llvm_cbe_tmp__336;
  static  unsigned long long aesl_llvm_cbe_1106_count = 0;
  static  unsigned long long aesl_llvm_cbe_1107_count = 0;
  static  unsigned long long aesl_llvm_cbe_1108_count = 0;
  static  unsigned long long aesl_llvm_cbe_1109_count = 0;
  static  unsigned long long aesl_llvm_cbe_1110_count = 0;
  static  unsigned long long aesl_llvm_cbe_1111_count = 0;
  static  unsigned long long aesl_llvm_cbe_1112_count = 0;
  static  unsigned long long aesl_llvm_cbe_1113_count = 0;
  static  unsigned long long aesl_llvm_cbe_1114_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_2e_lcssa_count = 0;
  unsigned int llvm_cbe_storemerge_2e_lcssa;
  unsigned int llvm_cbe_storemerge_2e_lcssa__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1115_count = 0;
  static  unsigned long long aesl_llvm_cbe_1116_count = 0;
  static  unsigned long long aesl_llvm_cbe_1117_count = 0;
  static  unsigned long long aesl_llvm_cbe_1118_count = 0;
  static  unsigned long long aesl_llvm_cbe_1119_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aesl_internal_fd_printf\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = bitcast i8** %%args to i8*, !dbg !23 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1056_count);
  llvm_cbe_tmp__328 = ( char *)(( char *)(&llvm_cbe_args));
if (AESL_DEBUG_TRACE)
printf("\n  call void @llvm.va_start(i8* %%1), !dbg !23 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1057_count);
  0; va_start(*(va_list*)llvm_cbe_tmp__328, llvm_cbe_format);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = getelementptr inbounds [256 x i8]* %%buffer, i64 0, i64 0, !dbg !22 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1058_count);
  llvm_cbe_tmp__329 = ( char *)(&llvm_cbe_buffer[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = load i8** %%args, align 8, !dbg !22 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1065_count);
  llvm_cbe_tmp__330 = ( char *)*(&llvm_cbe_args);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i32 @vsnprintf(i8* %%2, i64 256, i8* %%format, i8* %%3) nounwind, !dbg !22 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1066_count);
  llvm_cbe_tmp__331 = (unsigned int )vsnprintf(( char *)llvm_cbe_tmp__329, 256ull, ( char *)llvm_cbe_format, ( char *)llvm_cbe_tmp__330);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%I64X",256ull);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__331);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @llvm.va_end(i8* %%1), !dbg !23 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1072_count);
  0; va_end(*(va_list*)llvm_cbe_tmp__328);
if (AESL_DEBUG_TRACE) {
}
  if ((((signed int )llvm_cbe_tmp__331) < ((signed int )256u))) {
    goto llvm_cbe_tmp__337;
  } else {
    goto llvm_cbe__2e_thread;
  }

llvm_cbe__2e_thread:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([90 x i8]* @aesl_internal_.str24, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 22) nounwind, !dbg !23 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1075_count);
  _assert(( char *)((&aesl_internal__OC_str24[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 90
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 22u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",22u);
}
  goto llvm_cbe__2e_lr_2e_ph;

llvm_cbe_tmp__337:
  if ((((signed int )llvm_cbe_tmp__331) > ((signed int )0u))) {
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    llvm_cbe_storemerge_2e_lcssa__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  }

llvm_cbe__2e_lr_2e_ph:
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__338;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__338:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ 0, %%.lr.ph ], [ %%16, %%15  for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__336);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = sext i32 %%storemerge1 to i64, !dbg !21 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1094_count);
  llvm_cbe_tmp__332 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__332);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr inbounds [256 x i8]* %%buffer, i64 0, i64 %%9, !dbg !21 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1095_count);
  llvm_cbe_tmp__333 = ( char *)(&llvm_cbe_buffer[(((signed long long )llvm_cbe_tmp__332))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__332));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = sub nsw i32 %%4, %%storemerge1, !dbg !21 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1096_count);
  llvm_cbe_tmp__334 = (unsigned int )((unsigned int )(llvm_cbe_tmp__331&4294967295ull)) - ((unsigned int )(llvm_cbe_storemerge1&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__334&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = call i32 @write(i32 %%fd, i8* %%10, i32 %%11) nounwind, !dbg !21 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1097_count);
  llvm_cbe_tmp__335 = (unsigned int )write(llvm_cbe_fd, ( char *)llvm_cbe_tmp__333, llvm_cbe_tmp__334);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__334);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__335);
}
  if ((((signed int )llvm_cbe_tmp__335) > ((signed int )4294967295u))) {
    goto llvm_cbe_tmp__339;
  } else {
    goto llvm_cbe_tmp__340;
  }

llvm_cbe_tmp__339:
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = add nsw i32 %%12, %%storemerge1, !dbg !24 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1105_count);
  llvm_cbe_tmp__336 = (unsigned int )((unsigned int )(llvm_cbe_tmp__335&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge1&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__336&4294967295ull)));
  if ((((signed int )llvm_cbe_tmp__336) < ((signed int )llvm_cbe_tmp__331))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__336;   /* for PHI node */
    goto llvm_cbe_tmp__338;
  } else {
    llvm_cbe_storemerge_2e_lcssa__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__336;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  }

llvm_cbe_tmp__340:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([28 x i8]* @aesl_internal_.str16, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 26) nounwind, !dbg !24 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1103_count);
  _assert(( char *)((&aesl_internal__OC_str16[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 28
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 26u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",26u);
}
  goto llvm_cbe_tmp__339;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e__crit_edge:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge.lcssa = phi i32 [ 0, %%6 ], [ %%16, %%15  for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_storemerge_2e_lcssa_count);
  llvm_cbe_storemerge_2e_lcssa = (unsigned int )llvm_cbe_storemerge_2e_lcssa__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge.lcssa = 0x%X",llvm_cbe_storemerge_2e_lcssa);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__336);
}
  if (((llvm_cbe_storemerge_2e_lcssa&4294967295U) == (llvm_cbe_tmp__331&4294967295U))) {
    goto llvm_cbe_tmp__341;
  } else {
    goto llvm_cbe_tmp__342;
  }

llvm_cbe_tmp__342:
if (AESL_DEBUG_TRACE)
printf("\n  call void @_assert(i8* getelementptr inbounds ([50 x i8]* @aesl_internal_.str26, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 29) nounwind, !dbg !23 for 0x%I64xth hint within @aesl_internal_fd_printf  --> \n", ++aesl_llvm_cbe_1117_count);
  _assert(( char *)((&aesl_internal__OC_str26[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 50
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 29u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",29u);
}
  goto llvm_cbe_tmp__341;

llvm_cbe_tmp__341:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aesl_internal_fd_printf}\n");
  return;
}


signed int write_uint16_t_array(signed int llvm_cbe_fd, signed short *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1120_count = 0;
  static  unsigned long long aesl_llvm_cbe_1121_count = 0;
  static  unsigned long long aesl_llvm_cbe_1122_count = 0;
  static  unsigned long long aesl_llvm_cbe_1123_count = 0;
  static  unsigned long long aesl_llvm_cbe_1124_count = 0;
  static  unsigned long long aesl_llvm_cbe_1125_count = 0;
  static  unsigned long long aesl_llvm_cbe_1126_count = 0;
  static  unsigned long long aesl_llvm_cbe_1127_count = 0;
  static  unsigned long long aesl_llvm_cbe_1128_count = 0;
  static  unsigned long long aesl_llvm_cbe_1129_count = 0;
  static  unsigned long long aesl_llvm_cbe_1130_count = 0;
  static  unsigned long long aesl_llvm_cbe_1131_count = 0;
  static  unsigned long long aesl_llvm_cbe_1132_count = 0;
  static  unsigned long long aesl_llvm_cbe_1133_count = 0;
  static  unsigned long long aesl_llvm_cbe_1134_count = 0;
  static  unsigned long long aesl_llvm_cbe_1135_count = 0;
  static  unsigned long long aesl_llvm_cbe_1136_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1137_count = 0;
  unsigned long long llvm_cbe_tmp__343;
  static  unsigned long long aesl_llvm_cbe_1138_count = 0;
  signed short *llvm_cbe_tmp__344;
  static  unsigned long long aesl_llvm_cbe_1139_count = 0;
  unsigned short llvm_cbe_tmp__345;
  static  unsigned long long aesl_llvm_cbe_1140_count = 0;
  unsigned int llvm_cbe_tmp__346;
  static  unsigned long long aesl_llvm_cbe_1141_count = 0;
  static  unsigned long long aesl_llvm_cbe_1142_count = 0;
  unsigned int llvm_cbe_tmp__347;
  static  unsigned long long aesl_llvm_cbe_1143_count = 0;
  static  unsigned long long aesl_llvm_cbe_1144_count = 0;
  static  unsigned long long aesl_llvm_cbe_1145_count = 0;
  static  unsigned long long aesl_llvm_cbe_1146_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_1147_count = 0;
  static  unsigned long long aesl_llvm_cbe_1148_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_uint16_t_array\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__348;
  } else {
    goto llvm_cbe_tmp__349;
  }

llvm_cbe_tmp__349:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 178) nounwind, !dbg !21 for 0x%I64xth hint within @write_uint16_t_array  --> \n", ++aesl_llvm_cbe_1129_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 178u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",178u);
}
  goto llvm_cbe_tmp__348;

llvm_cbe_tmp__348:
  if ((((signed int )llvm_cbe_n) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%9, %%.lr.ph ], [ 0, %%3  for 0x%I64xth hint within @write_uint16_t_array  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__347);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%storemerge1 to i64, !dbg !22 for 0x%I64xth hint within @write_uint16_t_array  --> \n", ++aesl_llvm_cbe_1137_count);
  llvm_cbe_tmp__343 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__343);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i16* %%arr, i64 %%5, !dbg !22 for 0x%I64xth hint within @write_uint16_t_array  --> \n", ++aesl_llvm_cbe_1138_count);
  llvm_cbe_tmp__344 = (signed short *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__343))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__343));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i16* %%6, align 2, !dbg !22 for 0x%I64xth hint within @write_uint16_t_array  --> \n", ++aesl_llvm_cbe_1139_count);
  llvm_cbe_tmp__345 = (unsigned short )*llvm_cbe_tmp__344;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__345);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = zext i16 %%7 to i32, !dbg !22 for 0x%I64xth hint within @write_uint16_t_array  --> \n", ++aesl_llvm_cbe_1140_count);
  llvm_cbe_tmp__346 = (unsigned int )((unsigned int )(unsigned short )llvm_cbe_tmp__345&65535U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__346);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (i32, i8*, ...)* @aesl_internal_fd_printf(i32 %%fd, i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str17, i64 0, i64 0), i32 %%8), !dbg !22 for 0x%I64xth hint within @write_uint16_t_array  --> \n", ++aesl_llvm_cbe_1141_count);
   /*tail*/ aesl_internal_fd_printf(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str17[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__346);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__346);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%storemerge1, 1, !dbg !22 for 0x%I64xth hint within @write_uint16_t_array  --> \n", ++aesl_llvm_cbe_1142_count);
  llvm_cbe_tmp__347 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__347&4294967295ull)));
  if (((llvm_cbe_tmp__347&4294967295U) == (llvm_cbe_n&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__347;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_uint16_t_array}\n");
  return 0u;
}


signed int write_uint32_t_array(signed int llvm_cbe_fd, signed int *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1149_count = 0;
  static  unsigned long long aesl_llvm_cbe_1150_count = 0;
  static  unsigned long long aesl_llvm_cbe_1151_count = 0;
  static  unsigned long long aesl_llvm_cbe_1152_count = 0;
  static  unsigned long long aesl_llvm_cbe_1153_count = 0;
  static  unsigned long long aesl_llvm_cbe_1154_count = 0;
  static  unsigned long long aesl_llvm_cbe_1155_count = 0;
  static  unsigned long long aesl_llvm_cbe_1156_count = 0;
  static  unsigned long long aesl_llvm_cbe_1157_count = 0;
  static  unsigned long long aesl_llvm_cbe_1158_count = 0;
  static  unsigned long long aesl_llvm_cbe_1159_count = 0;
  static  unsigned long long aesl_llvm_cbe_1160_count = 0;
  static  unsigned long long aesl_llvm_cbe_1161_count = 0;
  static  unsigned long long aesl_llvm_cbe_1162_count = 0;
  static  unsigned long long aesl_llvm_cbe_1163_count = 0;
  static  unsigned long long aesl_llvm_cbe_1164_count = 0;
  static  unsigned long long aesl_llvm_cbe_1165_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1166_count = 0;
  unsigned long long llvm_cbe_tmp__350;
  static  unsigned long long aesl_llvm_cbe_1167_count = 0;
  signed int *llvm_cbe_tmp__351;
  static  unsigned long long aesl_llvm_cbe_1168_count = 0;
  unsigned int llvm_cbe_tmp__352;
  static  unsigned long long aesl_llvm_cbe_1169_count = 0;
  static  unsigned long long aesl_llvm_cbe_1170_count = 0;
  unsigned int llvm_cbe_tmp__353;
  static  unsigned long long aesl_llvm_cbe_1171_count = 0;
  static  unsigned long long aesl_llvm_cbe_1172_count = 0;
  static  unsigned long long aesl_llvm_cbe_1173_count = 0;
  static  unsigned long long aesl_llvm_cbe_1174_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_1175_count = 0;
  static  unsigned long long aesl_llvm_cbe_1176_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_uint32_t_array\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__354;
  } else {
    goto llvm_cbe_tmp__355;
  }

llvm_cbe_tmp__355:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 179) nounwind, !dbg !21 for 0x%I64xth hint within @write_uint32_t_array  --> \n", ++aesl_llvm_cbe_1158_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 179u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",179u);
}
  goto llvm_cbe_tmp__354;

llvm_cbe_tmp__354:
  if ((((signed int )llvm_cbe_n) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%8, %%.lr.ph ], [ 0, %%3  for 0x%I64xth hint within @write_uint32_t_array  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__353);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%storemerge1 to i64, !dbg !22 for 0x%I64xth hint within @write_uint32_t_array  --> \n", ++aesl_llvm_cbe_1166_count);
  llvm_cbe_tmp__350 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__350);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i32* %%arr, i64 %%5, !dbg !22 for 0x%I64xth hint within @write_uint32_t_array  --> \n", ++aesl_llvm_cbe_1167_count);
  llvm_cbe_tmp__351 = (signed int *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__350))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__350));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i32* %%6, align 4, !dbg !22 for 0x%I64xth hint within @write_uint32_t_array  --> \n", ++aesl_llvm_cbe_1168_count);
  llvm_cbe_tmp__352 = (unsigned int )*llvm_cbe_tmp__351;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__352);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (i32, i8*, ...)* @aesl_internal_fd_printf(i32 %%fd, i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str17, i64 0, i64 0), i32 %%7), !dbg !22 for 0x%I64xth hint within @write_uint32_t_array  --> \n", ++aesl_llvm_cbe_1169_count);
   /*tail*/ aesl_internal_fd_printf(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str17[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__352);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__352);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%storemerge1, 1, !dbg !22 for 0x%I64xth hint within @write_uint32_t_array  --> \n", ++aesl_llvm_cbe_1170_count);
  llvm_cbe_tmp__353 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__353&4294967295ull)));
  if (((llvm_cbe_tmp__353&4294967295U) == (llvm_cbe_n&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__353;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_uint32_t_array}\n");
  return 0u;
}


signed int write_uint64_t_array(signed int llvm_cbe_fd, signed long long *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1177_count = 0;
  static  unsigned long long aesl_llvm_cbe_1178_count = 0;
  static  unsigned long long aesl_llvm_cbe_1179_count = 0;
  static  unsigned long long aesl_llvm_cbe_1180_count = 0;
  static  unsigned long long aesl_llvm_cbe_1181_count = 0;
  static  unsigned long long aesl_llvm_cbe_1182_count = 0;
  static  unsigned long long aesl_llvm_cbe_1183_count = 0;
  static  unsigned long long aesl_llvm_cbe_1184_count = 0;
  static  unsigned long long aesl_llvm_cbe_1185_count = 0;
  static  unsigned long long aesl_llvm_cbe_1186_count = 0;
  static  unsigned long long aesl_llvm_cbe_1187_count = 0;
  static  unsigned long long aesl_llvm_cbe_1188_count = 0;
  static  unsigned long long aesl_llvm_cbe_1189_count = 0;
  static  unsigned long long aesl_llvm_cbe_1190_count = 0;
  static  unsigned long long aesl_llvm_cbe_1191_count = 0;
  static  unsigned long long aesl_llvm_cbe_1192_count = 0;
  static  unsigned long long aesl_llvm_cbe_1193_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1194_count = 0;
  unsigned long long llvm_cbe_tmp__356;
  static  unsigned long long aesl_llvm_cbe_1195_count = 0;
  signed long long *llvm_cbe_tmp__357;
  static  unsigned long long aesl_llvm_cbe_1196_count = 0;
  unsigned long long llvm_cbe_tmp__358;
  static  unsigned long long aesl_llvm_cbe_1197_count = 0;
  static  unsigned long long aesl_llvm_cbe_1198_count = 0;
  unsigned int llvm_cbe_tmp__359;
  static  unsigned long long aesl_llvm_cbe_1199_count = 0;
  static  unsigned long long aesl_llvm_cbe_1200_count = 0;
  static  unsigned long long aesl_llvm_cbe_1201_count = 0;
  static  unsigned long long aesl_llvm_cbe_1202_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_1203_count = 0;
  static  unsigned long long aesl_llvm_cbe_1204_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_uint64_t_array\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__360;
  } else {
    goto llvm_cbe_tmp__361;
  }

llvm_cbe_tmp__361:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 180) nounwind, !dbg !21 for 0x%I64xth hint within @write_uint64_t_array  --> \n", ++aesl_llvm_cbe_1186_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 180u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",180u);
}
  goto llvm_cbe_tmp__360;

llvm_cbe_tmp__360:
  if ((((signed int )llvm_cbe_n) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%8, %%.lr.ph ], [ 0, %%3  for 0x%I64xth hint within @write_uint64_t_array  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__359);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%storemerge1 to i64, !dbg !22 for 0x%I64xth hint within @write_uint64_t_array  --> \n", ++aesl_llvm_cbe_1194_count);
  llvm_cbe_tmp__356 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__356);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i64* %%arr, i64 %%5, !dbg !22 for 0x%I64xth hint within @write_uint64_t_array  --> \n", ++aesl_llvm_cbe_1195_count);
  llvm_cbe_tmp__357 = (signed long long *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__356))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__356));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i64* %%6, align 8, !dbg !22 for 0x%I64xth hint within @write_uint64_t_array  --> \n", ++aesl_llvm_cbe_1196_count);
  llvm_cbe_tmp__358 = (unsigned long long )*llvm_cbe_tmp__357;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__358);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (i32, i8*, ...)* @aesl_internal_fd_printf(i32 %%fd, i8* getelementptr inbounds ([7 x i8]* @aesl_internal_.str18, i64 0, i64 0), i64 %%7), !dbg !22 for 0x%I64xth hint within @write_uint64_t_array  --> \n", ++aesl_llvm_cbe_1197_count);
   /*tail*/ aesl_internal_fd_printf(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str18[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 7
#endif
])), llvm_cbe_tmp__358);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%I64X",llvm_cbe_tmp__358);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%storemerge1, 1, !dbg !22 for 0x%I64xth hint within @write_uint64_t_array  --> \n", ++aesl_llvm_cbe_1198_count);
  llvm_cbe_tmp__359 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__359&4294967295ull)));
  if (((llvm_cbe_tmp__359&4294967295U) == (llvm_cbe_n&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__359;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_uint64_t_array}\n");
  return 0u;
}


signed int write_int8_t_array(signed int llvm_cbe_fd,  char *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1205_count = 0;
  static  unsigned long long aesl_llvm_cbe_1206_count = 0;
  static  unsigned long long aesl_llvm_cbe_1207_count = 0;
  static  unsigned long long aesl_llvm_cbe_1208_count = 0;
  static  unsigned long long aesl_llvm_cbe_1209_count = 0;
  static  unsigned long long aesl_llvm_cbe_1210_count = 0;
  static  unsigned long long aesl_llvm_cbe_1211_count = 0;
  static  unsigned long long aesl_llvm_cbe_1212_count = 0;
  static  unsigned long long aesl_llvm_cbe_1213_count = 0;
  static  unsigned long long aesl_llvm_cbe_1214_count = 0;
  static  unsigned long long aesl_llvm_cbe_1215_count = 0;
  static  unsigned long long aesl_llvm_cbe_1216_count = 0;
  static  unsigned long long aesl_llvm_cbe_1217_count = 0;
  static  unsigned long long aesl_llvm_cbe_1218_count = 0;
  static  unsigned long long aesl_llvm_cbe_1219_count = 0;
  static  unsigned long long aesl_llvm_cbe_1220_count = 0;
  static  unsigned long long aesl_llvm_cbe_1221_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1222_count = 0;
  unsigned long long llvm_cbe_tmp__362;
  static  unsigned long long aesl_llvm_cbe_1223_count = 0;
   char *llvm_cbe_tmp__363;
  static  unsigned long long aesl_llvm_cbe_1224_count = 0;
  unsigned char llvm_cbe_tmp__364;
  static  unsigned long long aesl_llvm_cbe_1225_count = 0;
  unsigned int llvm_cbe_tmp__365;
  static  unsigned long long aesl_llvm_cbe_1226_count = 0;
  static  unsigned long long aesl_llvm_cbe_1227_count = 0;
  unsigned int llvm_cbe_tmp__366;
  static  unsigned long long aesl_llvm_cbe_1228_count = 0;
  static  unsigned long long aesl_llvm_cbe_1229_count = 0;
  static  unsigned long long aesl_llvm_cbe_1230_count = 0;
  static  unsigned long long aesl_llvm_cbe_1231_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_1232_count = 0;
  static  unsigned long long aesl_llvm_cbe_1233_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_int8_t_array\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__367;
  } else {
    goto llvm_cbe_tmp__368;
  }

llvm_cbe_tmp__368:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 181) nounwind, !dbg !21 for 0x%I64xth hint within @write_int8_t_array  --> \n", ++aesl_llvm_cbe_1214_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 181u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",181u);
}
  goto llvm_cbe_tmp__367;

llvm_cbe_tmp__367:
  if ((((signed int )llvm_cbe_n) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%9, %%.lr.ph ], [ 0, %%3  for 0x%I64xth hint within @write_int8_t_array  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__366);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%storemerge1 to i64, !dbg !22 for 0x%I64xth hint within @write_int8_t_array  --> \n", ++aesl_llvm_cbe_1222_count);
  llvm_cbe_tmp__362 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__362);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i8* %%arr, i64 %%5, !dbg !22 for 0x%I64xth hint within @write_int8_t_array  --> \n", ++aesl_llvm_cbe_1223_count);
  llvm_cbe_tmp__363 = ( char *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__362))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__362));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i8* %%6, align 1, !dbg !22 for 0x%I64xth hint within @write_int8_t_array  --> \n", ++aesl_llvm_cbe_1224_count);
  llvm_cbe_tmp__364 = (unsigned char )*llvm_cbe_tmp__363;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__364);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = sext i8 %%7 to i32, !dbg !22 for 0x%I64xth hint within @write_int8_t_array  --> \n", ++aesl_llvm_cbe_1225_count);
  llvm_cbe_tmp__365 = (unsigned int )((signed int )( char )llvm_cbe_tmp__364);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__365);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (i32, i8*, ...)* @aesl_internal_fd_printf(i32 %%fd, i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str19, i64 0, i64 0), i32 %%8), !dbg !22 for 0x%I64xth hint within @write_int8_t_array  --> \n", ++aesl_llvm_cbe_1226_count);
   /*tail*/ aesl_internal_fd_printf(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str19[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__365);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__365);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%storemerge1, 1, !dbg !22 for 0x%I64xth hint within @write_int8_t_array  --> \n", ++aesl_llvm_cbe_1227_count);
  llvm_cbe_tmp__366 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__366&4294967295ull)));
  if (((llvm_cbe_tmp__366&4294967295U) == (llvm_cbe_n&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__366;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_int8_t_array}\n");
  return 0u;
}


signed int write_int16_t_array(signed int llvm_cbe_fd, signed short *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1234_count = 0;
  static  unsigned long long aesl_llvm_cbe_1235_count = 0;
  static  unsigned long long aesl_llvm_cbe_1236_count = 0;
  static  unsigned long long aesl_llvm_cbe_1237_count = 0;
  static  unsigned long long aesl_llvm_cbe_1238_count = 0;
  static  unsigned long long aesl_llvm_cbe_1239_count = 0;
  static  unsigned long long aesl_llvm_cbe_1240_count = 0;
  static  unsigned long long aesl_llvm_cbe_1241_count = 0;
  static  unsigned long long aesl_llvm_cbe_1242_count = 0;
  static  unsigned long long aesl_llvm_cbe_1243_count = 0;
  static  unsigned long long aesl_llvm_cbe_1244_count = 0;
  static  unsigned long long aesl_llvm_cbe_1245_count = 0;
  static  unsigned long long aesl_llvm_cbe_1246_count = 0;
  static  unsigned long long aesl_llvm_cbe_1247_count = 0;
  static  unsigned long long aesl_llvm_cbe_1248_count = 0;
  static  unsigned long long aesl_llvm_cbe_1249_count = 0;
  static  unsigned long long aesl_llvm_cbe_1250_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1251_count = 0;
  unsigned long long llvm_cbe_tmp__369;
  static  unsigned long long aesl_llvm_cbe_1252_count = 0;
  signed short *llvm_cbe_tmp__370;
  static  unsigned long long aesl_llvm_cbe_1253_count = 0;
  unsigned short llvm_cbe_tmp__371;
  static  unsigned long long aesl_llvm_cbe_1254_count = 0;
  unsigned int llvm_cbe_tmp__372;
  static  unsigned long long aesl_llvm_cbe_1255_count = 0;
  static  unsigned long long aesl_llvm_cbe_1256_count = 0;
  unsigned int llvm_cbe_tmp__373;
  static  unsigned long long aesl_llvm_cbe_1257_count = 0;
  static  unsigned long long aesl_llvm_cbe_1258_count = 0;
  static  unsigned long long aesl_llvm_cbe_1259_count = 0;
  static  unsigned long long aesl_llvm_cbe_1260_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_1261_count = 0;
  static  unsigned long long aesl_llvm_cbe_1262_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_int16_t_array\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__374;
  } else {
    goto llvm_cbe_tmp__375;
  }

llvm_cbe_tmp__375:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 182) nounwind, !dbg !21 for 0x%I64xth hint within @write_int16_t_array  --> \n", ++aesl_llvm_cbe_1243_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 182u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",182u);
}
  goto llvm_cbe_tmp__374;

llvm_cbe_tmp__374:
  if ((((signed int )llvm_cbe_n) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%9, %%.lr.ph ], [ 0, %%3  for 0x%I64xth hint within @write_int16_t_array  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__373);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%storemerge1 to i64, !dbg !22 for 0x%I64xth hint within @write_int16_t_array  --> \n", ++aesl_llvm_cbe_1251_count);
  llvm_cbe_tmp__369 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__369);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i16* %%arr, i64 %%5, !dbg !22 for 0x%I64xth hint within @write_int16_t_array  --> \n", ++aesl_llvm_cbe_1252_count);
  llvm_cbe_tmp__370 = (signed short *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__369))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__369));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i16* %%6, align 2, !dbg !22 for 0x%I64xth hint within @write_int16_t_array  --> \n", ++aesl_llvm_cbe_1253_count);
  llvm_cbe_tmp__371 = (unsigned short )*llvm_cbe_tmp__370;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__371);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = sext i16 %%7 to i32, !dbg !22 for 0x%I64xth hint within @write_int16_t_array  --> \n", ++aesl_llvm_cbe_1254_count);
  llvm_cbe_tmp__372 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__371);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__372);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (i32, i8*, ...)* @aesl_internal_fd_printf(i32 %%fd, i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str19, i64 0, i64 0), i32 %%8), !dbg !22 for 0x%I64xth hint within @write_int16_t_array  --> \n", ++aesl_llvm_cbe_1255_count);
   /*tail*/ aesl_internal_fd_printf(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str19[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__372);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__372);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%storemerge1, 1, !dbg !22 for 0x%I64xth hint within @write_int16_t_array  --> \n", ++aesl_llvm_cbe_1256_count);
  llvm_cbe_tmp__373 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__373&4294967295ull)));
  if (((llvm_cbe_tmp__373&4294967295U) == (llvm_cbe_n&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__373;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_int16_t_array}\n");
  return 0u;
}


signed int write_int32_t_array(signed int llvm_cbe_fd, signed int *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1263_count = 0;
  static  unsigned long long aesl_llvm_cbe_1264_count = 0;
  static  unsigned long long aesl_llvm_cbe_1265_count = 0;
  static  unsigned long long aesl_llvm_cbe_1266_count = 0;
  static  unsigned long long aesl_llvm_cbe_1267_count = 0;
  static  unsigned long long aesl_llvm_cbe_1268_count = 0;
  static  unsigned long long aesl_llvm_cbe_1269_count = 0;
  static  unsigned long long aesl_llvm_cbe_1270_count = 0;
  static  unsigned long long aesl_llvm_cbe_1271_count = 0;
  static  unsigned long long aesl_llvm_cbe_1272_count = 0;
  static  unsigned long long aesl_llvm_cbe_1273_count = 0;
  static  unsigned long long aesl_llvm_cbe_1274_count = 0;
  static  unsigned long long aesl_llvm_cbe_1275_count = 0;
  static  unsigned long long aesl_llvm_cbe_1276_count = 0;
  static  unsigned long long aesl_llvm_cbe_1277_count = 0;
  static  unsigned long long aesl_llvm_cbe_1278_count = 0;
  static  unsigned long long aesl_llvm_cbe_1279_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1280_count = 0;
  unsigned long long llvm_cbe_tmp__376;
  static  unsigned long long aesl_llvm_cbe_1281_count = 0;
  signed int *llvm_cbe_tmp__377;
  static  unsigned long long aesl_llvm_cbe_1282_count = 0;
  unsigned int llvm_cbe_tmp__378;
  static  unsigned long long aesl_llvm_cbe_1283_count = 0;
  static  unsigned long long aesl_llvm_cbe_1284_count = 0;
  unsigned int llvm_cbe_tmp__379;
  static  unsigned long long aesl_llvm_cbe_1285_count = 0;
  static  unsigned long long aesl_llvm_cbe_1286_count = 0;
  static  unsigned long long aesl_llvm_cbe_1287_count = 0;
  static  unsigned long long aesl_llvm_cbe_1288_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_1289_count = 0;
  static  unsigned long long aesl_llvm_cbe_1290_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_int32_t_array\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__380;
  } else {
    goto llvm_cbe_tmp__381;
  }

llvm_cbe_tmp__381:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 183) nounwind, !dbg !21 for 0x%I64xth hint within @write_int32_t_array  --> \n", ++aesl_llvm_cbe_1272_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 183u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",183u);
}
  goto llvm_cbe_tmp__380;

llvm_cbe_tmp__380:
  if ((((signed int )llvm_cbe_n) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%8, %%.lr.ph ], [ 0, %%3  for 0x%I64xth hint within @write_int32_t_array  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__379);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%storemerge1 to i64, !dbg !22 for 0x%I64xth hint within @write_int32_t_array  --> \n", ++aesl_llvm_cbe_1280_count);
  llvm_cbe_tmp__376 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__376);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i32* %%arr, i64 %%5, !dbg !22 for 0x%I64xth hint within @write_int32_t_array  --> \n", ++aesl_llvm_cbe_1281_count);
  llvm_cbe_tmp__377 = (signed int *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__376))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__376));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i32* %%6, align 4, !dbg !22 for 0x%I64xth hint within @write_int32_t_array  --> \n", ++aesl_llvm_cbe_1282_count);
  llvm_cbe_tmp__378 = (unsigned int )*llvm_cbe_tmp__377;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__378);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (i32, i8*, ...)* @aesl_internal_fd_printf(i32 %%fd, i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str19, i64 0, i64 0), i32 %%7), !dbg !22 for 0x%I64xth hint within @write_int32_t_array  --> \n", ++aesl_llvm_cbe_1283_count);
   /*tail*/ aesl_internal_fd_printf(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str19[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__378);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__378);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%storemerge1, 1, !dbg !22 for 0x%I64xth hint within @write_int32_t_array  --> \n", ++aesl_llvm_cbe_1284_count);
  llvm_cbe_tmp__379 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__379&4294967295ull)));
  if (((llvm_cbe_tmp__379&4294967295U) == (llvm_cbe_n&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__379;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_int32_t_array}\n");
  return 0u;
}


signed int write_int64_t_array(signed int llvm_cbe_fd, signed long long *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1291_count = 0;
  static  unsigned long long aesl_llvm_cbe_1292_count = 0;
  static  unsigned long long aesl_llvm_cbe_1293_count = 0;
  static  unsigned long long aesl_llvm_cbe_1294_count = 0;
  static  unsigned long long aesl_llvm_cbe_1295_count = 0;
  static  unsigned long long aesl_llvm_cbe_1296_count = 0;
  static  unsigned long long aesl_llvm_cbe_1297_count = 0;
  static  unsigned long long aesl_llvm_cbe_1298_count = 0;
  static  unsigned long long aesl_llvm_cbe_1299_count = 0;
  static  unsigned long long aesl_llvm_cbe_1300_count = 0;
  static  unsigned long long aesl_llvm_cbe_1301_count = 0;
  static  unsigned long long aesl_llvm_cbe_1302_count = 0;
  static  unsigned long long aesl_llvm_cbe_1303_count = 0;
  static  unsigned long long aesl_llvm_cbe_1304_count = 0;
  static  unsigned long long aesl_llvm_cbe_1305_count = 0;
  static  unsigned long long aesl_llvm_cbe_1306_count = 0;
  static  unsigned long long aesl_llvm_cbe_1307_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1308_count = 0;
  unsigned long long llvm_cbe_tmp__382;
  static  unsigned long long aesl_llvm_cbe_1309_count = 0;
  signed long long *llvm_cbe_tmp__383;
  static  unsigned long long aesl_llvm_cbe_1310_count = 0;
  unsigned long long llvm_cbe_tmp__384;
  static  unsigned long long aesl_llvm_cbe_1311_count = 0;
  static  unsigned long long aesl_llvm_cbe_1312_count = 0;
  unsigned int llvm_cbe_tmp__385;
  static  unsigned long long aesl_llvm_cbe_1313_count = 0;
  static  unsigned long long aesl_llvm_cbe_1314_count = 0;
  static  unsigned long long aesl_llvm_cbe_1315_count = 0;
  static  unsigned long long aesl_llvm_cbe_1316_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_1317_count = 0;
  static  unsigned long long aesl_llvm_cbe_1318_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_int64_t_array\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__386;
  } else {
    goto llvm_cbe_tmp__387;
  }

llvm_cbe_tmp__387:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 184) nounwind, !dbg !21 for 0x%I64xth hint within @write_int64_t_array  --> \n", ++aesl_llvm_cbe_1300_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 184u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",184u);
}
  goto llvm_cbe_tmp__386;

llvm_cbe_tmp__386:
  if ((((signed int )llvm_cbe_n) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%8, %%.lr.ph ], [ 0, %%3  for 0x%I64xth hint within @write_int64_t_array  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__385);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%storemerge1 to i64, !dbg !22 for 0x%I64xth hint within @write_int64_t_array  --> \n", ++aesl_llvm_cbe_1308_count);
  llvm_cbe_tmp__382 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__382);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i64* %%arr, i64 %%5, !dbg !22 for 0x%I64xth hint within @write_int64_t_array  --> \n", ++aesl_llvm_cbe_1309_count);
  llvm_cbe_tmp__383 = (signed long long *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__382))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__382));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i64* %%6, align 8, !dbg !22 for 0x%I64xth hint within @write_int64_t_array  --> \n", ++aesl_llvm_cbe_1310_count);
  llvm_cbe_tmp__384 = (unsigned long long )*llvm_cbe_tmp__383;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__384);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (i32, i8*, ...)* @aesl_internal_fd_printf(i32 %%fd, i8* getelementptr inbounds ([7 x i8]* @aesl_internal_.str20, i64 0, i64 0), i64 %%7), !dbg !22 for 0x%I64xth hint within @write_int64_t_array  --> \n", ++aesl_llvm_cbe_1311_count);
   /*tail*/ aesl_internal_fd_printf(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str20[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 7
#endif
])), llvm_cbe_tmp__384);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = 0x%I64X",llvm_cbe_tmp__384);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%storemerge1, 1, !dbg !22 for 0x%I64xth hint within @write_int64_t_array  --> \n", ++aesl_llvm_cbe_1312_count);
  llvm_cbe_tmp__385 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__385&4294967295ull)));
  if (((llvm_cbe_tmp__385&4294967295U) == (llvm_cbe_n&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__385;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_int64_t_array}\n");
  return 0u;
}


signed int write_float_array(signed int llvm_cbe_fd, float *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1319_count = 0;
  static  unsigned long long aesl_llvm_cbe_1320_count = 0;
  static  unsigned long long aesl_llvm_cbe_1321_count = 0;
  static  unsigned long long aesl_llvm_cbe_1322_count = 0;
  static  unsigned long long aesl_llvm_cbe_1323_count = 0;
  static  unsigned long long aesl_llvm_cbe_1324_count = 0;
  static  unsigned long long aesl_llvm_cbe_1325_count = 0;
  static  unsigned long long aesl_llvm_cbe_1326_count = 0;
  static  unsigned long long aesl_llvm_cbe_1327_count = 0;
  static  unsigned long long aesl_llvm_cbe_1328_count = 0;
  static  unsigned long long aesl_llvm_cbe_1329_count = 0;
  static  unsigned long long aesl_llvm_cbe_1330_count = 0;
  static  unsigned long long aesl_llvm_cbe_1331_count = 0;
  static  unsigned long long aesl_llvm_cbe_1332_count = 0;
  static  unsigned long long aesl_llvm_cbe_1333_count = 0;
  static  unsigned long long aesl_llvm_cbe_1334_count = 0;
  static  unsigned long long aesl_llvm_cbe_1335_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1336_count = 0;
  unsigned long long llvm_cbe_tmp__388;
  static  unsigned long long aesl_llvm_cbe_1337_count = 0;
  float *llvm_cbe_tmp__389;
  static  unsigned long long aesl_llvm_cbe_1338_count = 0;
  float llvm_cbe_tmp__390;
  static  unsigned long long aesl_llvm_cbe_1339_count = 0;
  double llvm_cbe_tmp__391;
  static  unsigned long long aesl_llvm_cbe_1340_count = 0;
  static  unsigned long long aesl_llvm_cbe_1341_count = 0;
  unsigned int llvm_cbe_tmp__392;
  static  unsigned long long aesl_llvm_cbe_1342_count = 0;
  static  unsigned long long aesl_llvm_cbe_1343_count = 0;
  static  unsigned long long aesl_llvm_cbe_1344_count = 0;
  static  unsigned long long aesl_llvm_cbe_1345_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_1346_count = 0;
  static  unsigned long long aesl_llvm_cbe_1347_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_float_array\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__393;
  } else {
    goto llvm_cbe_tmp__394;
  }

llvm_cbe_tmp__394:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 186) nounwind, !dbg !21 for 0x%I64xth hint within @write_float_array  --> \n", ++aesl_llvm_cbe_1328_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 186u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",186u);
}
  goto llvm_cbe_tmp__393;

llvm_cbe_tmp__393:
  if ((((signed int )llvm_cbe_n) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%9, %%.lr.ph ], [ 0, %%3  for 0x%I64xth hint within @write_float_array  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__392);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%storemerge1 to i64, !dbg !22 for 0x%I64xth hint within @write_float_array  --> \n", ++aesl_llvm_cbe_1336_count);
  llvm_cbe_tmp__388 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__388);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds float* %%arr, i64 %%5, !dbg !22 for 0x%I64xth hint within @write_float_array  --> \n", ++aesl_llvm_cbe_1337_count);
  llvm_cbe_tmp__389 = (float *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__388))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__388));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load float* %%6, align 4, !dbg !22 for 0x%I64xth hint within @write_float_array  --> \n", ++aesl_llvm_cbe_1338_count);
  llvm_cbe_tmp__390 = (float )*llvm_cbe_tmp__389;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__390, *(int*)(&llvm_cbe_tmp__390));
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = fpext float %%7 to double, !dbg !22 for 0x%I64xth hint within @write_float_array  --> \n", ++aesl_llvm_cbe_1339_count);
  llvm_cbe_tmp__391 = (double )((double )llvm_cbe_tmp__390);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__391, *(long long*)(&llvm_cbe_tmp__391));
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (i32, i8*, ...)* @aesl_internal_fd_printf(i32 %%fd, i8* getelementptr inbounds ([7 x i8]* @aesl_internal_.str21, i64 0, i64 0), double %%8), !dbg !22 for 0x%I64xth hint within @write_float_array  --> \n", ++aesl_llvm_cbe_1340_count);
   /*tail*/ aesl_internal_fd_printf(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str21[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 7
#endif
])), llvm_cbe_tmp__391);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__391, *(long long*)(&llvm_cbe_tmp__391));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%storemerge1, 1, !dbg !22 for 0x%I64xth hint within @write_float_array  --> \n", ++aesl_llvm_cbe_1341_count);
  llvm_cbe_tmp__392 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__392&4294967295ull)));
  if (((llvm_cbe_tmp__392&4294967295U) == (llvm_cbe_n&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__392;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_float_array}\n");
  return 0u;
}


signed int write_double_array(signed int llvm_cbe_fd, double *llvm_cbe_arr, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1348_count = 0;
  static  unsigned long long aesl_llvm_cbe_1349_count = 0;
  static  unsigned long long aesl_llvm_cbe_1350_count = 0;
  static  unsigned long long aesl_llvm_cbe_1351_count = 0;
  static  unsigned long long aesl_llvm_cbe_1352_count = 0;
  static  unsigned long long aesl_llvm_cbe_1353_count = 0;
  static  unsigned long long aesl_llvm_cbe_1354_count = 0;
  static  unsigned long long aesl_llvm_cbe_1355_count = 0;
  static  unsigned long long aesl_llvm_cbe_1356_count = 0;
  static  unsigned long long aesl_llvm_cbe_1357_count = 0;
  static  unsigned long long aesl_llvm_cbe_1358_count = 0;
  static  unsigned long long aesl_llvm_cbe_1359_count = 0;
  static  unsigned long long aesl_llvm_cbe_1360_count = 0;
  static  unsigned long long aesl_llvm_cbe_1361_count = 0;
  static  unsigned long long aesl_llvm_cbe_1362_count = 0;
  static  unsigned long long aesl_llvm_cbe_1363_count = 0;
  static  unsigned long long aesl_llvm_cbe_1364_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1365_count = 0;
  unsigned long long llvm_cbe_tmp__395;
  static  unsigned long long aesl_llvm_cbe_1366_count = 0;
  double *llvm_cbe_tmp__396;
  static  unsigned long long aesl_llvm_cbe_1367_count = 0;
  double llvm_cbe_tmp__397;
  static  unsigned long long aesl_llvm_cbe_1368_count = 0;
  static  unsigned long long aesl_llvm_cbe_1369_count = 0;
  unsigned int llvm_cbe_tmp__398;
  static  unsigned long long aesl_llvm_cbe_1370_count = 0;
  static  unsigned long long aesl_llvm_cbe_1371_count = 0;
  static  unsigned long long aesl_llvm_cbe_1372_count = 0;
  static  unsigned long long aesl_llvm_cbe_1373_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_1374_count = 0;
  static  unsigned long long aesl_llvm_cbe_1375_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_double_array\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__399;
  } else {
    goto llvm_cbe_tmp__400;
  }

llvm_cbe_tmp__400:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 187) nounwind, !dbg !21 for 0x%I64xth hint within @write_double_array  --> \n", ++aesl_llvm_cbe_1357_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 187u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",187u);
}
  goto llvm_cbe_tmp__399;

llvm_cbe_tmp__399:
  if ((((signed int )llvm_cbe_n) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%8, %%.lr.ph ], [ 0, %%3  for 0x%I64xth hint within @write_double_array  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__398);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%storemerge1 to i64, !dbg !22 for 0x%I64xth hint within @write_double_array  --> \n", ++aesl_llvm_cbe_1365_count);
  llvm_cbe_tmp__395 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__395);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds double* %%arr, i64 %%5, !dbg !22 for 0x%I64xth hint within @write_double_array  --> \n", ++aesl_llvm_cbe_1366_count);
  llvm_cbe_tmp__396 = (double *)(&llvm_cbe_arr[(((signed long long )llvm_cbe_tmp__395))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__395));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load double* %%6, align 8, !dbg !22 for 0x%I64xth hint within @write_double_array  --> \n", ++aesl_llvm_cbe_1367_count);
  llvm_cbe_tmp__397 = (double )*llvm_cbe_tmp__396;
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__397, *(long long*)(&llvm_cbe_tmp__397));
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (i32, i8*, ...)* @aesl_internal_fd_printf(i32 %%fd, i8* getelementptr inbounds ([7 x i8]* @aesl_internal_.str21, i64 0, i64 0), double %%7), !dbg !22 for 0x%I64xth hint within @write_double_array  --> \n", ++aesl_llvm_cbe_1368_count);
   /*tail*/ aesl_internal_fd_printf(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str21[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 7
#endif
])), llvm_cbe_tmp__397);
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__397, *(long long*)(&llvm_cbe_tmp__397));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%storemerge1, 1, !dbg !22 for 0x%I64xth hint within @write_double_array  --> \n", ++aesl_llvm_cbe_1369_count);
  llvm_cbe_tmp__398 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__398&4294967295ull)));
  if (((llvm_cbe_tmp__398&4294967295U) == (llvm_cbe_n&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__398;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_double_array}\n");
  return 0u;
}


signed int write_section_header(signed int llvm_cbe_fd) {
  static  unsigned long long aesl_llvm_cbe_1376_count = 0;
  static  unsigned long long aesl_llvm_cbe_1377_count = 0;
  static  unsigned long long aesl_llvm_cbe_1378_count = 0;
  static  unsigned long long aesl_llvm_cbe_1379_count = 0;
  static  unsigned long long aesl_llvm_cbe_1380_count = 0;
  static  unsigned long long aesl_llvm_cbe_1381_count = 0;
  static  unsigned long long aesl_llvm_cbe_1382_count = 0;
  static  unsigned long long aesl_llvm_cbe_1383_count = 0;
  static  unsigned long long aesl_llvm_cbe_1384_count = 0;
const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @write_section_header\n");
  if ((((signed int )llvm_cbe_fd) > ((signed int )1u))) {
    goto llvm_cbe_tmp__401;
  } else {
    goto llvm_cbe_tmp__402;
  }

llvm_cbe_tmp__402:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @_assert(i8* getelementptr inbounds ([34 x i8]* @aesl_internal_.str1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8]* @aesl_internal_.str2, i64 0, i64 0), i32 190) nounwind, !dbg !21 for 0x%I64xth hint within @write_section_header  --> \n", ++aesl_llvm_cbe_1381_count);
   /*tail*/ _assert(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 34
#endif
])), ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 26
#endif
])), 190u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",190u);
}
  goto llvm_cbe_tmp__401;

llvm_cbe_tmp__401:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (i32, i8*, ...)* @aesl_internal_fd_printf(i32 %%fd, i8* getelementptr inbounds ([6 x i8]* @aesl_internal_.str22, i64 0, i64 0)), !dbg !22 for 0x%I64xth hint within @write_section_header  --> \n", ++aesl_llvm_cbe_1383_count);
   /*tail*/ aesl_internal_fd_printf(llvm_cbe_fd, ( char *)((&aesl_internal__OC_str22[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nArgument fd = 0x%X",llvm_cbe_fd);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @write_section_header}\n");
  return 0u;
}

