#include "SYSCFG.h"

// 类型定义
typedef unsigned char u8;
typedef unsigned int u16;

// LED控制引脚定义
// #define DemoPortOut RA4
#define DemoPortOut RA0


// 时间控制结构体
typedef struct
{
  u8 DutyCount;   // 占空比计数器 (ms)
  u16 OnOffCount; // 开关状态计数器 (ms)
  u16 CycleCount; // 循环计数器 (ms)
} time_t;

// 全局变量定义
time_t Time;     // 时间控制变量
u8 LEDState;     // LED当前状态 (0=熄灭, 1=点亮)
u8 BlinkCounter; // 闪烁次数计数器
u8 SystemState;  // 系统状态 (0=闪烁, 1=暂停)

void Power_Initial(void);
void DelayUs(u8 delay_us);
void Shinking(u8 duty_on, u8 duty_off);
void LEDControl(void);

void Power_Initial(void)
{
  OSCCON = 0B01110001; // WDT 32KHZ IRCF=111=16MHZ/2=8MHZ,0.125US/T

  INTCON = 0; // 暂禁止所有中断
  PORTA = 0B00000000;
  TRISA = 0B11101110; // PA0输出

  PORTC = 0B00000000;
  TRISC = 0B11111111; 

  WPUA = 0B01000000; 
  WPUC = 0B00000000; 

  CLRWDT(); 

  OPTION = 0B00000100; 
  TMR0 = 5;            

  PSRCA = 0B11111111; 
  PSRCC = 0B11111111;
  PSINKA = 0B11111111; 
  PSINKC = 0B11111111;

  MSCON = 0B00110000;

}

void DelayUs(u8 Time)
{
  u8 a;
  for (a = 0; a < Time; a++)
  {
    NOP();
  }
}

void Shinking(u8 duty_on, u8 duty_off)
{
  // 当前占空比周期结束时切换状态
  if (Time.DutyCount == 0)
  {
    if (LEDState) // 当前为亮起状态
    {
      LEDState = 0;              // 切换到熄灭状态
      Time.DutyCount = duty_off; // 设置熄灭持续时间
      BlinkCounter++;            // 闪烁次数计数器递增
    }
    else // 当前为熄灭状态
    {
      LEDState = 1;             // 切换到亮起状态
      Time.DutyCount = duty_on; // 设置亮起持续时间
    }
  }
}
/*----------------------------------------------------
 *	函数名称：DelayS
 *	功能：   短延时函数
 *	输入参数：Time 延时时间长度 延时时长Time S
 *	返回参数：无
 ----------------------------------------------------*/
// LED控制函数
void LEDControl(void)
{
  switch (SystemState)
  {
  case 0:             // 闪烁状态
    Shinking(60, 60); // LED亮60ms，灭60ms
    DemoPortOut = LEDState;

    // 完成4次闪烁后进入暂停状态
    if (BlinkCounter >= 9) // 4个完整周期 = 8次状态切换
    {
      BlinkCounter = 0;
      SystemState = 1;       // 进入暂停状态
      Time.OnOffCount = 768; // 暂768ms
      DemoPortOut = 0;       // 关闭LED
    }
    break;

  case 1: // 暂停状态
    if (Time.OnOffCount == 0)
    {
      SystemState = 0; // 回到闪烁状态
    }
    break;

  default:
    SystemState = 0; // 异常状态重置
    break;
  }
}

// 定时器0中断服务程序
// 每1ms触发一次，用于系统时基和LED控制
void interrupt ISR(void)
{
  // 检查定时器0中断标志
  if (T0IE && T0IF)
  {
    T0IF = 0; // 清除中断标志
    TMR0 = 5; // 重新加载定时器初值

    // 更新时间计数器
    if (Time.DutyCount > 0)
      Time.DutyCount--; // 占空比计数器递减
    if (Time.OnOffCount > 0)
      Time.OnOffCount--; // 开关状态计数器递减

    // 执行LED控制
    LEDControl(); // LED控制处理
  }
}

// 主函数：系统入口点
int main(void)
{
  u8 i;

  // 系统初始化
  Power_Initial();

  // 启动延时：等待系统稳定 (约50ms)
  for (i = 0; i < 250; i++)
    DelayUs(197);

  // 清除看门狗
  CLRWDT();

  // 初始化全局变量
  LEDState = 0;
  BlinkCounter = 0;
  SystemState = 0;
  Time.DutyCount = 76; // 初始亮起时间
  Time.OnOffCount = 0;
  Time.CycleCount = 0;

  // 启用中断系统
  T0IF = 0; // 清除定时器0中断标志
  GIE = 1;  // 使能全局中断
  T0IE = 1; // 使能定时器0中断

  // 主循环：只负责喂狗，所有功能在中断中处理
  while (1)
  {
    CLRWDT(); // 清除看门狗，防止系统复位
  }

  return 0;
}