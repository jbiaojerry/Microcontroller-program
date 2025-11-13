//Project: 003-ZX-FT60F12X-CH2-MODE1-COMPLEX.prj
// Device: FT60F12X
// Memory: Flash 2KX14b, EEPROM 256X8b, SRAM 128X8b
// Author: 
//Company: 
//Version:
//   Date: 
//===========================================================
//===========================================================
#include "SYSCFG.h"
typedef unsigned char u8;
typedef unsigned int u16;

#define Dang_EEPROM_Addr 0x00
#define Key_Pin2 RA2  // 正极触发按键（PA2:5脚）
#define Key_Pin RC5 // 负极按键（PC5:4脚）
#define MAX_MODE_NUM 25
#define KEY_PRESS_THRESHOLD       3  // 负极按键判定为“按下”所需的最短连续低电平次数（滤除瞬态毛刺）
#define KEY_RELEASE_THRESHOLD     60 // 负极按键判定为“释放”所需的最短连续高电平次数（避免断线复位误触发）
#define KEY_POS_PRESS_THRESHOLD   3  // 正极按键判定为“按下”所需的最短连续高电平次数
#define KEY_POS_RELEASE_THRESHOLD 60 // 正极按键判定为“释放”所需的最短连续低电平次数

typedef struct
{
  u8 hitCount;
  u8 hitCount2;
  u16 dutyCount;
  u16 onOffCount;
  u16 dutyCount2;
  u16 onOffCount2;
} time_t;

typedef union
{
  struct
  {
    unsigned keyHit : 1;
    unsigned keyHit2 : 1;
    unsigned toEeprom : 1;
    unsigned toWhite : 1;
    unsigned : 6;
  } bits;
  u8 allBits;
} flag_t;

time_t Time;
flag_t Flag;

// 优化：将被立即赋值的变量省略初始化，减少Flash占用
volatile u8 shanCnt2;        // 省略=0（BSS段，启动时自动清零）
volatile u8 shinkBits2;      // 省略=0（BSS段，启动时自动清零）
volatile u8 shanCnt;        // 省略=0（BSS段，启动时自动清零）
volatile u8 shinkBits;      // 省略=0（BSS段，启动时自动清零）
volatile u8 dang;           // 省略=0，main()中会从EEPROM读取赋值
volatile u8 ledBits;        // 省略=0，在keyCheck中会被立即赋值

// ===== 模式全局变量定义  begin ======
// 非0初始值必须保留，占用Flash的DATA段
volatile u8 currentLed = 0x01;       // 当前LED选择：0=RA7, 1=RC4
volatile u8 ledMask = 0x01;          // LED位掩码
// 0值初始化可省略（BSS段），但保留更安全
volatile u16 delayCounter; // 延迟计数器（启动时自动为0）
volatile u8 ledPhase;        // LED控制阶段（启动时自动为0）
volatile u8 counter; // 计数器（启动时自动为0）

// 模式 16 专用变量（省略=0，BSS段自动清零）
volatile u8 phase2SwitchCnt;
volatile u8 lastShanCnt2Div4;

// 模式 23 专用变量（省略=0，BSS段自动清零）
volatile u8 lowCounter, highCounter; // 低位和高位计数器
volatile u8 lowPhase, highPhase; // 低位和高位阶段
volatile u8 subLowPhase, subHighPhase; // 低位和高位子阶段
// ===== 模式全局变量定义  end ======

void ledDisplay(void);
void powerInitial(void);
void initVariables(u8 dang);
void keyCheck(void);
void keyPosCheck(void);
void delayUs(u8 timeUs);
u8 eepromRead(u8 eeAddr);
void eepromWrite(u8 eeAddr, u8 data);
void shinking2(u16 dutyon, u16 dutyoff);
void shinking(u16 dutyOn, u16 dutyOff);
void modeMachine(void);
void alternatingLedControl(u8 flashTime, u16 holdTime);
void synchronizedLedControl(u8 flashTime, u16 holdTime, u16 offTime);
void staggeredLedControl(u16 flashOn, u16 flashOff);
void do1314(u8 dang);
void do15(void);
void do16(void);
void do17(void);
void do18(void);
void do1920(u8 dang);
void do23(void);


void ledDisplay(void)
{
  // 2bit LED控制，实际使用RA5和RA4
  // bit0->RA5:2脚, bit1->RA4:3脚
  if (ledBits & 0x01)
    RA5 = 1;
  else
    RA5 = 0;

  if (ledBits & 0x02)
    RA4 = 1;
  else
    RA4 = 0;
}
void shinking2(u16 dutyon, u16 dutyoff)
{
  if (Time.dutyCount2 == 0)
  {
    if (shinkBits2)
    {
      shinkBits2 = 0;
      Time.dutyCount2 = dutyoff;
      shanCnt2++;
    }
    else
    {
      shinkBits2 = 0xffffffff;
      Time.dutyCount2 = dutyon;
    }
  }
}

void shinking(u16 dutyOn, u16 dutyOff)
{
  if (Time.dutyCount == 0)
  {
    if (shinkBits)
    {
      shinkBits = 0;
      Time.dutyCount = dutyOff;
      shanCnt++;
    }
    else
    {
      shinkBits = 0xff;
      Time.dutyCount = dutyOn;
    }
  }
}

// ============模式处理辅助函数 begin ==============================

void alternatingLedControl(u8 flashTime, u16 holdTime)
{
  if (ledPhase == 0) // 闪烁阶段
  {
    if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0) // 闪烁4次完成
    {
      shanCnt = 0;
      shinkBits = ledMask;
      ledBits = 0;
      ledPhase = 1; // 进入长亮阶段
      Time.dutyCount = holdTime;
    } else {
      shinking(flashTime, flashTime);
      ledMask = 0x01 << currentLed;  // 位操作优化
      ledBits = shinkBits & ledMask;
    }
  }
  else if (ledPhase == 1) // 长亮阶段
  {
    ledBits = shinkBits;
    if (Time.dutyCount == 0) // holdTime结束
    {
      currentLed ^= 1;
      shanCnt = 0;
      ledBits = 0;
      shinkBits = 0;
      ledPhase = 0; // 重新开始循环
    }
  }
}

void synchronizedLedControl(u8 flashTime, u16 holdTime, u16 offTime)
{
  if (ledPhase == 0) // 闪烁阶段
  {
    if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0) // 闪烁4次完成
    {
      shanCnt = 0;
      shinkBits = 0;
      ledBits = 0;
      ledPhase = 1; // 进入长亮阶段
    } else {
      shinking(flashTime, flashTime);
    }
  }
  else if (ledPhase == 1) // 长亮阶段
  {
    if (shanCnt >= 1 && shinkBits == 0 && Time.dutyCount == 0) // 全灭结束
    {
      shanCnt = 0;
      shinkBits = 0;
      ledBits = 0;
      ledPhase = 0; // 重新开始循环
    } else {
      shinking(holdTime, offTime);
    }
  }
  ledBits = shinkBits & 0x03;
}
void do8()
{
	if (ledPhase == 0) // 闪烁阶段
  {
    if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0) // 闪烁4次完成
    {
      shanCnt = 0;
      shinkBits = 0;
      ledBits = 0;
      ledPhase = 1; // 进入长灭阶段
      Time.dutyCount = 1070;
    } else {
      shinking(119, 119);
    }
  }
  else if (ledPhase == 1) // 长灭阶段
  {
    if (Time.dutyCount == 0) // 全灭结束
    {
      shanCnt = 0;
      shinkBits = 0;
      ledBits = 0;
      ledPhase = 0; // 重新开始循环
    }
  }
  ledBits = shinkBits & 0x03;
}

void staggeredLedControl(u16 flashOn, u16 flashOff)
{
  shinking(flashOn, flashOff);
  if (delayCounter == 0)
  {
    shinking2(flashOn, flashOff);
    ledBits = (shinkBits & 0x01) | (shinkBits2 & 0x02);
  }
  else
  {
    delayCounter--;
    ledBits = shinkBits & 0x01;
  }
}

void do1314(u8 dang)
{
  // 225→15→225循环，每15ms一个时间点
  if (ledPhase == 0)
  {
    // 递减：225→210→...→30→15
    if (shanCnt >= 1 && shinkBits == 0 && Time.dutyCount == 0)
    {
        shanCnt = 0;
        --counter;
        if (counter == 0)
        {
          ledPhase = 1;
          counter = 1;
        }
     }
     else {
      shinking(counter * 15, counter * 15);
     }
  }
  else
  {
    // 递增：15→30→...→210→225
    if (shanCnt >= 1 && shinkBits == 0 && Time.dutyCount == 0)
    {
      shanCnt = 0;
      counter++;
      if (counter == 15)
      {
        ledPhase = 0;
        counter = 15;
      }
    }
    else {
      shinking(counter * 15, counter * 15);
    }
  }
  ledBits = dang == 13 ? (shinkBits ? 0x02 : 0x01) : (shinkBits ? 0x03 : 0);
}

void do16(void)
{
  if (ledPhase == 0)
  {
    // 阶段1：亮99ms灭299ms循环4次
    if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0)
    {
      shanCnt = 0;
      ledPhase = 1;
    }
    else
    {
      shinking(99, 299);
    }
  }
  else if (ledPhase == 1)
  {
    // 阶段2闪烁：亮49ms灭49ms循环4次
    if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0)
    {
      shanCnt = 0;
      ledPhase = 2;
      delayCounter = 390;
    }
    else
    {
      shinking(49, 49);
    }
  }
  else
  {
    // 阶段2全灭390ms
    if (delayCounter > 0)
    {
      delayCounter--;
    }
    else
    {
      if (counter >= 1)
      {
        counter = 0;
        ledPhase = 0;
      }
      else
      {
        counter++;
        ledPhase = 1;
      }
    }
  }
  ledBits = (ledPhase == 2) ? 0 : (shinkBits ? 0x03 : 0);
}

void do15(void)
{
if (ledPhase < 2) {
    // ========== 阶段一 ==========
    u8 prevShinkBits = shinkBits;
    shinking(99, 99);
    if (prevShinkBits != 0 && shinkBits == 0) {
      currentLed ^= 0x03;  // 每次闪烁完成切换LED
    }
    ledBits = shinkBits & currentLed;
    
    if (shanCnt >= 4) {
      shanCnt = shinkBits = 0;
      if (++ledPhase == 2) {
        phase2SwitchCnt = lastShanCnt2Div4 = 0;
      }
    }
  } else {
    // ========== 阶段二 ==========
    shinking2(49, 49);
    ledBits = shinkBits2 & currentLed;
    
    u8 currentDiv4 = shanCnt2 >> 2;
    if (currentDiv4 > 0 && currentDiv4 > lastShanCnt2Div4) {
      currentLed ^= 0x03;  // 切换LED
      lastShanCnt2Div4 = currentDiv4;
      if (++phase2SwitchCnt >= 4) {
        ledPhase = shanCnt2 = shinkBits2 = phase2SwitchCnt = lastShanCnt2Div4 = 0;
      }
    }
  }
}

void do17(void)
{
  if (ledPhase < 2) {
    // ========== 阶段一 ==========
    u8 prevShinkBits = shinkBits;
    shinking(238, 238);
    if (prevShinkBits != 0 && shinkBits == 0) {
      currentLed ^= 0x03;  // 每次闪烁完成切换LED
    }
    ledBits = shinkBits & currentLed;
    
    if (shanCnt >= 4) {
      shanCnt = shinkBits = 0;
      if (++ledPhase == 2) {
        phase2SwitchCnt = lastShanCnt2Div4 = 0;
      }
    }
  } else {
    // ========== 阶段二 ==========
    shinking2(120, 120);
    ledBits = shinkBits2 & currentLed;
    
    u8 currentDiv4 = shanCnt2 >> 2;
    if (currentDiv4 > 0 && currentDiv4 > lastShanCnt2Div4) {
      currentLed ^= 0x03;  // 切换LED
      lastShanCnt2Div4 = currentDiv4;
      if (++phase2SwitchCnt >= 4) {
        ledPhase = shanCnt2 = shinkBits2 = phase2SwitchCnt = lastShanCnt2Div4 = 0;
      }
    }
  }
}

void do18(void)
{
  if (ledPhase == 0)
  {
    if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0)
    {
      shanCnt = shinkBits = 0;
      ledPhase = 1;
    }
    else
    {
      shinking(238, 711);
    }
  }
  else if (ledPhase == 1)
  {
    if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0)
    {
      shanCnt = shinkBits = 0;
      Time.dutyCount = 1071; // 添加这行：初始化Time.dutyCount，避免立即触发shinking的else分支
      ledPhase = 2;
    }
    else
    {
      shinking(120, 120);
    }
  }
  else
  {
    if (Time.dutyCount == 0)
    {
      shanCnt = shinkBits = 0;
      if (counter >= 1)
      {
        ledPhase = 0;
        counter = 0;
      }
      else
      {
        counter++;
        ledPhase = 1;
      }
    }
  }
  ledBits = shinkBits & 0x03;
}



void do1920(u8 dang)
{
  shinking(109, 327);

  if (delayCounter == 0)
  {
    shinking2(109, 327);
    ledBits = (dang == 19) ? ((shinkBits & 0x01) | (shinkBits2 & 0x02)) : ((shinkBits & 0x02) | (shinkBits2 & 0x01));
  }
  else
  {
    // 注意：需要按键函数中初始化 delayCounter=109
    delayCounter--;
    ledBits = (dang == 19) ? (shinkBits & 0x01) : (shinkBits & 0x02);
  }
}

void do23()
{
  // begin 低位0x01控制逻辑
  if (lowPhase == 0)
  { // 阶段一闪烁4次
    if (shanCnt >= 2 && shinkBits == 0 && Time.dutyCount == 0)
    { // 闪烁4次完成
      shanCnt = 0;
      shinkBits = 0;
      lowPhase = 1;
      Time.dutyCount = 0;
      lowCounter = 0;
      subLowPhase = 0;
    }
    else
    {
      shinking(290, 485);
    }
  }
  else if (lowPhase == 1)
  {
    if (lowCounter >= 2)
    { 
      shanCnt = 0;
      shinkBits = 0;
      lowPhase = 2; // 进入阶段三
      Time.dutyCount = 0;
      lowCounter = 0;
      subLowPhase = 0;
    }
    else
    {
      if (subLowPhase == 0)
      {
        if (shanCnt == 4 && shinkBits == 0 && Time.dutyCount == 0)
        { // 闪烁4次完成
          shanCnt = 0;
          shinkBits = 0;
          subLowPhase = 1;
          Time.dutyCount = 0; 
        }
        else
        {
          shinking(25, 25);
        }
      }
      else
      {
        if (shanCnt == 1 && shinkBits == 0 && Time.dutyCount == 0)
        { // 闪烁1次完成（亮194ms+灭399ms算一次）
          shanCnt = 0;
          shinkBits = 0;
          subLowPhase = 0;
          Time.dutyCount = 0;
          lowCounter++;
        }
        else
        {
          shinking(194, 399); 
        }
      }
    }
  }
  else
  { // ledPhase == 2 (阶段三)
    if (lowCounter >= 2)
    { 
      shanCnt = 0;
      shinkBits = 0;
      lowPhase = 0; 
      Time.dutyCount = 0;
      lowCounter = 0;
      subLowPhase = 0;
    }
    else
    {
      if (subLowPhase == 0)
      {
        if (shanCnt == 4 && shinkBits == 0 && Time.dutyCount == 0)
        { // 闪烁4次完成
          shanCnt = 0;
          shinkBits = 0;
          subLowPhase = 1;
          Time.dutyCount = 390; // 设置390ms灭时间
        }
        else
        {
          shinking(50, 50);
        }
      }
      else
      {              // ledPhase_1 == 1，等待390ms灭时间
        shinkBits = 0; // 保持灭状态
        if (Time.dutyCount == 0)
        { // 390ms灭时间结束
          shanCnt = 0;
          shinkBits = 0;
          subLowPhase = 0; // 回到subLowPhase的初始状态
          lowCounter++;
        }
      }
    }
  }
  // end 低位0x01控制逻辑

  // begin 高位0x02控制逻辑
  // ====================================
  // 1. 延时386ms
  // 2. 闪烁290/97，两次，灭782ms，两轮
  // 3. 闪烁25/25,闪烁200/782, 两轮
  // 4. 闪烁50/50，8次 灭782
  // ====================================

  if (delayCounter == 0)
  {
    if (highPhase == 0)
    { // 阶段一
      if (highCounter >= 1)
      {
        shanCnt2 = 0;
        shinkBits2 = 0;
        Time.dutyCount2 = 0;
        subHighPhase = 0;
        highCounter = 0;
        highPhase = 1;
      }
      else
      {
        if (subHighPhase == 0)
        { // 阶段1.1
          // 2. 闪烁290/97，两次，灭782ms，两轮
          if (shanCnt2 >= 2 && shinkBits2 == 0 && Time.dutyCount2 == 0)
          { // 闪烁2次完成
            subHighPhase = 1;
            shanCnt2 = 0;
            shinkBits2 = 0;
            Time.dutyCount2 = 782;
          }
          else
          {
            shinking2(290, 97);
          }
        }
        else
        { // 阶段1.2
          if (Time.dutyCount2 == 0)
          {
            shanCnt2 = 0;
            shinkBits2 = 0;
            subHighPhase = 0;
            highCounter++;
          }
        }
      }
    }
    else if (highPhase == 1)
    { // 阶段二
      if (highCounter >= 2)
      {
        shanCnt2 = 0;
        shinkBits2 = 0;
        Time.dutyCount2 = 0;
        subHighPhase = 0;
        highCounter = 0;
        highPhase = 2;
      }
      else
      {
        if (subHighPhase == 0)
        {
          if (shanCnt2 >= 4 && shinkBits2 == 0 && Time.dutyCount2 == 0)
          { // 闪烁2次完成
            shanCnt2 = 0;
            shinkBits2 = 0;
            subHighPhase = 1;
          }
          else
          {
            shinking2(25, 25);
          }
        }
        else
        {
          if (shanCnt2 >= 1 && shinkBits2 == 0 && Time.dutyCount2 == 0)
          { // 闪烁1次完成
            shanCnt2 = 0;
            shinkBits2 = 0;
            subHighPhase = 0;
            highCounter++;
          }
          else
          {
            shinking2(200, 782);
          }
        }
      }
    }
    else
    {
      if (subHighPhase == 0)
      { // 阶段3.1
        if (shanCnt2 >= 8 && shinkBits2 == 0 && Time.dutyCount2 == 0)
        { // 闪烁8次完成
          subHighPhase = 1;
          shanCnt2 = 0;
          shinkBits2 = 0;
          Time.dutyCount2 = 782;
        }
        else
        {
          shinking2(50, 50);
        }
      }
      else
      { // 阶段3.2
        if (Time.dutyCount2 == 0)
        {
          shanCnt2 = 0;
          shinkBits2 = 0;
          highCounter = 0;
          highPhase = 0;
          subHighPhase = 0;
        }
      }
    }
  }
  else
  {
    // 注意：需要按键函数中初始化 delayCounter=0
    delayCounter--;
  }

  // end 高位0x02控制逻辑

  ledBits = shinkBits & 0x01 | shinkBits2 & 0x02;
}

// ============模式处理辅助函数 end ==============================

void modeMachine(void)
{
  switch (dang)
  {
  case 0:
    shinking(1, 1);
    ledBits = shinkBits;
    break;
  case 1:
    alternatingLedControl(25, 200);
    break;
  case 2:
    synchronizedLedControl(25, 200, 390);
    break;
  case 3:
    alternatingLedControl(59, 470);
    break;
  case 4:
    synchronizedLedControl(59, 470, 951);
    break;
  case 5:
    alternatingLedControl(49, 0);
    break;
  case 6:
    synchronizedLedControl(49, 0, 439);
    break;
  case 7:
    alternatingLedControl(119, 0);
    break;
  case 8:
    //synchronizedLedControl(119, 0, 1070);
    do8();
    break;
  case 9:
    staggeredLedControl(289, 485);
    break;
  case 10:
    shinking(290, 480);
    ledBits = shinkBits & 0x03;
    break;
  case 11:
    staggeredLedControl(698, 1167);
    break;
  case 12:
    shinking(701, 1161);
    ledBits = shinkBits & 0x03;
    break;
  case 13:
    do1314(13);
    break;
  case 14:
    do1314(14);
    break;
  case 15:
    do15();
    break;
  case 16:
    do16();
    break;
  case 17:
    do17();
    break;
  case 18:
    do18();
    break;
  case 19:
    do1920(19);
    break;
  case 20:
    do1920(20);
    break;
  case 21:
    if (Time.dutyCount == 0)
    {
      Time.dutyCount = 109;
      shanCnt++;
    }
    ledBits = 1 << ((shanCnt - 1) & 1);
    break;
  case 22:
    shinking(109, 109);
    ledBits = shinkBits & 0x03;
    break;
  case 23:
    do23();
    break;
  case 24:
    shinking(246, 369);
    shinking2(1, 1);
    ledBits = (shinkBits & 0x01) | (shinkBits2 & 0x02);
    break;
  case 25:
    shinking(246, 369);
    shinking2(1, 1);
    ledBits = (shinkBits & 0x02) | (shinkBits2 & 0x01);
    break;
  default:
    break;
  }
}

void initVariables(u8 dang) 
{  // 初始化变量
     ledBits = 0; // 立即赋值，节省Flash
     shanCnt = 0;
     shanCnt2 = 0;
     Time.onOffCount = 0;
     Time.dutyCount = 0;
     Time.dutyCount2 = 0;
	// 模式变量
	 delayCounter = 0;
     ledPhase = 0;
     counter = 0;
	 shinkBits = 0;
     shinkBits2 = 0;
     currentLed = 0;
     ledMask = 0x01;
     if (dang == 9 ) 
     {
       	delayCounter = 385;  // 高位延时 385ms
     }
     if (dang == 11)
     {
       	delayCounter =  935; // 高位延时 935ms
     }
     if (dang == 13 || dang == 14)
     {
       counter = 15;
     }
     if (dang == 15 || dang == 17)
     {
       currentLed = 0x01;
       phase2SwitchCnt = 0;
       lastShanCnt2Div4 = 0;
     }
     if (dang == 19 || dang == 20)
     {
       delayCounter = 109;  // 延时 109ms
     }
     if (dang == 23)
     {
       lowPhase = 0;
       highPhase = 0;
       subLowPhase = 0;
       subHighPhase = 0;
       lowCounter = 0;
       highCounter = 0;
       lowPhase = 0;
       highPhase = 0;
       subLowPhase = 0;
       subHighPhase = 0;
       delayCounter = 386;  // 延时 386ms
     }
}
void keyCheck(void)
{
  static u8 keyState = 0; // 0 = 已释放, 1 = 已按下

  if (Key_Pin == 0)
  {
    if (Time.hitCount < KEY_PRESS_THRESHOLD)
    {
      Time.hitCount++;
    }
    Time.onOffCount = 0;

    if (keyState == 0 && Time.hitCount >= KEY_PRESS_THRESHOLD)
    {
      keyState = 1;
      Flag.bits.keyHit = 1;

      dang = (dang >= MAX_MODE_NUM) ? 0 : (dang + 1);
      eepromWrite(Dang_EEPROM_Addr, dang);
      initVariables(dang);
    }
  }
  else
  {
    if (Time.onOffCount < KEY_RELEASE_THRESHOLD)
    {
      Time.onOffCount++;
    }
    Time.hitCount = 0;

    if (keyState == 1 && Time.onOffCount >= KEY_RELEASE_THRESHOLD)
    {
      keyState = 0;
      Flag.bits.keyHit = 0;
    }
  }
}
void keyPosCheck(void)
{
  static u8 keyState = 0; // 0 = 已释放, 1 = 已按下

  if (Key_Pin2 == 1)
  {
    if (Time.hitCount2 < KEY_POS_PRESS_THRESHOLD)
    {
      Time.hitCount2++;
    }
    Time.onOffCount2 = 0;

    if (keyState == 0 && Time.hitCount2 >= KEY_POS_PRESS_THRESHOLD)
    {
      keyState = 1;
      Flag.bits.keyHit2 = 1;

      dang = (dang >= MAX_MODE_NUM) ? 0 : (dang + 1);
      eepromWrite(Dang_EEPROM_Addr, dang);
      initVariables(dang);
    }
  }
  else
  {
    if (Time.onOffCount2 < KEY_POS_RELEASE_THRESHOLD)
    {
      Time.onOffCount2++;
    }
    Time.hitCount2 = 0;

    if (keyState == 1 && Time.onOffCount2 >= KEY_POS_RELEASE_THRESHOLD)
    {
      keyState = 0;
      Flag.bits.keyHit2 = 0;
    }
  }
}

void powerInitial(void)
{
  OSCCON = 0B01110001;
  INTCON = 0;
  PORTA = 0B00000000;
  TRISA = 0B01000101;
  WPUA =  0B01000001;  // RA2正极关上拉（悬空）

  PORTC = 0B00000000;
  TRISC = 0B11101011;
  WPUC  = 0B11101011; // pc5负极开上拉

  CLRWDT();

  OPTION = 0B00000100;
  WDTCON = 0B00010000;
  TMR0 = 5;

  PSRCA = 0B11111111;
  PSRCC = 0B11111111;
  PSINKA = 0B11111111;
  PSINKC = 0B11111111;

  MSCON = 0B00110000;
}

void interrupt ISR(void)
{
  if (T0IE && T0IF)
  {
    T0IF = 0;
    TMR0 = 5;
    if (Time.dutyCount > 0)
      Time.dutyCount--;
    if (Time.dutyCount2 > 0)
      Time.dutyCount2--;
    keyCheck();
    keyPosCheck();
    modeMachine();
    ledDisplay();
  }
}

void delayUs(u8 timeUs)
{
  u8 a;
  for (a = 0; a < timeUs; a++)
  {
    NOP();
  }
}

u8 eepromRead(u8 eeAddr)
{
  u8 reEepromRead;

  EEADR = eeAddr;
  RD = 1;
  reEepromRead = EEDAT;
  return reEepromRead;
}
void eepromWrite(u8 eeAddr, u8 data)
{
  while (GIE)
  {
    GIE = 0;
  }
  EEADR = eeAddr;
  EEDAT = data;
  EEIF = 0;
  EECON1 |= 0x34;
  WR = 1;
  NOP();
  NOP();
  GIE = 1;
  while (WR)
    ;
}

int main(void)
{
  u8 i;

  powerInitial();

  for (i = 0; i < 250; i++)
    delayUs(197);

  CLRWDT();
  eepromWrite(0xff, 0xaa);
  eepromWrite(0xff, 0xaa);
  dang = eepromRead(Dang_EEPROM_Addr);
  if (dang > MAX_MODE_NUM)
  {
    dang = 0;
    Flag.bits.toEeprom = 1;
  }

  T0IF = 0;
  GIE = 1;
  T0IE = 1;

  while (1)
  {
    CLRWDT();
    if (Flag.bits.toEeprom)
    {
      eepromWrite(Dang_EEPROM_Addr, dang);
      Flag.bits.toEeprom = 0;
    }
  }
  
  return 0;
}
