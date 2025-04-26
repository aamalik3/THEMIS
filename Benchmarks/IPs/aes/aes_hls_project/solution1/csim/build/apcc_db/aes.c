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
typedef struct l_struct_OC_aes256_context l_struct_OC_aes256_context;

/* Structure contents */
struct l_struct_OC_aes256_context {
   char field0[32];
   char field1[32];
   char field2[32];
};


/* External Global Variable Declarations */
extern  char sbox[256];

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
unsigned char rj_xtime( char llvm_cbe_x);
void aes_subBytes( char *llvm_cbe_buf);
void aes_addRoundKey( char *llvm_cbe_buf,  char *llvm_cbe_key);
void aes_addRoundKey_cpy( char *llvm_cbe_buf,  char *llvm_cbe_key,  char *llvm_cbe_cpk);
void aes_shiftRows( char *llvm_cbe_buf);
void aes_mixColumns( char *llvm_cbe_buf);
void aes_expandEncKey( char *llvm_cbe_k,  char *llvm_cbe_rc);
void aes256_encrypt_ecb(l_struct_OC_aes256_context *llvm_cbe_ctx,  char *llvm_cbe_k,  char *llvm_cbe_buf);


/* Global Variable Definitions and Initialization */
 char sbox[256] = { ((unsigned char )99), ((unsigned char )124), ((unsigned char )119), ((unsigned char )123), ((unsigned char )-14), ((unsigned char )107), ((unsigned char )111), ((unsigned char )-59), ((unsigned char )48), ((unsigned char )1), ((unsigned char )103), ((unsigned char )43), ((unsigned char )-2), ((unsigned char )-41), ((unsigned char )-85), ((unsigned char )118), ((unsigned char )-54), ((unsigned char )-126), ((unsigned char )-55), ((unsigned char )125), ((unsigned char )-6), ((unsigned char )89), ((unsigned char )71), ((unsigned char )-16), ((unsigned char )-83), ((unsigned char )-44), ((unsigned char )-94), ((unsigned char )-81), ((unsigned char )-100), ((unsigned char )-92), ((unsigned char )114), ((unsigned char )-64), ((unsigned char )-73), ((unsigned char )-3), ((unsigned char )-109), ((unsigned char )38), ((unsigned char )54), ((unsigned char )63), ((unsigned char )-9), ((unsigned char )-52), ((unsigned char )52), ((unsigned char )-91), ((unsigned char )-27), ((unsigned char )-15), ((unsigned char )113), ((unsigned char )-40), ((unsigned char )49), ((unsigned char )21), ((unsigned char )4), ((unsigned char )-57), ((unsigned char )35), ((unsigned char )-61), ((unsigned char )24), ((unsigned char )-106), ((unsigned char )5), ((unsigned char )-102), ((unsigned char )7), ((unsigned char )18), ((unsigned char )128u), ((unsigned char )-30), ((unsigned char )-21), ((unsigned char )39), ((unsigned char )-78), ((unsigned char )117), ((unsigned char )9), ((unsigned char )-125), ((unsigned char )44), ((unsigned char )26), ((unsigned char )27), ((unsigned char )110), ((unsigned char )90), ((unsigned char )-96), ((unsigned char )82), ((unsigned char )59), ((unsigned char )-42), ((unsigned char )-77), ((unsigned char )41), ((unsigned char )-29), ((unsigned char )47), ((unsigned char )-124), ((unsigned char )83), ((unsigned char )-47), ((unsigned char )0), ((unsigned char )-19), ((unsigned char )32), ((unsigned char )-4), ((unsigned char )-79), ((unsigned char )91), ((unsigned char )106), ((unsigned char )-53), ((unsigned char )-66), ((unsigned char )57), ((unsigned char )74), ((unsigned char )76), ((unsigned char )88), ((unsigned char )-49), ((unsigned char )-48), ((unsigned char )-17), ((unsigned char )-86), ((unsigned char )-5), ((unsigned char )67), ((unsigned char )77), ((unsigned char )51), ((unsigned char )-123), ((unsigned char )69), ((unsigned char )-7), ((unsigned char )2), ((unsigned char )127), ((unsigned char )80), ((unsigned char )60), ((unsigned char )-97), ((unsigned char )-88), ((unsigned char )81), ((unsigned char )-93), ((unsigned char )64), ((unsigned char )-113), ((unsigned char )-110), ((unsigned char )-99), ((unsigned char )56), ((unsigned char )-11), ((unsigned char )-68), ((unsigned char )-74), ((unsigned char )-38), ((unsigned char )33), ((unsigned char )16), ((unsigned char )-1), ((unsigned char )-13), ((unsigned char )-46), ((unsigned char )-51), ((unsigned char )12), ((unsigned char )19), ((unsigned char )-20), ((unsigned char )95), ((unsigned char )-105), ((unsigned char )68), ((unsigned char )23), ((unsigned char )-60), ((unsigned char )-89), ((unsigned char )126), ((unsigned char )61), ((unsigned char )100), ((unsigned char )93), ((unsigned char )25), ((unsigned char )115), ((unsigned char )96), ((unsigned char )-127), ((unsigned char )79), ((unsigned char )-36), ((unsigned char )34), ((unsigned char )42), ((unsigned char )-112), ((unsigned char )-120), ((unsigned char )70), ((unsigned char )-18), ((unsigned char )-72), ((unsigned char )20), ((unsigned char )-34), ((unsigned char )94), ((unsigned char )11), ((unsigned char )-37), ((unsigned char )-32), ((unsigned char )50), ((unsigned char )58), ((unsigned char )10), ((unsigned char )73), ((unsigned char )6), ((unsigned char )36), ((unsigned char )92), ((unsigned char )-62), ((unsigned char )-45), ((unsigned char )-84), ((unsigned char )98), ((unsigned char )-111), ((unsigned char )-107), ((unsigned char )-28), ((unsigned char )121), ((unsigned char )-25), ((unsigned char )-56), ((unsigned char )55), ((unsigned char )109), ((unsigned char )-115), ((unsigned char )-43), ((unsigned char )78), ((unsigned char )-87), ((unsigned char )108), ((unsigned char )86), ((unsigned char )-12), ((unsigned char )-22), ((unsigned char )101), ((unsigned char )122), ((unsigned char )-82), ((unsigned char )8), ((unsigned char )-70), ((unsigned char )120), ((unsigned char )37), ((unsigned char )46), ((unsigned char )28), ((unsigned char )-90), ((unsigned char )-76), ((unsigned char )-58), ((unsigned char )-24), ((unsigned char )-35), ((unsigned char )116), ((unsigned char )31), ((unsigned char )75), ((unsigned char )-67), ((unsigned char )-117), ((unsigned char )-118), ((unsigned char )112), ((unsigned char )62), ((unsigned char )-75), ((unsigned char )102), ((unsigned char )72), ((unsigned char )3), ((unsigned char )-10), ((unsigned char )14), ((unsigned char )97), ((unsigned char )53), ((unsigned char )87), ((unsigned char )-71), ((unsigned char )-122), ((unsigned char )-63), ((unsigned char )29), ((unsigned char )-98), ((unsigned char )-31), ((unsigned char )-8), ((unsigned char )-104), ((unsigned char )17), ((unsigned char )105), ((unsigned char )-39), ((unsigned char )-114), ((unsigned char )-108), ((unsigned char )-101), ((unsigned char )30), ((unsigned char )-121), ((unsigned char )-23), ((unsigned char )-50), ((unsigned char )85), ((unsigned char )40), ((unsigned char )-33), ((unsigned char )-116), ((unsigned char )-95), ((unsigned char )-119), ((unsigned char )13), ((unsigned char )-65), ((unsigned char )-26), ((unsigned char )66), ((unsigned char )104), ((unsigned char )65), ((unsigned char )-103), ((unsigned char )45), ((unsigned char )15), ((unsigned char )-80), ((unsigned char )84), ((unsigned char )-69), ((unsigned char )22) };


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

unsigned char rj_xtime( char llvm_cbe_x) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  unsigned char llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  unsigned char llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  unsigned char llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  unsigned char llvm_cbe_tmp__4;
  unsigned char llvm_cbe_tmp__4__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @rj_xtime\n");
  if (((( char )llvm_cbe_x) < (( char )((unsigned char )0)))) {
    goto llvm_cbe_tmp__5;
  } else {
    goto llvm_cbe_tmp__6;
  }

llvm_cbe_tmp__5:
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = shl i8 %%x, 1, !dbg !8 for 0x%I64xth hint within @rj_xtime  --> \n", ++aesl_llvm_cbe_7_count);
  llvm_cbe_tmp__1 = (unsigned char )((unsigned char )(llvm_cbe_x << ((unsigned char )1)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__1);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = xor i8 %%3, 27, !dbg !8 for 0x%I64xth hint within @rj_xtime  --> \n", ++aesl_llvm_cbe_8_count);
  llvm_cbe_tmp__2 = (unsigned char )((unsigned char )(llvm_cbe_tmp__1 ^ ((unsigned char )27)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__2);
  llvm_cbe_tmp__4__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__2;   /* for PHI node */
  goto llvm_cbe_tmp__7;

llvm_cbe_tmp__6:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = shl i8 %%x, 1, !dbg !8 for 0x%I64xth hint within @rj_xtime  --> \n", ++aesl_llvm_cbe_10_count);
  llvm_cbe_tmp__3 = (unsigned char )((unsigned char )(llvm_cbe_x << ((unsigned char )1)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__3);
  llvm_cbe_tmp__4__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__3;   /* for PHI node */
  goto llvm_cbe_tmp__7;

llvm_cbe_tmp__7:
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = phi i8 [ %%4, %%2 ], [ %%6, %%5 ], !dbg !8 for 0x%I64xth hint within @rj_xtime  --> \n", ++aesl_llvm_cbe_12_count);
  llvm_cbe_tmp__4 = (unsigned char )llvm_cbe_tmp__4__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__4);
printf("\n = 0x%X",llvm_cbe_tmp__2);
printf("\n = 0x%X",llvm_cbe_tmp__3);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @rj_xtime}\n");
  return llvm_cbe_tmp__4;
}


void aes_subBytes( char *llvm_cbe_buf) {
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  unsigned char llvm_cbe_tmp__8;
  unsigned char llvm_cbe_tmp__8__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  unsigned long long llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
   char *llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  unsigned char llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  unsigned long long llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
   char *llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  unsigned char llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  unsigned char llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aes_subBytes\n");
  llvm_cbe_tmp__8__PHI_TEMPORARY = (unsigned char )((unsigned char )15);   /* for PHI node */
  goto llvm_cbe_tmp__16;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__16:
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = phi i8 [ 15, %%0 ], [ %%9, %%1  for 0x%I64xth hint within @aes_subBytes  --> \n", ++aesl_llvm_cbe_26_count);
  llvm_cbe_tmp__8 = (unsigned char )llvm_cbe_tmp__8__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__8);
printf("\n = 0x%X",((unsigned char )15));
printf("\n = 0x%X",llvm_cbe_tmp__15);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = zext i8 %%2 to i64, !dbg !8 for 0x%I64xth hint within @aes_subBytes  --> \n", ++aesl_llvm_cbe_27_count);
  llvm_cbe_tmp__9 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__8&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__9);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds i8* %%buf, i64 %%3, !dbg !8 for 0x%I64xth hint within @aes_subBytes  --> \n", ++aesl_llvm_cbe_28_count);
  llvm_cbe_tmp__10 = ( char *)(&llvm_cbe_buf[(((signed long long )llvm_cbe_tmp__9))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__9));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load i8* %%4, align 1, !dbg !8 for 0x%I64xth hint within @aes_subBytes  --> \n", ++aesl_llvm_cbe_29_count);
  llvm_cbe_tmp__11 = (unsigned char )*llvm_cbe_tmp__10;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__11);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = zext i8 %%5 to i64, !dbg !8 for 0x%I64xth hint within @aes_subBytes  --> \n", ++aesl_llvm_cbe_30_count);
  llvm_cbe_tmp__12 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__11&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__12);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds [256 x i8]* @sbox, i64 0, i64 %%6, !dbg !8 for 0x%I64xth hint within @aes_subBytes  --> \n", ++aesl_llvm_cbe_31_count);
  llvm_cbe_tmp__13 = ( char *)(&sbox[(((signed long long )llvm_cbe_tmp__12))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__12));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__12) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'sbox' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i8* %%7, align 1, !dbg !8 for 0x%I64xth hint within @aes_subBytes  --> \n", ++aesl_llvm_cbe_32_count);
  llvm_cbe_tmp__14 = (unsigned char )*llvm_cbe_tmp__13;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__14);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%8, i8* %%4, align 1, !dbg !8 for 0x%I64xth hint within @aes_subBytes  --> \n", ++aesl_llvm_cbe_33_count);
  *llvm_cbe_tmp__10 = llvm_cbe_tmp__14;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__14);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add i8 %%2, -1, !dbg !8 for 0x%I64xth hint within @aes_subBytes  --> \n", ++aesl_llvm_cbe_34_count);
  llvm_cbe_tmp__15 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__8&255ull)) + ((unsigned char )(((unsigned char )-1)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__15&255ull)));
  if (((llvm_cbe_tmp__8&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__17;
  } else {
    llvm_cbe_tmp__8__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__15;   /* for PHI node */
    goto llvm_cbe_tmp__16;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__17:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aes_subBytes}\n");
  return;
}


void aes_addRoundKey( char *llvm_cbe_buf,  char *llvm_cbe_key) {
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  unsigned char llvm_cbe_tmp__18;
  unsigned char llvm_cbe_tmp__18__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  unsigned long long llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
   char *llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  unsigned char llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
   char *llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  unsigned char llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  unsigned char llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  unsigned char llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aes_addRoundKey\n");
  llvm_cbe_tmp__18__PHI_TEMPORARY = (unsigned char )((unsigned char )15);   /* for PHI node */
  goto llvm_cbe_tmp__26;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__26:
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = phi i8 [ 15, %%0 ], [ %%9, %%1  for 0x%I64xth hint within @aes_addRoundKey  --> \n", ++aesl_llvm_cbe_55_count);
  llvm_cbe_tmp__18 = (unsigned char )llvm_cbe_tmp__18__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__18);
printf("\n = 0x%X",((unsigned char )15));
printf("\n = 0x%X",llvm_cbe_tmp__25);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = zext i8 %%2 to i64, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey  --> \n", ++aesl_llvm_cbe_56_count);
  llvm_cbe_tmp__19 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__18&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__19);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds i8* %%key, i64 %%3, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey  --> \n", ++aesl_llvm_cbe_57_count);
  llvm_cbe_tmp__20 = ( char *)(&llvm_cbe_key[(((signed long long )llvm_cbe_tmp__19))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__19));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load i8* %%4, align 1, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey  --> \n", ++aesl_llvm_cbe_58_count);
  llvm_cbe_tmp__21 = (unsigned char )*llvm_cbe_tmp__20;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__21);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i8* %%buf, i64 %%3, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey  --> \n", ++aesl_llvm_cbe_59_count);
  llvm_cbe_tmp__22 = ( char *)(&llvm_cbe_buf[(((signed long long )llvm_cbe_tmp__19))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__19));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i8* %%6, align 1, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey  --> \n", ++aesl_llvm_cbe_60_count);
  llvm_cbe_tmp__23 = (unsigned char )*llvm_cbe_tmp__22;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__23);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = xor i8 %%7, %%5, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey  --> \n", ++aesl_llvm_cbe_61_count);
  llvm_cbe_tmp__24 = (unsigned char )((unsigned char )(llvm_cbe_tmp__23 ^ llvm_cbe_tmp__21));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%8, i8* %%6, align 1, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey  --> \n", ++aesl_llvm_cbe_62_count);
  *llvm_cbe_tmp__22 = llvm_cbe_tmp__24;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add i8 %%2, -1, !dbg !9 for 0x%I64xth hint within @aes_addRoundKey  --> \n", ++aesl_llvm_cbe_63_count);
  llvm_cbe_tmp__25 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__18&255ull)) + ((unsigned char )(((unsigned char )-1)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__25&255ull)));
  if (((llvm_cbe_tmp__18&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__27;
  } else {
    llvm_cbe_tmp__18__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__25;   /* for PHI node */
    goto llvm_cbe_tmp__26;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__27:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aes_addRoundKey}\n");
  return;
}


void aes_addRoundKey_cpy( char *llvm_cbe_buf,  char *llvm_cbe_key,  char *llvm_cbe_cpk) {
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
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  unsigned char llvm_cbe_tmp__28;
  unsigned char llvm_cbe_tmp__28__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  unsigned long long llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
   char *llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  unsigned char llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
   char *llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
   char *llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  unsigned char llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  unsigned char llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  unsigned int llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  unsigned int llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  unsigned long long llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
   char *llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  unsigned char llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
   char *llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  unsigned char llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aes_addRoundKey_cpy\n");
  llvm_cbe_tmp__28__PHI_TEMPORARY = (unsigned char )((unsigned char )15);   /* for PHI node */
  goto llvm_cbe_tmp__43;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__43:
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = phi i8 [ 15, %%0 ], [ %%16, %%1  for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_94_count);
  llvm_cbe_tmp__28 = (unsigned char )llvm_cbe_tmp__28__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__28);
printf("\n = 0x%X",((unsigned char )15));
printf("\n = 0x%X",llvm_cbe_tmp__42);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = zext i8 %%2 to i64, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_95_count);
  llvm_cbe_tmp__29 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__28&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__29);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds i8* %%key, i64 %%3, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_96_count);
  llvm_cbe_tmp__30 = ( char *)(&llvm_cbe_key[(((signed long long )llvm_cbe_tmp__29))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__29));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load i8* %%4, align 1, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_97_count);
  llvm_cbe_tmp__31 = (unsigned char )*llvm_cbe_tmp__30;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__31);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i8* %%cpk, i64 %%3, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_98_count);
  llvm_cbe_tmp__32 = ( char *)(&llvm_cbe_cpk[(((signed long long )llvm_cbe_tmp__29))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__29));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%5, i8* %%6, align 1, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_99_count);
  *llvm_cbe_tmp__32 = llvm_cbe_tmp__31;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__31);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds i8* %%buf, i64 %%3, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_100_count);
  llvm_cbe_tmp__33 = ( char *)(&llvm_cbe_buf[(((signed long long )llvm_cbe_tmp__29))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__29));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i8* %%7, align 1, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_101_count);
  llvm_cbe_tmp__34 = (unsigned char )*llvm_cbe_tmp__33;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__34);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = xor i8 %%8, %%5, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_102_count);
  llvm_cbe_tmp__35 = (unsigned char )((unsigned char )(llvm_cbe_tmp__34 ^ llvm_cbe_tmp__31));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__35);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%9, i8* %%7, align 1, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_103_count);
  *llvm_cbe_tmp__33 = llvm_cbe_tmp__35;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__35);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = zext i8 %%2 to i32, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_104_count);
  llvm_cbe_tmp__36 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__28&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__36);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = add nsw i32 %%10, 16, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_105_count);
  llvm_cbe_tmp__37 = (unsigned int )((unsigned int )(llvm_cbe_tmp__36&4294967295ull)) + ((unsigned int )(16u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__37&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = zext i32 %%11 to i64, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_106_count);
  llvm_cbe_tmp__38 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__37&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__38);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = getelementptr inbounds i8* %%key, i64 %%12, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_107_count);
  llvm_cbe_tmp__39 = ( char *)(&llvm_cbe_key[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load i8* %%13, align 1, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_108_count);
  llvm_cbe_tmp__40 = (unsigned char )*llvm_cbe_tmp__39;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__40);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = getelementptr inbounds i8* %%cpk, i64 %%12, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_109_count);
  llvm_cbe_tmp__41 = ( char *)(&llvm_cbe_cpk[(((signed long long )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%14, i8* %%15, align 1, !dbg !8 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_110_count);
  *llvm_cbe_tmp__41 = llvm_cbe_tmp__40;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__40);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = add i8 %%2, -1, !dbg !9 for 0x%I64xth hint within @aes_addRoundKey_cpy  --> \n", ++aesl_llvm_cbe_111_count);
  llvm_cbe_tmp__42 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__28&255ull)) + ((unsigned char )(((unsigned char )-1)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__42&255ull)));
  if (((llvm_cbe_tmp__28&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__44;
  } else {
    llvm_cbe_tmp__28__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__42;   /* for PHI node */
    goto llvm_cbe_tmp__43;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__44:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aes_addRoundKey_cpy}\n");
  return;
}


void aes_shiftRows( char *llvm_cbe_buf) {
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
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
   char *llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  unsigned char llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
   char *llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  unsigned char llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
   char *llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  unsigned char llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
   char *llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  unsigned char llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
   char *llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  unsigned char llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
   char *llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  unsigned char llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
   char *llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  unsigned char llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
   char *llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  unsigned char llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
   char *llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  unsigned char llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
   char *llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  unsigned char llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
   char *llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  unsigned char llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
   char *llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  unsigned char llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aes_shiftRows\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = getelementptr inbounds i8* %%buf, i64 1, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_147_count);
  llvm_cbe_tmp__45 = ( char *)(&llvm_cbe_buf[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = load i8* %%1, align 1, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_148_count);
  llvm_cbe_tmp__46 = (unsigned char )*llvm_cbe_tmp__45;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__46);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i8* %%buf, i64 5, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_152_count);
  llvm_cbe_tmp__47 = ( char *)(&llvm_cbe_buf[(((signed long long )5ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i8* %%3, align 1, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_153_count);
  llvm_cbe_tmp__48 = (unsigned char )*llvm_cbe_tmp__47;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__48);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%4, i8* %%1, align 1, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_154_count);
  *llvm_cbe_tmp__45 = llvm_cbe_tmp__48;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__48);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds i8* %%buf, i64 9, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_155_count);
  llvm_cbe_tmp__49 = ( char *)(&llvm_cbe_buf[(((signed long long )9ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load i8* %%5, align 1, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_156_count);
  llvm_cbe_tmp__50 = (unsigned char )*llvm_cbe_tmp__49;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__50);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%6, i8* %%3, align 1, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_157_count);
  *llvm_cbe_tmp__47 = llvm_cbe_tmp__50;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__50);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds i8* %%buf, i64 13, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_158_count);
  llvm_cbe_tmp__51 = ( char *)(&llvm_cbe_buf[(((signed long long )13ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i8* %%7, align 1, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_159_count);
  llvm_cbe_tmp__52 = (unsigned char )*llvm_cbe_tmp__51;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__52);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%8, i8* %%5, align 1, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_160_count);
  *llvm_cbe_tmp__49 = llvm_cbe_tmp__52;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__52);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%2, i8* %%7, align 1, !dbg !8 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_161_count);
  *llvm_cbe_tmp__51 = llvm_cbe_tmp__46;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__46);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds i8* %%buf, i64 10, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_162_count);
  llvm_cbe_tmp__53 = ( char *)(&llvm_cbe_buf[(((signed long long )10ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load i8* %%9, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_163_count);
  llvm_cbe_tmp__54 = (unsigned char )*llvm_cbe_tmp__53;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = getelementptr inbounds i8* %%buf, i64 2, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_167_count);
  llvm_cbe_tmp__55 = ( char *)(&llvm_cbe_buf[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load i8* %%11, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_168_count);
  llvm_cbe_tmp__56 = (unsigned char )*llvm_cbe_tmp__55;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__56);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%12, i8* %%9, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_169_count);
  *llvm_cbe_tmp__53 = llvm_cbe_tmp__56;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__56);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%10, i8* %%11, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_170_count);
  *llvm_cbe_tmp__55 = llvm_cbe_tmp__54;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = getelementptr inbounds i8* %%buf, i64 3, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_171_count);
  llvm_cbe_tmp__57 = ( char *)(&llvm_cbe_buf[(((signed long long )3ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load i8* %%13, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_172_count);
  llvm_cbe_tmp__58 = (unsigned char )*llvm_cbe_tmp__57;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__58);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = getelementptr inbounds i8* %%buf, i64 15, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_176_count);
  llvm_cbe_tmp__59 = ( char *)(&llvm_cbe_buf[(((signed long long )15ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = load i8* %%15, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_177_count);
  llvm_cbe_tmp__60 = (unsigned char )*llvm_cbe_tmp__59;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__60);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%16, i8* %%13, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_178_count);
  *llvm_cbe_tmp__57 = llvm_cbe_tmp__60;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__60);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = getelementptr inbounds i8* %%buf, i64 11, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_179_count);
  llvm_cbe_tmp__61 = ( char *)(&llvm_cbe_buf[(((signed long long )11ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = load i8* %%17, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_180_count);
  llvm_cbe_tmp__62 = (unsigned char )*llvm_cbe_tmp__61;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__62);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%18, i8* %%15, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_181_count);
  *llvm_cbe_tmp__59 = llvm_cbe_tmp__62;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__62);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = getelementptr inbounds i8* %%buf, i64 7, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_182_count);
  llvm_cbe_tmp__63 = ( char *)(&llvm_cbe_buf[(((signed long long )7ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = load i8* %%19, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_183_count);
  llvm_cbe_tmp__64 = (unsigned char )*llvm_cbe_tmp__63;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%20, i8* %%17, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_184_count);
  *llvm_cbe_tmp__61 = llvm_cbe_tmp__64;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%14, i8* %%19, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_185_count);
  *llvm_cbe_tmp__63 = llvm_cbe_tmp__58;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__58);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds i8* %%buf, i64 14, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_186_count);
  llvm_cbe_tmp__65 = ( char *)(&llvm_cbe_buf[(((signed long long )14ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = load i8* %%21, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_187_count);
  llvm_cbe_tmp__66 = (unsigned char )*llvm_cbe_tmp__65;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__66);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = getelementptr inbounds i8* %%buf, i64 6, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_191_count);
  llvm_cbe_tmp__67 = ( char *)(&llvm_cbe_buf[(((signed long long )6ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = load i8* %%23, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_192_count);
  llvm_cbe_tmp__68 = (unsigned char )*llvm_cbe_tmp__67;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__68);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%24, i8* %%21, align 1, !dbg !9 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_193_count);
  *llvm_cbe_tmp__65 = llvm_cbe_tmp__68;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__68);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%22, i8* %%23, align 1, !dbg !10 for 0x%I64xth hint within @aes_shiftRows  --> \n", ++aesl_llvm_cbe_194_count);
  *llvm_cbe_tmp__67 = llvm_cbe_tmp__66;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__66);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aes_shiftRows}\n");
  return;
}


void aes_mixColumns( char *llvm_cbe_buf) {
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned char llvm_cbe_storemerge1;
  unsigned char llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  unsigned long long llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
   char *llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  unsigned char llvm_cbe_tmp__71;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  unsigned int llvm_cbe_tmp__72;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  unsigned int llvm_cbe_tmp__73;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  unsigned long long llvm_cbe_tmp__74;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
   char *llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  unsigned char llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  unsigned int llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  unsigned long long llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
   char *llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
  unsigned char llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  unsigned int llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  unsigned long long llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
   char *llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  unsigned char llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  unsigned char llvm_cbe_tmp__85;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  unsigned char llvm_cbe_tmp__86;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  unsigned char llvm_cbe_tmp__87;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  unsigned char llvm_cbe_tmp__88;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;
  unsigned char llvm_cbe_tmp__89;
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  unsigned char llvm_cbe_tmp__90;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  unsigned char llvm_cbe_tmp__91;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  unsigned char llvm_cbe_tmp__92;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  unsigned char llvm_cbe_tmp__93;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;
  unsigned char llvm_cbe_tmp__94;
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  unsigned char llvm_cbe_tmp__95;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  unsigned char llvm_cbe_tmp__96;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  unsigned char llvm_cbe_tmp__97;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;
  unsigned char llvm_cbe_tmp__98;
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;
  unsigned char llvm_cbe_tmp__99;
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  unsigned char llvm_cbe_tmp__100;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
  unsigned char llvm_cbe_tmp__101;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  unsigned char llvm_cbe_tmp__102;
  static  unsigned long long aesl_llvm_cbe_276_count = 0;
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

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aes_mixColumns\n");
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned char )((unsigned char )0);   /* for PHI node */
  goto llvm_cbe_tmp__103;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__103:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i8 [ 0, %%0 ], [ %%35, %%1  for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned char )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",((unsigned char )0));
printf("\n = 0x%X",llvm_cbe_tmp__102);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = zext i8 %%storemerge1 to i64, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_217_count);
  llvm_cbe_tmp__69 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_storemerge1&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__69);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i8* %%buf, i64 %%2, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_218_count);
  llvm_cbe_tmp__70 = ( char *)(&llvm_cbe_buf[(((signed long long )llvm_cbe_tmp__69))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__69));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i8* %%3, align 1, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_219_count);
  llvm_cbe_tmp__71 = (unsigned char )*llvm_cbe_tmp__70;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__71);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = zext i8 %%storemerge1 to i32, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_224_count);
  llvm_cbe_tmp__72 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_storemerge1&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__72);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = or i32 %%5, 1, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_225_count);
  llvm_cbe_tmp__73 = (unsigned int )llvm_cbe_tmp__72 | 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__73);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = zext i32 %%6 to i64, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_226_count);
  llvm_cbe_tmp__74 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__73&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__74);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = getelementptr inbounds i8* %%buf, i64 %%7, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_227_count);
  llvm_cbe_tmp__75 = ( char *)(&llvm_cbe_buf[(((signed long long )llvm_cbe_tmp__74))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__74));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = load i8* %%8, align 1, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_228_count);
  llvm_cbe_tmp__76 = (unsigned char )*llvm_cbe_tmp__75;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__76);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = or i32 %%5, 2, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_233_count);
  llvm_cbe_tmp__77 = (unsigned int )llvm_cbe_tmp__72 | 2u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__77);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = zext i32 %%10 to i64, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_234_count);
  llvm_cbe_tmp__78 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__77&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__78);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds i8* %%buf, i64 %%11, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_235_count);
  llvm_cbe_tmp__79 = ( char *)(&llvm_cbe_buf[(((signed long long )llvm_cbe_tmp__78))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__78));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8* %%12, align 1, !dbg !8 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_236_count);
  llvm_cbe_tmp__80 = (unsigned char )*llvm_cbe_tmp__79;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__80);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = or i32 %%5, 3, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_241_count);
  llvm_cbe_tmp__81 = (unsigned int )llvm_cbe_tmp__72 | 3u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__81);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = zext i32 %%14 to i64, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_242_count);
  llvm_cbe_tmp__82 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__81&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__82);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = getelementptr inbounds i8* %%buf, i64 %%15, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_243_count);
  llvm_cbe_tmp__83 = ( char *)(&llvm_cbe_buf[(((signed long long )llvm_cbe_tmp__82))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__82));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = load i8* %%16, align 1, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_244_count);
  llvm_cbe_tmp__84 = (unsigned char )*llvm_cbe_tmp__83;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__84);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = xor i8 %%9, %%4, !dbg !10 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_249_count);
  llvm_cbe_tmp__85 = (unsigned char )((unsigned char )(llvm_cbe_tmp__76 ^ llvm_cbe_tmp__71));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__85);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = xor i8 %%18, %%13, !dbg !10 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_250_count);
  llvm_cbe_tmp__86 = (unsigned char )((unsigned char )(llvm_cbe_tmp__85 ^ llvm_cbe_tmp__80));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__86);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = xor i8 %%19, %%17, !dbg !10 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_251_count);
  llvm_cbe_tmp__87 = (unsigned char )((unsigned char )(llvm_cbe_tmp__86 ^ llvm_cbe_tmp__84));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__87);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = tail call zeroext i8 @rj_xtime(i8 zeroext %%18), !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_257_count);
  llvm_cbe_tmp__88 = (unsigned char ) /*tail*/ rj_xtime(llvm_cbe_tmp__85);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__85);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__88);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = xor i8 %%21, %%4, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_258_count);
  llvm_cbe_tmp__89 = (unsigned char )((unsigned char )(llvm_cbe_tmp__88 ^ llvm_cbe_tmp__71));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__89);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = xor i8 %%22, %%20, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_259_count);
  llvm_cbe_tmp__90 = (unsigned char )((unsigned char )(llvm_cbe_tmp__89 ^ llvm_cbe_tmp__87));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__90);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%23, i8* %%3, align 1, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_260_count);
  *llvm_cbe_tmp__70 = llvm_cbe_tmp__90;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__90);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = xor i8 %%13, %%9, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_261_count);
  llvm_cbe_tmp__91 = (unsigned char )((unsigned char )(llvm_cbe_tmp__80 ^ llvm_cbe_tmp__76));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__91);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = tail call zeroext i8 @rj_xtime(i8 zeroext %%24), !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_262_count);
  llvm_cbe_tmp__92 = (unsigned char ) /*tail*/ rj_xtime(llvm_cbe_tmp__91);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__91);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__92);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = xor i8 %%25, %%20, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_263_count);
  llvm_cbe_tmp__93 = (unsigned char )((unsigned char )(llvm_cbe_tmp__92 ^ llvm_cbe_tmp__87));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__93);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = xor i8 %%26, %%9, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_264_count);
  llvm_cbe_tmp__94 = (unsigned char )((unsigned char )(llvm_cbe_tmp__93 ^ llvm_cbe_tmp__76));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__94);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%27, i8* %%8, align 1, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_265_count);
  *llvm_cbe_tmp__75 = llvm_cbe_tmp__94;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__94);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = xor i8 %%17, %%13, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_266_count);
  llvm_cbe_tmp__95 = (unsigned char )((unsigned char )(llvm_cbe_tmp__84 ^ llvm_cbe_tmp__80));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__95);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = tail call zeroext i8 @rj_xtime(i8 zeroext %%28), !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_267_count);
  llvm_cbe_tmp__96 = (unsigned char ) /*tail*/ rj_xtime(llvm_cbe_tmp__95);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__95);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__96);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = xor i8 %%29, %%20, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_268_count);
  llvm_cbe_tmp__97 = (unsigned char )((unsigned char )(llvm_cbe_tmp__96 ^ llvm_cbe_tmp__87));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__97);
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = xor i8 %%30, %%13, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_269_count);
  llvm_cbe_tmp__98 = (unsigned char )((unsigned char )(llvm_cbe_tmp__97 ^ llvm_cbe_tmp__80));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__98);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%31, i8* %%12, align 1, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_270_count);
  *llvm_cbe_tmp__79 = llvm_cbe_tmp__98;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__98);
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = xor i8 %%17, %%4, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_271_count);
  llvm_cbe_tmp__99 = (unsigned char )((unsigned char )(llvm_cbe_tmp__84 ^ llvm_cbe_tmp__71));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__99);
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = tail call zeroext i8 @rj_xtime(i8 zeroext %%32), !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_272_count);
  llvm_cbe_tmp__100 = (unsigned char ) /*tail*/ rj_xtime(llvm_cbe_tmp__99);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__99);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__100);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = xor i8 %%33, %%19, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_273_count);
  llvm_cbe_tmp__101 = (unsigned char )((unsigned char )(llvm_cbe_tmp__100 ^ llvm_cbe_tmp__86));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__101);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%34, i8* %%16, align 1, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_274_count);
  *llvm_cbe_tmp__83 = llvm_cbe_tmp__101;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__101);
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = add i8 %%storemerge1, 4, !dbg !9 for 0x%I64xth hint within @aes_mixColumns  --> \n", ++aesl_llvm_cbe_275_count);
  llvm_cbe_tmp__102 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_storemerge1&255ull)) + ((unsigned char )(((unsigned char )4)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__102&255ull)));
  if ((((unsigned char )llvm_cbe_tmp__102&255U) < ((unsigned char )((unsigned char )16)&255U))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__102;   /* for PHI node */
    goto llvm_cbe_tmp__103;
  } else {
    goto llvm_cbe_tmp__104;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__104:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aes_mixColumns}\n");
  return;
}


void aes_expandEncKey( char *llvm_cbe_k,  char *llvm_cbe_rc) {
  static  unsigned long long aesl_llvm_cbe_290_count = 0;
  static  unsigned long long aesl_llvm_cbe_291_count = 0;
  static  unsigned long long aesl_llvm_cbe_292_count = 0;
  static  unsigned long long aesl_llvm_cbe_293_count = 0;
  static  unsigned long long aesl_llvm_cbe_294_count = 0;
  static  unsigned long long aesl_llvm_cbe_295_count = 0;
  static  unsigned long long aesl_llvm_cbe_296_count = 0;
  static  unsigned long long aesl_llvm_cbe_297_count = 0;
  static  unsigned long long aesl_llvm_cbe_298_count = 0;
  static  unsigned long long aesl_llvm_cbe_299_count = 0;
  static  unsigned long long aesl_llvm_cbe_300_count = 0;
  static  unsigned long long aesl_llvm_cbe_301_count = 0;
  static  unsigned long long aesl_llvm_cbe_302_count = 0;
  static  unsigned long long aesl_llvm_cbe_303_count = 0;
  static  unsigned long long aesl_llvm_cbe_304_count = 0;
  static  unsigned long long aesl_llvm_cbe_305_count = 0;
  static  unsigned long long aesl_llvm_cbe_306_count = 0;
  static  unsigned long long aesl_llvm_cbe_307_count = 0;
  static  unsigned long long aesl_llvm_cbe_308_count = 0;
  static  unsigned long long aesl_llvm_cbe_309_count = 0;
  static  unsigned long long aesl_llvm_cbe_310_count = 0;
  static  unsigned long long aesl_llvm_cbe_311_count = 0;
  static  unsigned long long aesl_llvm_cbe_312_count = 0;
  static  unsigned long long aesl_llvm_cbe_313_count = 0;
  static  unsigned long long aesl_llvm_cbe_314_count = 0;
  static  unsigned long long aesl_llvm_cbe_315_count = 0;
  static  unsigned long long aesl_llvm_cbe_316_count = 0;
  static  unsigned long long aesl_llvm_cbe_317_count = 0;
  static  unsigned long long aesl_llvm_cbe_318_count = 0;
  static  unsigned long long aesl_llvm_cbe_319_count = 0;
  static  unsigned long long aesl_llvm_cbe_320_count = 0;
  static  unsigned long long aesl_llvm_cbe_321_count = 0;
  static  unsigned long long aesl_llvm_cbe_322_count = 0;
  static  unsigned long long aesl_llvm_cbe_323_count = 0;
  static  unsigned long long aesl_llvm_cbe_324_count = 0;
  static  unsigned long long aesl_llvm_cbe_325_count = 0;
  static  unsigned long long aesl_llvm_cbe_326_count = 0;
  static  unsigned long long aesl_llvm_cbe_327_count = 0;
  static  unsigned long long aesl_llvm_cbe_328_count = 0;
   char *llvm_cbe_tmp__105;
  static  unsigned long long aesl_llvm_cbe_329_count = 0;
  unsigned char llvm_cbe_tmp__106;
  static  unsigned long long aesl_llvm_cbe_330_count = 0;
  unsigned long long llvm_cbe_tmp__107;
  static  unsigned long long aesl_llvm_cbe_331_count = 0;
   char *llvm_cbe_tmp__108;
  static  unsigned long long aesl_llvm_cbe_332_count = 0;
  unsigned char llvm_cbe_tmp__109;
  static  unsigned long long aesl_llvm_cbe_333_count = 0;
  unsigned char llvm_cbe_tmp__110;
  static  unsigned long long aesl_llvm_cbe_334_count = 0;
  unsigned char llvm_cbe_tmp__111;
  static  unsigned long long aesl_llvm_cbe_335_count = 0;
  unsigned char llvm_cbe_tmp__112;
  static  unsigned long long aesl_llvm_cbe_336_count = 0;
  unsigned char llvm_cbe_tmp__113;
  static  unsigned long long aesl_llvm_cbe_337_count = 0;
  static  unsigned long long aesl_llvm_cbe_338_count = 0;
   char *llvm_cbe_tmp__114;
  static  unsigned long long aesl_llvm_cbe_339_count = 0;
  unsigned char llvm_cbe_tmp__115;
  static  unsigned long long aesl_llvm_cbe_340_count = 0;
  unsigned long long llvm_cbe_tmp__116;
  static  unsigned long long aesl_llvm_cbe_341_count = 0;
   char *llvm_cbe_tmp__117;
  static  unsigned long long aesl_llvm_cbe_342_count = 0;
  unsigned char llvm_cbe_tmp__118;
  static  unsigned long long aesl_llvm_cbe_343_count = 0;
   char *llvm_cbe_tmp__119;
  static  unsigned long long aesl_llvm_cbe_344_count = 0;
  unsigned char llvm_cbe_tmp__120;
  static  unsigned long long aesl_llvm_cbe_345_count = 0;
  unsigned char llvm_cbe_tmp__121;
  static  unsigned long long aesl_llvm_cbe_346_count = 0;
  static  unsigned long long aesl_llvm_cbe_347_count = 0;
   char *llvm_cbe_tmp__122;
  static  unsigned long long aesl_llvm_cbe_348_count = 0;
  unsigned char llvm_cbe_tmp__123;
  static  unsigned long long aesl_llvm_cbe_349_count = 0;
  unsigned long long llvm_cbe_tmp__124;
  static  unsigned long long aesl_llvm_cbe_350_count = 0;
   char *llvm_cbe_tmp__125;
  static  unsigned long long aesl_llvm_cbe_351_count = 0;
  unsigned char llvm_cbe_tmp__126;
  static  unsigned long long aesl_llvm_cbe_352_count = 0;
   char *llvm_cbe_tmp__127;
  static  unsigned long long aesl_llvm_cbe_353_count = 0;
  unsigned char llvm_cbe_tmp__128;
  static  unsigned long long aesl_llvm_cbe_354_count = 0;
  unsigned char llvm_cbe_tmp__129;
  static  unsigned long long aesl_llvm_cbe_355_count = 0;
  static  unsigned long long aesl_llvm_cbe_356_count = 0;
   char *llvm_cbe_tmp__130;
  static  unsigned long long aesl_llvm_cbe_357_count = 0;
  unsigned char llvm_cbe_tmp__131;
  static  unsigned long long aesl_llvm_cbe_358_count = 0;
  unsigned long long llvm_cbe_tmp__132;
  static  unsigned long long aesl_llvm_cbe_359_count = 0;
   char *llvm_cbe_tmp__133;
  static  unsigned long long aesl_llvm_cbe_360_count = 0;
  unsigned char llvm_cbe_tmp__134;
  static  unsigned long long aesl_llvm_cbe_361_count = 0;
   char *llvm_cbe_tmp__135;
  static  unsigned long long aesl_llvm_cbe_362_count = 0;
  unsigned char llvm_cbe_tmp__136;
  static  unsigned long long aesl_llvm_cbe_363_count = 0;
  unsigned char llvm_cbe_tmp__137;
  static  unsigned long long aesl_llvm_cbe_364_count = 0;
  static  unsigned long long aesl_llvm_cbe_365_count = 0;
  unsigned char llvm_cbe_tmp__138;
  static  unsigned long long aesl_llvm_cbe_366_count = 0;
  unsigned char llvm_cbe_tmp__139;
  static  unsigned long long aesl_llvm_cbe_367_count = 0;
  unsigned char llvm_cbe_tmp__140;
  static  unsigned long long aesl_llvm_cbe_368_count = 0;
  unsigned char llvm_cbe_tmp__141;
  static  unsigned long long aesl_llvm_cbe_369_count = 0;
  unsigned char llvm_cbe_tmp__142;
  static  unsigned long long aesl_llvm_cbe_370_count = 0;
  static  unsigned long long aesl_llvm_cbe_371_count = 0;
  static  unsigned long long aesl_llvm_cbe_372_count = 0;
  static  unsigned long long aesl_llvm_cbe_373_count = 0;
  static  unsigned long long aesl_llvm_cbe_374_count = 0;
  static  unsigned long long aesl_llvm_cbe_375_count = 0;
  static  unsigned long long aesl_llvm_cbe_376_count = 0;
  static  unsigned long long aesl_llvm_cbe_377_count = 0;
  static  unsigned long long aesl_llvm_cbe_378_count = 0;
  static  unsigned long long aesl_llvm_cbe_379_count = 0;
  static  unsigned long long aesl_llvm_cbe_380_count = 0;
  static  unsigned long long aesl_llvm_cbe_381_count = 0;
  static  unsigned long long aesl_llvm_cbe_382_count = 0;
  static  unsigned long long aesl_llvm_cbe_383_count = 0;
  static  unsigned long long aesl_llvm_cbe_384_count = 0;
  static  unsigned long long aesl_llvm_cbe_385_count = 0;
  static  unsigned long long aesl_llvm_cbe_386_count = 0;
  static  unsigned long long aesl_llvm_cbe_387_count = 0;
  static  unsigned long long aesl_llvm_cbe_388_count = 0;
  static  unsigned long long aesl_llvm_cbe_389_count = 0;
  static  unsigned long long aesl_llvm_cbe_390_count = 0;
  static  unsigned long long aesl_llvm_cbe_391_count = 0;
  static  unsigned long long aesl_llvm_cbe_392_count = 0;
  unsigned char llvm_cbe_tmp__143;
  static  unsigned long long aesl_llvm_cbe_393_count = 0;
   char *llvm_cbe_tmp__144;
  static  unsigned long long aesl_llvm_cbe_394_count = 0;
  unsigned char llvm_cbe_tmp__145;
  static  unsigned long long aesl_llvm_cbe_395_count = 0;
  unsigned char llvm_cbe_tmp__146;
  static  unsigned long long aesl_llvm_cbe_396_count = 0;
  static  unsigned long long aesl_llvm_cbe_397_count = 0;
  unsigned char llvm_cbe_tmp__147;
  static  unsigned long long aesl_llvm_cbe_398_count = 0;
   char *llvm_cbe_tmp__148;
  static  unsigned long long aesl_llvm_cbe_399_count = 0;
  unsigned char llvm_cbe_tmp__149;
  static  unsigned long long aesl_llvm_cbe_400_count = 0;
  unsigned char llvm_cbe_tmp__150;
  static  unsigned long long aesl_llvm_cbe_401_count = 0;
  static  unsigned long long aesl_llvm_cbe_402_count = 0;
  unsigned char llvm_cbe_tmp__151;
  static  unsigned long long aesl_llvm_cbe_403_count = 0;
   char *llvm_cbe_tmp__152;
  static  unsigned long long aesl_llvm_cbe_404_count = 0;
  unsigned char llvm_cbe_tmp__153;
  static  unsigned long long aesl_llvm_cbe_405_count = 0;
  unsigned char llvm_cbe_tmp__154;
  static  unsigned long long aesl_llvm_cbe_406_count = 0;
  static  unsigned long long aesl_llvm_cbe_407_count = 0;
  unsigned char llvm_cbe_tmp__155;
  static  unsigned long long aesl_llvm_cbe_408_count = 0;
   char *llvm_cbe_tmp__156;
  static  unsigned long long aesl_llvm_cbe_409_count = 0;
  unsigned char llvm_cbe_tmp__157;
  static  unsigned long long aesl_llvm_cbe_410_count = 0;
  unsigned char llvm_cbe_tmp__158;
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
  static  unsigned long long aesl_llvm_cbe_429_count = 0;
  static  unsigned long long aesl_llvm_cbe_430_count = 0;
  static  unsigned long long aesl_llvm_cbe_431_count = 0;
  static  unsigned long long aesl_llvm_cbe_432_count = 0;
  static  unsigned long long aesl_llvm_cbe_433_count = 0;
   char *llvm_cbe_tmp__159;
  static  unsigned long long aesl_llvm_cbe_434_count = 0;
  unsigned char llvm_cbe_tmp__160;
  static  unsigned long long aesl_llvm_cbe_435_count = 0;
  unsigned char llvm_cbe_tmp__161;
  static  unsigned long long aesl_llvm_cbe_436_count = 0;
  static  unsigned long long aesl_llvm_cbe_437_count = 0;
   char *llvm_cbe_tmp__162;
  static  unsigned long long aesl_llvm_cbe_438_count = 0;
  unsigned char llvm_cbe_tmp__163;
  static  unsigned long long aesl_llvm_cbe_439_count = 0;
  unsigned char llvm_cbe_tmp__164;
  static  unsigned long long aesl_llvm_cbe_440_count = 0;
  static  unsigned long long aesl_llvm_cbe_441_count = 0;
   char *llvm_cbe_tmp__165;
  static  unsigned long long aesl_llvm_cbe_442_count = 0;
  unsigned char llvm_cbe_tmp__166;
  static  unsigned long long aesl_llvm_cbe_443_count = 0;
  unsigned char llvm_cbe_tmp__167;
  static  unsigned long long aesl_llvm_cbe_444_count = 0;
  static  unsigned long long aesl_llvm_cbe_445_count = 0;
   char *llvm_cbe_tmp__168;
  static  unsigned long long aesl_llvm_cbe_446_count = 0;
  unsigned char llvm_cbe_tmp__169;
  static  unsigned long long aesl_llvm_cbe_447_count = 0;
  unsigned char llvm_cbe_tmp__170;
  static  unsigned long long aesl_llvm_cbe_448_count = 0;
  static  unsigned long long aesl_llvm_cbe_449_count = 0;
  static  unsigned long long aesl_llvm_cbe_450_count = 0;
  static  unsigned long long aesl_llvm_cbe_451_count = 0;
  static  unsigned long long aesl_llvm_cbe_452_count = 0;
  static  unsigned long long aesl_llvm_cbe_453_count = 0;
  static  unsigned long long aesl_llvm_cbe_454_count = 0;
  static  unsigned long long aesl_llvm_cbe_455_count = 0;
  static  unsigned long long aesl_llvm_cbe_456_count = 0;
  static  unsigned long long aesl_llvm_cbe_457_count = 0;
  static  unsigned long long aesl_llvm_cbe_458_count = 0;
  static  unsigned long long aesl_llvm_cbe_459_count = 0;
  static  unsigned long long aesl_llvm_cbe_460_count = 0;
  static  unsigned long long aesl_llvm_cbe_461_count = 0;
  static  unsigned long long aesl_llvm_cbe_462_count = 0;
  static  unsigned long long aesl_llvm_cbe_463_count = 0;
  static  unsigned long long aesl_llvm_cbe_464_count = 0;
  static  unsigned long long aesl_llvm_cbe_465_count = 0;
  static  unsigned long long aesl_llvm_cbe_466_count = 0;
  static  unsigned long long aesl_llvm_cbe_467_count = 0;
  static  unsigned long long aesl_llvm_cbe_468_count = 0;
  static  unsigned long long aesl_llvm_cbe_469_count = 0;
  static  unsigned long long aesl_llvm_cbe_470_count = 0;
   char *llvm_cbe_tmp__171;
  static  unsigned long long aesl_llvm_cbe_471_count = 0;
  unsigned char llvm_cbe_tmp__172;
  static  unsigned long long aesl_llvm_cbe_472_count = 0;
  unsigned char llvm_cbe_tmp__173;
  static  unsigned long long aesl_llvm_cbe_473_count = 0;
  static  unsigned long long aesl_llvm_cbe_474_count = 0;
   char *llvm_cbe_tmp__174;
  static  unsigned long long aesl_llvm_cbe_475_count = 0;
  unsigned char llvm_cbe_tmp__175;
  static  unsigned long long aesl_llvm_cbe_476_count = 0;
  unsigned char llvm_cbe_tmp__176;
  static  unsigned long long aesl_llvm_cbe_477_count = 0;
  static  unsigned long long aesl_llvm_cbe_478_count = 0;
   char *llvm_cbe_tmp__177;
  static  unsigned long long aesl_llvm_cbe_479_count = 0;
  unsigned char llvm_cbe_tmp__178;
  static  unsigned long long aesl_llvm_cbe_480_count = 0;
  unsigned char llvm_cbe_tmp__179;
  static  unsigned long long aesl_llvm_cbe_481_count = 0;
  static  unsigned long long aesl_llvm_cbe_482_count = 0;
   char *llvm_cbe_tmp__180;
  static  unsigned long long aesl_llvm_cbe_483_count = 0;
  unsigned char llvm_cbe_tmp__181;
  static  unsigned long long aesl_llvm_cbe_484_count = 0;
  unsigned char llvm_cbe_tmp__182;
  static  unsigned long long aesl_llvm_cbe_485_count = 0;
  static  unsigned long long aesl_llvm_cbe_486_count = 0;
  static  unsigned long long aesl_llvm_cbe_487_count = 0;
  static  unsigned long long aesl_llvm_cbe_488_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_507_count = 0;
  unsigned long long llvm_cbe_tmp__183;
  static  unsigned long long aesl_llvm_cbe_508_count = 0;
   char *llvm_cbe_tmp__184;
  static  unsigned long long aesl_llvm_cbe_509_count = 0;
  unsigned char llvm_cbe_tmp__185;
  static  unsigned long long aesl_llvm_cbe_510_count = 0;
   char *llvm_cbe_tmp__186;
  static  unsigned long long aesl_llvm_cbe_511_count = 0;
  unsigned char llvm_cbe_tmp__187;
  static  unsigned long long aesl_llvm_cbe_512_count = 0;
  unsigned char llvm_cbe_tmp__188;
  static  unsigned long long aesl_llvm_cbe_513_count = 0;
  static  unsigned long long aesl_llvm_cbe_514_count = 0;
  unsigned long long llvm_cbe_tmp__189;
  static  unsigned long long aesl_llvm_cbe_515_count = 0;
   char *llvm_cbe_tmp__190;
  static  unsigned long long aesl_llvm_cbe_516_count = 0;
  unsigned char llvm_cbe_tmp__191;
  static  unsigned long long aesl_llvm_cbe_517_count = 0;
   char *llvm_cbe_tmp__192;
  static  unsigned long long aesl_llvm_cbe_518_count = 0;
  unsigned char llvm_cbe_tmp__193;
  static  unsigned long long aesl_llvm_cbe_519_count = 0;
  unsigned char llvm_cbe_tmp__194;
  static  unsigned long long aesl_llvm_cbe_520_count = 0;
  static  unsigned long long aesl_llvm_cbe_521_count = 0;
  unsigned long long llvm_cbe_tmp__195;
  static  unsigned long long aesl_llvm_cbe_522_count = 0;
   char *llvm_cbe_tmp__196;
  static  unsigned long long aesl_llvm_cbe_523_count = 0;
  unsigned char llvm_cbe_tmp__197;
  static  unsigned long long aesl_llvm_cbe_524_count = 0;
   char *llvm_cbe_tmp__198;
  static  unsigned long long aesl_llvm_cbe_525_count = 0;
  unsigned char llvm_cbe_tmp__199;
  static  unsigned long long aesl_llvm_cbe_526_count = 0;
  unsigned char llvm_cbe_tmp__200;
  static  unsigned long long aesl_llvm_cbe_527_count = 0;
  static  unsigned long long aesl_llvm_cbe_528_count = 0;
  unsigned long long llvm_cbe_tmp__201;
  static  unsigned long long aesl_llvm_cbe_529_count = 0;
   char *llvm_cbe_tmp__202;
  static  unsigned long long aesl_llvm_cbe_530_count = 0;
  unsigned char llvm_cbe_tmp__203;
  static  unsigned long long aesl_llvm_cbe_531_count = 0;
   char *llvm_cbe_tmp__204;
  static  unsigned long long aesl_llvm_cbe_532_count = 0;
  unsigned char llvm_cbe_tmp__205;
  static  unsigned long long aesl_llvm_cbe_533_count = 0;
  unsigned char llvm_cbe_tmp__206;
  static  unsigned long long aesl_llvm_cbe_534_count = 0;
  static  unsigned long long aesl_llvm_cbe_535_count = 0;
  static  unsigned long long aesl_llvm_cbe_536_count = 0;
  static  unsigned long long aesl_llvm_cbe_537_count = 0;
  static  unsigned long long aesl_llvm_cbe_538_count = 0;
  static  unsigned long long aesl_llvm_cbe_539_count = 0;
  static  unsigned long long aesl_llvm_cbe_540_count = 0;
  static  unsigned long long aesl_llvm_cbe_541_count = 0;
  static  unsigned long long aesl_llvm_cbe_542_count = 0;
  static  unsigned long long aesl_llvm_cbe_543_count = 0;
  static  unsigned long long aesl_llvm_cbe_544_count = 0;
  static  unsigned long long aesl_llvm_cbe_545_count = 0;
  static  unsigned long long aesl_llvm_cbe_546_count = 0;
  static  unsigned long long aesl_llvm_cbe_547_count = 0;
  static  unsigned long long aesl_llvm_cbe_548_count = 0;
  static  unsigned long long aesl_llvm_cbe_549_count = 0;
  static  unsigned long long aesl_llvm_cbe_550_count = 0;
  static  unsigned long long aesl_llvm_cbe_551_count = 0;
  static  unsigned long long aesl_llvm_cbe_552_count = 0;
  static  unsigned long long aesl_llvm_cbe_553_count = 0;
  static  unsigned long long aesl_llvm_cbe_554_count = 0;
  static  unsigned long long aesl_llvm_cbe_555_count = 0;
  static  unsigned long long aesl_llvm_cbe_556_count = 0;
   char *llvm_cbe_tmp__207;
  static  unsigned long long aesl_llvm_cbe_557_count = 0;
  unsigned char llvm_cbe_tmp__208;
  static  unsigned long long aesl_llvm_cbe_558_count = 0;
  unsigned char llvm_cbe_tmp__209;
  static  unsigned long long aesl_llvm_cbe_559_count = 0;
  static  unsigned long long aesl_llvm_cbe_560_count = 0;
   char *llvm_cbe_tmp__210;
  static  unsigned long long aesl_llvm_cbe_561_count = 0;
  unsigned char llvm_cbe_tmp__211;
  static  unsigned long long aesl_llvm_cbe_562_count = 0;
  unsigned char llvm_cbe_tmp__212;
  static  unsigned long long aesl_llvm_cbe_563_count = 0;
  static  unsigned long long aesl_llvm_cbe_564_count = 0;
   char *llvm_cbe_tmp__213;
  static  unsigned long long aesl_llvm_cbe_565_count = 0;
  unsigned char llvm_cbe_tmp__214;
  static  unsigned long long aesl_llvm_cbe_566_count = 0;
  unsigned char llvm_cbe_tmp__215;
  static  unsigned long long aesl_llvm_cbe_567_count = 0;
  static  unsigned long long aesl_llvm_cbe_568_count = 0;
   char *llvm_cbe_tmp__216;
  static  unsigned long long aesl_llvm_cbe_569_count = 0;
  unsigned char llvm_cbe_tmp__217;
  static  unsigned long long aesl_llvm_cbe_570_count = 0;
  unsigned char llvm_cbe_tmp__218;
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
  static  unsigned long long aesl_llvm_cbe_585_count = 0;
  static  unsigned long long aesl_llvm_cbe_586_count = 0;
  static  unsigned long long aesl_llvm_cbe_587_count = 0;
  static  unsigned long long aesl_llvm_cbe_588_count = 0;
  static  unsigned long long aesl_llvm_cbe_589_count = 0;
  static  unsigned long long aesl_llvm_cbe_590_count = 0;
  static  unsigned long long aesl_llvm_cbe_591_count = 0;
  static  unsigned long long aesl_llvm_cbe_592_count = 0;
  static  unsigned long long aesl_llvm_cbe_593_count = 0;
   char *llvm_cbe_tmp__219;
  static  unsigned long long aesl_llvm_cbe_594_count = 0;
  unsigned char llvm_cbe_tmp__220;
  static  unsigned long long aesl_llvm_cbe_595_count = 0;
  unsigned char llvm_cbe_tmp__221;
  static  unsigned long long aesl_llvm_cbe_596_count = 0;
  static  unsigned long long aesl_llvm_cbe_597_count = 0;
   char *llvm_cbe_tmp__222;
  static  unsigned long long aesl_llvm_cbe_598_count = 0;
  unsigned char llvm_cbe_tmp__223;
  static  unsigned long long aesl_llvm_cbe_599_count = 0;
  unsigned char llvm_cbe_tmp__224;
  static  unsigned long long aesl_llvm_cbe_600_count = 0;
  static  unsigned long long aesl_llvm_cbe_601_count = 0;
   char *llvm_cbe_tmp__225;
  static  unsigned long long aesl_llvm_cbe_602_count = 0;
  unsigned char llvm_cbe_tmp__226;
  static  unsigned long long aesl_llvm_cbe_603_count = 0;
  unsigned char llvm_cbe_tmp__227;
  static  unsigned long long aesl_llvm_cbe_604_count = 0;
  static  unsigned long long aesl_llvm_cbe_605_count = 0;
   char *llvm_cbe_tmp__228;
  static  unsigned long long aesl_llvm_cbe_606_count = 0;
  unsigned char llvm_cbe_tmp__229;
  static  unsigned long long aesl_llvm_cbe_607_count = 0;
  unsigned char llvm_cbe_tmp__230;
  static  unsigned long long aesl_llvm_cbe_608_count = 0;
  static  unsigned long long aesl_llvm_cbe_609_count = 0;
  static  unsigned long long aesl_llvm_cbe_610_count = 0;
  static  unsigned long long aesl_llvm_cbe_611_count = 0;
  static  unsigned long long aesl_llvm_cbe_612_count = 0;
  static  unsigned long long aesl_llvm_cbe_613_count = 0;
  static  unsigned long long aesl_llvm_cbe_614_count = 0;
  static  unsigned long long aesl_llvm_cbe_615_count = 0;
  static  unsigned long long aesl_llvm_cbe_616_count = 0;
  static  unsigned long long aesl_llvm_cbe_617_count = 0;
  static  unsigned long long aesl_llvm_cbe_618_count = 0;
  static  unsigned long long aesl_llvm_cbe_619_count = 0;
  static  unsigned long long aesl_llvm_cbe_620_count = 0;
  static  unsigned long long aesl_llvm_cbe_621_count = 0;
  static  unsigned long long aesl_llvm_cbe_622_count = 0;
  static  unsigned long long aesl_llvm_cbe_623_count = 0;
  static  unsigned long long aesl_llvm_cbe_624_count = 0;
  static  unsigned long long aesl_llvm_cbe_625_count = 0;
  static  unsigned long long aesl_llvm_cbe_626_count = 0;
  static  unsigned long long aesl_llvm_cbe_627_count = 0;
  static  unsigned long long aesl_llvm_cbe_628_count = 0;
  static  unsigned long long aesl_llvm_cbe_629_count = 0;
  static  unsigned long long aesl_llvm_cbe_630_count = 0;
  unsigned char llvm_cbe_tmp__231;
  static  unsigned long long aesl_llvm_cbe_631_count = 0;
  unsigned char llvm_cbe_tmp__232;
  static  unsigned long long aesl_llvm_cbe_632_count = 0;
  static  unsigned long long aesl_llvm_cbe_633_count = 0;
  unsigned char llvm_cbe_tmp__233;
  static  unsigned long long aesl_llvm_cbe_634_count = 0;
  unsigned char llvm_cbe_tmp__234;
  static  unsigned long long aesl_llvm_cbe_635_count = 0;
  static  unsigned long long aesl_llvm_cbe_636_count = 0;
  unsigned char llvm_cbe_tmp__235;
  static  unsigned long long aesl_llvm_cbe_637_count = 0;
  unsigned char llvm_cbe_tmp__236;
  static  unsigned long long aesl_llvm_cbe_638_count = 0;
  static  unsigned long long aesl_llvm_cbe_639_count = 0;
  unsigned char llvm_cbe_tmp__237;
  static  unsigned long long aesl_llvm_cbe_640_count = 0;
  unsigned char llvm_cbe_tmp__238;
  static  unsigned long long aesl_llvm_cbe_641_count = 0;
  static  unsigned long long aesl_llvm_cbe_642_count = 0;
  static  unsigned long long aesl_llvm_cbe_643_count = 0;
  static  unsigned long long aesl_llvm_cbe_644_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_663_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aes_expandEncKey\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = getelementptr inbounds i8* %%k, i64 29, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_328_count);
  llvm_cbe_tmp__105 = ( char *)(&llvm_cbe_k[(((signed long long )29ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = load i8* %%1, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_329_count);
  llvm_cbe_tmp__106 = (unsigned char )*llvm_cbe_tmp__105;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__106);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = zext i8 %%2 to i64, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_330_count);
  llvm_cbe_tmp__107 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__106&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__107);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds [256 x i8]* @sbox, i64 0, i64 %%3, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_331_count);
  llvm_cbe_tmp__108 = ( char *)(&sbox[(((signed long long )llvm_cbe_tmp__107))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__107));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__107) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'sbox' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load i8* %%4, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_332_count);
  llvm_cbe_tmp__109 = (unsigned char )*llvm_cbe_tmp__108;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__109);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load i8* %%rc, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_333_count);
  llvm_cbe_tmp__110 = (unsigned char )*llvm_cbe_rc;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__110);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i8* %%k, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_334_count);
  llvm_cbe_tmp__111 = (unsigned char )*llvm_cbe_k;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__111);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = xor i8 %%6, %%5, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_335_count);
  llvm_cbe_tmp__112 = (unsigned char )((unsigned char )(llvm_cbe_tmp__110 ^ llvm_cbe_tmp__109));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__112);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = xor i8 %%8, %%7, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_336_count);
  llvm_cbe_tmp__113 = (unsigned char )((unsigned char )(llvm_cbe_tmp__112 ^ llvm_cbe_tmp__111));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__113);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%9, i8* %%k, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_337_count);
  *llvm_cbe_k = llvm_cbe_tmp__113;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__113);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr inbounds i8* %%k, i64 30, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_338_count);
  llvm_cbe_tmp__114 = ( char *)(&llvm_cbe_k[(((signed long long )30ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = load i8* %%10, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_339_count);
  llvm_cbe_tmp__115 = (unsigned char )*llvm_cbe_tmp__114;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__115);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = zext i8 %%11 to i64, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_340_count);
  llvm_cbe_tmp__116 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__115&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__116);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = getelementptr inbounds [256 x i8]* @sbox, i64 0, i64 %%12, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_341_count);
  llvm_cbe_tmp__117 = ( char *)(&sbox[(((signed long long )llvm_cbe_tmp__116))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__116));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__116) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'sbox' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load i8* %%13, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_342_count);
  llvm_cbe_tmp__118 = (unsigned char )*llvm_cbe_tmp__117;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__118);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = getelementptr inbounds i8* %%k, i64 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_343_count);
  llvm_cbe_tmp__119 = ( char *)(&llvm_cbe_k[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = load i8* %%15, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_344_count);
  llvm_cbe_tmp__120 = (unsigned char )*llvm_cbe_tmp__119;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__120);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = xor i8 %%16, %%14, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_345_count);
  llvm_cbe_tmp__121 = (unsigned char )((unsigned char )(llvm_cbe_tmp__120 ^ llvm_cbe_tmp__118));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__121);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%17, i8* %%15, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_346_count);
  *llvm_cbe_tmp__119 = llvm_cbe_tmp__121;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__121);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds i8* %%k, i64 31, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_347_count);
  llvm_cbe_tmp__122 = ( char *)(&llvm_cbe_k[(((signed long long )31ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = load i8* %%18, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_348_count);
  llvm_cbe_tmp__123 = (unsigned char )*llvm_cbe_tmp__122;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__123);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = zext i8 %%19 to i64, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_349_count);
  llvm_cbe_tmp__124 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__123&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__124);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds [256 x i8]* @sbox, i64 0, i64 %%20, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_350_count);
  llvm_cbe_tmp__125 = ( char *)(&sbox[(((signed long long )llvm_cbe_tmp__124))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__124));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__124) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'sbox' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = load i8* %%21, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_351_count);
  llvm_cbe_tmp__126 = (unsigned char )*llvm_cbe_tmp__125;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__126);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = getelementptr inbounds i8* %%k, i64 2, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_352_count);
  llvm_cbe_tmp__127 = ( char *)(&llvm_cbe_k[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = load i8* %%23, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_353_count);
  llvm_cbe_tmp__128 = (unsigned char )*llvm_cbe_tmp__127;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__128);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = xor i8 %%24, %%22, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_354_count);
  llvm_cbe_tmp__129 = (unsigned char )((unsigned char )(llvm_cbe_tmp__128 ^ llvm_cbe_tmp__126));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__129);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%25, i8* %%23, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_355_count);
  *llvm_cbe_tmp__127 = llvm_cbe_tmp__129;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__129);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = getelementptr inbounds i8* %%k, i64 28, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_356_count);
  llvm_cbe_tmp__130 = ( char *)(&llvm_cbe_k[(((signed long long )28ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = load i8* %%26, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_357_count);
  llvm_cbe_tmp__131 = (unsigned char )*llvm_cbe_tmp__130;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__131);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = zext i8 %%27 to i64, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_358_count);
  llvm_cbe_tmp__132 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__131&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__132);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = getelementptr inbounds [256 x i8]* @sbox, i64 0, i64 %%28, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_359_count);
  llvm_cbe_tmp__133 = ( char *)(&sbox[(((signed long long )llvm_cbe_tmp__132))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__132));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__132) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'sbox' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = load i8* %%29, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_360_count);
  llvm_cbe_tmp__134 = (unsigned char )*llvm_cbe_tmp__133;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__134);
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = getelementptr inbounds i8* %%k, i64 3, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_361_count);
  llvm_cbe_tmp__135 = ( char *)(&llvm_cbe_k[(((signed long long )3ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = load i8* %%31, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_362_count);
  llvm_cbe_tmp__136 = (unsigned char )*llvm_cbe_tmp__135;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__136);
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = xor i8 %%32, %%30, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_363_count);
  llvm_cbe_tmp__137 = (unsigned char )((unsigned char )(llvm_cbe_tmp__136 ^ llvm_cbe_tmp__134));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__137);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%33, i8* %%31, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_364_count);
  *llvm_cbe_tmp__135 = llvm_cbe_tmp__137;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__137);
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = load i8* %%rc, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_365_count);
  llvm_cbe_tmp__138 = (unsigned char )*llvm_cbe_rc;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__138);
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = shl i8 %%34, 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_366_count);
  llvm_cbe_tmp__139 = (unsigned char )((unsigned char )(llvm_cbe_tmp__138 << ((unsigned char )1)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__139);
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = ashr i8 %%34, 7, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_367_count);
  llvm_cbe_tmp__140 = (unsigned char )((unsigned char )((( char )((( char )llvm_cbe_tmp__138) >> (( char )((unsigned char )7))))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", (( char )llvm_cbe_tmp__140));
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = and i8 %%36, 27, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_368_count);
  llvm_cbe_tmp__141 = (unsigned char )((unsigned char )(llvm_cbe_tmp__140 & ((unsigned char )27)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__141);
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = xor i8 %%37, %%35, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_369_count);
  llvm_cbe_tmp__142 = (unsigned char )((unsigned char )(llvm_cbe_tmp__141 ^ llvm_cbe_tmp__139));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__142);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%38, i8* %%rc, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_370_count);
  *llvm_cbe_rc = llvm_cbe_tmp__142;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__142);
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = load i8* %%k, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_392_count);
  llvm_cbe_tmp__143 = (unsigned char )*llvm_cbe_k;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__143);
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = getelementptr inbounds i8* %%k, i64 4, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_393_count);
  llvm_cbe_tmp__144 = ( char *)(&llvm_cbe_k[(((signed long long )4ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = load i8* %%40, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_394_count);
  llvm_cbe_tmp__145 = (unsigned char )*llvm_cbe_tmp__144;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__145);
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = xor i8 %%41, %%39, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_395_count);
  llvm_cbe_tmp__146 = (unsigned char )((unsigned char )(llvm_cbe_tmp__145 ^ llvm_cbe_tmp__143));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__146);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%42, i8* %%40, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_396_count);
  *llvm_cbe_tmp__144 = llvm_cbe_tmp__146;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__146);
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = load i8* %%15, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_397_count);
  llvm_cbe_tmp__147 = (unsigned char )*llvm_cbe_tmp__119;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__147);
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = getelementptr inbounds i8* %%k, i64 5, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_398_count);
  llvm_cbe_tmp__148 = ( char *)(&llvm_cbe_k[(((signed long long )5ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = load i8* %%44, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_399_count);
  llvm_cbe_tmp__149 = (unsigned char )*llvm_cbe_tmp__148;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__149);
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = xor i8 %%45, %%43, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_400_count);
  llvm_cbe_tmp__150 = (unsigned char )((unsigned char )(llvm_cbe_tmp__149 ^ llvm_cbe_tmp__147));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__150);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%46, i8* %%44, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_401_count);
  *llvm_cbe_tmp__148 = llvm_cbe_tmp__150;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__150);
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = load i8* %%23, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_402_count);
  llvm_cbe_tmp__151 = (unsigned char )*llvm_cbe_tmp__127;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__151);
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = getelementptr inbounds i8* %%k, i64 6, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_403_count);
  llvm_cbe_tmp__152 = ( char *)(&llvm_cbe_k[(((signed long long )6ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = load i8* %%48, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_404_count);
  llvm_cbe_tmp__153 = (unsigned char )*llvm_cbe_tmp__152;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__153);
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = xor i8 %%49, %%47, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_405_count);
  llvm_cbe_tmp__154 = (unsigned char )((unsigned char )(llvm_cbe_tmp__153 ^ llvm_cbe_tmp__151));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__154);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%50, i8* %%48, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_406_count);
  *llvm_cbe_tmp__152 = llvm_cbe_tmp__154;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__154);
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = load i8* %%31, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_407_count);
  llvm_cbe_tmp__155 = (unsigned char )*llvm_cbe_tmp__135;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__155);
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = getelementptr inbounds i8* %%k, i64 7, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_408_count);
  llvm_cbe_tmp__156 = ( char *)(&llvm_cbe_k[(((signed long long )7ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = load i8* %%52, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_409_count);
  llvm_cbe_tmp__157 = (unsigned char )*llvm_cbe_tmp__156;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__157);
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = xor i8 %%53, %%51, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_410_count);
  llvm_cbe_tmp__158 = (unsigned char )((unsigned char )(llvm_cbe_tmp__157 ^ llvm_cbe_tmp__155));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__158);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%54, i8* %%52, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_411_count);
  *llvm_cbe_tmp__156 = llvm_cbe_tmp__158;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__158);
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = getelementptr inbounds i8* %%k, i64 8, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_433_count);
  llvm_cbe_tmp__159 = ( char *)(&llvm_cbe_k[(((signed long long )8ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = load i8* %%55, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_434_count);
  llvm_cbe_tmp__160 = (unsigned char )*llvm_cbe_tmp__159;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__160);
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = xor i8 %%56, %%42, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_435_count);
  llvm_cbe_tmp__161 = (unsigned char )((unsigned char )(llvm_cbe_tmp__160 ^ llvm_cbe_tmp__146));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__161);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%57, i8* %%55, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_436_count);
  *llvm_cbe_tmp__159 = llvm_cbe_tmp__161;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__161);
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = getelementptr inbounds i8* %%k, i64 9, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_437_count);
  llvm_cbe_tmp__162 = ( char *)(&llvm_cbe_k[(((signed long long )9ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = load i8* %%58, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_438_count);
  llvm_cbe_tmp__163 = (unsigned char )*llvm_cbe_tmp__162;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__163);
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = xor i8 %%59, %%46, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_439_count);
  llvm_cbe_tmp__164 = (unsigned char )((unsigned char )(llvm_cbe_tmp__163 ^ llvm_cbe_tmp__150));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__164);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%60, i8* %%58, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_440_count);
  *llvm_cbe_tmp__162 = llvm_cbe_tmp__164;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__164);
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = getelementptr inbounds i8* %%k, i64 10, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_441_count);
  llvm_cbe_tmp__165 = ( char *)(&llvm_cbe_k[(((signed long long )10ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = load i8* %%61, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_442_count);
  llvm_cbe_tmp__166 = (unsigned char )*llvm_cbe_tmp__165;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__166);
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = xor i8 %%62, %%50, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_443_count);
  llvm_cbe_tmp__167 = (unsigned char )((unsigned char )(llvm_cbe_tmp__166 ^ llvm_cbe_tmp__154));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__167);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%63, i8* %%61, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_444_count);
  *llvm_cbe_tmp__165 = llvm_cbe_tmp__167;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__167);
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = getelementptr inbounds i8* %%k, i64 11, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_445_count);
  llvm_cbe_tmp__168 = ( char *)(&llvm_cbe_k[(((signed long long )11ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = load i8* %%64, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_446_count);
  llvm_cbe_tmp__169 = (unsigned char )*llvm_cbe_tmp__168;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__169);
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = xor i8 %%65, %%54, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_447_count);
  llvm_cbe_tmp__170 = (unsigned char )((unsigned char )(llvm_cbe_tmp__169 ^ llvm_cbe_tmp__158));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__170);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%66, i8* %%64, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_448_count);
  *llvm_cbe_tmp__168 = llvm_cbe_tmp__170;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__170);
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = getelementptr inbounds i8* %%k, i64 12, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_470_count);
  llvm_cbe_tmp__171 = ( char *)(&llvm_cbe_k[(((signed long long )12ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = load i8* %%67, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_471_count);
  llvm_cbe_tmp__172 = (unsigned char )*llvm_cbe_tmp__171;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__172);
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = xor i8 %%68, %%57, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_472_count);
  llvm_cbe_tmp__173 = (unsigned char )((unsigned char )(llvm_cbe_tmp__172 ^ llvm_cbe_tmp__161));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__173);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%69, i8* %%67, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_473_count);
  *llvm_cbe_tmp__171 = llvm_cbe_tmp__173;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__173);
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = getelementptr inbounds i8* %%k, i64 13, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_474_count);
  llvm_cbe_tmp__174 = ( char *)(&llvm_cbe_k[(((signed long long )13ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = load i8* %%70, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_475_count);
  llvm_cbe_tmp__175 = (unsigned char )*llvm_cbe_tmp__174;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__175);
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = xor i8 %%71, %%60, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_476_count);
  llvm_cbe_tmp__176 = (unsigned char )((unsigned char )(llvm_cbe_tmp__175 ^ llvm_cbe_tmp__164));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__176);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%72, i8* %%70, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_477_count);
  *llvm_cbe_tmp__174 = llvm_cbe_tmp__176;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__176);
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = getelementptr inbounds i8* %%k, i64 14, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_478_count);
  llvm_cbe_tmp__177 = ( char *)(&llvm_cbe_k[(((signed long long )14ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = load i8* %%73, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_479_count);
  llvm_cbe_tmp__178 = (unsigned char )*llvm_cbe_tmp__177;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__178);
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = xor i8 %%74, %%63, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_480_count);
  llvm_cbe_tmp__179 = (unsigned char )((unsigned char )(llvm_cbe_tmp__178 ^ llvm_cbe_tmp__167));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__179);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%75, i8* %%73, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_481_count);
  *llvm_cbe_tmp__177 = llvm_cbe_tmp__179;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__179);
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = getelementptr inbounds i8* %%k, i64 15, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_482_count);
  llvm_cbe_tmp__180 = ( char *)(&llvm_cbe_k[(((signed long long )15ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = load i8* %%76, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_483_count);
  llvm_cbe_tmp__181 = (unsigned char )*llvm_cbe_tmp__180;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__181);
if (AESL_DEBUG_TRACE)
printf("\n  %%78 = xor i8 %%77, %%66, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_484_count);
  llvm_cbe_tmp__182 = (unsigned char )((unsigned char )(llvm_cbe_tmp__181 ^ llvm_cbe_tmp__170));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__182);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%78, i8* %%76, align 1, !dbg !8 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_485_count);
  *llvm_cbe_tmp__180 = llvm_cbe_tmp__182;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__182);
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = zext i8 %%69 to i64, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_507_count);
  llvm_cbe_tmp__183 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__173&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__183);
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = getelementptr inbounds [256 x i8]* @sbox, i64 0, i64 %%79, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_508_count);
  llvm_cbe_tmp__184 = ( char *)(&sbox[(((signed long long )llvm_cbe_tmp__183))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__183));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__183) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'sbox' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%81 = load i8* %%80, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_509_count);
  llvm_cbe_tmp__185 = (unsigned char )*llvm_cbe_tmp__184;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__185);
if (AESL_DEBUG_TRACE)
printf("\n  %%82 = getelementptr inbounds i8* %%k, i64 16, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_510_count);
  llvm_cbe_tmp__186 = ( char *)(&llvm_cbe_k[(((signed long long )16ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%83 = load i8* %%82, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_511_count);
  llvm_cbe_tmp__187 = (unsigned char )*llvm_cbe_tmp__186;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__187);
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = xor i8 %%83, %%81, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_512_count);
  llvm_cbe_tmp__188 = (unsigned char )((unsigned char )(llvm_cbe_tmp__187 ^ llvm_cbe_tmp__185));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__188);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%84, i8* %%82, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_513_count);
  *llvm_cbe_tmp__186 = llvm_cbe_tmp__188;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__188);
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = zext i8 %%72 to i64, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_514_count);
  llvm_cbe_tmp__189 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__176&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__189);
if (AESL_DEBUG_TRACE)
printf("\n  %%86 = getelementptr inbounds [256 x i8]* @sbox, i64 0, i64 %%85, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_515_count);
  llvm_cbe_tmp__190 = ( char *)(&sbox[(((signed long long )llvm_cbe_tmp__189))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__189));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__189) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'sbox' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%87 = load i8* %%86, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_516_count);
  llvm_cbe_tmp__191 = (unsigned char )*llvm_cbe_tmp__190;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__191);
if (AESL_DEBUG_TRACE)
printf("\n  %%88 = getelementptr inbounds i8* %%k, i64 17, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_517_count);
  llvm_cbe_tmp__192 = ( char *)(&llvm_cbe_k[(((signed long long )17ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%89 = load i8* %%88, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_518_count);
  llvm_cbe_tmp__193 = (unsigned char )*llvm_cbe_tmp__192;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__193);
if (AESL_DEBUG_TRACE)
printf("\n  %%90 = xor i8 %%89, %%87, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_519_count);
  llvm_cbe_tmp__194 = (unsigned char )((unsigned char )(llvm_cbe_tmp__193 ^ llvm_cbe_tmp__191));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__194);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%90, i8* %%88, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_520_count);
  *llvm_cbe_tmp__192 = llvm_cbe_tmp__194;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__194);
if (AESL_DEBUG_TRACE)
printf("\n  %%91 = zext i8 %%75 to i64, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_521_count);
  llvm_cbe_tmp__195 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__179&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__195);
if (AESL_DEBUG_TRACE)
printf("\n  %%92 = getelementptr inbounds [256 x i8]* @sbox, i64 0, i64 %%91, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_522_count);
  llvm_cbe_tmp__196 = ( char *)(&sbox[(((signed long long )llvm_cbe_tmp__195))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__195));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__195) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'sbox' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = load i8* %%92, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_523_count);
  llvm_cbe_tmp__197 = (unsigned char )*llvm_cbe_tmp__196;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__197);
if (AESL_DEBUG_TRACE)
printf("\n  %%94 = getelementptr inbounds i8* %%k, i64 18, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_524_count);
  llvm_cbe_tmp__198 = ( char *)(&llvm_cbe_k[(((signed long long )18ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = load i8* %%94, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_525_count);
  llvm_cbe_tmp__199 = (unsigned char )*llvm_cbe_tmp__198;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__199);
if (AESL_DEBUG_TRACE)
printf("\n  %%96 = xor i8 %%95, %%93, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_526_count);
  llvm_cbe_tmp__200 = (unsigned char )((unsigned char )(llvm_cbe_tmp__199 ^ llvm_cbe_tmp__197));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__200);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%96, i8* %%94, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_527_count);
  *llvm_cbe_tmp__198 = llvm_cbe_tmp__200;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__200);
if (AESL_DEBUG_TRACE)
printf("\n  %%97 = zext i8 %%78 to i64, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_528_count);
  llvm_cbe_tmp__201 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__182&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__201);
if (AESL_DEBUG_TRACE)
printf("\n  %%98 = getelementptr inbounds [256 x i8]* @sbox, i64 0, i64 %%97, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_529_count);
  llvm_cbe_tmp__202 = ( char *)(&sbox[(((signed long long )llvm_cbe_tmp__201))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__201));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__201) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'sbox' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%99 = load i8* %%98, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_530_count);
  llvm_cbe_tmp__203 = (unsigned char )*llvm_cbe_tmp__202;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__203);
if (AESL_DEBUG_TRACE)
printf("\n  %%100 = getelementptr inbounds i8* %%k, i64 19, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_531_count);
  llvm_cbe_tmp__204 = ( char *)(&llvm_cbe_k[(((signed long long )19ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%101 = load i8* %%100, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_532_count);
  llvm_cbe_tmp__205 = (unsigned char )*llvm_cbe_tmp__204;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__205);
if (AESL_DEBUG_TRACE)
printf("\n  %%102 = xor i8 %%101, %%99, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_533_count);
  llvm_cbe_tmp__206 = (unsigned char )((unsigned char )(llvm_cbe_tmp__205 ^ llvm_cbe_tmp__203));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__206);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%102, i8* %%100, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_534_count);
  *llvm_cbe_tmp__204 = llvm_cbe_tmp__206;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__206);
if (AESL_DEBUG_TRACE)
printf("\n  %%103 = getelementptr inbounds i8* %%k, i64 20, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_556_count);
  llvm_cbe_tmp__207 = ( char *)(&llvm_cbe_k[(((signed long long )20ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%104 = load i8* %%103, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_557_count);
  llvm_cbe_tmp__208 = (unsigned char )*llvm_cbe_tmp__207;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__208);
if (AESL_DEBUG_TRACE)
printf("\n  %%105 = xor i8 %%104, %%84, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_558_count);
  llvm_cbe_tmp__209 = (unsigned char )((unsigned char )(llvm_cbe_tmp__208 ^ llvm_cbe_tmp__188));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__209);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%105, i8* %%103, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_559_count);
  *llvm_cbe_tmp__207 = llvm_cbe_tmp__209;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__209);
if (AESL_DEBUG_TRACE)
printf("\n  %%106 = getelementptr inbounds i8* %%k, i64 21, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_560_count);
  llvm_cbe_tmp__210 = ( char *)(&llvm_cbe_k[(((signed long long )21ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%107 = load i8* %%106, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_561_count);
  llvm_cbe_tmp__211 = (unsigned char )*llvm_cbe_tmp__210;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__211);
if (AESL_DEBUG_TRACE)
printf("\n  %%108 = xor i8 %%107, %%90, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_562_count);
  llvm_cbe_tmp__212 = (unsigned char )((unsigned char )(llvm_cbe_tmp__211 ^ llvm_cbe_tmp__194));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__212);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%108, i8* %%106, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_563_count);
  *llvm_cbe_tmp__210 = llvm_cbe_tmp__212;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__212);
if (AESL_DEBUG_TRACE)
printf("\n  %%109 = getelementptr inbounds i8* %%k, i64 22, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_564_count);
  llvm_cbe_tmp__213 = ( char *)(&llvm_cbe_k[(((signed long long )22ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%110 = load i8* %%109, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_565_count);
  llvm_cbe_tmp__214 = (unsigned char )*llvm_cbe_tmp__213;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__214);
if (AESL_DEBUG_TRACE)
printf("\n  %%111 = xor i8 %%110, %%96, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_566_count);
  llvm_cbe_tmp__215 = (unsigned char )((unsigned char )(llvm_cbe_tmp__214 ^ llvm_cbe_tmp__200));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__215);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%111, i8* %%109, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_567_count);
  *llvm_cbe_tmp__213 = llvm_cbe_tmp__215;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__215);
if (AESL_DEBUG_TRACE)
printf("\n  %%112 = getelementptr inbounds i8* %%k, i64 23, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_568_count);
  llvm_cbe_tmp__216 = ( char *)(&llvm_cbe_k[(((signed long long )23ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%113 = load i8* %%112, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_569_count);
  llvm_cbe_tmp__217 = (unsigned char )*llvm_cbe_tmp__216;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__217);
if (AESL_DEBUG_TRACE)
printf("\n  %%114 = xor i8 %%113, %%102, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_570_count);
  llvm_cbe_tmp__218 = (unsigned char )((unsigned char )(llvm_cbe_tmp__217 ^ llvm_cbe_tmp__206));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__218);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%114, i8* %%112, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_571_count);
  *llvm_cbe_tmp__216 = llvm_cbe_tmp__218;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__218);
if (AESL_DEBUG_TRACE)
printf("\n  %%115 = getelementptr inbounds i8* %%k, i64 24, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_593_count);
  llvm_cbe_tmp__219 = ( char *)(&llvm_cbe_k[(((signed long long )24ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%116 = load i8* %%115, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_594_count);
  llvm_cbe_tmp__220 = (unsigned char )*llvm_cbe_tmp__219;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__220);
if (AESL_DEBUG_TRACE)
printf("\n  %%117 = xor i8 %%116, %%105, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_595_count);
  llvm_cbe_tmp__221 = (unsigned char )((unsigned char )(llvm_cbe_tmp__220 ^ llvm_cbe_tmp__209));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__221);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%117, i8* %%115, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_596_count);
  *llvm_cbe_tmp__219 = llvm_cbe_tmp__221;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__221);
if (AESL_DEBUG_TRACE)
printf("\n  %%118 = getelementptr inbounds i8* %%k, i64 25, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_597_count);
  llvm_cbe_tmp__222 = ( char *)(&llvm_cbe_k[(((signed long long )25ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%119 = load i8* %%118, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_598_count);
  llvm_cbe_tmp__223 = (unsigned char )*llvm_cbe_tmp__222;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__223);
if (AESL_DEBUG_TRACE)
printf("\n  %%120 = xor i8 %%119, %%108, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_599_count);
  llvm_cbe_tmp__224 = (unsigned char )((unsigned char )(llvm_cbe_tmp__223 ^ llvm_cbe_tmp__212));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__224);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%120, i8* %%118, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_600_count);
  *llvm_cbe_tmp__222 = llvm_cbe_tmp__224;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__224);
if (AESL_DEBUG_TRACE)
printf("\n  %%121 = getelementptr inbounds i8* %%k, i64 26, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_601_count);
  llvm_cbe_tmp__225 = ( char *)(&llvm_cbe_k[(((signed long long )26ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%122 = load i8* %%121, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_602_count);
  llvm_cbe_tmp__226 = (unsigned char )*llvm_cbe_tmp__225;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__226);
if (AESL_DEBUG_TRACE)
printf("\n  %%123 = xor i8 %%122, %%111, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_603_count);
  llvm_cbe_tmp__227 = (unsigned char )((unsigned char )(llvm_cbe_tmp__226 ^ llvm_cbe_tmp__215));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__227);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%123, i8* %%121, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_604_count);
  *llvm_cbe_tmp__225 = llvm_cbe_tmp__227;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__227);
if (AESL_DEBUG_TRACE)
printf("\n  %%124 = getelementptr inbounds i8* %%k, i64 27, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_605_count);
  llvm_cbe_tmp__228 = ( char *)(&llvm_cbe_k[(((signed long long )27ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%125 = load i8* %%124, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_606_count);
  llvm_cbe_tmp__229 = (unsigned char )*llvm_cbe_tmp__228;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__229);
if (AESL_DEBUG_TRACE)
printf("\n  %%126 = xor i8 %%125, %%114, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_607_count);
  llvm_cbe_tmp__230 = (unsigned char )((unsigned char )(llvm_cbe_tmp__229 ^ llvm_cbe_tmp__218));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__230);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%126, i8* %%124, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_608_count);
  *llvm_cbe_tmp__228 = llvm_cbe_tmp__230;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__230);
if (AESL_DEBUG_TRACE)
printf("\n  %%127 = load i8* %%26, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_630_count);
  llvm_cbe_tmp__231 = (unsigned char )*llvm_cbe_tmp__130;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__231);
if (AESL_DEBUG_TRACE)
printf("\n  %%128 = xor i8 %%127, %%117, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_631_count);
  llvm_cbe_tmp__232 = (unsigned char )((unsigned char )(llvm_cbe_tmp__231 ^ llvm_cbe_tmp__221));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__232);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%128, i8* %%26, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_632_count);
  *llvm_cbe_tmp__130 = llvm_cbe_tmp__232;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__232);
if (AESL_DEBUG_TRACE)
printf("\n  %%129 = load i8* %%1, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_633_count);
  llvm_cbe_tmp__233 = (unsigned char )*llvm_cbe_tmp__105;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__233);
if (AESL_DEBUG_TRACE)
printf("\n  %%130 = xor i8 %%129, %%120, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_634_count);
  llvm_cbe_tmp__234 = (unsigned char )((unsigned char )(llvm_cbe_tmp__233 ^ llvm_cbe_tmp__224));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__234);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%130, i8* %%1, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_635_count);
  *llvm_cbe_tmp__105 = llvm_cbe_tmp__234;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__234);
if (AESL_DEBUG_TRACE)
printf("\n  %%131 = load i8* %%10, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_636_count);
  llvm_cbe_tmp__235 = (unsigned char )*llvm_cbe_tmp__114;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__235);
if (AESL_DEBUG_TRACE)
printf("\n  %%132 = xor i8 %%131, %%123, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_637_count);
  llvm_cbe_tmp__236 = (unsigned char )((unsigned char )(llvm_cbe_tmp__235 ^ llvm_cbe_tmp__227));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__236);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%132, i8* %%10, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_638_count);
  *llvm_cbe_tmp__114 = llvm_cbe_tmp__236;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__236);
if (AESL_DEBUG_TRACE)
printf("\n  %%133 = load i8* %%18, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_639_count);
  llvm_cbe_tmp__237 = (unsigned char )*llvm_cbe_tmp__122;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__237);
if (AESL_DEBUG_TRACE)
printf("\n  %%134 = xor i8 %%133, %%126, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_640_count);
  llvm_cbe_tmp__238 = (unsigned char )((unsigned char )(llvm_cbe_tmp__237 ^ llvm_cbe_tmp__230));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__238);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%134, i8* %%18, align 1, !dbg !9 for 0x%I64xth hint within @aes_expandEncKey  --> \n", ++aesl_llvm_cbe_641_count);
  *llvm_cbe_tmp__122 = llvm_cbe_tmp__238;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__238);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aes_expandEncKey}\n");
  return;
}


void aes256_encrypt_ecb(l_struct_OC_aes256_context *llvm_cbe_ctx,  char *llvm_cbe_k,  char *llvm_cbe_buf) {
  static  unsigned long long aesl_llvm_cbe_rcon_count = 0;
   char llvm_cbe_rcon;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_664_count = 0;
  static  unsigned long long aesl_llvm_cbe_665_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_686_count = 0;
  static  unsigned long long aesl_llvm_cbe_687_count = 0;
  static  unsigned long long aesl_llvm_cbe_688_count = 0;
  static  unsigned long long aesl_llvm_cbe_689_count = 0;
  static  unsigned long long aesl_llvm_cbe_690_count = 0;
  static  unsigned long long aesl_llvm_cbe_691_count = 0;
  static  unsigned long long aesl_llvm_cbe_692_count = 0;
  static  unsigned long long aesl_llvm_cbe_693_count = 0;
  static  unsigned long long aesl_llvm_cbe_694_count = 0;
  static  unsigned long long aesl_llvm_cbe_695_count = 0;
  static  unsigned long long aesl_llvm_cbe_696_count = 0;
  static  unsigned long long aesl_llvm_cbe_697_count = 0;
  static  unsigned long long aesl_llvm_cbe_698_count = 0;
  static  unsigned long long aesl_llvm_cbe_699_count = 0;
  static  unsigned long long aesl_llvm_cbe_700_count = 0;
  static  unsigned long long aesl_llvm_cbe_701_count = 0;
  static  unsigned long long aesl_llvm_cbe_702_count = 0;
  static  unsigned long long aesl_llvm_cbe_703_count = 0;
  static  unsigned long long aesl_llvm_cbe_704_count = 0;
  static  unsigned long long aesl_llvm_cbe_705_count = 0;
  static  unsigned long long aesl_llvm_cbe_706_count = 0;
  static  unsigned long long aesl_llvm_cbe_707_count = 0;
  static  unsigned long long aesl_llvm_cbe_708_count = 0;
  static  unsigned long long aesl_llvm_cbe_709_count = 0;
  static  unsigned long long aesl_llvm_cbe_710_count = 0;
  static  unsigned long long aesl_llvm_cbe_711_count = 0;
  static  unsigned long long aesl_llvm_cbe_712_count = 0;
  static  unsigned long long aesl_llvm_cbe_713_count = 0;
  static  unsigned long long aesl_llvm_cbe_714_count = 0;
  static  unsigned long long aesl_llvm_cbe_715_count = 0;
  static  unsigned long long aesl_llvm_cbe_716_count = 0;
   char *llvm_cbe_tmp__239;
  static  unsigned long long aesl_llvm_cbe_717_count = 0;
  static  unsigned long long aesl_llvm_cbe_718_count = 0;
  static  unsigned long long aesl_llvm_cbe_719_count = 0;
  static  unsigned long long aesl_llvm_cbe_720_count = 0;
  static  unsigned long long aesl_llvm_cbe_721_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_740_count = 0;
  static  unsigned long long aesl_llvm_cbe_741_count = 0;
  static  unsigned long long aesl_llvm_cbe_742_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_763_count = 0;
  static  unsigned long long aesl_llvm_cbe_764_count = 0;
  static  unsigned long long aesl_llvm_cbe_765_count = 0;
  static  unsigned long long aesl_llvm_cbe_766_count = 0;
  static  unsigned long long aesl_llvm_cbe_767_count = 0;
  static  unsigned long long aesl_llvm_cbe_768_count = 0;
  static  unsigned long long aesl_llvm_cbe_769_count = 0;
  static  unsigned long long aesl_llvm_cbe_770_count = 0;
  static  unsigned long long aesl_llvm_cbe_771_count = 0;
  static  unsigned long long aesl_llvm_cbe_772_count = 0;
  static  unsigned long long aesl_llvm_cbe_773_count = 0;
  static  unsigned long long aesl_llvm_cbe_774_count = 0;
  static  unsigned long long aesl_llvm_cbe_775_count = 0;
  static  unsigned long long aesl_llvm_cbe_776_count = 0;
  static  unsigned long long aesl_llvm_cbe_777_count = 0;
  static  unsigned long long aesl_llvm_cbe_778_count = 0;
  static  unsigned long long aesl_llvm_cbe_779_count = 0;
  static  unsigned long long aesl_llvm_cbe_780_count = 0;
  static  unsigned long long aesl_llvm_cbe_781_count = 0;
  static  unsigned long long aesl_llvm_cbe_782_count = 0;
  static  unsigned long long aesl_llvm_cbe_783_count = 0;
  static  unsigned long long aesl_llvm_cbe_784_count = 0;
  static  unsigned long long aesl_llvm_cbe_785_count = 0;
  static  unsigned long long aesl_llvm_cbe_786_count = 0;
  static  unsigned long long aesl_llvm_cbe_787_count = 0;
  static  unsigned long long aesl_llvm_cbe_788_count = 0;
  static  unsigned long long aesl_llvm_cbe_789_count = 0;
  static  unsigned long long aesl_llvm_cbe_790_count = 0;
  static  unsigned long long aesl_llvm_cbe_791_count = 0;
  static  unsigned long long aesl_llvm_cbe_792_count = 0;
  static  unsigned long long aesl_llvm_cbe_793_count = 0;
  static  unsigned long long aesl_llvm_cbe_794_count = 0;
   char *llvm_cbe_tmp__240;
  static  unsigned long long aesl_llvm_cbe_795_count = 0;
   char *llvm_cbe_tmp__241;
  static  unsigned long long aesl_llvm_cbe_796_count = 0;
  static  unsigned long long aesl_llvm_cbe_797_count = 0;
  static  unsigned long long aesl_llvm_cbe_798_count = 0;
  static  unsigned long long aesl_llvm_cbe_799_count = 0;
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
   char *llvm_cbe_tmp__242;
  static  unsigned long long aesl_llvm_cbe_815_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge5_count = 0;
  unsigned char llvm_cbe_storemerge5;
  unsigned char llvm_cbe_storemerge5__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_816_count = 0;
  unsigned long long llvm_cbe_tmp__243;
  static  unsigned long long aesl_llvm_cbe_817_count = 0;
   char *llvm_cbe_tmp__244;
  static  unsigned long long aesl_llvm_cbe_818_count = 0;
  unsigned char llvm_cbe_tmp__245;
  static  unsigned long long aesl_llvm_cbe_819_count = 0;
   char *llvm_cbe_tmp__246;
  static  unsigned long long aesl_llvm_cbe_820_count = 0;
  static  unsigned long long aesl_llvm_cbe_821_count = 0;
   char *llvm_cbe_tmp__247;
  static  unsigned long long aesl_llvm_cbe_822_count = 0;
  static  unsigned long long aesl_llvm_cbe_823_count = 0;
  unsigned char llvm_cbe_tmp__248;
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
  static  unsigned long long aesl_llvm_cbe_exitcond6_count = 0;
  static  unsigned long long aesl_llvm_cbe_834_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge13_count = 0;
  unsigned char llvm_cbe_storemerge13;
  unsigned char llvm_cbe_storemerge13__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_835_count = 0;
  static  unsigned long long aesl_llvm_cbe_836_count = 0;
  static  unsigned long long aesl_llvm_cbe_837_count = 0;
  static  unsigned long long aesl_llvm_cbe_838_count = 0;
  unsigned char llvm_cbe_tmp__249;
  static  unsigned long long aesl_llvm_cbe_839_count = 0;
  static  unsigned long long aesl_llvm_cbe_840_count = 0;
  static  unsigned long long aesl_llvm_cbe_841_count = 0;
  static  unsigned long long aesl_llvm_cbe_842_count = 0;
  static  unsigned long long aesl_llvm_cbe_843_count = 0;
  static  unsigned long long aesl_llvm_cbe_844_count = 0;
  static  unsigned long long aesl_llvm_cbe_845_count = 0;
  static  unsigned long long aesl_llvm_cbe_846_count = 0;
  unsigned char llvm_cbe_tmp__250;
  static  unsigned long long aesl_llvm_cbe_847_count = 0;
  static  unsigned long long aesl_llvm_cbe_848_count = 0;
  static  unsigned long long aesl_llvm_cbe_849_count = 0;
  static  unsigned long long aesl_llvm_cbe_850_count = 0;
  static  unsigned long long aesl_llvm_cbe_851_count = 0;
  static  unsigned long long aesl_llvm_cbe_852_count = 0;
  static  unsigned long long aesl_llvm_cbe_853_count = 0;
  static  unsigned long long aesl_llvm_cbe_854_count = 0;
  static  unsigned long long aesl_llvm_cbe_855_count = 0;
  static  unsigned long long aesl_llvm_cbe_856_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_857_count = 0;
  static  unsigned long long aesl_llvm_cbe_858_count = 0;
  static  unsigned long long aesl_llvm_cbe_859_count = 0;
  static  unsigned long long aesl_llvm_cbe_860_count = 0;
  static  unsigned long long aesl_llvm_cbe_861_count = 0;
  static  unsigned long long aesl_llvm_cbe_862_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aes256_encrypt_ecb\n");
if (AESL_DEBUG_TRACE)
printf("\n  store i8 1, i8* %%rcon, align 1, !dbg !11 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_694_count);
  *(&llvm_cbe_rcon) = ((unsigned char )1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )1));
  llvm_cbe_storemerge5__PHI_TEMPORARY = (unsigned char )((unsigned char )0);   /* for PHI node */
  goto llvm_cbe_tmp__251;

llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = getelementptr inbounds %%struct.aes256_context* %%ctx, i64 0, i32 2, i64 0, !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_716_count);
  llvm_cbe_tmp__239 = ( char *)(&llvm_cbe_ctx->field2[(((signed long long )0ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_expandEncKey(i8* %%1, i8* %%rcon), !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_717_count);
  aes_expandEncKey(( char *)llvm_cbe_tmp__239, ( char *)(&llvm_cbe_rcon));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_expandEncKey(i8* %%1, i8* %%rcon), !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_728_count);
  aes_expandEncKey(( char *)llvm_cbe_tmp__239, ( char *)(&llvm_cbe_rcon));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_expandEncKey(i8* %%1, i8* %%rcon), !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_739_count);
  aes_expandEncKey(( char *)llvm_cbe_tmp__239, ( char *)(&llvm_cbe_rcon));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_expandEncKey(i8* %%1, i8* %%rcon), !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_750_count);
  aes_expandEncKey(( char *)llvm_cbe_tmp__239, ( char *)(&llvm_cbe_rcon));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_expandEncKey(i8* %%1, i8* %%rcon), !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_761_count);
  aes_expandEncKey(( char *)llvm_cbe_tmp__239, ( char *)(&llvm_cbe_rcon));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_expandEncKey(i8* %%1, i8* %%rcon), !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_772_count);
  aes_expandEncKey(( char *)llvm_cbe_tmp__239, ( char *)(&llvm_cbe_rcon));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_expandEncKey(i8* %%1, i8* %%rcon), !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_783_count);
  aes_expandEncKey(( char *)llvm_cbe_tmp__239, ( char *)(&llvm_cbe_rcon));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = getelementptr inbounds %%struct.aes256_context* %%ctx, i64 0, i32 1, i64 0, !dbg !9 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_794_count);
  llvm_cbe_tmp__240 = ( char *)(&llvm_cbe_ctx->field1[(((signed long long )0ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds %%struct.aes256_context* %%ctx, i64 0, i32 0, i64 0, !dbg !9 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_795_count);
  llvm_cbe_tmp__241 = ( char *)(&llvm_cbe_ctx->field0[(((signed long long )0ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_addRoundKey_cpy(i8* %%buf, i8* %%2, i8* %%3), !dbg !9 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_796_count);
  aes_addRoundKey_cpy(( char *)llvm_cbe_buf, ( char *)llvm_cbe_tmp__240, ( char *)llvm_cbe_tmp__241);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 1, i8* %%rcon, align 1, !dbg !11 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_813_count);
  *(&llvm_cbe_rcon) = ((unsigned char )1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )1));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds %%struct.aes256_context* %%ctx, i64 0, i32 0, i64 16, !dbg !9 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_814_count);
  llvm_cbe_tmp__242 = ( char *)(&llvm_cbe_ctx->field0[(((signed long long )16ull))]);
if (AESL_DEBUG_TRACE) {
}
  llvm_cbe_storemerge13__PHI_TEMPORARY = (unsigned char )((unsigned char )1);   /* for PHI node */
  goto llvm_cbe_tmp__252;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__251:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge5 = phi i8 [ 0, %%0 ], [ %%11, %%5  for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_storemerge5_count);
  llvm_cbe_storemerge5 = (unsigned char )llvm_cbe_storemerge5__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge5 = 0x%X",llvm_cbe_storemerge5);
printf("\n = 0x%X",((unsigned char )0));
printf("\n = 0x%X",llvm_cbe_tmp__248);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = zext i8 %%storemerge5 to i64, !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_816_count);
  llvm_cbe_tmp__243 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_storemerge5&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__243);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds i8* %%k, i64 %%6, !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_817_count);
  llvm_cbe_tmp__244 = ( char *)(&llvm_cbe_k[(((signed long long )llvm_cbe_tmp__243))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__243));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i8* %%7, align 1, !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_818_count);
  llvm_cbe_tmp__245 = (unsigned char )*llvm_cbe_tmp__244;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__245);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds %%struct.aes256_context* %%ctx, i64 0, i32 2, i64 %%6, !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_819_count);
  llvm_cbe_tmp__246 = ( char *)(&llvm_cbe_ctx->field2[(((signed long long )llvm_cbe_tmp__243))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__243));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%8, i8* %%9, align 1, !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_820_count);
  *llvm_cbe_tmp__246 = llvm_cbe_tmp__245;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__245);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr inbounds %%struct.aes256_context* %%ctx, i64 0, i32 1, i64 %%6, !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_821_count);
  llvm_cbe_tmp__247 = ( char *)(&llvm_cbe_ctx->field1[(((signed long long )llvm_cbe_tmp__243))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__243));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%8, i8* %%10, align 1, !dbg !8 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_822_count);
  *llvm_cbe_tmp__247 = llvm_cbe_tmp__245;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__245);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = add i8 %%storemerge5, 1, !dbg !11 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_823_count);
  llvm_cbe_tmp__248 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_storemerge5&255ull)) + ((unsigned char )(((unsigned char )1)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__248&255ull)));
  if (((llvm_cbe_tmp__248&255U) == (((unsigned char )32)&255U))) {
    goto llvm_cbe__2e_preheader;
  } else {
    llvm_cbe_storemerge5__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__248;   /* for PHI node */
    goto llvm_cbe_tmp__251;
  }

  } while (1); /* end of syntactic loop '' */
  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__252:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge13 = phi i8 [ 1, %%.preheader ], [ %%18, %%17  for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_storemerge13_count);
  llvm_cbe_storemerge13 = (unsigned char )llvm_cbe_storemerge13__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge13 = 0x%X",llvm_cbe_storemerge13);
printf("\n = 0x%X",((unsigned char )1));
printf("\n = 0x%X",llvm_cbe_tmp__250);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_subBytes(i8* %%buf), !dbg !10 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_835_count);
  aes_subBytes(( char *)llvm_cbe_buf);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_shiftRows(i8* %%buf), !dbg !10 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_836_count);
  aes_shiftRows(( char *)llvm_cbe_buf);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_mixColumns(i8* %%buf), !dbg !10 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_837_count);
  aes_mixColumns(( char *)llvm_cbe_buf);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = and i8 %%storemerge13, 1, !dbg !11 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_838_count);
  llvm_cbe_tmp__249 = (unsigned char )((unsigned char )(llvm_cbe_storemerge13 & ((unsigned char )1)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__249);
  if (((llvm_cbe_tmp__249&255U) == (((unsigned char )0)&255U))) {
    goto llvm_cbe_tmp__253;
  } else {
    goto llvm_cbe_tmp__254;
  }

llvm_cbe_tmp__255:
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = add i8 %%storemerge13, 1, !dbg !11 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_846_count);
  llvm_cbe_tmp__250 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_storemerge13&255ull)) + ((unsigned char )(((unsigned char )1)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__250&255ull)));
  if (((llvm_cbe_tmp__250&255U) == (((unsigned char )14)&255U))) {
    goto llvm_cbe_tmp__256;
  } else {
    llvm_cbe_storemerge13__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__250;   /* for PHI node */
    goto llvm_cbe_tmp__252;
  }

llvm_cbe_tmp__254:
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_addRoundKey(i8* %%buf, i8* %%4), !dbg !9 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_841_count);
  aes_addRoundKey(( char *)llvm_cbe_buf, ( char *)llvm_cbe_tmp__242);
if (AESL_DEBUG_TRACE) {
}
  goto llvm_cbe_tmp__255;

llvm_cbe_tmp__253:
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_expandEncKey(i8* %%3, i8* %%rcon), !dbg !9 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_843_count);
  aes_expandEncKey(( char *)llvm_cbe_tmp__241, ( char *)(&llvm_cbe_rcon));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_addRoundKey(i8* %%buf, i8* %%3), !dbg !9 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_844_count);
  aes_addRoundKey(( char *)llvm_cbe_buf, ( char *)llvm_cbe_tmp__241);
if (AESL_DEBUG_TRACE) {
}
  goto llvm_cbe_tmp__255;

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__256:
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_subBytes(i8* %%buf), !dbg !10 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_858_count);
  aes_subBytes(( char *)llvm_cbe_buf);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_shiftRows(i8* %%buf), !dbg !10 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_859_count);
  aes_shiftRows(( char *)llvm_cbe_buf);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_expandEncKey(i8* %%3, i8* %%rcon), !dbg !9 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_860_count);
  aes_expandEncKey(( char *)llvm_cbe_tmp__241, ( char *)(&llvm_cbe_rcon));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @aes_addRoundKey(i8* %%buf, i8* %%3), !dbg !9 for 0x%I64xth hint within @aes256_encrypt_ecb  --> \n", ++aesl_llvm_cbe_861_count);
  aes_addRoundKey(( char *)llvm_cbe_buf, ( char *)llvm_cbe_tmp__241);
if (AESL_DEBUG_TRACE) {
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aes256_encrypt_ecb}\n");
  return;
}

