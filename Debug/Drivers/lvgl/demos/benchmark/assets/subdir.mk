################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.c \
../Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.c \
../Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.c \
../Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.c \
../Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.c \
../Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.c \
../Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.c \
../Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.c \
../Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.c 

OBJS += \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.o \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.o \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.o \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.o \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.o \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.o \
./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.o \
./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.o \
./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.o 

C_DEPS += \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.d \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.d \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.d \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.d \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.d \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.d \
./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.d \
./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.d \
./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/demos/benchmark/assets/%.o Drivers/lvgl/demos/benchmark/assets/%.su Drivers/lvgl/demos/benchmark/assets/%.cyclo: ../Drivers/lvgl/demos/benchmark/assets/%.c Drivers/lvgl/demos/benchmark/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/lvgl" -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/UI" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I/home/kiet/STM32CubeIDE/workspace_1.18.1/STM32_TFT_Display_F407/Drivers/lvgl -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-demos-2f-benchmark-2f-assets

clean-Drivers-2f-lvgl-2f-demos-2f-benchmark-2f-assets:
	-$(RM) ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.cyclo ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.d ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.o ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.su ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.cyclo ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.d ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.o ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.su ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.cyclo ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.d ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.o ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.su ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.cyclo ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.d ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.o ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.su ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.cyclo ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.d ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.o ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.su ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.cyclo ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.d ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.o ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.su ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.cyclo ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.d ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.o ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.su ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.cyclo ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.d ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.o ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.su ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.cyclo ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.d ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.o ./Drivers/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.su

.PHONY: clean-Drivers-2f-lvgl-2f-demos-2f-benchmark-2f-assets

