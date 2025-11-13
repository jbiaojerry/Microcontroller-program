#include "SYSCFG.h";
typedef unsigned char u8;
typedef unsigned int u16;

#define Dang_EEPROM_Addr 0x00
// #define Key_Pin RC3
#define Key_Pin RA5 // PA5按键输入，高电平

typedef struct
{
  u8 DutyCount;
  u16 OnOffCount;
  u8 HitCount;
} time_t;

typedef union
{
  struct
  {
    unsigned KeyHit : 1;
    unsigned ToEEPROM : 1;
    unsigned ToWhite : 1;
    unsigned : 6;
  } bits;
  u8 allBits;
} flag_t;

time_t Time;
flag_t Flag;

u8 Dang;
u8 ModeState;
u8 LEDBits;
u8 ShanCnt;
u8 Shinkbits;
u8 TempH;
u8 TempM;
u8 TempL;
u8 TempC;
u8 TempW1;
u8 TempW2;

void Power_Initial(void);
void EEPROMwrite(u8 EEAddr, u8 Data);
u8 EEPROMread(u8 EEAddr);
void DelayUs(u8 TimeUs);
void LEDDisplay(void);
void KeyCheck(void);
void ModeMachine(void);
void Shinking(u8 dutyon, u8 dutyoff);
void D8ToDo(void);

void Shinking(u8 dutyon, u8 dutyoff)
{
  if (Time.DutyCount == 0)
  {
    if (Shinkbits)
    {
      Shinkbits = 0;
      Time.DutyCount = dutyoff;
      ShanCnt++;
    }
    else
    {
      Shinkbits = 0xff;
      Time.DutyCount = dutyon;
    }
  }
}

void LEDDisplay(void)
{
  // 4位LED映射: bit0->RA4, bit1->RA0, bit2->RA1, bit3->RA2
  if (LEDBits & 0x01)  // bit0 -> RA4
    RA4 = 1;
  else
    RA4 = 0;

  if (LEDBits & 0x02)  // bit1 -> RA0
    RA0 = 1;
  else
    RA0 = 0;

  if (LEDBits & 0x04)  // bit2 -> RA1
    RA1 = 1;
  else
    RA1 = 0;

  if (LEDBits & 0x08)  // bit3 -> RA2
    RA2 = 1;
  else
    RA2 = 0;
}

void KeyCheck(void)
{
  if (Key_Pin == 0)
  {
    if (Time.HitCount == 0)
    {
      if (Flag.bits.KeyHit == 0)
      {
        Flag.bits.KeyHit = 1;
        ModeState = 0;
        LEDBits = 0;
        TempH = 0;
        TempM = 0;
        TempL = 0;
        TempC = 0;
        TempW1 = 0;
        TempW2 = 0;
        ShanCnt = 0;
        Time.OnOffCount = 0;
        if (Dang >= 17)
          Dang = 0;
        else
        {
          Dang++;
        }
        EEPROMwrite(Dang_EEPROM_Addr, Dang);
      }
    }
  }
  else
  {
    Flag.bits.KeyHit = 0;
    Time.HitCount = 60;
  }
}

void DelayUs(u8 TimeUs)
{
  u8 a;
  for (a = 0; a < TimeUs; a++)
  {
    NOP();
  }
}

u8 EEPROMread(u8 EEAddr)
{
  u8 ReEEPROMread;

  EEADR = EEAddr;
  RD = 1;
  ReEEPROMread = EEDAT;
  return ReEEPROMread;
}

void EEPROMwrite(u8 EEAddr, u8 Data)
{
  while (GIE)
  {
    GIE = 0;
  }
  EEADR = EEAddr;
  EEDAT = Data;
  EEIF = 0;
  EECON1 |= 0x34;
  WR = 1;
  NOP();
  NOP();
  GIE = 1;
  while (WR)
    ;
}

void Power_Initial(void)
{
  OSCCON = 0B01110001;
  INTCON = 0;
  PORTA = 0B00000000;
  TRISA = 0B00100000;
  WPUA  = 0B00100000; // PA5输入，开上拉

  PORTC = 0B00000000;
  TRISC = 0B11101011;
  WPUC  = 0B11101011;

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


void ModeMachine(void)
{
  switch (Dang)
  {
  case 0:
	Shinking(5, 2);
    LEDBits = Shinkbits;
    break;
    
  case 1:
  {
    // Mode 1：中间两个LED和旁边两个LED交替切换
    // bit0->RA5, bit1->RA4, bit2->RA7, bit3->RC4
    // 中间两个LED：bit1+bit2 = 0x06 (RA4+RA7)
    // 旁边两个LED：bit0+bit3 = 0x09 (RA5+RC4)
    
    if (Time.OnOffCount == 0)
    {
      Time.OnOffCount = 160;  // 设置合适的切换频率：50个周期
      
      if (TempW2 == 0)
      {
        LEDBits = 0x06;  // 中间两个LED亮 (RA4+RA7)
        TempW2 = 1;
      }
      else
      {
        LEDBits = 0x09;  // 旁边两个LED亮 (RA5+RC4)
        TempW2 = 0;
      }
    }
  }
  break;

  case 2:
  {
    // Mode 2：4位LED高频闪烁6次，然后短暂全灭，然后循环执行
    // 使用自定义逻辑实现高频闪烁效果
    
    if (TempM == 0)  // 闪烁阶段
    {
      // 使用DutyCount控制闪烁频率
      if (Time.DutyCount == 0)
      {
        if (Shinkbits)
        {
          Shinkbits = 0;
          Time.DutyCount = 50;  // 关闭5个周期
          ShanCnt++;
        }
        else
        {
          Shinkbits = 0xFF;  // 所有4个LED亮
          Time.DutyCount = 50;  // 开启5个周期
        }
      }
      
      LEDBits = Shinkbits;  // 所有4个LED闪烁
      
      if (ShanCnt >= 10)  // 闪烁6次后进入全灭阶段
      {
        ShanCnt = 0;
        LEDBits = 0;
        TempM = 1;
        Time.OnOffCount = 500;  // 全灭100个周期
      }
    }
    else if (TempM == 1)  // 全灭阶段
    {
      LEDBits = 0;  // 所有LED关闭
      
      if (Time.OnOffCount == 0)  // 全灭时间结束，重新开始闪烁
      {
        TempM = 0;
        ShanCnt = 0;  // 重置闪烁计数
        Shinkbits = 0;  // 重置闪烁状态
      }
    }
  }
  break;

  case 3:
  {
    // Mode 3：先闪烁10次然后2轮左流水灯，然后再闪烁10次再2轮右流水灯
    // 阶段1：高频闪烁10次
    // 阶段2：左流水灯2轮
    // 阶段3：高频闪烁10次
    // 阶段4：右流水灯2轮
    // 阶段5：循环执行
    
    if (TempM == 0)  // 第一次高频闪烁阶段
    {
      // 使用DutyCount控制闪烁频率
      if (Time.DutyCount == 0)
      {
        if (Shinkbits)
        {
          Shinkbits = 0;
          Time.DutyCount = 50;  // 关闭50个周期
          ShanCnt++;
        }
        else
        {
          Shinkbits = 0xFF;  // 所有4个LED亮
          Time.DutyCount = 50;  // 开启50个周期
        }
      }
      
      LEDBits = Shinkbits;  // 所有4个LED闪烁
      
      if (ShanCnt >= 10)  // 闪烁10次后进入左流水灯阶段
      {
        ShanCnt = 0;
        TempM = 1;  // 进入左流水灯阶段
        TempL = 0;  // 重置流水灯位置
        Time.OnOffCount = 100;  // 流水灯切换间隔
      }
    }
    else if (TempM == 1)  // 左流水灯阶段
    {
      if (Time.OnOffCount == 0)
      {
        Time.OnOffCount = 100;  // 流水灯切换间隔
        
        if (TempL == 0)  // 左流水灯第一轮
        {
          LEDBits = 0x01;  // bit0 -> RA5
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x02;  // bit1 -> RA4
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x04;  // bit2 -> RA7
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x08;  // bit3 -> RC4
          TempL = 4;
        }
        else if (TempL == 4)  // 左流水灯第二轮
        {
          LEDBits = 0x01;  // bit0 -> RA5
          TempL = 5;
        }
        else if (TempL == 5)
        {
          LEDBits = 0x02;  // bit1 -> RA4
          TempL = 6;
        }
        else if (TempL == 6)
        {
          LEDBits = 0x04;  // bit2 -> RA7
          TempL = 7;
        }
        else if (TempL == 7)  // 左流水灯完成，进入第二次闪烁
        {
          LEDBits = 0;
          TempL = 0;
          TempM = 2;  // 进入第二次闪烁阶段
          ShanCnt = 0;
          Shinkbits = 0;
        }
      }
    }
    else if (TempM == 2)  // 第二次高频闪烁阶段
    {
      // 使用DutyCount控制闪烁频率
      if (Time.DutyCount == 0)
      {
        if (Shinkbits)
        {
          Shinkbits = 0;
          Time.DutyCount = 50;  // 关闭50个周期
          ShanCnt++;
        }
        else
        {
          Shinkbits = 0xFF;  // 所有4个LED亮
          Time.DutyCount = 50;  // 开启50个周期
        }
      }
      
      LEDBits = Shinkbits;  // 所有4个LED闪烁
      
      if (ShanCnt >= 10)  // 闪烁10次后进入右流水灯阶段
      {
        ShanCnt = 0;
        TempM = 3;  // 进入右流水灯阶段
        TempL = 0;  // 重置流水灯位置
        Time.OnOffCount = 100;  // 流水灯切换间隔
      }
    }
    else if (TempM == 3)  // 右流水灯阶段
    {
      if (Time.OnOffCount == 0)
      {
        Time.OnOffCount = 100;  // 流水灯切换间隔
        
        if (TempL == 0)  // 右流水灯第一轮
        {
          LEDBits = 0x08;  // bit3 -> RC4
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x04;  // bit2 -> RA7
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x02;  // bit1 -> RA4
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x01;  // bit0 -> RA5
          TempL = 4;
        }
        else if (TempL == 4)  // 右流水灯第二轮
        {
          LEDBits = 0x08;  // bit3 -> RC4
          TempL = 5;
        }
        else if (TempL == 5)
        {
          LEDBits = 0x04;  // bit2 -> RA7
          TempL = 6;
        }
        else if (TempL == 6)
        {
          LEDBits = 0x02;  // bit1 -> RA4
          TempL = 7;
        }
        else if (TempL == 7)  // 右流水灯完成，重新开始
        {
          LEDBits = 0;
          TempL = 0;
          TempM = 0;  // 重新开始第一次闪烁
          ShanCnt = 0;
          Shinkbits = 0;
        }
      }
    }
  }
  break;

  case 4:
    D8ToDo();
    break;

  case 5:
  {
    // Mode 5：4位LED低频闪烁，持续循环
    // 持续低频闪烁，无全灭阶段
    
    // 使用Shinking函数实现低频闪烁
    Shinking(70, 70);  // 开启100个周期，关闭100个周期
    
    LEDBits = Shinkbits;  // 所有4个LED闪烁
  }
  break;

  case 6:
  {
    // Mode 6：4位LED高频率左右流水循环
    // 左流水：RA5 -> RA4 -> RA7 -> RC4
    // 右流水：RC4 -> RA7 -> RA4 -> RA5
    // 循环执行
    
    if (Time.OnOffCount == 0)
    {
      Time.OnOffCount = 80;  // 中频率切换间隔
      
      if (TempM == 0)  // 左流水阶段
      {
        if (TempL == 0)
        {
          LEDBits = 0x01;  // bit0 -> RA5
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x02;  // bit1 -> RA4
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x04;  // bit2 -> RA7
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x08;  // bit3 -> RC4
          TempL = 0;
          TempM = 1;  // 切换到右流水阶段
        }
      }
      else if (TempM == 1)  // 右流水阶段
      {
        if (TempL == 0)
        {
          LEDBits = 0x08;  // bit3 -> RC4
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x04;  // bit2 -> RA7
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x02;  // bit1 -> RA4
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x01;  // bit0 -> RA5
          TempL = 0;
          TempM = 0;  // 切换到左流水阶段
        }
      }
    }
  }
  break;

  case 7:
  {
    // Mode 7：4位LED按照指定序列闪烁
    // 阶段1：0x0c高两位闪烁3次
    // 阶段2：0x03低两位闪烁3次
    // 阶段3：0x0f四位闪烁6次
    // 阶段4：循环执行
    
    if (TempM == 0)  // 0x0c高两位闪烁3次
    {
      // 使用Shinking函数实现闪烁
      Shinking(50, 50);  // 开启50个周期，关闭50个周期
      
      LEDBits = Shinkbits & 0x0C;  // 高两位LED闪烁 (RA7+RC4)
      
      if (ShanCnt >= 6)  // 闪烁3次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        TempM = 1;  // 进入第二阶段
      }
    }
    else if (TempM == 1)  // 0x03低两位闪烁3次
    {
      // 使用Shinking函数实现闪烁
      Shinking(50, 50);  // 开启50个周期，关闭50个周期
      
      LEDBits = Shinkbits & 0x03;  // 低两位LED闪烁 (RA5+RA4)
      
      if (ShanCnt >= 6)  // 闪烁3次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        TempM = 2;  // 进入第三阶段
      }
    }
    else if (TempM == 2)  // 0x0f四位闪烁6次
    {
      // 使用Shinking函数实现闪烁
      Shinking(50, 50);  // 开启50个周期，关闭50个周期
      
      LEDBits = Shinkbits & 0x0F;  // 四位LED闪烁 (RA5+RA4+RA7+RC4)
      
      if (ShanCnt >= 12)  // 闪烁6次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        TempM = 0;  // 重新开始第一阶段
      }
    }
  }
  break;

  case 8:
  {
    // Mode 8：4位LED按照指定序列闪烁
    // 阶段1：0x0c高两位闪烁5次
    // 阶段2：0x03低两位闪烁5次
    // 阶段3：循环执行
    
    if (TempM == 0)  // 0x0c高两位闪烁5次
    {
      // 使用Shinking函数实现闪烁
      Shinking(50, 50);  // 开启50个周期，关闭50个周期
      
      LEDBits = Shinkbits & 0x0C;  // 高两位LED闪烁 (RA7+RC4)
      
      if (ShanCnt >= 10)  // 闪烁5次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        TempM = 1;  // 进入第二阶段
      }
    }
    else if (TempM == 1)  // 0x03低两位闪烁5次
    {
      // 使用Shinking函数实现闪烁
      Shinking(50, 50);  // 开启50个周期，关闭50个周期
      
      LEDBits = Shinkbits & 0x03;  // 低两位LED闪烁 (RA5+RA4)
      
      if (ShanCnt >= 10)  // 闪烁5次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        TempM = 0;  // 重新开始第一阶段
      }
    }
  }
  break;

  case 9:
  {
    // Mode 9：4位LED按照指定序列依次点亮
    // 序列：0x03、0x06、0x0c、0x08、0x02、0x04、0x01、0x09、0x08、0x0c、0x06、0x03、0x01、0x08、0x04、0x0c、0x08、0x01
    // 完整之后再循环
    
    if (Time.OnOffCount == 0)
    {
      Time.OnOffCount = 60;  // 中频率切换间隔
      
      // 使用数组存储18个LED状态序列
      u8 led_sequence[18] = {
        0x03, 0x06, 0x0C, 0x08, 0x02, 0x04, 0x01, 0x09, 
        0x08, 0x0C, 0x06, 0x03, 0x01, 0x08, 0x04, 0x0C, 
        0x08, 0x01
      };
      
      // 根据索引获取LED状态
      LEDBits = led_sequence[TempL];
      
      // 切换到下一个状态
      TempL++;
      if (TempL >= 18)
        TempL = 0;  // 重新开始循环
    }
  }
  break;

  case 10:
  {
    // Mode 10：4位LED按照指定序列执行
    // 序列：0x06中间两位亮 -> 短暂全灭 -> 0x0F四位全亮 -> 短暂灭 -> 循环执行
    // 状态0：0x06中间两位亮（快速）
    // 状态1：短暂全灭（加长时间）
    // 状态2：0x0F四位全亮（快速）
    // 状态3：短暂灭（快速）
    // 然后循环执行
    
    if (Time.OnOffCount == 0)
    {
      if (TempM == 0)  // 0x06状态（中间两位亮）
      {
        LEDBits = 0x06;  // RA4+RA7 (中间两位)
        Time.OnOffCount = 50;  // 快速切换间隔
        TempM = 1;  // 切换到全灭状态
      }
      else if (TempM == 1)  // 全灭状态
      {
        LEDBits = 0;  // 所有LED关闭
        Time.OnOffCount = 120;  // 加长全灭时间
        TempM = 2;  // 切换到0x0F状态
      }
      else if (TempM == 2)  // 0x0F状态（四位全亮）
      {
        LEDBits = 0x0F;  // RA5+RA4+RA7+RC4 (所有四位)
        Time.OnOffCount = 50;  // 快速切换间隔
        TempM = 3;  // 切换到短暂灭状态
      }
      else if (TempM == 3)  // 短暂灭状态
      {
        LEDBits = 0;  // 所有LED关闭
        Time.OnOffCount = 50;  // 快速切换间隔
        TempM = 0;  // 切换到0x06状态，重新开始循环
      }
    }
  }
  break;

  case 11:
  {
    // Mode 11：4位LED按照指定序列闪烁
    // 序列：0x05闪烁3次 -> 0x0A闪烁3次 -> 循环执行
    // 状态0：0x05闪烁3次
    // 状态1：0x0A闪烁3次
    // 然后循环执行
    
    if (Time.OnOffCount == 0)
    {
      if (TempM == 0)  // 0x05状态闪烁
      {
        // 使用DutyCount控制闪烁频率
        if (Time.DutyCount == 0)
        {
          if (Shinkbits)
          {
            Shinkbits = 0;
            Time.DutyCount = 40;  // 关闭40个周期
            ShanCnt++;
          }
          else
          {
            Shinkbits = 0xFF;
            Time.DutyCount = 40;  // 开启40个周期
          }
        }
        
        LEDBits = Shinkbits & 0x05;  // RA5+RC4 (0x05)闪烁
        
        if (ShanCnt >= 6)  // 闪烁3次后切换到0x0A状态
        {
          ShanCnt = 0;
          Shinkbits = 0;
          TempM = 1;  // 切换到0x0A状态
        }
      }
      else if (TempM == 1)  // 0x0A状态闪烁
      {
        // 使用DutyCount控制闪烁频率
        if (Time.DutyCount == 0)
        {
          if (Shinkbits)
          {
            Shinkbits = 0;
            Time.DutyCount = 40;  // 关闭40个周期
            ShanCnt++;
          }
          else
          {
            Shinkbits = 0xFF;
            Time.DutyCount = 40;  // 开启40个周期
          }
        }
        
        LEDBits = Shinkbits & 0x0A;  // RA4+RC4 (0x0A)闪烁
        
        if (ShanCnt >= 6)  // 闪烁3次后切换到0x05状态
        {
          ShanCnt = 0;
          Shinkbits = 0;
          TempM = 0;  // 切换到0x05状态，重新开始循环
        }
      }
    }
  }
  break;

  case 12:
  {
    // Mode 12：4位LED左右流水灯，极快频率循环
    // 左流水：RA5 -> RA4 -> RA7 -> RC4
    // 右流水：RC4 -> RA7 -> RA4 -> RA5
    // 极快频率循环执行
    
    if (Time.OnOffCount == 0)
    {
      Time.OnOffCount = 20;  // 极快频率切换间隔
      
      if (TempM == 0)  // 左流水阶段
      {
        if (TempL == 0)
        {
          LEDBits = 0x01;  // bit0 -> RA5
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x02;  // bit1 -> RA4
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x04;  // bit2 -> RA7
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x08;  // bit3 -> RC4
          TempL = 0;
          TempM = 1;  // 切换到右流水阶段
        }
      }
      else if (TempM == 1)  // 右流水阶段
      {
        if (TempL == 0)
        {
          LEDBits = 0x08;  // bit3 -> RC4
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x04;  // bit2 -> RA7
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x02;  // bit1 -> RA4
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x01;  // bit0 -> RA5
          TempL = 0;
          TempM = 0;  // 切换到左流水阶段
        }
      }
    }
  }
  break;

  case 13:
  {
    // Mode 13：4位LED递增递减流水灯，中频率循环
    // 阶段1：从低位0x01到高位依次递增点亮 (0x01 -> 0x03 -> 0x07 -> 0x0F)
    // 阶段2：从高位到低位依次递增熄灭 (0x0E -> 0x0C -> 0x08 -> 0x00)
    // 阶段3：从高位到低位依次递增点亮 (0x08 -> 0x0C -> 0x0E -> 0x0F)
    // 阶段4：从低位到高位依次递增熄灭 (0x07 -> 0x03 -> 0x01 -> 0x00)
    // 中频率循环执行
    
    if (Time.OnOffCount == 0)
    {
      Time.OnOffCount = 80;  // 中频率切换间隔
      
      if (TempM == 0)  // 阶段1：从低位到高位依次递增点亮
      {
        if (TempL == 0)
        {
          LEDBits = 0x01;  // bit0 -> RA5
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x03;  // bit0+bit1 -> RA5+RA4
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x07;  // bit0+bit1+bit2 -> RA5+RA4+RA7
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x0F;  // bit0+bit1+bit2+bit3 -> RA5+RA4+RA7+RC4
          TempL = 0;
          TempM = 1;  // 切换到阶段2
        }
      }
      else if (TempM == 1)  // 阶段2：从高位到低位依次递增熄灭
      {
        if (TempL == 0)
        {
          LEDBits = 0x0E;  // bit1+bit2+bit3 -> RA4+RA7+RC4 (bit0灭)
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x0C;  // bit2+bit3 -> RA7+RC4 (bit0+bit1灭)
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x08;  // bit3 -> RC4 (bit0+bit1+bit2灭)
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x00;  // 全灭 (bit0+bit1+bit2+bit3灭)
          TempL = 0;
          TempM = 2;  // 切换到阶段3
        }
      }
      else if (TempM == 2)  // 阶段3：从高位到低位依次递增点亮
      {
        if (TempL == 0)
        {
          LEDBits = 0x08;  // bit3 -> RC4
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x0C;  // bit2+bit3 -> RA7+RC4
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x0E;  // bit1+bit2+bit3 -> RA4+RA7+RC4
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x0F;  // bit0+bit1+bit2+bit3 -> RA5+RA4+RA7+RC4
          TempL = 0;
          TempM = 3;  // 切换到阶段4
        }
      }
      else if (TempM == 3)  // 阶段4：从低位到高位依次递增熄灭
      {
        if (TempL == 0)
        {
          LEDBits = 0x07;  // bit0+bit1+bit2 -> RA5+RA4+RA7 (bit3灭)
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x03;  // bit0+bit1 -> RA5+RA4 (bit2+bit3灭)
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x01;  // bit0 -> RA5 (bit1+bit2+bit3灭)
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x00;  // 全灭 (bit0+bit1+bit2+bit3灭)
          TempL = 0;
          TempM = 0;  // 切换到阶段1，重新开始循环
        }
      }
    }
  }
  break;

  case 14:
  {
    // Mode 14：4位LED全亮闪烁5次，然后全灭一定合适时间，以此循环
    // 阶段1：全亮闪烁5次
    // 阶段2：全灭一定合适时间
    // 循环执行
    
    if (TempM == 0)  // 阶段1：全亮闪烁5次
    {
      // 使用DutyCount控制闪烁频率
      if (Time.DutyCount == 0)
      {
        if (Shinkbits)
        {
          Shinkbits = 0;
          Time.DutyCount = 50;  // 关闭50个周期
          ShanCnt++;
        }
        else
        {
          Shinkbits = 0xFF;  // 所有4个LED亮
          Time.DutyCount = 50;  // 开启50个周期
        }
      }
      
      LEDBits = Shinkbits;  // 所有4个LED闪烁
      
      if (ShanCnt >= 10)  // 闪烁5次后进入全灭阶段
      {
        ShanCnt = 0;
        Shinkbits = 0;
        LEDBits = 0;
        TempM = 1;  // 进入全灭阶段
        Time.OnOffCount = 500;  // 全灭500个周期
      }
    }
    else if (TempM == 1)  // 阶段2：全灭一定合适时间
    {
      LEDBits = 0;  // 所有LED关闭
      
      if (Time.OnOffCount == 0)  // 全灭时间结束，重新开始闪烁
      {
        TempM = 0;  // 重新开始闪烁阶段
        ShanCnt = 0;  // 重置闪烁计数
        Shinkbits = 0;  // 重置闪烁状态
      }
    }
  }
  break;

  case 15:
  {
    // Mode 15：4位LED慢速左右流水灯循环
    // 左流水：RA5 -> RA4 -> RA7 -> RC4
    // 右流水：RC4 -> RA7 -> RA4 -> RA5
    // 慢速循环执行
    
    if (Time.OnOffCount == 0)
    {
      Time.OnOffCount = 150;  // 慢速切换间隔
      
      if (TempM == 0)  // 左流水阶段
      {
        if (TempL == 0)
        {
          LEDBits = 0x01;  // bit0 -> RA5
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x02;  // bit1 -> RA4
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x04;  // bit2 -> RA7
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x08;  // bit3 -> RC4
          TempL = 0;
          TempM = 1;  // 切换到右流水阶段
        }
      }
      else if (TempM == 1)  // 右流水阶段
      {
        if (TempL == 0)
        {
          LEDBits = 0x08;  // bit3 -> RC4
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x04;  // bit2 -> RA7
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x02;  // bit1 -> RA4
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x01;  // bit0 -> RA5
          TempL = 0;
          TempM = 0;  // 切换到左流水阶段
        }
      }
    }
  }
  break;

  case 16:
  {
    // Mode 16：4位LED递增点亮+闪烁循环
    // 阶段1：从低位0x01到高位依次递增点亮 (0x01 -> 0x03 -> 0x07 -> 0x0F)
    // 阶段2：闪烁5次
    // 阶段3：从高位到低位依次递增点亮 (0x08 -> 0x0C -> 0x0E -> 0x0F)
    // 阶段4：闪烁5次
    // 循环执行
    
    if (TempM == 0)  // 阶段1：从低位到高位依次递增点亮
    {
      if (Time.OnOffCount == 0)
      {
        Time.OnOffCount = 60;  // 切换间隔（优化：从100减少到60）
        
        if (TempL == 0)
        {
          LEDBits = 0x01;  // bit0 -> RA5
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x03;  // bit0+bit1 -> RA5+RA4
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x07;  // bit0+bit1+bit2 -> RA5+RA4+RA7
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x0F;  // bit0+bit1+bit2+bit3 -> RA5+RA4+RA7+RC4
          TempL = 0;
          TempM = 1;  // 切换到阶段2
          ShanCnt = 0;  // 重置闪烁计数
          Shinkbits = 0;  // 重置闪烁状态
        }
      }
    }
    else if (TempM == 1)  // 阶段2：闪烁5次
    {
      // 使用DutyCount控制闪烁频率
      if (Time.DutyCount == 0)
      {
        if (Shinkbits)
        {
          Shinkbits = 0;
          Time.DutyCount = 50;  // 关闭50个周期
          ShanCnt++;
        }
        else
        {
          Shinkbits = 0xFF;  // 所有4个LED亮
          Time.DutyCount = 50;  // 开启50个周期
        }
      }
      
      LEDBits = Shinkbits;  // 所有4个LED闪烁
      
      if (ShanCnt >= 10)  // 闪烁5次后进入阶段3
      {
        ShanCnt = 0;
        Shinkbits = 0;
        LEDBits = 0;
        TempM = 2;  // 进入阶段3
        TempL = 0;  // 重置位置计数
      }
    }
    else if (TempM == 2)  // 阶段3：从高位到低位依次递增点亮
    {
      if (Time.OnOffCount == 0)
      {
        Time.OnOffCount = 60;  // 切换间隔（优化：从100减少到60）
        
        if (TempL == 0)
        {
          LEDBits = 0x08;  // bit3 -> RC4
          TempL = 1;
        }
        else if (TempL == 1)
        {
          LEDBits = 0x0C;  // bit2+bit3 -> RA7+RC4
          TempL = 2;
        }
        else if (TempL == 2)
        {
          LEDBits = 0x0E;  // bit1+bit2+bit3 -> RA4+RA7+RC4
          TempL = 3;
        }
        else if (TempL == 3)
        {
          LEDBits = 0x0F;  // bit0+bit1+bit2+bit3 -> RA5+RA4+RA7+RC4
          TempL = 0;
          TempM = 3;  // 切换到阶段4
          ShanCnt = 0;  // 重置闪烁计数
          Shinkbits = 0;  // 重置闪烁状态
        }
      }
    }
    else if (TempM == 3)  // 阶段4：闪烁5次
    {
      // 使用DutyCount控制闪烁频率
      if (Time.DutyCount == 0)
      {
        if (Shinkbits)
        {
          Shinkbits = 0;
          Time.DutyCount = 50;  // 关闭50个周期
          ShanCnt++;
        }
        else
        {
          Shinkbits = 0xFF;  // 所有4个LED亮
          Time.DutyCount = 50;  // 开启50个周期
        }
      }
      
      LEDBits = Shinkbits;  // 所有4个LED闪烁
      
      if (ShanCnt >= 10)  // 闪烁5次后重新开始循环
      {
        ShanCnt = 0;
        Shinkbits = 0;
        LEDBits = 0;
        TempM = 0;  // 重新开始阶段1
        TempL = 0;  // 重置位置计数
      }
    }
  }
  break;

  case 17:
  {
    // Mode 17：4位LED切换模式（全程高频闪烁）
    // 阶段1：0x06和0x09状态慢速来回切换10次
    // 阶段2：0x06和0x09状态快速切换5次
    // 循环执行，全程高频闪烁
    
    // 使用DutyCount控制高频闪烁
    if (Time.DutyCount == 0)
    {
      if (Shinkbits)
      {
        Shinkbits = 0;
        Time.DutyCount = 30;  // 关闭30个周期（高频闪烁）
        ShanCnt++;
      }
      else
      {
        Shinkbits = 0x0F;
        Time.DutyCount = 30;  // 开启30个周期（高频闪烁）
      }
    }
    
    if (Time.OnOffCount == 0)
    {
      if (TempM == 0)  // 阶段1：慢速切换10次
      {
        Time.OnOffCount = 480;  // 慢速切换间隔
        TempL++;
        
        // 根据当前状态设置LEDBits（高频闪烁）
        if (TempL % 2 == 0)  // 偶数次：0x09状态
        {
          LEDBits = Shinkbits & 0x09;  // RA5+RC4 (两边两位)
        }
        else  // 奇数次：0x06状态
        {
          LEDBits = Shinkbits & 0x06;  // RA4+RA7 (中间两位)
        }
        
        if (TempL >= 14)  // 完成10次慢速切换后进入阶段2
        {
          TempL = 0;
          TempM = 1;  // 进入阶段2
        }
      }
      else if (TempM == 1)  // 阶段2：快速切换5次
      {
        Time.OnOffCount = 140;  // 快速切换间隔（与慢速有明显区别）
        TempL++;
        // 根据当前状态设置LEDBits（高频闪烁）
        if (TempL % 2 == 0)  // 偶数次：0x09状态
        {
          LEDBits = Shinkbits & 0x09;  // RA5+RC4 (两边两位)
        }
        else  // 奇数次：0x06状态
        {
          LEDBits = Shinkbits & 0x06;  // RA4+RA7 (中间两位)
        }

        if (TempL >= 10)  // 完成5次快速切换后重新开始
        {
          TempL = 0;
          TempM = 0;  // 重新开始阶段1
        }
      }
    }
    else
    {
      // 在等待期间保持当前LED状态（高频闪烁）
      if (TempL % 2 == 0)  // 偶数次：0x09状态
      {
        LEDBits = Shinkbits & 0x09;  // RA5+RC4 (两边两位)
      }
      else  // 奇数次：0x06状态
      {
        LEDBits = Shinkbits & 0x06;  // RA4+RA7 (中间两位)
      }
    }
  }
  break;

  default:
    break;
  }
}

void D8ToDo(void)
{
  if (Time.OnOffCount == 0)
  {
    Time.OnOffCount = 30;
    switch (ModeState)
    {
    case 0:  // 0x01一位亮起闪烁
      if (TempH == 0)
        TempH = 0x01;
      // 实现闪烁效果
      if (Shinkbits)
      {
        Shinkbits = 0;
        LEDBits = 0;  // 熄灭
      }
      else
      {
        Shinkbits = 0xFF;
        LEDBits = TempH;  // 亮起
      }
      ShanCnt++;
      if (ShanCnt >= 6)  // 闪烁3次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        ModeState = 1;
      }
      break;

    case 1:  // 0x03两位亮起闪烁
      TempH = 0x03;
      // 实现闪烁效果
      if (Shinkbits)
      {
        Shinkbits = 0;
        LEDBits = 0;  // 熄灭
      }
      else
      {
        Shinkbits = 0xFF;
        LEDBits = TempH;  // 亮起
      }
      ShanCnt++;
      if (ShanCnt >= 6)  // 闪烁3次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        ModeState = 2;
      }
      break;

    case 2:  // 0x07三位亮起闪烁
      TempH = 0x07;
      // 实现闪烁效果
      if (Shinkbits)
      {
        Shinkbits = 0;
        LEDBits = 0;  // 熄灭
      }
      else
      {
        Shinkbits = 0xFF;
        LEDBits = TempH;  // 亮起
      }
      ShanCnt++;
      if (ShanCnt >= 6)  // 闪烁3次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        ModeState = 3;
      }
      break;

    case 3:  // 0x0F四位亮起闪烁
      TempH = 0x0F;
      // 实现闪烁效果
      if (Shinkbits)
      {
        Shinkbits = 0;
        LEDBits = 0;  // 熄灭
      }
      else
      {
        Shinkbits = 0xFF;
        LEDBits = TempH;  // 亮起
      }
      ShanCnt++;
      if (ShanCnt >= 6)  // 闪烁3次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        ModeState = 4;
      }
      break;

    case 4:  // 0x0E三位亮起闪烁
      TempH = 0x0E;
      // 实现闪烁效果
      if (Shinkbits)
      {
        Shinkbits = 0;
        LEDBits = 0;  // 熄灭
      }
      else
      {
        Shinkbits = 0xFF;
        LEDBits = TempH;  // 亮起
      }
      ShanCnt++;
      if (ShanCnt >= 6)  // 闪烁3次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        ModeState = 5;
      }
      break;

    case 5:  // 0x0C两位亮起闪烁
      TempH = 0x0C;
      // 实现闪烁效果
      if (Shinkbits)
      {
        Shinkbits = 0;
        LEDBits = 0;  // 熄灭
      }
      else
      {
        Shinkbits = 0xFF;
        LEDBits = TempH;  // 亮起
      }
      ShanCnt++;
      if (ShanCnt >= 6)  // 闪烁3次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        ModeState = 6;
      }
      break;

    case 6:  // 0x08一位亮起闪烁
      TempH = 0x08;
      // 实现闪烁效果
      if (Shinkbits)
      {
        Shinkbits = 0;
        LEDBits = 0;  // 熄灭
      }
      else
      {
        Shinkbits = 0xFF;
        LEDBits = TempH;  // 亮起
      }
      ShanCnt++;
      if (ShanCnt >= 6)  // 闪烁3次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        ModeState = 7;
      }
      break;

    case 7:  // 全灭
      LEDBits = 0;
      ShanCnt++;
      if (ShanCnt >= 2)  // 全灭2个周期
      {
        ShanCnt = 0;
        ModeState = 8;
      }
      break;

    case 8:  // 反着流水灯一轮：0x08 -> 0x0C -> 0x0E -> 0x0F -> 0x07 -> 0x03 -> 0x01
      if (TempH == 0)
        TempH = 0x08;
      // 实现闪烁效果
      if (Shinkbits)
      {
        Shinkbits = 0;
        LEDBits = 0;  // 熄灭
      }
      else
      {
        Shinkbits = 0xFF;
        LEDBits = TempH;  // 亮起
      }
      ShanCnt++;
      if (ShanCnt >= 6)  // 闪烁3次（每次闪烁需要2个周期：亮+灭）
      {
        ShanCnt = 0;
        Shinkbits = 0;
        if (TempH == 0x08)
          TempH = 0x0C;
        else if (TempH == 0x0C)
          TempH = 0x0E;
        else if (TempH == 0x0E)
          TempH = 0x0F;
        else if (TempH == 0x0F)
          TempH = 0x07;
        else if (TempH == 0x07)
          TempH = 0x03;
        else if (TempH == 0x03)
          TempH = 0x01;
        else if (TempH == 0x01)
        {
          TempH = 0x01;  // 重置为初始值
          ModeState = 0;  // 重新开始
        }
      }
      break;

    default:
      break;
    }
  }
}

void interrupt ISR(void)
{
  if (T0IE && T0IF)
  {
    T0IF = 0;
    TMR0 = 5;
    if (Time.DutyCount > 0)
      Time.DutyCount--;
    if (Time.HitCount > 0)
      Time.HitCount--;
    if (Time.OnOffCount > 0)
      Time.OnOffCount--;

    KeyCheck();
    ModeMachine();
    LEDDisplay();
  }
}

int main(void)
{
  u8 i;

  Power_Initial();

  for (i = 0; i < 250; i++)
    DelayUs(197);

  CLRWDT();
  EEPROMwrite(0xff, 0xaa);
  EEPROMwrite(0xff, 0xaa);
  Dang = EEPROMread(Dang_EEPROM_Addr);
  if (Dang > 17)
  {
    Dang = 0;
    Flag.bits.ToEEPROM = 1;
  }

  T0IF = 0;
  GIE = 1;
  T0IE = 1;

  while (1)
  {
    CLRWDT();
    if (Flag.bits.ToEEPROM)
    {
      EEPROMwrite(Dang_EEPROM_Addr, Dang);
      Flag.bits.ToEEPROM = 0;
    }
  }
  
  return 0;
}