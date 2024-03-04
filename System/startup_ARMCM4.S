/**************************************************************************//**
 * @file     startup_ARMCM4.S
 * @brief    CMSIS-Core(M) Device Startup File for Cortex-M4 Device
 * @version  V2.2.0
 * @date     26. May 2021
 ******************************************************************************/
/*
 * Copyright (c) 2009-2021 Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License)// you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

                .syntax  unified
                //.arch    armv7e-m Убрал
                .cpu cortex-m4
                .fpu softvfp //Софтоввые вычисления с плавающей точкой
                .section .vectors
                .align   2
                .globl   __Vectors
                .globl   __Vectors_End
                .globl   __Vectors_Size
__Vectors:
#if 0
                .long    __StackTop                         /*     Top of Stack */
                .long    Reset_Handler                      /*     Reset Handler */
                .long    NMI_Handler                        /* -14 NMI Handler */
                .long    HardFault_Handler                  /* -13 Hard Fault Handler */
                .long    MemManage_Handler                  /* -12 MPU Fault Handler */
                .long    BusFault_Handler                   /* -11 Bus Fault Handler */
                .long    UsageFault_Handler                 /* -10 Usage Fault Handler */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    SVC_Handler                        /*  -5 SVC Handler */
                .long    DebugMon_Handler                   /*  -4 Debug Monitor Handler */
                .long    0                                  /*     Reserved */
                .long    PendSV_Handler                     /*  -2 PendSV Handler */
                .long    SysTick_Handler                    /*  -1 SysTick Handler */

                /* Interrupts */
                .long    Interrupt0_Handler                 /*   0 Interrupt 0 */
                .long    Interrupt1_Handler                 /*   1 Interrupt 1 */
                .long    Interrupt2_Handler                 /*   2 Interrupt 2 */
                .long    Interrupt3_Handler                 /*   3 Interrupt 3 */
                .long    Interrupt4_Handler                 /*   4 Interrupt 4 */
                .long    Interrupt5_Handler                 /*   5 Interrupt 5 */
                .long    Interrupt6_Handler                 /*   6 Interrupt 6 */
                .long    Interrupt7_Handler                 /*   7 Interrupt 7 */
                .long    Interrupt8_Handler                 /*   8 Interrupt 8 */
                .long    Interrupt9_Handler                 /*   9 Interrupt 9 */

                .space   (214 * 4)                          /* Interrupts 10 .. 224 are left out */
#endif

                .long     __StackTop                        // Top of Stack 
                .long     Reset_Handler                     // Reset Handler
                .long     NMI_Handler                       // NMI Handler
                .long     HardFault_Handler                 // Hard Fault Handler
                .long     MemManage_Handler                 // MPU Fault Handler
                .long     BusFault_Handler                  // Bus Fault Handler
                .long     UsageFault_Handler                // Usage Fault Handler
                .long     0                                 // Reserved
                .long     0                                 // Reserved
                .long     0                                 // Reserved
                .long     0                                 // Reserved
                .long     SVC_Handler                       // SVCall Handler
                .long     DebugMon_Handler                  // Debug Monitor Handler
                .long     0                                 // Reserved
                .long     PendSV_Handler                    // PendSV Handler
                .long     SysTick_Handler                   // SysTick Handler

//               /* external interrupts handler */
                .long     WWDGT_IRQHandler                  // 16:Window Watchdog Timer
                .long     LVD_IRQHandler                    // 17:LVD through EXTI Line detect
                .long     TAMPER_IRQHandler                 // 18:Tamper through EXTI Line detect
                .long     RTC_IRQHandler                    // 19:RTC through EXTI Line
                .long     FMC_IRQHandler                    // 20:FMC
                .long     RCU_CTC_IRQHandler                // 21:RCU and CTC
                .long     EXTI0_IRQHandler                  // 22:EXTI Line 0
                .long     EXTI1_IRQHandler                  // 23:EXTI Line 1
                .long     EXTI2_IRQHandler                  // 24:EXTI Line 2
                .long     EXTI3_IRQHandler                  // 25:EXTI Line 3
                .long     EXTI4_IRQHandler                  // 26:EXTI Line 4
                .long     DMA0_Channel0_IRQHandler          // 27:DMA0 Channel0
                .long     DMA0_Channel1_IRQHandler          // 28:DMA0 Channel1
                .long     DMA0_Channel2_IRQHandler          // 29:DMA0 Channel2
                .long     DMA0_Channel3_IRQHandler          // 30:DMA0 Channel3
                .long     DMA0_Channel4_IRQHandler          // 31:DMA0 Channel4
                .long     DMA0_Channel5_IRQHandler          // 32:DMA0 Channel5
                .long     DMA0_Channel6_IRQHandler          // 33:DMA0 Channel6
                .long     ADC0_1_IRQHandler                 // 34:ADC0 and ADC1
                .long     CAN0_TX_IRQHandler                // 35:CAN0 TX
                .long     CAN0_RX0_IRQHandler               // 36:CAN0 RX0
                .long     CAN0_RX1_IRQHandler               // 37:CAN0 RX1
                .long     CAN0_EWMC_IRQHandler              // 38:CAN0 EWMC
                .long     EXTI5_9_IRQHandler                // 39:EXTI5 to EXTI9
                .long     TIMER0_BRK_TIMER8_IRQHandler      // 40:TIMER0 Break and TIMER8
                .long     TIMER0_UP_TIMER9_IRQHandler       // 41:TIMER0 Update and TIMER9
                .long     TIMER0_TRG_CMT_TIMER10_IRQHandler // 42:TIMER0 Trigger and Commutation and TIMER10
                .long     TIMER0_Channel_IRQHandler         // 43:TIMER0 Channel Capture Compare
                .long     TIMER1_IRQHandler                 // 44:TIMER1
                .long     TIMER2_IRQHandler                 // 45:TIMER2
                .long     TIMER3_IRQHandler                 // 46:TIMER3
                .long     I2C0_EV_IRQHandler                // 47:I2C0 Event
                .long     I2C0_ER_IRQHandler                // 48:I2C0 Error
                .long     I2C1_EV_IRQHandler                // 49:I2C1 Event
                .long     I2C1_ER_IRQHandler                // 50:I2C1 Error
                .long     SPI0_IRQHandler                   // 51:SPI0
                .long     SPI1_IRQHandler                   // 52:SPI1
                .long     USART0_IRQHandler                 // 53:USART0
                .long     USART1_IRQHandler                 // 54:USART1
                .long     USART2_IRQHandler                 // 55:USART2
                .long     EXTI10_15_IRQHandler              // 56:EXTI10 to EXTI15
                .long     RTC_Alarm_IRQHandler              // 57:RTC Alarm
                .long     USBFS_WKUP_IRQHandler             // 58:USBFS Wakeup
                .long     TIMER7_BRK_TIMER11_IRQHandler     // 59:TIMER7 Break and TIMER11
                .long     TIMER7_UP_TIMER12_IRQHandler      // 60:TIMER7 Update and TIMER12
                .long     TIMER7_TRG_CMT_TIMER13_IRQHandler // 61:TIMER7 Trigger and Commutation and TIMER13
                .long     TIMER7_Channel_IRQHandler         // 62:TIMER7 Channel Capture Compare
                .long     0                                 // Reserved
                .long     EXMC_IRQHandler                   // 64:EXMC
                .long     0                                 // Reserved
                .long     TIMER4_IRQHandler                 // 66:TIMER4
                .long     SPI2_IRQHandler                   // 67:SPI2
                .long     UART3_IRQHandler                  // 68:UART3
                .long     UART4_IRQHandler                  // 69:UART4
                .long     TIMER5_IRQHandler                 // 70:TIMER5 
                .long     TIMER6_IRQHandler                 // 71:TIMER6
                .long     DMA1_Channel0_IRQHandler          // 72:DMA1 Channel0
                .long     DMA1_Channel1_IRQHandler          // 73:DMA1 Channel1
                .long     DMA1_Channel2_IRQHandler          // 74:DMA1 Channel2
                .long     DMA1_Channel3_IRQHandler          // 75:DMA1 Channel3
                .long     DMA1_Channel4_IRQHandler          // 76:DMA1 Channel4
                .long     ENET_IRQHandler                   // 77:Ethernet
                .long     ENET_WKUP_IRQHandler              // 78:Ethernet Wakeup through EXTI Line
                .long     CAN1_TX_IRQHandler                // 79:CAN1 TX
                .long     CAN1_RX0_IRQHandler               // 80:CAN1 RX0
                .long     CAN1_RX1_IRQHandler               // 81:CAN1 RX1
                .long     CAN1_EWMC_IRQHandler              // 82:CAN1 EWMC
                .long     USBFS_IRQHandler                  // 83:USBFS



__Vectors_End:
                .equ     __Vectors_Size, __Vectors_End - __Vectors
                .size    __Vectors, . - __Vectors


                .thumb
                .section .text
                .align   2

                .thumb_func
                .type    Reset_Handler, %function
                .globl   Reset_Handler
                .fnstart
Reset_Handler:
                bl       SystemInit  // Вызвали из библиотеки
                //переносим data
                ldr      r4, =__copy_table_start__  
                ldr      r5, =__copy_table_end__    

.L_loop0: //Дальше копируем
                cmp      r4, r5
                bge      .L_loop0_done
                ldr      r1, [r4]                /* source address */
                ldr      r2, [r4, #4]            /* destination address */
                ldr      r3, [r4, #8]            /* word count */
                lsls     r3, r3, #2              /* byte count */

.L_loop0_0:
                subs     r3, #4                  /* decrement byte count */
                ittt     ge
                ldrge    r0, [r1, r3]
                strge    r0, [r2, r3]
                bge      .L_loop0_0

                adds     r4, #12
                b        .L_loop0
.L_loop0_done: //Закидываем 0 в зероинит

                ldr      r3, =__zero_table_start__
                ldr      r4, =__zero_table_end__

.L_loop2:
                cmp      r3, r4
                bge      .L_loop2_done
                ldr      r1, [r3]                /* destination address */
                ldr      r2, [r3, #4]            /* word count */
                lsls     r2, r2, #2              /* byte count */
                movs     r0, 0

.L_loop2_0:
                subs     r2, #4                  /* decrement byte count */
                itt      ge
                strge    r0, [r1, r2]
                bge      .L_loop2_0

                adds     r3, #8
                b        .L_loop2
.L_loop2_done://

                bl       main //main???
                
                .fnend
                .size    Reset_Handler, . - Reset_Handler
//Конец ресет хендлера
/* The default macro is not used for HardFault_Handler
 * because this results in a poor debug illusion.
 */
                .thumb_func
                .type    HardFault_Handler, %function
                .weak    HardFault_Handler
                .fnstart
HardFault_Handler:
                b        .
                .fnend
                .size    HardFault_Handler, . - HardFault_Handler

                .thumb_func
                .type    Default_Handler, %function
                .weak    Default_Handler
                .fnstart
Default_Handler:
                b        .
                .fnend
                .size    Default_Handler, . - Default_Handler

/*
                .thumb_func
                .type    CAN0_RX0_IRQHandler, %function
                .globl    CAN0_RX0_IRQHandler
                .fnstart
CAN0_RX0_IRQHandler:
                bl CAN0_RX0_IRQHandler_ovr
                .fnend
                .size    Default_Handler, . - Default_Handler
*/
/* Macro to define default exception/interrupt handlers.
 * Default handler are weak symbols with an endless loop.
 * They can be overwritten by real handlers.
 */
                /*.macro Set_Default_Handler  Handler_Name
                .weak Handler_Name
                .thumb_set Handler_Name, Default_Handler
                .endm
*/

/* Default exception/interrupt handler */
#if 0
                Set_Default_Handler  NMI_Handler
                Set_Default_Handler  MemManage_Handler
                Set_Default_Handler  BusFault_Handler
                Set_Default_Handler  UsageFault_Handler
                Set_Default_Handler  SVC_Handler
                Set_Default_Handler  DebugMon_Handler
                Set_Default_Handler  PendSV_Handler
                Set_Default_Handler  SysTick_Handler

                Set_Default_Handler  Interrupt0_Handler
                Set_Default_Handler  Interrupt1_Handler
                Set_Default_Handler  Interrupt2_Handler
                Set_Default_Handler  Interrupt3_Handler
                Set_Default_Handler  Interrupt4_Handler
                Set_Default_Handler  Interrupt5_Handler
                Set_Default_Handler  Interrupt6_Handler
                Set_Default_Handler  Interrupt7_Handler
                Set_Default_Handler  Interrupt8_Handler
                Set_Default_Handler  Interrupt9_Handler

#endif

.weak NMI_Handler 
.thumb_set NMI_Handler,Default_Handler

.weak MemManage_Handler 
.thumb_set MemManage_Handler,Default_Handler

.weak BusFault_Handler 
.thumb_set BusFault_Handler,Default_Handler

.weak UsageFault_Handler 
.thumb_set UsageFault_Handler,Default_Handler

.weak SVC_Handler 
.thumb_set SVC_Handler,Default_Handler

.weak DebugMon_Handler 
.thumb_set DebugMon_Handler,Default_Handler

.weak PendSV_Handler 
.thumb_set PendSV_Handler,Default_Handler

.weak SysTick_Handler 
.thumb_set SysTick_Handler,Default_Handler

.weak WWDGT_IRQHandler 
.thumb_set WWDGT_IRQHandler,Default_Handler

.weak LVD_IRQHandler 
.thumb_set LVD_IRQHandler,Default_Handler

.weak TAMPER_IRQHandler 
.thumb_set TAMPER_IRQHandler,Default_Handler

.weak RTC_IRQHandler 
.thumb_set RTC_IRQHandler,Default_Handler

.weak FMC_IRQHandler 
.thumb_set FMC_IRQHandler,Default_Handler

.weak RCU_CTC_IRQHandler 
.thumb_set RCU_CTC_IRQHandler,Default_Handler

.weak EXTI0_IRQHandler 
.thumb_set EXTI0_IRQHandler,Default_Handler

.weak EXTI1_IRQHandler 
.thumb_set EXTI1_IRQHandler,Default_Handler

.weak EXTI2_IRQHandler 
.thumb_set EXTI2_IRQHandler,Default_Handler

.weak EXTI3_IRQHandler 
.thumb_set EXTI3_IRQHandler,Default_Handler

.weak EXTI4_IRQHandler 
.thumb_set EXTI4_IRQHandler,Default_Handler

.weak DMA0_Channel0_IRQHandler 
.thumb_set DMA0_Channel0_IRQHandler,Default_Handler

.weak DMA0_Channel1_IRQHandler 
.thumb_set DMA0_Channel1_IRQHandler,Default_Handler

.weak DMA0_Channel2_IRQHandler 
.thumb_set DMA0_Channel2_IRQHandler,Default_Handler

.weak DMA0_Channel3_IRQHandler 
.thumb_set DMA0_Channel3_IRQHandler,Default_Handler

.weak DMA0_Channel4_IRQHandler 
.thumb_set DMA0_Channel4_IRQHandler,Default_Handler

.weak DMA0_Channel5_IRQHandler 
.thumb_set DMA0_Channel5_IRQHandler,Default_Handler

.weak DMA0_Channel6_IRQHandler 
.thumb_set DMA0_Channel6_IRQHandler,Default_Handler

.weak ADC0_1_IRQHandler 
.thumb_set ADC0_1_IRQHandler,Default_Handler

.weak CAN0_TX_IRQHandler 
.thumb_set CAN0_TX_IRQHandler,Default_Handler

.weak CAN0_RX0_IRQHandler 
.thumb_set CAN0_RX0_IRQHandler,Default_Handler

.weak CAN0_RX1_IRQHandler 
.thumb_set CAN0_RX1_IRQHandler,Default_Handler

.weak CAN0_EWMC_IRQHandler 
.thumb_set CAN0_EWMC_IRQHandler,Default_Handler

.weak EXTI5_9_IRQHandler 
.thumb_set EXTI5_9_IRQHandler,Default_Handler

.weak TIMER0_BRK_TIMER8_IRQHandler 
.thumb_set TIMER0_BRK_TIMER8_IRQHandler,Default_Handler

.weak TIMER0_UP_TIMER9_IRQHandler 
.thumb_set TIMER0_UP_TIMER9_IRQHandler,Default_Handler

.weak TIMER0_TRG_CMT_TIMER10_IRQHandler 
.thumb_set TIMER0_TRG_CMT_TIMER10_IRQHandler,Default_Handler

.weak TIMER0_Channel_IRQHandler 
.thumb_set TIMER0_Channel_IRQHandler,Default_Handler

.weak TIMER1_IRQHandler 
.thumb_set TIMER1_IRQHandler,Default_Handler

.weak TIMER2_IRQHandler 
.thumb_set TIMER2_IRQHandler,Default_Handler

.weak TIMER3_IRQHandler 
.thumb_set TIMER3_IRQHandler,Default_Handler

.weak I2C0_EV_IRQHandler 
.thumb_set I2C0_EV_IRQHandler,Default_Handler

.weak I2C0_ER_IRQHandler 
.thumb_set I2C0_ER_IRQHandler,Default_Handler

.weak I2C1_EV_IRQHandler 
.thumb_set I2C1_EV_IRQHandler,Default_Handler

.weak I2C1_ER_IRQHandler 
.thumb_set I2C1_ER_IRQHandler,Default_Handler

.weak SPI0_IRQHandler 
.thumb_set SPI0_IRQHandler,Default_Handler

.weak SPI1_IRQHandler 
.thumb_set SPI1_IRQHandler,Default_Handler

.weak USART0_IRQHandler 
.thumb_set USART0_IRQHandler,Default_Handler

.weak USART1_IRQHandler 
.thumb_set USART1_IRQHandler,Default_Handler

.weak USART2_IRQHandler 
.thumb_set USART2_IRQHandler,Default_Handler

.weak EXTI10_15_IRQHandler 
.thumb_set EXTI10_15_IRQHandler,Default_Handler

.weak RTC_Alarm_IRQHandler 
.thumb_set RTC_Alarm_IRQHandler,Default_Handler

.weak USBFS_WKUP_IRQHandler 
.thumb_set USBFS_WKUP_IRQHandler,Default_Handler

.weak TIMER7_BRK_TIMER11_IRQHandler 
.thumb_set TIMER7_BRK_TIMER11_IRQHandler,Default_Handler

.weak TIMER7_UP_TIMER12_IRQHandler 
.thumb_set TIMER7_UP_TIMER12_IRQHandler,Default_Handler

.weak TIMER7_TRG_CMT_TIMER13_IRQHandler 
.thumb_set TIMER7_TRG_CMT_TIMER13_IRQHandler,Default_Handler

.weak TIMER7_Channel_IRQHandler 
.thumb_set TIMER7_Channel_IRQHandler,Default_Handler

.weak EXMC_IRQHandler 
.thumb_set EXMC_IRQHandler,Default_Handler

.weak TIMER4_IRQHandler 
.thumb_set TIMER4_IRQHandler,Default_Handler

.weak SPI2_IRQHandler 
.thumb_set SPI2_IRQHandler,Default_Handler

.weak UART3_IRQHandler 
.thumb_set UART3_IRQHandler,Default_Handler

.weak UART4_IRQHandler 
.thumb_set UART4_IRQHandler,Default_Handler

.weak TIMER5_IRQHandler 
.thumb_set TIMER5_IRQHandler,Default_Handler

.weak TIMER6_IRQHandler 
.thumb_set TIMER6_IRQHandler,Default_Handler

.weak DMA1_Channel0_IRQHandler 
.thumb_set DMA1_Channel0_IRQHandler,Default_Handler

.weak DMA1_Channel1_IRQHandler 
.thumb_set DMA1_Channel1_IRQHandler,Default_Handler

.weak DMA1_Channel2_IRQHandler 
.thumb_set DMA1_Channel2_IRQHandler,Default_Handler

.weak DMA1_Channel3_IRQHandler 
.thumb_set DMA1_Channel3_IRQHandler,Default_Handler

.weak DMA1_Channel4_IRQHandler 
.thumb_set DMA1_Channel4_IRQHandler,Default_Handler

.weak ENET_IRQHandler 
.thumb_set ENET_IRQHandler,Default_Handler

.weak ENET_WKUP_IRQHandler 
.thumb_set ENET_WKUP_IRQHandler,Default_Handler

.weak CAN1_TX_IRQHandler 
.thumb_set CAN1_TX_IRQHandler,Default_Handler

.weak CAN1_RX0_IRQHandler 
.thumb_set CAN1_RX0_IRQHandler,Default_Handler

.weak CAN1_RX1_IRQHandler 
.thumb_set CAN1_RX1_IRQHandler,Default_Handler

.weak CAN1_EWMC_IRQHandler 
.thumb_set CAN1_EWMC_IRQHandler,Default_Handler

.weak USBFS_IRQHandler 
.thumb_set USBFS_IRQHandler,Default_Handler

.end
