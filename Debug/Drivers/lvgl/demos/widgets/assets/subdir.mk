################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/demos/widgets/assets/img_clothes.c \
../Drivers/lvgl/demos/widgets/assets/img_demo_widgets_avatar.c \
../Drivers/lvgl/demos/widgets/assets/img_lvgl_logo.c 

OBJS += \
./Drivers/lvgl/demos/widgets/assets/img_clothes.o \
./Drivers/lvgl/demos/widgets/assets/img_demo_widgets_avatar.o \
./Drivers/lvgl/demos/widgets/assets/img_lvgl_logo.o 

C_DEPS += \
./Drivers/lvgl/demos/widgets/assets/img_clothes.d \
./Drivers/lvgl/demos/widgets/assets/img_demo_widgets_avatar.d \
./Drivers/lvgl/demos/widgets/assets/img_lvgl_logo.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/demos/widgets/assets/%.o Drivers/lvgl/demos/widgets/assets/%.su Drivers/lvgl/demos/widgets/assets/%.cyclo: ../Drivers/lvgl/demos/widgets/assets/%.c Drivers/lvgl/demos/widgets/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/lvgl" -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/UI" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I/home/kiet/STM32CubeIDE/workspace_1.18.1/STM32_TFT_Display_F407/Drivers/lvgl -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-demos-2f-widgets-2f-assets

clean-Drivers-2f-lvgl-2f-demos-2f-widgets-2f-assets:
	-$(RM) ./Drivers/lvgl/demos/widgets/assets/img_clothes.cyclo ./Drivers/lvgl/demos/widgets/assets/img_clothes.d ./Drivers/lvgl/demos/widgets/assets/img_clothes.o ./Drivers/lvgl/demos/widgets/assets/img_clothes.su ./Drivers/lvgl/demos/widgets/assets/img_demo_widgets_avatar.cyclo ./Drivers/lvgl/demos/widgets/assets/img_demo_widgets_avatar.d ./Drivers/lvgl/demos/widgets/assets/img_demo_widgets_avatar.o ./Drivers/lvgl/demos/widgets/assets/img_demo_widgets_avatar.su ./Drivers/lvgl/demos/widgets/assets/img_lvgl_logo.cyclo ./Drivers/lvgl/demos/widgets/assets/img_lvgl_logo.d ./Drivers/lvgl/demos/widgets/assets/img_lvgl_logo.o ./Drivers/lvgl/demos/widgets/assets/img_lvgl_logo.su

.PHONY: clean-Drivers-2f-lvgl-2f-demos-2f-widgets-2f-assets

