################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/UI/components/ui_comp_hook.c 

OBJS += \
./Drivers/UI/components/ui_comp_hook.o 

C_DEPS += \
./Drivers/UI/components/ui_comp_hook.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/UI/components/%.o Drivers/UI/components/%.su Drivers/UI/components/%.cyclo: ../Drivers/UI/components/%.c Drivers/UI/components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/lvgl" -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/UI" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I/home/kiet/STM32CubeIDE/workspace_1.18.1/STM32_TFT_Display_F407/Drivers/lvgl -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-UI-2f-components

clean-Drivers-2f-UI-2f-components:
	-$(RM) ./Drivers/UI/components/ui_comp_hook.cyclo ./Drivers/UI/components/ui_comp_hook.d ./Drivers/UI/components/ui_comp_hook.o ./Drivers/UI/components/ui_comp_hook.su

.PHONY: clean-Drivers-2f-UI-2f-components

