################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/examples/libs/png/img_wink_png.c \
../Drivers/lvgl/examples/libs/png/lv_example_png_1.c 

OBJS += \
./Drivers/lvgl/examples/libs/png/img_wink_png.o \
./Drivers/lvgl/examples/libs/png/lv_example_png_1.o 

C_DEPS += \
./Drivers/lvgl/examples/libs/png/img_wink_png.d \
./Drivers/lvgl/examples/libs/png/lv_example_png_1.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/examples/libs/png/%.o Drivers/lvgl/examples/libs/png/%.su Drivers/lvgl/examples/libs/png/%.cyclo: ../Drivers/lvgl/examples/libs/png/%.c Drivers/lvgl/examples/libs/png/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/lvgl" -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/UI" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I/home/kiet/STM32CubeIDE/workspace_1.18.1/STM32_TFT_Display_F407/Drivers/lvgl -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-examples-2f-libs-2f-png

clean-Drivers-2f-lvgl-2f-examples-2f-libs-2f-png:
	-$(RM) ./Drivers/lvgl/examples/libs/png/img_wink_png.cyclo ./Drivers/lvgl/examples/libs/png/img_wink_png.d ./Drivers/lvgl/examples/libs/png/img_wink_png.o ./Drivers/lvgl/examples/libs/png/img_wink_png.su ./Drivers/lvgl/examples/libs/png/lv_example_png_1.cyclo ./Drivers/lvgl/examples/libs/png/lv_example_png_1.d ./Drivers/lvgl/examples/libs/png/lv_example_png_1.o ./Drivers/lvgl/examples/libs/png/lv_example_png_1.su

.PHONY: clean-Drivers-2f-lvgl-2f-examples-2f-libs-2f-png

