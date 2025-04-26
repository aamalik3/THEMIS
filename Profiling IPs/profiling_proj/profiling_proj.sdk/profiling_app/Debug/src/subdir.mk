################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/PR_executer.c \
../src/aes_profiling.c \
../src/bfs_my_module.c \
../src/fft_profiling.c \
../src/gemm_profiling.c \
../src/helloworld.c \
../src/kmp_profiling.c \
../src/latency_counter.c \
../src/platform.c \
../src/scheduler.c \
../src/sha_profiling.c \
../src/sort_profiling.c \
../src/spmv_profiling.c 

OBJS += \
./src/PR_executer.o \
./src/aes_profiling.o \
./src/bfs_my_module.o \
./src/fft_profiling.o \
./src/gemm_profiling.o \
./src/helloworld.o \
./src/kmp_profiling.o \
./src/latency_counter.o \
./src/platform.o \
./src/scheduler.o \
./src/sha_profiling.o \
./src/sort_profiling.o \
./src/spmv_profiling.o 

C_DEPS += \
./src/PR_executer.d \
./src/aes_profiling.d \
./src/bfs_my_module.d \
./src/fft_profiling.d \
./src/gemm_profiling.d \
./src/helloworld.d \
./src/kmp_profiling.d \
./src/latency_counter.d \
./src/platform.d \
./src/scheduler.d \
./src/sha_profiling.d \
./src/sort_profiling.d \
./src/spmv_profiling.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../profiling_app_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


