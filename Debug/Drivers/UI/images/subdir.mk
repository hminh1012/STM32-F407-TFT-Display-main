################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/UI/images/ui_img_1334565599.c \
../Drivers/UI/images/ui_img_1334569699.c \
../Drivers/UI/images/ui_img_1349165757.c \
../Drivers/UI/images/ui_img_1425725674.c \
../Drivers/UI/images/ui_img_1774135500.c \
../Drivers/UI/images/ui_img_airbag_png.c 

OBJS += \
./Drivers/UI/images/ui_img_1334565599.o \
./Drivers/UI/images/ui_img_1334569699.o \
./Drivers/UI/images/ui_img_1349165757.o \
./Drivers/UI/images/ui_img_1425725674.o \
./Drivers/UI/images/ui_img_1774135500.o \
./Drivers/UI/images/ui_img_airbag_png.o 

C_DEPS += \
./Drivers/UI/images/ui_img_1334565599.d \
./Drivers/UI/images/ui_img_1334569699.d \
./Drivers/UI/images/ui_img_1349165757.d \
./Drivers/UI/images/ui_img_1425725674.d \
./Drivers/UI/images/ui_img_1774135500.d \
./Drivers/UI/images/ui_img_airbag_png.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/UI/images/%.o Drivers/UI/images/%.su Drivers/UI/images/%.cyclo: ../Drivers/UI/images/%.c Drivers/UI/images/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/lvgl" -I"D:/STM32CubeIDE/workspace_TFT/STM32-F407-TFT-Display-main/STM32-F407-TFT-Display-main/Drivers/UI" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I/home/kiet/STM32CubeIDE/workspace_1.18.1/STM32_TFT_Display_F407/Drivers/lvgl -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-UI-2f-images

clean-Drivers-2f-UI-2f-images:
	-$(RM) ./Drivers/UI/images/ui_img_1334565599.cyclo ./Drivers/UI/images/ui_img_1334565599.d ./Drivers/UI/images/ui_img_1334565599.o ./Drivers/UI/images/ui_img_1334565599.su ./Drivers/UI/images/ui_img_1334569699.cyclo ./Drivers/UI/images/ui_img_1334569699.d ./Drivers/UI/images/ui_img_1334569699.o ./Drivers/UI/images/ui_img_1334569699.su ./Drivers/UI/images/ui_img_1349165757.cyclo ./Drivers/UI/images/ui_img_1349165757.d ./Drivers/UI/images/ui_img_1349165757.o ./Drivers/UI/images/ui_img_1349165757.su ./Drivers/UI/images/ui_img_1425725674.cyclo ./Drivers/UI/images/ui_img_1425725674.d ./Drivers/UI/images/ui_img_1425725674.o ./Drivers/UI/images/ui_img_1425725674.su ./Drivers/UI/images/ui_img_1774135500.cyclo ./Drivers/UI/images/ui_img_1774135500.d ./Drivers/UI/images/ui_img_1774135500.o ./Drivers/UI/images/ui_img_1774135500.su ./Drivers/UI/images/ui_img_airbag_png.cyclo ./Drivers/UI/images/ui_img_airbag_png.d ./Drivers/UI/images/ui_img_airbag_png.o ./Drivers/UI/images/ui_img_airbag_png.su

.PHONY: clean-Drivers-2f-UI-2f-images

