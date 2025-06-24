/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.c
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2025 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "lvgl.h"
#include "LCDController.h"
#include "demos/benchmark/lv_demo_benchmark.h"
#include "ili9486_lvgl.h"
#include "ui.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
CAN_HandleTypeDef hcan2;

RTC_HandleTypeDef hrtc;

SPI_HandleTypeDef hspi1;
DMA_HandleTypeDef hdma_spi1_tx;

/* USER CODE BEGIN PV */
uint8_t RspeedValue = 0;
uint8_t LspeedValue = 0;
uint8_t steeringValue = 0;
uint8_t delayCounter = 0; // To slow down the change in while loop without affecting the renderer
bool toggleSignal = false;

volatile bool new_speed_frame = false;
volatile bool new_steering_frame = false;
volatile bool new_airbag_frame = false;



CAN_TxHeaderTypeDef   TxHeader; /* Header containing the information of the transmitted frame */
CAN_RxHeaderTypeDef   RxHeader; /* Header containing the information of the received frame */
uint8_t               TxData[8] = {0};  /* Buffer of the data to send */
uint8_t               RxData[8]; /* Buffer of the received data */
uint32_t              TxMailbox;  /* The number of the mail box that transmitted the Tx message */



uint8_t               RxSteering = 0; /* Buffer of the received data */
uint32_t id;
uint8_t airbag_state=0;
uint8_t buton =1;
uint8_t pulse;
uint8_t pulse1;


/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_SPI1_Init(void);
static void MX_RTC_Init(void);
static void MX_CAN2_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
// Display speed value
void update_speed_display(int new_speed) {
	char speed_str[10];
	sprintf(speed_str, "%d Km/h", new_speed); // Format the speed as a string

	if (ui_Speed != NULL) { // Check if the label exists
		lv_label_set_text(ui_Speed, speed_str);
	}
}



void update_speed1_display(int new_speed) {
	char speed_str1[10];
	sprintf(speed_str1, "%d Km/h", new_speed); // Format the speed as a string

	if (ui_Speed1 != NULL) { // Check if the label exists
		lv_label_set_text(ui_Speed1, speed_str1);
	}
}


void update_steering_display(int new_steering) {
	char steering_str[20];
	sprintf(steering_str, "Steering %d %%", new_steering); // Format the speed as a string

	if (ui_SteeringRate != NULL) { // Check if the label exists
		lv_label_set_text(ui_SteeringRate, steering_str);
	}
}


uint8_t update_steering_pulse(int new_steering1) {
	uint8_t steering_str1;
	if(new_steering_frame == true){
	steering_str1 = new_steering1;
	} // Format the speed as a string

	return steering_str1;


}


// Calling ready when the transfer has actually completed
void HAL_SPI_TxCpltCallback(SPI_HandleTypeDef *hspi)
{
  if (hspi->Instance == SPI1) // Check if it's the SPI connected to the display
  {
    lv_disp_drv_t *drv = lv_disp_get_default()->driver;
    if(drv) {
        lv_disp_flush_ready(drv);
    }
  }
}

// Toggle indicator
void toggle_indicator(lv_obj_t *indicator_obj, bool is_active) {
    if (!indicator_obj) {
        return;
    }
     if (is_active) {
         lv_obj_clear_flag(indicator_obj, LV_OBJ_FLAG_HIDDEN); // Make it visible
     } else {
         lv_obj_add_flag(indicator_obj, LV_OBJ_FLAG_HIDDEN);   // Make it hidden
     }
}



uint32_t angle_to_pulse(uint8_t angle) {

   uint8_t angle2 = angle *4096/100;
   return (250 + angle2/4.1);

}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_SPI1_Init();
  MX_RTC_Init();
  MX_CAN2_Init();
  /* USER CODE BEGIN 2 */
	lv_init();
	lv_port_disp_init();
	ui_init();



	  TxHeader.StdId = 0x123;
	  TxHeader.RTR = CAN_RTR_DATA;
	  TxHeader.IDE = CAN_ID_STD;
	  TxHeader.DLC = 8;
	  TxHeader.TransmitGlobalTime = DISABLE;
	  TxData[0] = 0;
	  TxData[7] = 0xFF;

	  toggle_indicator(ui_Abs, false); //nhap' nhay' Airbag
	  toggle_indicator(ui_Airbag, false);// nhap' nhay' Abs
	  toggle_indicator(ui_SteeringIcon, false);// nhap' nhay' Abs






  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
	while (1) {
		lv_timer_handler();
		HAL_Delay(5);
		buton = HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_0);

    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
		delayCounter++;
		if (delayCounter % 10 == 0) {
//
//					if (speedValue == 70) {
//						speedValue = 0;
//					}
//					speedValue++;
					update_speed_display(LspeedValue); //change value of Left speed
					update_speed1_display(RspeedValue); // change value of Right
		}






		update_steering_display(RxSteering); //thay doi gia tri cua banh lai
		lv_arc_set_value(ui_Steering, RxSteering); //thay doi thanh arc cua banh' lai'




		if (buton ==1){
		        	  toggleSignal = false;
		          }





		toggle_indicator(ui_Airbag, toggleSignal );// nhap' nhay' Abs


		if(LspeedValue - RspeedValue > 40 || RspeedValue - LspeedValue > 40){
			toggle_indicator(ui_Abs, true);
		}else
			toggle_indicator(ui_Abs, false);


		if(RxSteering > 80 || RxSteering < 20){
			toggle_indicator(ui_SteeringIcon, true);
		}else
			toggle_indicator(ui_SteeringIcon, false);




//			toggleSignal = !toggleSignal;
//			toggle_indicator(ui_Abs, toggleSignal); //nhap' nhay' Airbag
//
//			toggle_indicator(ui_SteeringIcon, toggleSignal);// nhap' nhay' Abs



//		  TxData[0] ++; /* Increment the first byte */


	      /* It's mandatory to look for a free Tx mail box */
//		  while(HAL_CAN_GetTxMailboxesFreeLevel(&hcan2) == 0); /* Wait till a Tx mailbox is free. Using while loop instead of HAL_Delay() */
//	      if (HAL_CAN_AddTxMessage(&hcan2, &TxHeader, TxData, &TxMailbox) != HAL_OK)
//	      {
//	        /* Transmission request Error */
//	        Error_Handler();
//	      }

	}
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI|RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 64;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief CAN2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_CAN2_Init(void)
{

  /* USER CODE BEGIN CAN2_Init 0 */
	CAN_FilterTypeDef  sFilterConfig;

  /* USER CODE END CAN2_Init 0 */

  /* USER CODE BEGIN CAN2_Init 1 */

  /* USER CODE END CAN2_Init 1 */
  hcan2.Instance = CAN2;
  hcan2.Init.Prescaler = 4;
  hcan2.Init.Mode = CAN_MODE_NORMAL;
  hcan2.Init.SyncJumpWidth = CAN_SJW_1TQ;
  hcan2.Init.TimeSeg1 = CAN_BS1_12TQ;
  hcan2.Init.TimeSeg2 = CAN_BS2_3TQ;
  hcan2.Init.TimeTriggeredMode = DISABLE;
  hcan2.Init.AutoBusOff = DISABLE;
  hcan2.Init.AutoWakeUp = DISABLE;
  hcan2.Init.AutoRetransmission = DISABLE;
  hcan2.Init.ReceiveFifoLocked = DISABLE;
  hcan2.Init.TransmitFifoPriority = DISABLE;
  if (HAL_CAN_Init(&hcan2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN CAN2_Init 2 */
  /* The CAN filter configuration */
    sFilterConfig.FilterBank = 14;
    sFilterConfig.FilterMode = CAN_FILTERMODE_IDMASK;
    sFilterConfig.FilterScale = CAN_FILTERSCALE_32BIT;
    sFilterConfig.FilterIdHigh = 0x0000;
    sFilterConfig.FilterIdLow = 0x0000;
    sFilterConfig.FilterMaskIdHigh = 0x0000;
    sFilterConfig.FilterMaskIdLow = 0x0000;
    sFilterConfig.FilterFIFOAssignment = CAN_RX_FIFO0; /* The data will be received in FIFO0 */
    sFilterConfig.FilterActivation = ENABLE;
    sFilterConfig.SlaveStartFilterBank = 14;
    if (HAL_CAN_ConfigFilter(&hcan2, &sFilterConfig) != HAL_OK)
    {
      /* Filter configuration Error */
      Error_Handler();
    }
   /* Starting the CAN peripheral */
    if (HAL_CAN_Start(&hcan2) != HAL_OK)
    {
      /* Start Error */
      Error_Handler();
    }
   /* Activate CAN RX notification on FIFO0 */
    if (HAL_CAN_ActivateNotification(&hcan2, CAN_IT_RX_FIFO0_MSG_PENDING) != HAL_OK)
    {
      /* Notification Error */
      Error_Handler();
    }
  /* USER CODE END CAN2_Init 2 */

}

/**
  * @brief RTC Initialization Function
  * @param None
  * @retval None
  */
static void MX_RTC_Init(void)
{

  /* USER CODE BEGIN RTC_Init 0 */

  /* USER CODE END RTC_Init 0 */

  RTC_TimeTypeDef sTime = {0};
  RTC_DateTypeDef sDate = {0};

  /* USER CODE BEGIN RTC_Init 1 */

  /* USER CODE END RTC_Init 1 */

  /** Initialize RTC Only
  */
  hrtc.Instance = RTC;
  hrtc.Init.HourFormat = RTC_HOURFORMAT_24;
  hrtc.Init.AsynchPrediv = 127;
  hrtc.Init.SynchPrediv = 255;
  hrtc.Init.OutPut = RTC_OUTPUT_DISABLE;
  hrtc.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
  hrtc.Init.OutPutType = RTC_OUTPUT_TYPE_OPENDRAIN;
  if (HAL_RTC_Init(&hrtc) != HAL_OK)
  {
    Error_Handler();
  }

  /* USER CODE BEGIN Check_RTC_BKUP */

  /* USER CODE END Check_RTC_BKUP */

  /** Initialize RTC and set the Time and Date
  */
  sTime.Hours = 0x0;
  sTime.Minutes = 0x0;
  sTime.Seconds = 0x0;
  sTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  sTime.StoreOperation = RTC_STOREOPERATION_RESET;
  if (HAL_RTC_SetTime(&hrtc, &sTime, RTC_FORMAT_BCD) != HAL_OK)
  {
    Error_Handler();
  }
  sDate.WeekDay = RTC_WEEKDAY_MONDAY;
  sDate.Month = RTC_MONTH_JANUARY;
  sDate.Date = 0x1;
  sDate.Year = 0x0;

  if (HAL_RTC_SetDate(&hrtc, &sDate, RTC_FORMAT_BCD) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN RTC_Init 2 */

  /* USER CODE END RTC_Init 2 */

}

/**
  * @brief SPI1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI1_Init(void)
{

  /* USER CODE BEGIN SPI1_Init 0 */

  /* USER CODE END SPI1_Init 0 */

  /* USER CODE BEGIN SPI1_Init 1 */

  /* USER CODE END SPI1_Init 1 */
  /* SPI1 parameter configuration*/
  hspi1.Instance = SPI1;
  hspi1.Init.Mode = SPI_MODE_MASTER;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi1.Init.NSS = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_4;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi1.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial = 10;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI1_Init 2 */

  /* USER CODE END SPI1_Init 2 */

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA2_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA2_Stream3_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA2_Stream3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA2_Stream3_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /* USER CODE BEGIN MX_GPIO_Init_1 */

  /* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOE, CS_Pin|DC_Pin|RESET_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : PA0 */
  GPIO_InitStruct.Pin = GPIO_PIN_0;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : CS_Pin DC_Pin RESET_Pin */
  GPIO_InitStruct.Pin = CS_Pin|DC_Pin|RESET_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

  /* USER CODE BEGIN MX_GPIO_Init_2 */

  /* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */
void HAL_CAN_RxFifo0MsgPendingCallback(CAN_HandleTypeDef *CanHandle)
{
  /* Get RX message */
  if (HAL_CAN_GetRxMessage(CanHandle, CAN_RX_FIFO0, &RxHeader, RxData) != HAL_OK)
  {
    /* Reception Error */
    Error_Handler();
  }
  id = RxHeader.StdId;
  // 2) Phân ID
  switch (id) {
    case 0x040: {
      // ========== Abs ==========
      LspeedValue =RxData[0];
      RspeedValue = RxData[1];
      new_speed_frame = true;
      break;
    }


    case 0x012: {
          // ========== Airbag ==========
          if(RxData[0] == 1){
        	  toggleSignal = true;

          }
          new_airbag_frame = true;

          break;
        }


    case 0x050: {
              // ========== Steering ==========
              RxSteering = RxData[0] * 100 / 80;
              pulse =  (250 + (RxData[0] *4096/100)/4.1);
              new_steering_frame = true;

              break;
            }





    default:
      // Bỏ qua các ID khác
      break;
  }
}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
	/* User can add his own implementation to report the HAL error return state */
	__disable_irq();
	while (1) {
	}
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
