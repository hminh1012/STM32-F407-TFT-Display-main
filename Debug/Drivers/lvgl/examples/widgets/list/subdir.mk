################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/examples/widgets/list/lv_example_list_1.c \
../Drivers/lvgl/examples/widgets/list/lv_example_list_2.c 

OBJS += \
./Drivers/lvgl/examples/widgets/list/lv_example_list_1.o \
./Drivers/lvgl/examples/widgets/list/lv_example_list_2.o 

C_DEPS += \
./Drivers/lvgl/examples/widgets/list/lv_example_list_1.d \
./Drivers/lvgl/examples/widgets/list/lv_example_list_2.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/examples/widgets/list/%.o Drivers/lvgl/examples/widgets/list/%.su Drivers/lvgl/examples/widgets/list/%.cyclo: ../Drivers/lvgl/examples/widgets/list/%.c Drivers/lvgl/examples/widgets/list/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/lvgl" -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/UI" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I/home/kiet/STM32CubeIDE/workspace_1.18.1/STM32_TFT_Display_F407/Drivers/lvgl -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-list

clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-list:
	-$(RM) ./Drivers/lvgl/examples/widgets/list/lv_example_list_1.cyclo ./Drivers/lvgl/examples/widgets/list/lv_example_list_1.d ./Drivers/lvgl/examples/widgets/list/lv_example_list_1.o ./Drivers/lvgl/examples/widgets/list/lv_example_list_1.su ./Drivers/lvgl/examples/widgets/list/lv_example_list_2.cyclo ./Drivers/lvgl/examples/widgets/list/lv_example_list_2.d ./Drivers/lvgl/examples/widgets/list/lv_example_list_2.o ./Drivers/lvgl/examples/widgets/list/lv_example_list_2.su

.PHONY: clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-list

