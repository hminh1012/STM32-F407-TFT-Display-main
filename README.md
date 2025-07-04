# STM32-F407-TFT-Display

Cre: https://github.com/lukas0173/STM32-F407-TFT-Display.git

Link Youtube: https://youtu.be/4Q9slg72BXE?si=NKwpC67XfI1g5_zQ

Link Youtube Full: https://youtu.be/QYsB1-hZlzI?si=pJNaX-6_GcHTe9Gh


The project will utilize the 3.5-inch TFT LCD (Wireshark clone), ILI9486 chip, with the STM32F407VGT6 dev kit. An additional adapter layer is needed over the original Wireshark driver for LVGL compatibility (`Core/Inc/ili9846_lvgl.h`, and `Core/Src/ili9846_lvgl.c`). This adapter layer is inspired by the ILI9341 driver, following this tutorial: https://controllerstech.com/lvgl-on-stm32-part-1/

The result like this

![img2](https://github.com/hminh1012/STM32-F407-TFT-Display-main/blob/8da09e22ca64517237e741999bbd76d977fa7cdc/img/UI_d%E1%BA%B9mo.gif)


Hence we intergrated with our project

![img](https://github.com/hminh1012/STM32-F407-TFT-Display-main/blob/4f19c8eadb7831bfeaed505349f6ff52e63e673b/img/Full.png)


## Notes
### Dashboard UI
The Dashboard UI for my project is located in `Drivers/UI`, you can use it as a reference. This folder is exported as a designed ui using [SquareLine Studio](http://squareline.io/)
### Dependencies
- ili9486 driver headers and sources are located inside `Core/Inc` and `Core/Src`
- Make sure to copy all of the font files, `LCDController`, `ILI9486`, and `ili9486_lvgl`.
- This project is using LVGL v8.3 for compatibility, located in `Drivers` folder, make sure to copy the `lv_config.h` as well.

After copying the `lvgl` folder to `Drivers` directory, include the path by right-clicking on the project and opening Properties. Then head to `c/c++ Build` -> `Settings` -> `MCU GCC Compiler` -> `Include Paths`, then add the `lvgl` folder.
### Configurations
Besides copying all the necessary files into your projects, you will need to make the following change to the timer interrupt. In my case is the file `stm32f4xx_it.c`.
```c
void SysTick_Handler(void) {
	/* USER CODE BEGIN SysTick_IRQn 0 */
	lv_tick_inc(1);

	/* USER CODE END SysTick_IRQn 0 */
	HAL_IncTick();
	/* USER CODE BEGIN SysTick_IRQn 1 */

	/* USER CODE END SysTick_IRQn 1 */
}
```
I'm using the following pin as Output:
- PE11 -> CS.
- PE12 -> DC.
- PE13 -> RESET.
  
If you wanted to use the other pins, make sure to modify the driver header file `ILI9486.h`:
```cpp
#define LCD_CS_0        HAL_GPIO_WritePin(GPIOE, GPIO_PIN_11, GPIO_PIN_RESET);
#define LCD_CS_1        HAL_GPIO_WritePin(GPIOE, GPIO_PIN_11, GPIO_PIN_SET);

#define LCD_RST_0       HAL_GPIO_WritePin(GPIOE, GPIO_PIN_13, GPIO_PIN_RESET);
#define LCD_RST_1       HAL_GPIO_WritePin(GPIOE, GPIO_PIN_13, GPIO_PIN_SET);

#define LCD_DC_0        HAL_GPIO_WritePin(GPIOE, GPIO_PIN_12, GPIO_PIN_RESET);
#define LCD_DC_1        HAL_GPIO_WritePin(GPIOE, GPIO_PIN_12, GPIO_PIN_SET);
```
