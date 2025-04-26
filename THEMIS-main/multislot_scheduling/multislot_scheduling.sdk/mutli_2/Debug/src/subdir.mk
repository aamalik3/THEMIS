################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/PR_executer.c \
../src/aes_checker.c \
../src/bfs_checker.c \
../src/fft_checker.c \
../src/fft_profiling.c \
../src/gemm_checker.c \
../src/helloworld.c \
../src/kmp_checker.c \
../src/platform.c \
../src/scheduler.c \
../src/sha_checker.c \
../src/sha_profiling.c \
../src/sort_checker.c \
../src/sort_profiling.c \
../src/spmv_checking.c \
../src/stencil_checker.c \
../src/stfs_scheduling.c 

OBJS += \
./src/PR_executer.o \
./src/aes_checker.o \
./src/bfs_checker.o \
./src/fft_checker.o \
./src/fft_profiling.o \
./src/gemm_checker.o \
./src/helloworld.o \
./src/kmp_checker.o \
./src/platform.o \
./src/scheduler.o \
./src/sha_checker.o \
./src/sha_profiling.o \
./src/sort_checker.o \
./src/sort_profiling.o \
./src/spmv_checking.o \
./src/stencil_checker.o \
./src/stfs_scheduling.o 

C_DEPS += \
./src/PR_executer.d \
./src/aes_checker.d \
./src/bfs_checker.d \
./src/fft_checker.d \
./src/fft_profiling.d \
./src/gemm_checker.d \
./src/helloworld.d \
./src/kmp_checker.d \
./src/platform.d \
./src/scheduler.d \
./src/sha_checker.d \
./src/sha_profiling.d \
./src/sort_checker.d \
./src/sort_profiling.d \
./src/spmv_checking.d \
./src/stencil_checker.d \
./src/stfs_scheduling.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../mutli_2_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


