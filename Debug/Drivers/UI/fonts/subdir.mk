################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/UI/fonts/ui_font_Number.c 

OBJS += \
./Drivers/UI/fonts/ui_font_Number.o 

C_DEPS += \
./Drivers/UI/fonts/ui_font_Number.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/UI/fonts/%.o Drivers/UI/fonts/%.su Drivers/UI/fonts/%.cyclo: ../Drivers/UI/fonts/%.c Drivers/UI/fonts/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/lvgl" -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/UI" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I/home/kiet/STM32CubeIDE/workspace_1.18.1/STM32_TFT_Display_F407/Drivers/lvgl -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-UI-2f-fonts

clean-Drivers-2f-UI-2f-fonts:
	-$(RM) ./Drivers/UI/fonts/ui_font_Number.cyclo ./Drivers/UI/fonts/ui_font_Number.d ./Drivers/UI/fonts/ui_font_Number.o ./Drivers/UI/fonts/ui_font_Number.su

.PHONY: clean-Drivers-2f-UI-2f-fonts

