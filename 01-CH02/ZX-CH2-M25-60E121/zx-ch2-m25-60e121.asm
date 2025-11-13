//Deviec:FT60E12X
//-----------------------Variable---------------------------------
		_RA2		EQU		05H
		_RA4		EQU		05H
		_RA5		EQU		05H
		_RC5		EQU		07H
		_T0IF		EQU		0BH
		_T0IE		EQU		0BH
		_GIE		EQU		0BH
		_EEIF		EQU		0CH
		_RD		EQU		9CH
		_WR		EQU		9DH
		_Time.hitCount		EQU		20H
		_Time.hitCount2		EQU		21H
		_Time.dutyCount		EQU		22H
		_Time.onOffCount		EQU		24H
		_Time.dutyCount2		EQU		26H
		_Time.onOffCount2		EQU		28H
		_Time		EQU		20H
		_Flag.bits.keyHit		EQU		2CH
		_Flag.bits.keyHit2		EQU		2CH
		_Flag.bits.toEeprom		EQU		2CH
		_Flag.bits.toWhite		EQU		2CH
		_Flag.bits..		EQU		2DH
		_Flag.bits		EQU		2CH
		_Flag.allBits		EQU		2CH
		_Flag		EQU		2CH
		_shanCnt2		EQU		3DH
		_shinkBits2		EQU		3CH
		_shanCnt		EQU		3FH
		_shinkBits		EQU		3BH
		_dang		EQU		3AH
		_ledBits		EQU		39H
		_currentLed		EQU		4FH
		_ledMask		EQU		4EH
		_delayCounter		EQU		2AH
		_ledPhase		EQU		38H
		_counter		EQU		3EH
		_phase2SwitchCnt		EQU		37H
		_lastShanCnt2Div4		EQU		36H
		_lowCounter		EQU		35H
		_highCounter		EQU		34H
		_lowPhase		EQU		33H
		_highPhase		EQU		32H
		_subLowPhase		EQU		31H
		_subHighPhase		EQU		30H
//		main@i		EQU		4DH
//		eepromWrite@eeAddr		EQU		4CH
//		eepromWrite@eeAddr		EQU		4CH
//		eepromWrite@data		EQU		4BH
//		eepromWrite@eeAddr		EQU		4CH
//		eepromRead@eeAddr		EQU		4BH
//		eepromRead@reEepromRead		EQU		4CH
//		eepromRead@eeAddr		EQU		4BH
//		eepromRead@eeAddr		EQU		4BH
//		delayUs@timeUs		EQU		4BH
//		delayUs@a		EQU		4CH
//		delayUs@timeUs		EQU		4BH
//		delayUs@timeUs		EQU		4BH
//		synchronizedLedControl@flashTime		EQU		40H
//		synchronizedLedControl@flashTime		EQU		40H
//		synchronizedLedControl@holdTime		EQU		7AH
//		synchronizedLedControl@offTime		EQU		7CH
//		synchronizedLedControl@flashTime		EQU		40H
//		staggeredLedControl@flashOn		EQU		7AH
//		staggeredLedControl@flashOff		EQU		7CH
//		do1920@dang		EQU		44H
//		do1920@dang		EQU		44H
//		do1920@dang		EQU		44H
//		do17@currentDiv4		EQU		7CH
//		do17@prevShinkBits		EQU		7BH
//		do15@currentDiv4		EQU		7CH
//		do15@prevShinkBits		EQU		7BH
//		shinking2@dutyon		EQU		70H
//		shinking2@dutyoff		EQU		72H
//		do1314@dang		EQU		40H
//		do1314@dang		EQU		40H
//		do1314@dang		EQU		40H
//		___wmul@product		EQU		74H
//		___wmul@multiplier		EQU		70H
//		___wmul@multiplicand		EQU		72H
//		alternatingLedControl@flashTime		EQU		7DH
//		alternatingLedControl@flashTime		EQU		7DH
//		alternatingLedControl@holdTime		EQU		7AH
//		alternatingLedControl@flashTime		EQU		7DH
//		shinking@dutyOn		EQU		76H
//		shinking@dutyOff		EQU		78H
//		keyPosCheck@keyState		EQU		2EH
//		keyCheck@keyState		EQU		2FH
//		i1eepromWrite@eeAddr		EQU		71H
//		i1eepromWrite@eeAddr		EQU		71H
//		i1eepromWrite@data		EQU		70H
//		i1eepromWrite@eeAddr		EQU		71H
//		initVariables@dang		EQU		70H
//		initVariables@dang		EQU		70H
//		initVariables@dang		EQU		70H
//-----------------------Variable END---------------------------------

		LJUMP 	0DH 			//0000 	380D
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		BCR 	STATUS,5 		//0006 	1283
		STR 	48H 			//0007 	01C8
		LDR 	FSR,0 			//0008 	0804
		STR 	49H 			//0009 	01C9
		LDR 	PCLATH,0 		//000A 	080A
		STR 	4AH 			//000B 	01CA
		LJUMP 	548H 			//000C 	3D48
		LJUMP 	0EH 			//000D 	380E
		LDWI 	1H 			//000E 	2A01
		STR 	4EH 			//000F 	01CE
		STR 	4FH 			//0010 	01CF
		LDWI 	20H 			//0011 	2A20
		BCR 	STATUS,7 		//0012 	1383
		STR 	FSR 			//0013 	0184
		LDWI 	40H 			//0014 	2A40
		LCALL 	660H 			//0015 	3660
		CLRR 	STATUS 			//0016 	0103
		LJUMP 	51FH 			//0017 	3D1F

		//;ZX-CH2-M25-60E121.C: 481: if (lowPhase == 0)
		LDR 	33H,0 			//0018 	0833
		BTSS 	STATUS,2 		//0019 	1D03
		LJUMP 	34H 			//001A 	3834

		//;ZX-CH2-M25-60E121.C: 482: {
		//;ZX-CH2-M25-60E121.C: 483: if (shanCnt >= 2 && shinkBits == 0 && Time.dutyCount == 0)
		LDWI 	2H 			//001B 	2A02
		SUBWR 	3FH,0 			//001C 	0C3F
		BTSS 	STATUS,0 		//001D 	1C03
		LJUMP 	2AH 			//001E 	382A
		LDR 	3BH,0 			//001F 	083B
		BTSS 	STATUS,2 		//0020 	1D03
		LJUMP 	2AH 			//0021 	382A
		LDR 	22H,0 			//0022 	0822
		IORWR 	23H,0 			//0023 	0323
		BTSS 	STATUS,2 		//0024 	1D03
		LJUMP 	2AH 			//0025 	382A

		//;ZX-CH2-M25-60E121.C: 484: {
		//;ZX-CH2-M25-60E121.C: 485: shanCnt = 0;
		CLRR 	3FH 			//0026 	013F

		//;ZX-CH2-M25-60E121.C: 486: shinkBits = 0;
		CLRR 	3BH 			//0027 	013B

		//;ZX-CH2-M25-60E121.C: 487: lowPhase = 1;
		LDWI 	1H 			//0028 	2A01
		LJUMP 	3DH 			//0029 	383D

		//;ZX-CH2-M25-60E121.C: 491: }
		//;ZX-CH2-M25-60E121.C: 490: subLowPhase = 0;
		//;ZX-CH2-M25-60E121.C: 489: lowCounter = 0;
		//;ZX-CH2-M25-60E121.C: 488: Time.dutyCount = 0;
		//;ZX-CH2-M25-60E121.C: 492: else
		//;ZX-CH2-M25-60E121.C: 493: {
		//;ZX-CH2-M25-60E121.C: 494: shinking(290, 485);
		LDWI 	22H 			//002A 	2A22
		STR 	76H 			//002B 	01F6
		LDWI 	1H 			//002C 	2A01
		STR 	77H 			//002D 	01F7
		LDWI 	E5H 			//002E 	2AE5
		STR 	78H 			//002F 	01F8
		LDWI 	1H 			//0030 	2A01
		STR 	79H 			//0031 	01F9
		LCALL 	62DH 			//0032 	362D
		LJUMP 	9DH 			//0033 	389D

		//;ZX-CH2-M25-60E121.C: 497: else if (lowPhase == 1)
		DECRSZ 	33H,0 		//0034 	0E33
		LJUMP 	6DH 			//0035 	386D

		//;ZX-CH2-M25-60E121.C: 498: {
		//;ZX-CH2-M25-60E121.C: 499: if (lowCounter >= 2)
		LDWI 	2H 			//0036 	2A02
		SUBWR 	35H,0 			//0037 	0C35
		BTSS 	STATUS,0 		//0038 	1C03
		LJUMP 	3FH 			//0039 	383F

		//;ZX-CH2-M25-60E121.C: 500: {
		//;ZX-CH2-M25-60E121.C: 501: shanCnt = 0;
		CLRR 	3FH 			//003A 	013F

		//;ZX-CH2-M25-60E121.C: 502: shinkBits = 0;
		CLRR 	3BH 			//003B 	013B

		//;ZX-CH2-M25-60E121.C: 503: lowPhase = 2;
		LDWI 	2H 			//003C 	2A02
		STR 	33H 			//003D 	01B3
		LJUMP 	74H 			//003E 	3874

		//;ZX-CH2-M25-60E121.C: 508: else
		//;ZX-CH2-M25-60E121.C: 509: {
		//;ZX-CH2-M25-60E121.C: 510: if (subLowPhase == 0)
		LDR 	31H,0 			//003F 	0831
		BTSS 	STATUS,2 		//0040 	1D03
		LJUMP 	58H 			//0041 	3858

		//;ZX-CH2-M25-60E121.C: 511: {
		//;ZX-CH2-M25-60E121.C: 512: if (shanCnt == 4 && shinkBits == 0 && Time.dutyCount == 0)
		LDWI 	4H 			//0042 	2A04
		XORWR 	3FH,0 			//0043 	043F
		BTSS 	STATUS,2 		//0044 	1D03
		LJUMP 	54H 			//0045 	3854
		LDR 	3BH,0 			//0046 	083B
		BTSS 	STATUS,2 		//0047 	1D03
		LJUMP 	54H 			//0048 	3854
		LDR 	22H,0 			//0049 	0822
		IORWR 	23H,0 			//004A 	0323
		BTSS 	STATUS,2 		//004B 	1D03
		LJUMP 	54H 			//004C 	3854

		//;ZX-CH2-M25-60E121.C: 513: {
		//;ZX-CH2-M25-60E121.C: 514: shanCnt = 0;
		CLRR 	3FH 			//004D 	013F

		//;ZX-CH2-M25-60E121.C: 515: shinkBits = 0;
		CLRR 	3BH 			//004E 	013B

		//;ZX-CH2-M25-60E121.C: 516: subLowPhase = 1;
		LDWI 	1H 			//004F 	2A01
		STR 	31H 			//0050 	01B1

		//;ZX-CH2-M25-60E121.C: 517: Time.dutyCount = 0;
		CLRR 	22H 			//0051 	0122
		CLRR 	23H 			//0052 	0123

		//;ZX-CH2-M25-60E121.C: 518: }
		LJUMP 	9DH 			//0053 	389D

		//;ZX-CH2-M25-60E121.C: 519: else
		//;ZX-CH2-M25-60E121.C: 520: {
		//;ZX-CH2-M25-60E121.C: 521: shinking(25, 25);
		LDWI 	19H 			//0054 	2A19
		LCALL 	133H 			//0055 	3133
		LCALL 	62DH 			//0056 	362D
		LJUMP 	9DH 			//0057 	389D

		//;ZX-CH2-M25-60E121.C: 524: else
		//;ZX-CH2-M25-60E121.C: 525: {
		//;ZX-CH2-M25-60E121.C: 526: if (shanCnt == 1 && shinkBits == 0 && Time.dutyCount == 0)
		DECRSZ 	3FH,0 		//0058 	0E3F
		LJUMP 	67H 			//0059 	3867
		LDR 	3BH,0 			//005A 	083B
		BTSS 	STATUS,2 		//005B 	1D03
		LJUMP 	67H 			//005C 	3867
		LDR 	22H,0 			//005D 	0822
		IORWR 	23H,0 			//005E 	0323
		BTSS 	STATUS,2 		//005F 	1D03
		LJUMP 	67H 			//0060 	3867

		//;ZX-CH2-M25-60E121.C: 527: {
		//;ZX-CH2-M25-60E121.C: 528: shanCnt = 0;
		CLRR 	3FH 			//0061 	013F

		//;ZX-CH2-M25-60E121.C: 529: shinkBits = 0;
		CLRR 	3BH 			//0062 	013B

		//;ZX-CH2-M25-60E121.C: 530: subLowPhase = 0;
		CLRR 	31H 			//0063 	0131

		//;ZX-CH2-M25-60E121.C: 531: Time.dutyCount = 0;
		CLRR 	22H 			//0064 	0122
		CLRR 	23H 			//0065 	0123

		//;ZX-CH2-M25-60E121.C: 533: }
		LJUMP 	9CH 			//0066 	389C

		//;ZX-CH2-M25-60E121.C: 534: else
		//;ZX-CH2-M25-60E121.C: 535: {
		//;ZX-CH2-M25-60E121.C: 536: shinking(194, 399);
		LDWI 	C2H 			//0067 	2AC2
		STR 	76H 			//0068 	01F6
		LDWI 	8FH 			//0069 	2A8F
		LCALL 	488H 			//006A 	3488
		LCALL 	62DH 			//006B 	362D
		LJUMP 	9DH 			//006C 	389D

		//;ZX-CH2-M25-60E121.C: 541: else
		//;ZX-CH2-M25-60E121.C: 542: {
		//;ZX-CH2-M25-60E121.C: 543: if (lowCounter >= 2)
		LDWI 	2H 			//006D 	2A02
		SUBWR 	35H,0 			//006E 	0C35
		BTSS 	STATUS,0 		//006F 	1C03
		LJUMP 	79H 			//0070 	3879

		//;ZX-CH2-M25-60E121.C: 544: {
		//;ZX-CH2-M25-60E121.C: 545: shanCnt = 0;
		CLRR 	3FH 			//0071 	013F

		//;ZX-CH2-M25-60E121.C: 546: shinkBits = 0;
		CLRR 	3BH 			//0072 	013B

		//;ZX-CH2-M25-60E121.C: 547: lowPhase = 0;
		CLRR 	33H 			//0073 	0133

		//;ZX-CH2-M25-60E121.C: 548: Time.dutyCount = 0;
		CLRR 	22H 			//0074 	0122
		CLRR 	23H 			//0075 	0123

		//;ZX-CH2-M25-60E121.C: 549: lowCounter = 0;
		CLRR 	35H 			//0076 	0135

		//;ZX-CH2-M25-60E121.C: 550: subLowPhase = 0;
		CLRR 	31H 			//0077 	0131

		//;ZX-CH2-M25-60E121.C: 551: }
		LJUMP 	9DH 			//0078 	389D

		//;ZX-CH2-M25-60E121.C: 552: else
		//;ZX-CH2-M25-60E121.C: 553: {
		//;ZX-CH2-M25-60E121.C: 554: if (subLowPhase == 0)
		LDR 	31H,0 			//0079 	0831
		BTSS 	STATUS,2 		//007A 	1D03
		LJUMP 	94H 			//007B 	3894

		//;ZX-CH2-M25-60E121.C: 555: {
		//;ZX-CH2-M25-60E121.C: 556: if (shanCnt == 4 && shinkBits == 0 && Time.dutyCount == 0)
		LDWI 	4H 			//007C 	2A04
		XORWR 	3FH,0 			//007D 	043F
		BTSS 	STATUS,2 		//007E 	1D03
		LJUMP 	90H 			//007F 	3890
		LDR 	3BH,0 			//0080 	083B
		BTSS 	STATUS,2 		//0081 	1D03
		LJUMP 	90H 			//0082 	3890
		LDR 	22H,0 			//0083 	0822
		IORWR 	23H,0 			//0084 	0323
		BTSS 	STATUS,2 		//0085 	1D03
		LJUMP 	90H 			//0086 	3890

		//;ZX-CH2-M25-60E121.C: 557: {
		//;ZX-CH2-M25-60E121.C: 558: shanCnt = 0;
		CLRR 	3FH 			//0087 	013F

		//;ZX-CH2-M25-60E121.C: 559: shinkBits = 0;
		CLRR 	3BH 			//0088 	013B

		//;ZX-CH2-M25-60E121.C: 560: subLowPhase = 1;
		LDWI 	1H 			//0089 	2A01
		STR 	31H 			//008A 	01B1

		//;ZX-CH2-M25-60E121.C: 561: Time.dutyCount = 390;
		LDWI 	86H 			//008B 	2A86
		STR 	22H 			//008C 	01A2
		LDWI 	1H 			//008D 	2A01
		STR 	23H 			//008E 	01A3

		//;ZX-CH2-M25-60E121.C: 562: }
		LJUMP 	9DH 			//008F 	389D

		//;ZX-CH2-M25-60E121.C: 563: else
		//;ZX-CH2-M25-60E121.C: 564: {
		//;ZX-CH2-M25-60E121.C: 565: shinking(50, 50);
		LDWI 	32H 			//0090 	2A32
		LCALL 	133H 			//0091 	3133
		LCALL 	62DH 			//0092 	362D
		LJUMP 	9DH 			//0093 	389D

		//;ZX-CH2-M25-60E121.C: 568: else
		//;ZX-CH2-M25-60E121.C: 569: {
		//;ZX-CH2-M25-60E121.C: 570: shinkBits = 0;
		CLRR 	3BH 			//0094 	013B

		//;ZX-CH2-M25-60E121.C: 571: if (Time.dutyCount == 0)
		LDR 	22H,0 			//0095 	0822
		IORWR 	23H,0 			//0096 	0323
		BTSS 	STATUS,2 		//0097 	1D03
		LJUMP 	9DH 			//0098 	389D

		//;ZX-CH2-M25-60E121.C: 572: {
		//;ZX-CH2-M25-60E121.C: 573: shanCnt = 0;
		CLRR 	3FH 			//0099 	013F

		//;ZX-CH2-M25-60E121.C: 574: shinkBits = 0;
		CLRR 	3BH 			//009A 	013B

		//;ZX-CH2-M25-60E121.C: 575: subLowPhase = 0;
		CLRR 	31H 			//009B 	0131

		//;ZX-CH2-M25-60E121.C: 532: lowCounter++;
		INCR	35H,1 			//009C 	09B5

		//;ZX-CH2-M25-60E121.C: 577: }
		//;ZX-CH2-M25-60E121.C: 578: }
		//;ZX-CH2-M25-60E121.C: 579: }
		//;ZX-CH2-M25-60E121.C: 580: }
		//;ZX-CH2-M25-60E121.C: 591: if (delayCounter == 0)
		LDR 	2AH,0 			//009D 	082A
		IORWR 	2BH,0 			//009E 	032B
		BTSS 	STATUS,2 		//009F 	1D03
		LJUMP 	123H 			//00A0 	3923

		//;ZX-CH2-M25-60E121.C: 592: {
		//;ZX-CH2-M25-60E121.C: 593: if (highPhase == 0)
		LDR 	32H,0 			//00A1 	0832
		BTSS 	STATUS,2 		//00A2 	1D03
		LJUMP 	D3H 			//00A3 	38D3

		//;ZX-CH2-M25-60E121.C: 594: {
		//;ZX-CH2-M25-60E121.C: 595: if (highCounter >= 1)
		LDR 	34H,0 			//00A4 	0834
		BTSC 	STATUS,2 		//00A5 	1503
		LJUMP 	AAH 			//00A6 	38AA

		//;ZX-CH2-M25-60E121.C: 596: {
		//;ZX-CH2-M25-60E121.C: 597: shanCnt2 = 0;
		//;ZX-CH2-M25-60E121.C: 598: shinkBits2 = 0;
		//;ZX-CH2-M25-60E121.C: 599: Time.dutyCount2 = 0;
		//;ZX-CH2-M25-60E121.C: 600: subHighPhase = 0;
		//;ZX-CH2-M25-60E121.C: 601: highCounter = 0;
		LCALL 	138H 			//00A7 	3138

		//;ZX-CH2-M25-60E121.C: 602: highPhase = 1;
		LDWI 	1H 			//00A8 	2A01
		LJUMP 	DBH 			//00A9 	38DB

		//;ZX-CH2-M25-60E121.C: 603: }
		//;ZX-CH2-M25-60E121.C: 604: else
		//;ZX-CH2-M25-60E121.C: 605: {
		//;ZX-CH2-M25-60E121.C: 606: if (subHighPhase == 0)
		LDR 	30H,0 			//00AA 	0830
		BTSS 	STATUS,2 		//00AB 	1D03
		LJUMP 	CAH 			//00AC 	38CA

		//;ZX-CH2-M25-60E121.C: 607: {
		//;ZX-CH2-M25-60E121.C: 609: if (shanCnt2 >= 2 && shinkBits2 == 0 && Time.dutyCount2 == 0)
		LDWI 	2H 			//00AD 	2A02
		SUBWR 	3DH,0 			//00AE 	0C3D
		BTSS 	STATUS,0 		//00AF 	1C03
		LJUMP 	C1H 			//00B0 	38C1
		LDR 	3CH,0 			//00B1 	083C
		BTSS 	STATUS,2 		//00B2 	1D03
		LJUMP 	C1H 			//00B3 	38C1
		LDR 	26H,0 			//00B4 	0826
		IORWR 	27H,0 			//00B5 	0327
		BTSS 	STATUS,2 		//00B6 	1D03
		LJUMP 	C1H 			//00B7 	38C1

		//;ZX-CH2-M25-60E121.C: 610: {
		//;ZX-CH2-M25-60E121.C: 611: subHighPhase = 1;
		LDWI 	1H 			//00B8 	2A01
		STR 	30H 			//00B9 	01B0

		//;ZX-CH2-M25-60E121.C: 612: shanCnt2 = 0;
		CLRR 	3DH 			//00BA 	013D

		//;ZX-CH2-M25-60E121.C: 613: shinkBits2 = 0;
		CLRR 	3CH 			//00BB 	013C

		//;ZX-CH2-M25-60E121.C: 614: Time.dutyCount2 = 782;
		LDWI 	EH 			//00BC 	2A0E
		STR 	26H 			//00BD 	01A6
		LDWI 	3H 			//00BE 	2A03
		STR 	27H 			//00BF 	01A7

		//;ZX-CH2-M25-60E121.C: 615: }
		LJUMP 	124H 			//00C0 	3924

		//;ZX-CH2-M25-60E121.C: 616: else
		//;ZX-CH2-M25-60E121.C: 617: {
		//;ZX-CH2-M25-60E121.C: 618: shinking2(290, 97);
		LDWI 	22H 			//00C1 	2A22
		STR 	70H 			//00C2 	01F0
		LDWI 	1H 			//00C3 	2A01
		STR 	71H 			//00C4 	01F1
		LDWI 	61H 			//00C5 	2A61
		STR 	72H 			//00C6 	01F2
		CLRR 	73H 			//00C7 	0173
		LCALL 	618H 			//00C8 	3618
		LJUMP 	124H 			//00C9 	3924

		//;ZX-CH2-M25-60E121.C: 621: else
		//;ZX-CH2-M25-60E121.C: 622: {
		//;ZX-CH2-M25-60E121.C: 623: if (Time.dutyCount2 == 0)
		LDR 	26H,0 			//00CA 	0826
		IORWR 	27H,0 			//00CB 	0327
		BTSS 	STATUS,2 		//00CC 	1D03
		LJUMP 	124H 			//00CD 	3924

		//;ZX-CH2-M25-60E121.C: 624: {
		//;ZX-CH2-M25-60E121.C: 625: shanCnt2 = 0;
		CLRR 	3DH 			//00CE 	013D

		//;ZX-CH2-M25-60E121.C: 626: shinkBits2 = 0;
		CLRR 	3CH 			//00CF 	013C

		//;ZX-CH2-M25-60E121.C: 627: subHighPhase = 0;
		CLRR 	30H 			//00D0 	0130

		//;ZX-CH2-M25-60E121.C: 628: highCounter++;
		INCR	34H,1 			//00D1 	09B4
		LJUMP 	124H 			//00D2 	3924

		//;ZX-CH2-M25-60E121.C: 633: else if (highPhase == 1)
		DECRSZ 	32H,0 		//00D3 	0E32
		LJUMP 	107H 			//00D4 	3907

		//;ZX-CH2-M25-60E121.C: 634: {
		//;ZX-CH2-M25-60E121.C: 635: if (highCounter >= 2)
		LDWI 	2H 			//00D5 	2A02
		SUBWR 	34H,0 			//00D6 	0C34
		BTSS 	STATUS,0 		//00D7 	1C03
		LJUMP 	DDH 			//00D8 	38DD

		//;ZX-CH2-M25-60E121.C: 636: {
		//;ZX-CH2-M25-60E121.C: 637: shanCnt2 = 0;
		//;ZX-CH2-M25-60E121.C: 638: shinkBits2 = 0;
		//;ZX-CH2-M25-60E121.C: 639: Time.dutyCount2 = 0;
		//;ZX-CH2-M25-60E121.C: 640: subHighPhase = 0;
		//;ZX-CH2-M25-60E121.C: 641: highCounter = 0;
		LCALL 	138H 			//00D9 	3138

		//;ZX-CH2-M25-60E121.C: 642: highPhase = 2;
		LDWI 	2H 			//00DA 	2A02
		STR 	32H 			//00DB 	01B2

		//;ZX-CH2-M25-60E121.C: 643: }
		LJUMP 	124H 			//00DC 	3924

		//;ZX-CH2-M25-60E121.C: 644: else
		//;ZX-CH2-M25-60E121.C: 645: {
		//;ZX-CH2-M25-60E121.C: 646: if (subHighPhase == 0)
		LDR 	30H,0 			//00DD 	0830
		BTSS 	STATUS,2 		//00DE 	1D03
		LJUMP 	F4H 			//00DF 	38F4

		//;ZX-CH2-M25-60E121.C: 647: {
		//;ZX-CH2-M25-60E121.C: 648: if (shanCnt2 >= 4 && shinkBits2 == 0 && Time.dutyCount2 == 0)
		LDWI 	4H 			//00E0 	2A04
		SUBWR 	3DH,0 			//00E1 	0C3D
		BTSS 	STATUS,0 		//00E2 	1C03
		LJUMP 	F0H 			//00E3 	38F0
		LDR 	3CH,0 			//00E4 	083C
		BTSS 	STATUS,2 		//00E5 	1D03
		LJUMP 	F0H 			//00E6 	38F0
		LDR 	26H,0 			//00E7 	0826
		IORWR 	27H,0 			//00E8 	0327
		BTSS 	STATUS,2 		//00E9 	1D03
		LJUMP 	F0H 			//00EA 	38F0

		//;ZX-CH2-M25-60E121.C: 649: {
		//;ZX-CH2-M25-60E121.C: 650: shanCnt2 = 0;
		CLRR 	3DH 			//00EB 	013D

		//;ZX-CH2-M25-60E121.C: 651: shinkBits2 = 0;
		CLRR 	3CH 			//00EC 	013C

		//;ZX-CH2-M25-60E121.C: 652: subHighPhase = 1;
		LDWI 	1H 			//00ED 	2A01
		STR 	30H 			//00EE 	01B0

		//;ZX-CH2-M25-60E121.C: 653: }
		LJUMP 	124H 			//00EF 	3924

		//;ZX-CH2-M25-60E121.C: 654: else
		//;ZX-CH2-M25-60E121.C: 655: {
		//;ZX-CH2-M25-60E121.C: 656: shinking2(25, 25);
		LDWI 	19H 			//00F0 	2A19
		LCALL 	13FH 			//00F1 	313F
		LCALL 	618H 			//00F2 	3618
		LJUMP 	124H 			//00F3 	3924

		//;ZX-CH2-M25-60E121.C: 659: else
		//;ZX-CH2-M25-60E121.C: 660: {
		//;ZX-CH2-M25-60E121.C: 661: if (shanCnt2 >= 1 && shinkBits2 == 0 && Time.dutyCount2 == 0)
		LDR 	3DH,0 			//00F4 	083D
		BTSC 	STATUS,2 		//00F5 	1503
		LJUMP 	FEH 			//00F6 	38FE
		LDR 	3CH,0 			//00F7 	083C
		BTSS 	STATUS,2 		//00F8 	1D03
		LJUMP 	FEH 			//00F9 	38FE
		LDR 	26H,0 			//00FA 	0826
		IORWR 	27H,0 			//00FB 	0327
		BTSC 	STATUS,2 		//00FC 	1503
		LJUMP 	CEH 			//00FD 	38CE

		//;ZX-CH2-M25-60E121.C: 668: else
		//;ZX-CH2-M25-60E121.C: 669: {
		//;ZX-CH2-M25-60E121.C: 670: shinking2(200, 782);
		LDWI 	C8H 			//00FE 	2AC8
		STR 	70H 			//00FF 	01F0
		LDWI 	EH 			//0100 	2A0E
		CLRR 	71H 			//0101 	0171
		STR 	72H 			//0102 	01F2
		LDWI 	3H 			//0103 	2A03
		STR 	73H 			//0104 	01F3
		LCALL 	618H 			//0105 	3618
		LJUMP 	124H 			//0106 	3924

		//;ZX-CH2-M25-60E121.C: 675: else
		//;ZX-CH2-M25-60E121.C: 676: {
		//;ZX-CH2-M25-60E121.C: 677: if (subHighPhase == 0)
		LDR 	30H,0 			//0107 	0830
		BTSS 	STATUS,2 		//0108 	1D03
		LJUMP 	119H 			//0109 	3919

		//;ZX-CH2-M25-60E121.C: 678: {
		//;ZX-CH2-M25-60E121.C: 679: if (shanCnt2 >= 8 && shinkBits2 == 0 && Time.dutyCount2 == 0)
		LDWI 	8H 			//010A 	2A08
		SUBWR 	3DH,0 			//010B 	0C3D
		BTSS 	STATUS,0 		//010C 	1C03
		LJUMP 	115H 			//010D 	3915
		LDR 	3CH,0 			//010E 	083C
		BTSS 	STATUS,2 		//010F 	1D03
		LJUMP 	115H 			//0110 	3915
		LDR 	26H,0 			//0111 	0826
		IORWR 	27H,0 			//0112 	0327
		BTSC 	STATUS,2 		//0113 	1503
		LJUMP 	B8H 			//0114 	38B8

		//;ZX-CH2-M25-60E121.C: 686: else
		//;ZX-CH2-M25-60E121.C: 687: {
		//;ZX-CH2-M25-60E121.C: 688: shinking2(50, 50);
		LDWI 	32H 			//0115 	2A32
		LCALL 	13FH 			//0116 	313F
		LCALL 	618H 			//0117 	3618
		LJUMP 	124H 			//0118 	3924

		//;ZX-CH2-M25-60E121.C: 691: else
		//;ZX-CH2-M25-60E121.C: 692: {
		//;ZX-CH2-M25-60E121.C: 693: if (Time.dutyCount2 == 0)
		LDR 	26H,0 			//0119 	0826
		IORWR 	27H,0 			//011A 	0327
		BTSS 	STATUS,2 		//011B 	1D03
		LJUMP 	124H 			//011C 	3924

		//;ZX-CH2-M25-60E121.C: 694: {
		//;ZX-CH2-M25-60E121.C: 695: shanCnt2 = 0;
		CLRR 	3DH 			//011D 	013D

		//;ZX-CH2-M25-60E121.C: 696: shinkBits2 = 0;
		CLRR 	3CH 			//011E 	013C

		//;ZX-CH2-M25-60E121.C: 697: highCounter = 0;
		CLRR 	34H 			//011F 	0134

		//;ZX-CH2-M25-60E121.C: 698: highPhase = 0;
		CLRR 	32H 			//0120 	0132

		//;ZX-CH2-M25-60E121.C: 699: subHighPhase = 0;
		CLRR 	30H 			//0121 	0130

		//;ZX-CH2-M25-60E121.C: 700: }
		//;ZX-CH2-M25-60E121.C: 701: }
		//;ZX-CH2-M25-60E121.C: 702: }
		//;ZX-CH2-M25-60E121.C: 703: }
		LJUMP 	124H 			//0122 	3924

		//;ZX-CH2-M25-60E121.C: 704: else
		//;ZX-CH2-M25-60E121.C: 705: {
		//;ZX-CH2-M25-60E121.C: 707: delayCounter--;
		LCALL 	12CH 			//0123 	312C

		//;ZX-CH2-M25-60E121.C: 708: }
		//;ZX-CH2-M25-60E121.C: 712: ledBits = shinkBits & 0x01 | shinkBits2 & 0x02;
		LDWI 	2H 			//0124 	2A02
		ANDWR 	3CH,0 			//0125 	023C
		STR 	7AH 			//0126 	01FA
		LDR 	3BH,0 			//0127 	083B
		ANDWI 	1H 			//0128 	2401
		IORWR 	7AH,0 			//0129 	037A
		STR 	39H 			//012A 	01B9
		RET		 					//012B 	0004
		LDWI 	1H 			//012C 	2A01
		SUBWR 	2AH,1 			//012D 	0CAA
		LDWI 	0H 			//012E 	2A00
		BTSS 	STATUS,0 		//012F 	1C03
		DECR 	2BH,1 			//0130 	0DAB
		SUBWR 	2BH,1 			//0131 	0CAB
		RET		 					//0132 	0004
		STR 	76H 			//0133 	01F6
		CLRR 	77H 			//0134 	0177
		STR 	78H 			//0135 	01F8
		CLRR 	79H 			//0136 	0179
		RET		 					//0137 	0004
		CLRR 	3DH 			//0138 	013D
		CLRR 	3CH 			//0139 	013C
		CLRR 	26H 			//013A 	0126
		CLRR 	27H 			//013B 	0127
		CLRR 	30H 			//013C 	0130
		CLRR 	34H 			//013D 	0134
		RET		 					//013E 	0004
		STR 	70H 			//013F 	01F0
		CLRR 	71H 			//0140 	0171
		STR 	72H 			//0141 	01F2
		CLRR 	73H 			//0142 	0173
		RET		 					//0143 	0004

		//;ZX-CH2-M25-60E121.C: 719: switch (dang)
		LJUMP 	1E1H 			//0144 	39E1

		//;ZX-CH2-M25-60E121.C: 722: shinking(1, 1);
		CLRR 	76H 			//0145 	0176
		INCR	76H,1 			//0146 	09F6
		CLRR 	77H 			//0147 	0177
		CLRR 	78H 			//0148 	0178
		INCR	78H,1 			//0149 	09F8
		CLRR 	79H 			//014A 	0179
		LCALL 	62DH 			//014B 	362D

		//;ZX-CH2-M25-60E121.C: 723: ledBits = shinkBits;
		LDR 	3BH,0 			//014C 	083B
		STR 	39H 			//014D 	01B9

		//;ZX-CH2-M25-60E121.C: 724: break;
		RET		 					//014E 	0004

		//;ZX-CH2-M25-60E121.C: 726: alternatingLedControl(25, 200);
		LDWI 	C8H 			//014F 	2AC8
		STR 	7AH 			//0150 	01FA
		LDWI 	19H 			//0151 	2A19
		CLRR 	7BH 			//0152 	017B
		LJUMP 	3D7H 			//0153 	3BD7

		//;ZX-CH2-M25-60E121.C: 727: break;
		//;ZX-CH2-M25-60E121.C: 729: synchronizedLedControl(25, 200, 390);
		LDWI 	C8H 			//0154 	2AC8
		STR 	7AH 			//0155 	01FA
		LDWI 	86H 			//0156 	2A86
		CLRR 	7BH 			//0157 	017B
		STR 	7CH 			//0158 	01FC
		LDWI 	1H 			//0159 	2A01
		STR 	7DH 			//015A 	01FD
		LDWI 	19H 			//015B 	2A19
		LJUMP 	48DH 			//015C 	3C8D

		//;ZX-CH2-M25-60E121.C: 730: break;
		//;ZX-CH2-M25-60E121.C: 732: alternatingLedControl(59, 470);
		LDWI 	D6H 			//015D 	2AD6
		STR 	7AH 			//015E 	01FA
		LDWI 	1H 			//015F 	2A01
		STR 	7BH 			//0160 	01FB
		LDWI 	3BH 			//0161 	2A3B
		LJUMP 	3D7H 			//0162 	3BD7

		//;ZX-CH2-M25-60E121.C: 733: break;
		//;ZX-CH2-M25-60E121.C: 735: synchronizedLedControl(59, 470, 951);
		LDWI 	D6H 			//0163 	2AD6
		STR 	7AH 			//0164 	01FA
		LDWI 	1H 			//0165 	2A01
		STR 	7BH 			//0166 	01FB
		LDWI 	B7H 			//0167 	2AB7
		STR 	7CH 			//0168 	01FC
		LDWI 	3H 			//0169 	2A03
		STR 	7DH 			//016A 	01FD
		LDWI 	3BH 			//016B 	2A3B
		LJUMP 	48DH 			//016C 	3C8D

		//;ZX-CH2-M25-60E121.C: 736: break;
		LDWI 	31H 			//016D 	2A31

		//;ZX-CH2-M25-60E121.C: 738: alternatingLedControl(49, 0);
		CLRR 	7AH 			//016E 	017A
		CLRR 	7BH 			//016F 	017B
		LJUMP 	3D7H 			//0170 	3BD7

		//;ZX-CH2-M25-60E121.C: 739: break;
		LDWI 	B7H 			//0171 	2AB7

		//;ZX-CH2-M25-60E121.C: 741: synchronizedLedControl(49, 0, 439);
		CLRR 	7AH 			//0172 	017A
		CLRR 	7BH 			//0173 	017B
		STR 	7CH 			//0174 	01FC
		LDWI 	1H 			//0175 	2A01
		STR 	7DH 			//0176 	01FD
		LDWI 	31H 			//0177 	2A31
		LJUMP 	48DH 			//0178 	3C8D

		//;ZX-CH2-M25-60E121.C: 742: break;
		LDWI 	77H 			//0179 	2A77

		//;ZX-CH2-M25-60E121.C: 744: alternatingLedControl(119, 0);
		CLRR 	7AH 			//017A 	017A
		CLRR 	7BH 			//017B 	017B
		LJUMP 	3D7H 			//017C 	3BD7

		//;ZX-CH2-M25-60E121.C: 745: break;
		//;ZX-CH2-M25-60E121.C: 748: do8();
		LJUMP 	4F4H 			//017D 	3CF4

		//;ZX-CH2-M25-60E121.C: 749: break;
		//;ZX-CH2-M25-60E121.C: 751: staggeredLedControl(289, 485);
		LDWI 	21H 			//017E 	2A21
		STR 	7AH 			//017F 	01FA
		LDWI 	1H 			//0180 	2A01
		STR 	7BH 			//0181 	01FB
		LDWI 	E5H 			//0182 	2AE5
		STR 	7CH 			//0183 	01FC
		LDWI 	1H 			//0184 	2A01
		STR 	7DH 			//0185 	01FD
		LJUMP 	593H 			//0186 	3D93

		//;ZX-CH2-M25-60E121.C: 752: break;
		//;ZX-CH2-M25-60E121.C: 754: shinking(290, 480);
		LDWI 	22H 			//0187 	2A22
		STR 	76H 			//0188 	01F6
		LDWI 	1H 			//0189 	2A01
		STR 	77H 			//018A 	01F7
		LDWI 	E0H 			//018B 	2AE0
		STR 	78H 			//018C 	01F8
		LDWI 	1H 			//018D 	2A01
		STR 	79H 			//018E 	01F9
		LCALL 	62DH 			//018F 	362D

		//;ZX-CH2-M25-60E121.C: 755: ledBits = shinkBits & 0x03;
		//;ZX-CH2-M25-60E121.C: 756: break;
		LJUMP 	4BDH 			//0190 	3CBD

		//;ZX-CH2-M25-60E121.C: 758: staggeredLedControl(698, 1167);
		LDWI 	BAH 			//0191 	2ABA
		STR 	7AH 			//0192 	01FA
		LDWI 	2H 			//0193 	2A02
		STR 	7BH 			//0194 	01FB
		LDWI 	8FH 			//0195 	2A8F
		STR 	7CH 			//0196 	01FC
		LDWI 	4H 			//0197 	2A04
		STR 	7DH 			//0198 	01FD
		LJUMP 	593H 			//0199 	3D93

		//;ZX-CH2-M25-60E121.C: 759: break;
		//;ZX-CH2-M25-60E121.C: 761: shinking(701, 1161);
		LDWI 	BDH 			//019A 	2ABD
		STR 	76H 			//019B 	01F6
		LDWI 	2H 			//019C 	2A02
		STR 	77H 			//019D 	01F7
		LDWI 	89H 			//019E 	2A89
		STR 	78H 			//019F 	01F8
		LDWI 	4H 			//01A0 	2A04
		LJUMP 	18EH 			//01A1 	398E

		//;ZX-CH2-M25-60E121.C: 765: do1314(13);
		LDWI 	DH 			//01A2 	2A0D
		LJUMP 	1FCH 			//01A3 	39FC

		//;ZX-CH2-M25-60E121.C: 766: break;
		//;ZX-CH2-M25-60E121.C: 768: do1314(14);
		LDWI 	EH 			//01A4 	2A0E
		LJUMP 	1FCH 			//01A5 	39FC

		//;ZX-CH2-M25-60E121.C: 769: break;
		//;ZX-CH2-M25-60E121.C: 771: do15();
		LJUMP 	302H 			//01A6 	3B02

		//;ZX-CH2-M25-60E121.C: 772: break;
		//;ZX-CH2-M25-60E121.C: 774: do16();
		LJUMP 	2AEH 			//01A7 	3AAE

		//;ZX-CH2-M25-60E121.C: 775: break;
		//;ZX-CH2-M25-60E121.C: 777: do17();
		LJUMP 	4C2H 			//01A8 	3CC2

		//;ZX-CH2-M25-60E121.C: 778: break;
		//;ZX-CH2-M25-60E121.C: 780: do18();
		LJUMP 	352H 			//01A9 	3B52

		//;ZX-CH2-M25-60E121.C: 781: break;
		//;ZX-CH2-M25-60E121.C: 783: do1920(19);
		LDWI 	13H 			//01AA 	2A13
		LJUMP 	454H 			//01AB 	3C54

		//;ZX-CH2-M25-60E121.C: 784: break;
		//;ZX-CH2-M25-60E121.C: 786: do1920(20);
		LDWI 	14H 			//01AC 	2A14
		LJUMP 	454H 			//01AD 	3C54

		//;ZX-CH2-M25-60E121.C: 787: break;
		//;ZX-CH2-M25-60E121.C: 789: if (Time.dutyCount == 0)
		LDR 	22H,0 			//01AE 	0822
		IORWR 	23H,0 			//01AF 	0323
		BTSS 	STATUS,2 		//01B0 	1D03
		LJUMP 	1B6H 			//01B1 	39B6

		//;ZX-CH2-M25-60E121.C: 790: {
		//;ZX-CH2-M25-60E121.C: 791: Time.dutyCount = 109;
		LDWI 	6DH 			//01B2 	2A6D
		STR 	22H 			//01B3 	01A2
		CLRR 	23H 			//01B4 	0123

		//;ZX-CH2-M25-60E121.C: 792: shanCnt++;
		INCR	3FH,1 			//01B5 	09BF

		//;ZX-CH2-M25-60E121.C: 793: }
		//;ZX-CH2-M25-60E121.C: 794: ledBits = 1 << ((shanCnt - 1) & 1);
		LDWI 	1H 			//01B6 	2A01
		STR 	47H 			//01B7 	01C7
		LDR 	3FH,0 			//01B8 	083F
		ADDWI 	FFH 			//01B9 	27FF
		ANDWI 	1H 			//01BA 	2401
		ADDWI 	1H 			//01BB 	2701
		LJUMP 	1BFH 			//01BC 	39BF
		BCR 	STATUS,0 		//01BD 	1003
		RLR 	47H,1 			//01BE 	05C7
		ADDWI 	FFH 			//01BF 	27FF
		BTSS 	STATUS,2 		//01C0 	1D03
		LJUMP 	1BDH 			//01C1 	39BD
		LDR 	47H,0 			//01C2 	0847
		STR 	39H 			//01C3 	01B9

		//;ZX-CH2-M25-60E121.C: 795: break;
		RET		 					//01C4 	0004

		//;ZX-CH2-M25-60E121.C: 797: shinking(109, 109);
		LDWI 	6DH 			//01C5 	2A6D
		LCALL 	133H 			//01C6 	3133
		LJUMP 	18FH 			//01C7 	398F

		//;ZX-CH2-M25-60E121.C: 801: do23();
		LJUMP 	18H 			//01C8 	3818

		//;ZX-CH2-M25-60E121.C: 802: break;
		//;ZX-CH2-M25-60E121.C: 804: shinking(246, 369);
		LCALL 	1EDH 			//01C9 	31ED
		LCALL 	62DH 			//01CA 	362D

		//;ZX-CH2-M25-60E121.C: 805: shinking2(1, 1);
		LCALL 	1F5H 			//01CB 	31F5
		LCALL 	618H 			//01CC 	3618

		//;ZX-CH2-M25-60E121.C: 806: ledBits = (shinkBits & 0x01) | (shinkBits2 & 0x02);
		LDWI 	2H 			//01CD 	2A02
		ANDWR 	3CH,0 			//01CE 	023C
		STR 	47H 			//01CF 	01C7
		LDR 	3BH,0 			//01D0 	083B
		ANDWI 	1H 			//01D1 	2401
		IORWR 	47H,0 			//01D2 	0347
		STR 	39H 			//01D3 	01B9

		//;ZX-CH2-M25-60E121.C: 807: break;
		RET		 					//01D4 	0004

		//;ZX-CH2-M25-60E121.C: 809: shinking(246, 369);
		LCALL 	1EDH 			//01D5 	31ED
		LCALL 	62DH 			//01D6 	362D

		//;ZX-CH2-M25-60E121.C: 810: shinking2(1, 1);
		LCALL 	1F5H 			//01D7 	31F5
		LCALL 	618H 			//01D8 	3618

		//;ZX-CH2-M25-60E121.C: 811: ledBits = (shinkBits & 0x02) | (shinkBits2 & 0x01);
		LDWI 	1H 			//01D9 	2A01
		ANDWR 	3CH,0 			//01DA 	023C
		STR 	47H 			//01DB 	01C7
		LDR 	3BH,0 			//01DC 	083B
		ANDWI 	2H 			//01DD 	2402
		IORWR 	47H,0 			//01DE 	0347
		STR 	39H 			//01DF 	01B9

		//;ZX-CH2-M25-60E121.C: 812: break;
		RET		 					//01E0 	0004
		LDR 	3AH,0 			//01E1 	083A
		STR 	FSR 			//01E2 	0184
		LDWI 	1AH 			//01E3 	2A1A
		SUBWR 	FSR,0 			//01E4 	0C04
		BTSC 	STATUS,0 		//01E5 	1403
		RET		 					//01E6 	0004
		LDWI 	5H 			//01E7 	2A05
		STR 	PCLATH 			//01E8 	018A
		LDWI 	B7H 			//01E9 	2AB7
		ADDWR 	FSR,0 			//01EA 	0B04
		STR 	PCL 			//01EB 	0182
		RET		 					//01EC 	0004
		LDWI 	F6H 			//01ED 	2AF6
		STR 	76H 			//01EE 	01F6
		LDWI 	71H 			//01EF 	2A71
		CLRR 	77H 			//01F0 	0177
		STR 	78H 			//01F1 	01F8
		LDWI 	1H 			//01F2 	2A01
		STR 	79H 			//01F3 	01F9
		RET		 					//01F4 	0004
		CLRR 	70H 			//01F5 	0170
		INCR	70H,1 			//01F6 	09F0
		CLRR 	71H 			//01F7 	0171
		CLRR 	72H 			//01F8 	0172
		INCR	72H,1 			//01F9 	09F2
		CLRR 	73H 			//01FA 	0173
		RET		 					//01FB 	0004
		STR 	40H 			//01FC 	01C0

		//;ZX-CH2-M25-60E121.C: 256: if (ledPhase == 0)
		LDR 	38H,0 			//01FD 	0838
		BTSS 	STATUS,2 		//01FE 	1D03
		LJUMP 	21EH 			//01FF 	3A1E

		//;ZX-CH2-M25-60E121.C: 257: {
		//;ZX-CH2-M25-60E121.C: 259: if (shanCnt >= 1 && shinkBits == 0 && Time.dutyCount == 0)
		LDR 	3FH,0 			//0200 	083F
		BTSC 	STATUS,2 		//0201 	1503
		LJUMP 	210H 			//0202 	3A10
		LDR 	3BH,0 			//0203 	083B
		BTSS 	STATUS,2 		//0204 	1D03
		LJUMP 	210H 			//0205 	3A10
		LDR 	22H,0 			//0206 	0822
		IORWR 	23H,0 			//0207 	0323
		BTSS 	STATUS,2 		//0208 	1D03
		LJUMP 	210H 			//0209 	3A10

		//;ZX-CH2-M25-60E121.C: 260: {
		//;ZX-CH2-M25-60E121.C: 261: shanCnt = 0;
		CLRR 	3FH 			//020A 	013F

		//;ZX-CH2-M25-60E121.C: 262: --counter;
		DECRSZ 	3EH,1 		//020B 	0EBE

		//;ZX-CH2-M25-60E121.C: 263: if (counter == 0)
		LJUMP 	231H 			//020C 	3A31

		//;ZX-CH2-M25-60E121.C: 264: {
		//;ZX-CH2-M25-60E121.C: 265: ledPhase = 1;
		LDWI 	1H 			//020D 	2A01
		STR 	38H 			//020E 	01B8
		LJUMP 	230H 			//020F 	3A30

		//;ZX-CH2-M25-60E121.C: 266: counter = 1;
		//;ZX-CH2-M25-60E121.C: 269: else {
		//;ZX-CH2-M25-60E121.C: 270: shinking(counter * 15, counter * 15);
		LCALL 	250H 			//0210 	3250
		LCALL 	5D1H 			//0211 	35D1
		LDR 	71H,0 			//0212 	0871
		STR 	77H 			//0213 	01F7
		LDR 	70H,0 			//0214 	0870
		STR 	76H 			//0215 	01F6
		LCALL 	250H 			//0216 	3250
		LCALL 	5D1H 			//0217 	35D1
		LDR 	71H,0 			//0218 	0871
		STR 	79H 			//0219 	01F9
		LDR 	70H,0 			//021A 	0870
		STR 	78H 			//021B 	01F8
		LCALL 	62DH 			//021C 	362D
		LJUMP 	231H 			//021D 	3A31

		//;ZX-CH2-M25-60E121.C: 273: else
		//;ZX-CH2-M25-60E121.C: 274: {
		//;ZX-CH2-M25-60E121.C: 276: if (shanCnt >= 1 && shinkBits == 0 && Time.dutyCount == 0)
		LDR 	3FH,0 			//021E 	083F
		BTSC 	STATUS,2 		//021F 	1503
		LJUMP 	210H 			//0220 	3A10
		LDR 	3BH,0 			//0221 	083B
		BTSS 	STATUS,2 		//0222 	1D03
		LJUMP 	210H 			//0223 	3A10
		LDR 	22H,0 			//0224 	0822
		IORWR 	23H,0 			//0225 	0323
		BTSS 	STATUS,2 		//0226 	1D03
		LJUMP 	210H 			//0227 	3A10

		//;ZX-CH2-M25-60E121.C: 277: {
		//;ZX-CH2-M25-60E121.C: 278: shanCnt = 0;
		CLRR 	3FH 			//0228 	013F

		//;ZX-CH2-M25-60E121.C: 279: counter++;
		INCR	3EH,1 			//0229 	09BE

		//;ZX-CH2-M25-60E121.C: 280: if (counter == 15)
		LDWI 	FH 			//022A 	2A0F
		XORWR 	3EH,0 			//022B 	043E
		BTSS 	STATUS,2 		//022C 	1D03
		LJUMP 	231H 			//022D 	3A31

		//;ZX-CH2-M25-60E121.C: 281: {
		//;ZX-CH2-M25-60E121.C: 282: ledPhase = 0;
		CLRR 	38H 			//022E 	0138

		//;ZX-CH2-M25-60E121.C: 283: counter = 15;
		LDWI 	FH 			//022F 	2A0F
		STR 	3EH 			//0230 	01BE

		//;ZX-CH2-M25-60E121.C: 288: }
		//;ZX-CH2-M25-60E121.C: 289: }
		//;ZX-CH2-M25-60E121.C: 290: ledBits = dang == 13 ? (shinkBits ? 0x02 : 0x01) : (shinkBits
		//+                           ? 0x03 : 0);
		LDWI 	DH 			//0231 	2A0D
		XORWR 	40H,0 			//0232 	0440
		BTSC 	STATUS,2 		//0233 	1503
		LJUMP 	241H 			//0234 	3A41
		LDR 	3BH,0 			//0235 	083B
		BTSS 	STATUS,2 		//0236 	1D03
		LJUMP 	23AH 			//0237 	3A3A
		CLRR 	43H 			//0238 	0143
		LJUMP 	23CH 			//0239 	3A3C
		LDWI 	3H 			//023A 	2A03
		STR 	43H 			//023B 	01C3
		CLRR 	44H 			//023C 	0144
		LDR 	44H,0 			//023D 	0844
		STR 	42H 			//023E 	01C2
		LDR 	43H,0 			//023F 	0843
		LJUMP 	24DH 			//0240 	3A4D
		LDR 	3BH,0 			//0241 	083B
		BTSS 	STATUS,2 		//0242 	1D03
		LJUMP 	247H 			//0243 	3A47
		CLRR 	45H 			//0244 	0145
		INCR	45H,1 			//0245 	09C5
		LJUMP 	249H 			//0246 	3A49
		LDWI 	2H 			//0247 	2A02
		STR 	45H 			//0248 	01C5
		CLRR 	46H 			//0249 	0146
		LDR 	46H,0 			//024A 	0846
		STR 	42H 			//024B 	01C2
		LDR 	45H,0 			//024C 	0845
		STR 	41H 			//024D 	01C1
		STR 	39H 			//024E 	01B9
		RET		 					//024F 	0004
		LDR 	3EH,0 			//0250 	083E
		STR 	70H 			//0251 	01F0
		LDWI 	FH 			//0252 	2A0F
		CLRR 	71H 			//0253 	0171
		STR 	72H 			//0254 	01F2
		CLRR 	73H 			//0255 	0173
		RET		 					//0256 	0004
		STR 	70H 			//0257 	01F0

		//;ZX-CH2-M25-60E121.C: 820: ledBits = 0;
		CLRR 	39H 			//0258 	0139

		//;ZX-CH2-M25-60E121.C: 821: shanCnt = 0;
		CLRR 	3FH 			//0259 	013F

		//;ZX-CH2-M25-60E121.C: 822: shanCnt2 = 0;
		CLRR 	3DH 			//025A 	013D

		//;ZX-CH2-M25-60E121.C: 823: Time.onOffCount = 0;
		CLRR 	24H 			//025B 	0124
		CLRR 	25H 			//025C 	0125

		//;ZX-CH2-M25-60E121.C: 824: Time.dutyCount = 0;
		CLRR 	22H 			//025D 	0122
		CLRR 	23H 			//025E 	0123

		//;ZX-CH2-M25-60E121.C: 825: Time.dutyCount2 = 0;
		CLRR 	26H 			//025F 	0126
		CLRR 	27H 			//0260 	0127

		//;ZX-CH2-M25-60E121.C: 827: delayCounter = 0;
		CLRR 	2AH 			//0261 	012A
		CLRR 	2BH 			//0262 	012B

		//;ZX-CH2-M25-60E121.C: 828: ledPhase = 0;
		CLRR 	38H 			//0263 	0138

		//;ZX-CH2-M25-60E121.C: 829: counter = 0;
		CLRR 	3EH 			//0264 	013E

		//;ZX-CH2-M25-60E121.C: 830: shinkBits = 0;
		CLRR 	3BH 			//0265 	013B

		//;ZX-CH2-M25-60E121.C: 831: shinkBits2 = 0;
		CLRR 	3CH 			//0266 	013C

		//;ZX-CH2-M25-60E121.C: 832: currentLed = 0;
		CLRR 	4FH 			//0267 	014F

		//;ZX-CH2-M25-60E121.C: 833: ledMask = 0x01;
		LDWI 	1H 			//0268 	2A01
		STR 	4EH 			//0269 	01CE

		//;ZX-CH2-M25-60E121.C: 834: if (dang == 9 )
		LDWI 	9H 			//026A 	2A09
		XORWR 	70H,0 			//026B 	0470
		BTSS 	STATUS,2 		//026C 	1D03
		LJUMP 	272H 			//026D 	3A72

		//;ZX-CH2-M25-60E121.C: 835: {
		//;ZX-CH2-M25-60E121.C: 836: delayCounter = 385;
		LDWI 	81H 			//026E 	2A81
		STR 	2AH 			//026F 	01AA
		LDWI 	1H 			//0270 	2A01
		STR 	2BH 			//0271 	01AB

		//;ZX-CH2-M25-60E121.C: 837: }
		//;ZX-CH2-M25-60E121.C: 838: if (dang == 11)
		LDWI 	BH 			//0272 	2A0B
		XORWR 	70H,0 			//0273 	0470
		BTSS 	STATUS,2 		//0274 	1D03
		LJUMP 	27AH 			//0275 	3A7A

		//;ZX-CH2-M25-60E121.C: 839: {
		//;ZX-CH2-M25-60E121.C: 840: delayCounter = 935;
		LDWI 	A7H 			//0276 	2AA7
		STR 	2AH 			//0277 	01AA
		LDWI 	3H 			//0278 	2A03
		STR 	2BH 			//0279 	01AB

		//;ZX-CH2-M25-60E121.C: 841: }
		//;ZX-CH2-M25-60E121.C: 842: if (dang == 13 || dang == 14)
		LDWI 	DH 			//027A 	2A0D
		XORWR 	70H,0 			//027B 	0470
		BTSC 	STATUS,2 		//027C 	1503
		LJUMP 	282H 			//027D 	3A82
		LDWI 	EH 			//027E 	2A0E
		XORWR 	70H,0 			//027F 	0470
		BTSS 	STATUS,2 		//0280 	1D03
		LJUMP 	284H 			//0281 	3A84

		//;ZX-CH2-M25-60E121.C: 843: {
		//;ZX-CH2-M25-60E121.C: 844: counter = 15;
		LDWI 	FH 			//0282 	2A0F
		STR 	3EH 			//0283 	01BE

		//;ZX-CH2-M25-60E121.C: 845: }
		//;ZX-CH2-M25-60E121.C: 846: if (dang == 15 || dang == 17)
		LDWI 	FH 			//0284 	2A0F
		XORWR 	70H,0 			//0285 	0470
		BTSC 	STATUS,2 		//0286 	1503
		LJUMP 	28CH 			//0287 	3A8C
		LDWI 	11H 			//0288 	2A11
		XORWR 	70H,0 			//0289 	0470
		BTSS 	STATUS,2 		//028A 	1D03
		LJUMP 	290H 			//028B 	3A90

		//;ZX-CH2-M25-60E121.C: 847: {
		//;ZX-CH2-M25-60E121.C: 848: currentLed = 0x01;
		LDWI 	1H 			//028C 	2A01
		STR 	4FH 			//028D 	01CF

		//;ZX-CH2-M25-60E121.C: 849: phase2SwitchCnt = 0;
		CLRR 	37H 			//028E 	0137

		//;ZX-CH2-M25-60E121.C: 850: lastShanCnt2Div4 = 0;
		CLRR 	36H 			//028F 	0136

		//;ZX-CH2-M25-60E121.C: 851: }
		//;ZX-CH2-M25-60E121.C: 852: if (dang == 19 || dang == 20)
		LDWI 	13H 			//0290 	2A13
		XORWR 	70H,0 			//0291 	0470
		BTSC 	STATUS,2 		//0292 	1503
		LJUMP 	298H 			//0293 	3A98
		LDWI 	14H 			//0294 	2A14
		XORWR 	70H,0 			//0295 	0470
		BTSS 	STATUS,2 		//0296 	1D03
		LJUMP 	29BH 			//0297 	3A9B

		//;ZX-CH2-M25-60E121.C: 853: {
		//;ZX-CH2-M25-60E121.C: 854: delayCounter = 109;
		LDWI 	6DH 			//0298 	2A6D
		STR 	2AH 			//0299 	01AA
		CLRR 	2BH 			//029A 	012B

		//;ZX-CH2-M25-60E121.C: 855: }
		//;ZX-CH2-M25-60E121.C: 856: if (dang == 23)
		LDWI 	17H 			//029B 	2A17
		XORWR 	70H,0 			//029C 	0470
		BTSS 	STATUS,2 		//029D 	1D03
		RET		 					//029E 	0004

		//;ZX-CH2-M25-60E121.C: 857: {
		//;ZX-CH2-M25-60E121.C: 858: lowPhase = 0;
		CLRR 	33H 			//029F 	0133

		//;ZX-CH2-M25-60E121.C: 859: highPhase = 0;
		CLRR 	32H 			//02A0 	0132

		//;ZX-CH2-M25-60E121.C: 860: subLowPhase = 0;
		CLRR 	31H 			//02A1 	0131

		//;ZX-CH2-M25-60E121.C: 861: subHighPhase = 0;
		CLRR 	30H 			//02A2 	0130

		//;ZX-CH2-M25-60E121.C: 862: lowCounter = 0;
		CLRR 	35H 			//02A3 	0135

		//;ZX-CH2-M25-60E121.C: 863: highCounter = 0;
		CLRR 	34H 			//02A4 	0134

		//;ZX-CH2-M25-60E121.C: 864: lowPhase = 0;
		CLRR 	33H 			//02A5 	0133

		//;ZX-CH2-M25-60E121.C: 865: highPhase = 0;
		CLRR 	32H 			//02A6 	0132

		//;ZX-CH2-M25-60E121.C: 866: subLowPhase = 0;
		CLRR 	31H 			//02A7 	0131

		//;ZX-CH2-M25-60E121.C: 867: subHighPhase = 0;
		CLRR 	30H 			//02A8 	0130

		//;ZX-CH2-M25-60E121.C: 868: delayCounter = 386;
		LDWI 	82H 			//02A9 	2A82
		STR 	2AH 			//02AA 	01AA
		LDWI 	1H 			//02AB 	2A01
		STR 	2BH 			//02AC 	01AB
		RET		 					//02AD 	0004

		//;ZX-CH2-M25-60E121.C: 295: if (ledPhase == 0)
		LDR 	38H,0 			//02AE 	0838
		BTSS 	STATUS,2 		//02AF 	1D03
		LJUMP 	2C4H 			//02B0 	3AC4

		//;ZX-CH2-M25-60E121.C: 296: {
		//;ZX-CH2-M25-60E121.C: 298: if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0)
		LDWI 	4H 			//02B1 	2A04
		SUBWR 	3FH,0 			//02B2 	0C3F
		BTSS 	STATUS,0 		//02B3 	1C03
		LJUMP 	2BEH 			//02B4 	3ABE
		LDR 	3BH,0 			//02B5 	083B
		BTSS 	STATUS,2 		//02B6 	1D03
		LJUMP 	2BEH 			//02B7 	3ABE
		LDR 	22H,0 			//02B8 	0822
		IORWR 	23H,0 			//02B9 	0323
		BTSS 	STATUS,2 		//02BA 	1D03
		LJUMP 	2BEH 			//02BB 	3ABE

		//;ZX-CH2-M25-60E121.C: 299: {
		//;ZX-CH2-M25-60E121.C: 300: shanCnt = 0;
		CLRR 	3FH 			//02BC 	013F

		//;ZX-CH2-M25-60E121.C: 302: }
		LJUMP 	2EAH 			//02BD 	3AEA

		//;ZX-CH2-M25-60E121.C: 303: else
		//;ZX-CH2-M25-60E121.C: 304: {
		//;ZX-CH2-M25-60E121.C: 305: shinking(99, 299);
		LDWI 	63H 			//02BE 	2A63
		STR 	76H 			//02BF 	01F6
		LDWI 	2BH 			//02C0 	2A2B
		LCALL 	488H 			//02C1 	3488
		LCALL 	62DH 			//02C2 	362D
		LJUMP 	2ECH 			//02C3 	3AEC

		//;ZX-CH2-M25-60E121.C: 308: else if (ledPhase == 1)
		DECRSZ 	38H,0 		//02C4 	0E38
		LJUMP 	2DDH 			//02C5 	3ADD

		//;ZX-CH2-M25-60E121.C: 309: {
		//;ZX-CH2-M25-60E121.C: 311: if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0)
		LDWI 	4H 			//02C6 	2A04
		SUBWR 	3FH,0 			//02C7 	0C3F
		BTSS 	STATUS,0 		//02C8 	1C03
		LJUMP 	2D9H 			//02C9 	3AD9
		LDR 	3BH,0 			//02CA 	083B
		BTSS 	STATUS,2 		//02CB 	1D03
		LJUMP 	2D9H 			//02CC 	3AD9
		LDR 	22H,0 			//02CD 	0822
		IORWR 	23H,0 			//02CE 	0323
		BTSS 	STATUS,2 		//02CF 	1D03
		LJUMP 	2D9H 			//02D0 	3AD9

		//;ZX-CH2-M25-60E121.C: 312: {
		//;ZX-CH2-M25-60E121.C: 313: shanCnt = 0;
		CLRR 	3FH 			//02D1 	013F

		//;ZX-CH2-M25-60E121.C: 314: ledPhase = 2;
		LDWI 	2H 			//02D2 	2A02
		STR 	38H 			//02D3 	01B8

		//;ZX-CH2-M25-60E121.C: 315: delayCounter = 390;
		LDWI 	86H 			//02D4 	2A86
		STR 	2AH 			//02D5 	01AA
		LDWI 	1H 			//02D6 	2A01
		STR 	2BH 			//02D7 	01AB

		//;ZX-CH2-M25-60E121.C: 316: }
		LJUMP 	2ECH 			//02D8 	3AEC

		//;ZX-CH2-M25-60E121.C: 317: else
		//;ZX-CH2-M25-60E121.C: 318: {
		//;ZX-CH2-M25-60E121.C: 319: shinking(49, 49);
		LDWI 	31H 			//02D9 	2A31
		LCALL 	133H 			//02DA 	3133
		LCALL 	62DH 			//02DB 	362D
		LJUMP 	2ECH 			//02DC 	3AEC

		//;ZX-CH2-M25-60E121.C: 322: else
		//;ZX-CH2-M25-60E121.C: 323: {
		//;ZX-CH2-M25-60E121.C: 325: if (delayCounter > 0)
		LDR 	2AH,0 			//02DD 	082A
		IORWR 	2BH,0 			//02DE 	032B
		BTSC 	STATUS,2 		//02DF 	1503
		LJUMP 	2E3H 			//02E0 	3AE3

		//;ZX-CH2-M25-60E121.C: 326: {
		//;ZX-CH2-M25-60E121.C: 327: delayCounter--;
		LCALL 	12CH 			//02E1 	312C

		//;ZX-CH2-M25-60E121.C: 328: }
		LJUMP 	2ECH 			//02E2 	3AEC

		//;ZX-CH2-M25-60E121.C: 329: else
		//;ZX-CH2-M25-60E121.C: 330: {
		//;ZX-CH2-M25-60E121.C: 331: if (counter >= 1)
		LDR 	3EH,0 			//02E3 	083E
		BTSC 	STATUS,2 		//02E4 	1503
		LJUMP 	2E9H 			//02E5 	3AE9

		//;ZX-CH2-M25-60E121.C: 332: {
		//;ZX-CH2-M25-60E121.C: 333: counter = 0;
		CLRR 	3EH 			//02E6 	013E

		//;ZX-CH2-M25-60E121.C: 334: ledPhase = 0;
		CLRR 	38H 			//02E7 	0138

		//;ZX-CH2-M25-60E121.C: 335: }
		LJUMP 	2ECH 			//02E8 	3AEC

		//;ZX-CH2-M25-60E121.C: 336: else
		//;ZX-CH2-M25-60E121.C: 337: {
		//;ZX-CH2-M25-60E121.C: 338: counter++;
		INCR	3EH,1 			//02E9 	09BE

		//;ZX-CH2-M25-60E121.C: 301: ledPhase = 1;
		LDWI 	1H 			//02EA 	2A01
		STR 	38H 			//02EB 	01B8

		//;ZX-CH2-M25-60E121.C: 340: }
		//;ZX-CH2-M25-60E121.C: 341: }
		//;ZX-CH2-M25-60E121.C: 342: }
		//;ZX-CH2-M25-60E121.C: 343: ledBits = (ledPhase == 2) ? 0 : (shinkBits ? 0x03 : 0);
		LDWI 	2H 			//02EC 	2A02
		XORWR 	38H,0 			//02ED 	0438
		BTSC 	STATUS,2 		//02EE 	1503
		LJUMP 	2FDH 			//02EF 	3AFD
		LDR 	3BH,0 			//02F0 	083B
		BTSS 	STATUS,2 		//02F1 	1D03
		LJUMP 	2F5H 			//02F2 	3AF5
		CLRR 	7CH 			//02F3 	017C
		LJUMP 	2F7H 			//02F4 	3AF7
		LDWI 	3H 			//02F5 	2A03
		STR 	7CH 			//02F6 	01FC
		CLRR 	7DH 			//02F7 	017D
		LDR 	7DH,0 			//02F8 	087D
		STR 	7BH 			//02F9 	01FB
		LDR 	7CH,0 			//02FA 	087C
		STR 	7AH 			//02FB 	01FA
		LJUMP 	2FFH 			//02FC 	3AFF
		CLRR 	7AH 			//02FD 	017A
		CLRR 	7BH 			//02FE 	017B
		LDR 	7AH,0 			//02FF 	087A
		STR 	39H 			//0300 	01B9
		RET		 					//0301 	0004

		//;ZX-CH2-M25-60E121.C: 348: if (ledPhase < 2) {
		LDWI 	2H 			//0302 	2A02
		SUBWR 	38H,0 			//0303 	0C38
		BTSC 	STATUS,0 		//0304 	1403
		LJUMP 	31CH 			//0305 	3B1C

		//;ZX-CH2-M25-60E121.C: 350: u8 prevShinkBits = shinkBits;
		LDR 	3BH,0 			//0306 	083B
		STR 	7BH 			//0307 	01FB

		//;ZX-CH2-M25-60E121.C: 351: shinking(99, 99);
		LDWI 	63H 			//0308 	2A63
		LCALL 	133H 			//0309 	3133
		LCALL 	62DH 			//030A 	362D

		//;ZX-CH2-M25-60E121.C: 352: if (prevShinkBits != 0 && shinkBits == 0) {
		LDR 	7BH,0 			//030B 	087B
		BTSC 	STATUS,2 		//030C 	1503
		LJUMP 	313H 			//030D 	3B13
		LDR 	3BH,0 			//030E 	083B
		BTSS 	STATUS,2 		//030F 	1D03
		LJUMP 	313H 			//0310 	3B13

		//;ZX-CH2-M25-60E121.C: 353: currentLed ^= 0x03;
		LDWI 	3H 			//0311 	2A03
		XORWR 	4FH,1 			//0312 	04CF

		//;ZX-CH2-M25-60E121.C: 354: }
		//;ZX-CH2-M25-60E121.C: 355: ledBits = shinkBits & currentLed;
		//;ZX-CH2-M25-60E121.C: 357: if (shanCnt >= 4) {
		LCALL 	334H 			//0313 	3334
		BTSS 	STATUS,0 		//0314 	1C03
		RET		 					//0315 	0004

		//;ZX-CH2-M25-60E121.C: 358: shanCnt = shinkBits = 0;
		//;ZX-CH2-M25-60E121.C: 359: if (++ledPhase == 2) {
		LCALL 	341H 			//0316 	3341
		BTSS 	STATUS,2 		//0317 	1D03
		RET		 					//0318 	0004

		//;ZX-CH2-M25-60E121.C: 360: phase2SwitchCnt = lastShanCnt2Div4 = 0;
		CLRR 	36H 			//0319 	0136
		CLRR 	37H 			//031A 	0137
		RET		 					//031B 	0004

		//;ZX-CH2-M25-60E121.C: 365: shinking2(49, 49);
		LDWI 	31H 			//031C 	2A31
		LCALL 	13FH 			//031D 	313F
		LCALL 	618H 			//031E 	3618

		//;ZX-CH2-M25-60E121.C: 366: ledBits = shinkBits2 & currentLed;
		//;ZX-CH2-M25-60E121.C: 368: u8 currentDiv4 = shanCnt2 >> 2;
		LCALL 	347H 			//031F 	3347
		STR 	7AH 			//0320 	01FA
		BCR 	STATUS,0 		//0321 	1003
		RRR	7AH,1 			//0322 	06FA
		BCR 	STATUS,0 		//0323 	1003
		RRR	7AH,1 			//0324 	06FA
		LDR 	7AH,0 			//0325 	087A
		STR 	7CH 			//0326 	01FC

		//;ZX-CH2-M25-60E121.C: 369: if (currentDiv4 > 0 && currentDiv4 > lastShanCnt2Div4) {
		LDR 	7CH,0 			//0327 	087C
		BTSC 	STATUS,2 		//0328 	1503
		RET		 					//0329 	0004
		SUBWR 	36H,0 			//032A 	0C36
		BTSC 	STATUS,0 		//032B 	1403
		RET		 					//032C 	0004

		//;ZX-CH2-M25-60E121.C: 370: currentLed ^= 0x03;
		LDWI 	3H 			//032D 	2A03
		XORWR 	4FH,1 			//032E 	04CF

		//;ZX-CH2-M25-60E121.C: 371: lastShanCnt2Div4 = currentDiv4;
		LDR 	7CH,0 			//032F 	087C

		//;ZX-CH2-M25-60E121.C: 372: if (++phase2SwitchCnt >= 4) {
		LCALL 	34DH 			//0330 	334D
		BTSS 	STATUS,0 		//0331 	1C03
		RET		 					//0332 	0004

		//;ZX-CH2-M25-60E121.C: 373: ledPhase = shanCnt2 = shinkBits2 = phase2SwitchCnt = lastShan
		//+                          Cnt2Div4 = 0;
		LJUMP 	33BH 			//0333 	3B3B
		LDR 	3BH,0 			//0334 	083B
		STR 	39H 			//0335 	01B9
		LDR 	4FH,0 			//0336 	084F
		ANDWR 	39H,1 			//0337 	02B9
		LDWI 	4H 			//0338 	2A04
		SUBWR 	3FH,0 			//0339 	0C3F
		RET		 					//033A 	0004
		CLRR 	36H 			//033B 	0136
		CLRR 	37H 			//033C 	0137
		CLRR 	3CH 			//033D 	013C
		CLRR 	3DH 			//033E 	013D
		CLRR 	38H 			//033F 	0138
		RET		 					//0340 	0004
		CLRR 	3BH 			//0341 	013B
		CLRR 	3FH 			//0342 	013F
		INCR	38H,1 			//0343 	09B8
		LDWI 	2H 			//0344 	2A02
		XORWR 	38H,0 			//0345 	0438
		RET		 					//0346 	0004
		LDR 	3CH,0 			//0347 	083C
		STR 	39H 			//0348 	01B9
		LDR 	4FH,0 			//0349 	084F
		ANDWR 	39H,1 			//034A 	02B9
		LDR 	3DH,0 			//034B 	083D
		RET		 					//034C 	0004
		STR 	36H 			//034D 	01B6
		LDWI 	4H 			//034E 	2A04
		INCR	37H,1 			//034F 	09B7
		SUBWR 	37H,0 			//0350 	0C37
		RET		 					//0351 	0004

		//;ZX-CH2-M25-60E121.C: 414: if (ledPhase == 0)
		LDR 	38H,0 			//0352 	0838
		BTSS 	STATUS,2 		//0353 	1D03
		LJUMP 	36DH 			//0354 	3B6D

		//;ZX-CH2-M25-60E121.C: 415: {
		//;ZX-CH2-M25-60E121.C: 416: if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0)
		LDWI 	4H 			//0355 	2A04
		SUBWR 	3FH,0 			//0356 	0C3F
		BTSS 	STATUS,0 		//0357 	1C03
		LJUMP 	364H 			//0358 	3B64
		LDR 	3BH,0 			//0359 	083B
		BTSS 	STATUS,2 		//035A 	1D03
		LJUMP 	364H 			//035B 	3B64
		LDR 	22H,0 			//035C 	0822
		IORWR 	23H,0 			//035D 	0323
		BTSS 	STATUS,2 		//035E 	1D03
		LJUMP 	364H 			//035F 	3B64

		//;ZX-CH2-M25-60E121.C: 417: {
		//;ZX-CH2-M25-60E121.C: 418: shanCnt = shinkBits = 0;
		CLRR 	3BH 			//0360 	013B
		CLRR 	3FH 			//0361 	013F

		//;ZX-CH2-M25-60E121.C: 419: ledPhase = 1;
		LDWI 	1H 			//0362 	2A01
		LJUMP 	381H 			//0363 	3B81

		//;ZX-CH2-M25-60E121.C: 420: }
		//;ZX-CH2-M25-60E121.C: 421: else
		//;ZX-CH2-M25-60E121.C: 422: {
		//;ZX-CH2-M25-60E121.C: 423: shinking(238, 711);
		LDWI 	EEH 			//0364 	2AEE
		STR 	76H 			//0365 	01F6
		LDWI 	C7H 			//0366 	2AC7
		CLRR 	77H 			//0367 	0177
		STR 	78H 			//0368 	01F8
		LDWI 	2H 			//0369 	2A02
		STR 	79H 			//036A 	01F9
		LCALL 	62DH 			//036B 	362D
		LJUMP 	395H 			//036C 	3B95

		//;ZX-CH2-M25-60E121.C: 426: else if (ledPhase == 1)
		DECRSZ 	38H,0 		//036D 	0E38
		LJUMP 	387H 			//036E 	3B87

		//;ZX-CH2-M25-60E121.C: 427: {
		//;ZX-CH2-M25-60E121.C: 428: if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0)
		LDWI 	4H 			//036F 	2A04
		SUBWR 	3FH,0 			//0370 	0C3F
		BTSS 	STATUS,0 		//0371 	1C03
		LJUMP 	383H 			//0372 	3B83
		LDR 	3BH,0 			//0373 	083B
		BTSS 	STATUS,2 		//0374 	1D03
		LJUMP 	383H 			//0375 	3B83
		LDR 	22H,0 			//0376 	0822
		IORWR 	23H,0 			//0377 	0323
		BTSS 	STATUS,2 		//0378 	1D03
		LJUMP 	383H 			//0379 	3B83

		//;ZX-CH2-M25-60E121.C: 429: {
		//;ZX-CH2-M25-60E121.C: 430: shanCnt = shinkBits = 0;
		CLRR 	3BH 			//037A 	013B
		CLRR 	3FH 			//037B 	013F

		//;ZX-CH2-M25-60E121.C: 431: Time.dutyCount = 1071;
		LDWI 	2FH 			//037C 	2A2F
		STR 	22H 			//037D 	01A2
		LDWI 	4H 			//037E 	2A04
		STR 	23H 			//037F 	01A3

		//;ZX-CH2-M25-60E121.C: 432: ledPhase = 2;
		LDWI 	2H 			//0380 	2A02
		STR 	38H 			//0381 	01B8

		//;ZX-CH2-M25-60E121.C: 433: }
		LJUMP 	395H 			//0382 	3B95

		//;ZX-CH2-M25-60E121.C: 434: else
		//;ZX-CH2-M25-60E121.C: 435: {
		//;ZX-CH2-M25-60E121.C: 436: shinking(120, 120);
		LDWI 	78H 			//0383 	2A78
		LCALL 	133H 			//0384 	3133
		LCALL 	62DH 			//0385 	362D
		LJUMP 	395H 			//0386 	3B95

		//;ZX-CH2-M25-60E121.C: 439: else
		//;ZX-CH2-M25-60E121.C: 440: {
		//;ZX-CH2-M25-60E121.C: 441: if (Time.dutyCount == 0)
		LDR 	22H,0 			//0387 	0822
		IORWR 	23H,0 			//0388 	0323
		BTSS 	STATUS,2 		//0389 	1D03
		LJUMP 	395H 			//038A 	3B95

		//;ZX-CH2-M25-60E121.C: 442: {
		//;ZX-CH2-M25-60E121.C: 443: shanCnt = shinkBits = 0;
		CLRR 	3BH 			//038B 	013B
		CLRR 	3FH 			//038C 	013F

		//;ZX-CH2-M25-60E121.C: 444: if (counter >= 1)
		LDR 	3EH,0 			//038D 	083E
		BTSC 	STATUS,2 		//038E 	1503
		LJUMP 	393H 			//038F 	3B93

		//;ZX-CH2-M25-60E121.C: 445: {
		//;ZX-CH2-M25-60E121.C: 446: ledPhase = 0;
		CLRR 	38H 			//0390 	0138

		//;ZX-CH2-M25-60E121.C: 447: counter = 0;
		CLRR 	3EH 			//0391 	013E

		//;ZX-CH2-M25-60E121.C: 448: }
		LJUMP 	395H 			//0392 	3B95

		//;ZX-CH2-M25-60E121.C: 449: else
		//;ZX-CH2-M25-60E121.C: 450: {
		//;ZX-CH2-M25-60E121.C: 451: counter++;
		INCR	3EH,1 			//0393 	09BE
		LJUMP 	362H 			//0394 	3B62

		//;ZX-CH2-M25-60E121.C: 453: }
		//;ZX-CH2-M25-60E121.C: 454: }
		//;ZX-CH2-M25-60E121.C: 455: }
		//;ZX-CH2-M25-60E121.C: 456: ledBits = shinkBits & 0x03;
		LJUMP 	4BDH 			//0395 	3CBD

		//;ZX-CH2-M25-60E121.C: 873: static u8 keyState = 0;
		//;ZX-CH2-M25-60E121.C: 875: if (RC5 == 0)
		BTSC 	7H,5 			//0396 	1687
		LJUMP 	3BCH 			//0397 	3BBC

		//;ZX-CH2-M25-60E121.C: 876: {
		//;ZX-CH2-M25-60E121.C: 877: if (Time.hitCount < 3)
		LDWI 	3H 			//0398 	2A03
		SUBWR 	20H,0 			//0399 	0C20
		BTSC 	STATUS,0 		//039A 	1403
		LJUMP 	39DH 			//039B 	3B9D

		//;ZX-CH2-M25-60E121.C: 878: {
		//;ZX-CH2-M25-60E121.C: 879: Time.hitCount++;
		INCR	20H,1 			//039C 	09A0

		//;ZX-CH2-M25-60E121.C: 880: }
		//;ZX-CH2-M25-60E121.C: 881: Time.onOffCount = 0;
		CLRR 	24H 			//039D 	0124
		CLRR 	25H 			//039E 	0125

		//;ZX-CH2-M25-60E121.C: 883: if (keyState == 0 && Time.hitCount >= 3)
		LDR 	2FH,0 			//039F 	082F
		BTSS 	STATUS,2 		//03A0 	1D03
		RET		 					//03A1 	0004
		LDWI 	3H 			//03A2 	2A03
		SUBWR 	20H,0 			//03A3 	0C20
		BTSS 	STATUS,0 		//03A4 	1C03
		RET		 					//03A5 	0004
		LDWI 	19H 			//03A6 	2A19

		//;ZX-CH2-M25-60E121.C: 884: {
		//;ZX-CH2-M25-60E121.C: 885: keyState = 1;
		CLRR 	2FH 			//03A7 	012F
		INCR	2FH,1 			//03A8 	09AF

		//;ZX-CH2-M25-60E121.C: 886: Flag.bits.keyHit = 1;
		BSR 	2CH,0 			//03A9 	182C

		//;ZX-CH2-M25-60E121.C: 888: dang = (dang >= 25) ? 0 : (dang + 1);
		SUBWR 	3AH,0 			//03AA 	0C3A
		BTSC 	STATUS,0 		//03AB 	1403
		LJUMP 	3B4H 			//03AC 	3BB4
		LDR 	3AH,0 			//03AD 	083A
		STR 	72H 			//03AE 	01F2
		CLRR 	73H 			//03AF 	0173
		INCR	72H,1 			//03B0 	09F2
		BTSC 	STATUS,2 		//03B1 	1503
		INCR	73H,1 			//03B2 	09F3
		LJUMP 	3B6H 			//03B3 	3BB6
		CLRR 	72H 			//03B4 	0172
		CLRR 	73H 			//03B5 	0173
		LDR 	72H,0 			//03B6 	0872

		//;ZX-CH2-M25-60E121.C: 889: eepromWrite(0x00, dang);
		LCALL 	3D3H 			//03B7 	33D3
		LCALL 	5EAH 			//03B8 	35EA

		//;ZX-CH2-M25-60E121.C: 890: initVariables(dang);
		BCR 	STATUS,5 		//03B9 	1283
		LDR 	3AH,0 			//03BA 	083A
		LJUMP 	257H 			//03BB 	3A57

		//;ZX-CH2-M25-60E121.C: 893: else
		//;ZX-CH2-M25-60E121.C: 894: {
		//;ZX-CH2-M25-60E121.C: 895: if (Time.onOffCount < 60)
		LDWI 	0H 			//03BC 	2A00
		SUBWR 	25H,0 			//03BD 	0C25
		LDWI 	3CH 			//03BE 	2A3C
		BTSC 	STATUS,2 		//03BF 	1503
		SUBWR 	24H,0 			//03C0 	0C24
		BTSC 	STATUS,0 		//03C1 	1403
		LJUMP 	3C6H 			//03C2 	3BC6

		//;ZX-CH2-M25-60E121.C: 896: {
		//;ZX-CH2-M25-60E121.C: 897: Time.onOffCount++;
		INCR	24H,1 			//03C3 	09A4
		BTSC 	STATUS,2 		//03C4 	1503
		INCR	25H,1 			//03C5 	09A5

		//;ZX-CH2-M25-60E121.C: 898: }
		//;ZX-CH2-M25-60E121.C: 899: Time.hitCount = 0;
		CLRR 	20H 			//03C6 	0120

		//;ZX-CH2-M25-60E121.C: 901: if (keyState == 1 && Time.onOffCount >= 60)
		DECRSZ 	2FH,0 		//03C7 	0E2F
		RET		 					//03C8 	0004
		LDWI 	0H 			//03C9 	2A00
		SUBWR 	25H,0 			//03CA 	0C25
		LDWI 	3CH 			//03CB 	2A3C
		BTSC 	STATUS,2 		//03CC 	1503
		SUBWR 	24H,0 			//03CD 	0C24
		BTSS 	STATUS,0 		//03CE 	1C03
		RET		 					//03CF 	0004

		//;ZX-CH2-M25-60E121.C: 902: {
		//;ZX-CH2-M25-60E121.C: 903: keyState = 0;
		CLRR 	2FH 			//03D0 	012F

		//;ZX-CH2-M25-60E121.C: 904: Flag.bits.keyHit = 0;
		BCR 	2CH,0 			//03D1 	102C
		RET		 					//03D2 	0004
		STR 	3AH 			//03D3 	01BA
		LDR 	3AH,0 			//03D4 	083A
		STR 	70H 			//03D5 	01F0
		RETW 	0H 			//03D6 	2100
		STR 	7DH 			//03D7 	01FD

		//;ZX-CH2-M25-60E121.C: 153: if (ledPhase == 0)
		LDR 	38H,0 			//03D8 	0838
		BTSS 	STATUS,2 		//03D9 	1D03
		LJUMP 	408H 			//03DA 	3C08

		//;ZX-CH2-M25-60E121.C: 154: {
		//;ZX-CH2-M25-60E121.C: 155: if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0)
		LDWI 	4H 			//03DB 	2A04
		SUBWR 	3FH,0 			//03DC 	0C3F
		BTSS 	STATUS,0 		//03DD 	1C03
		LJUMP 	3F1H 			//03DE 	3BF1
		LDR 	3BH,0 			//03DF 	083B
		BTSS 	STATUS,2 		//03E0 	1D03
		LJUMP 	3F1H 			//03E1 	3BF1
		LDR 	22H,0 			//03E2 	0822
		IORWR 	23H,0 			//03E3 	0323
		BTSS 	STATUS,2 		//03E4 	1D03
		LJUMP 	3F1H 			//03E5 	3BF1

		//;ZX-CH2-M25-60E121.C: 156: {
		//;ZX-CH2-M25-60E121.C: 157: shanCnt = 0;
		CLRR 	3FH 			//03E6 	013F

		//;ZX-CH2-M25-60E121.C: 158: shinkBits = ledMask;
		LDR 	4EH,0 			//03E7 	084E
		STR 	3BH 			//03E8 	01BB

		//;ZX-CH2-M25-60E121.C: 159: ledBits = 0;
		CLRR 	39H 			//03E9 	0139

		//;ZX-CH2-M25-60E121.C: 160: ledPhase = 1;
		LDWI 	1H 			//03EA 	2A01
		STR 	38H 			//03EB 	01B8

		//;ZX-CH2-M25-60E121.C: 161: Time.dutyCount = holdTime;
		LDR 	7BH,0 			//03EC 	087B
		STR 	23H 			//03ED 	01A3
		LDR 	7AH,0 			//03EE 	087A
		STR 	22H 			//03EF 	01A2

		//;ZX-CH2-M25-60E121.C: 162: } else {
		RET		 					//03F0 	0004

		//;ZX-CH2-M25-60E121.C: 163: shinking(flashTime, flashTime);
		LDR 	7DH,0 			//03F1 	087D
		STR 	76H 			//03F2 	01F6
		CLRR 	77H 			//03F3 	0177
		LDR 	7DH,0 			//03F4 	087D
		STR 	78H 			//03F5 	01F8
		CLRR 	79H 			//03F6 	0179
		LCALL 	62DH 			//03F7 	362D

		//;ZX-CH2-M25-60E121.C: 164: ledMask = 0x01 << currentLed;
		LDWI 	1H 			//03F8 	2A01
		STR 	7CH 			//03F9 	01FC
		INCR	4FH,0 			//03FA 	094F
		LJUMP 	3FEH 			//03FB 	3BFE
		BCR 	STATUS,0 		//03FC 	1003
		RLR 	7CH,1 			//03FD 	05FC
		ADDWI 	FFH 			//03FE 	27FF
		BTSS 	STATUS,2 		//03FF 	1D03
		LJUMP 	3FCH 			//0400 	3BFC
		LDR 	7CH,0 			//0401 	087C
		STR 	4EH 			//0402 	01CE

		//;ZX-CH2-M25-60E121.C: 165: ledBits = shinkBits & ledMask;
		LDR 	3BH,0 			//0403 	083B
		STR 	39H 			//0404 	01B9
		LDR 	4EH,0 			//0405 	084E
		ANDWR 	39H,1 			//0406 	02B9
		RET		 					//0407 	0004

		//;ZX-CH2-M25-60E121.C: 168: else if (ledPhase == 1)
		DECRSZ 	38H,0 		//0408 	0E38
		RET		 					//0409 	0004

		//;ZX-CH2-M25-60E121.C: 169: {
		//;ZX-CH2-M25-60E121.C: 170: ledBits = shinkBits;
		LDR 	3BH,0 			//040A 	083B
		STR 	39H 			//040B 	01B9

		//;ZX-CH2-M25-60E121.C: 171: if (Time.dutyCount == 0)
		LDR 	22H,0 			//040C 	0822
		IORWR 	23H,0 			//040D 	0323
		BTSS 	STATUS,2 		//040E 	1D03
		RET		 					//040F 	0004

		//;ZX-CH2-M25-60E121.C: 172: {
		//;ZX-CH2-M25-60E121.C: 173: currentLed ^= 1;
		LDWI 	1H 			//0410 	2A01
		XORWR 	4FH,1 			//0411 	04CF

		//;ZX-CH2-M25-60E121.C: 174: shanCnt = 0;
		CLRR 	3FH 			//0412 	013F

		//;ZX-CH2-M25-60E121.C: 175: ledBits = 0;
		CLRR 	39H 			//0413 	0139

		//;ZX-CH2-M25-60E121.C: 176: shinkBits = 0;
		CLRR 	3BH 			//0414 	013B

		//;ZX-CH2-M25-60E121.C: 177: ledPhase = 0;
		CLRR 	38H 			//0415 	0138
		RET		 					//0416 	0004

		//;ZX-CH2-M25-60E121.C: 910: static u8 keyState = 0;
		//;ZX-CH2-M25-60E121.C: 912: if (RA2 == 1)
		BTSS 	5H,2 			//0417 	1D05
		LJUMP 	43DH 			//0418 	3C3D

		//;ZX-CH2-M25-60E121.C: 913: {
		//;ZX-CH2-M25-60E121.C: 914: if (Time.hitCount2 < 3)
		LDWI 	3H 			//0419 	2A03
		SUBWR 	21H,0 			//041A 	0C21
		BTSC 	STATUS,0 		//041B 	1403
		LJUMP 	41EH 			//041C 	3C1E

		//;ZX-CH2-M25-60E121.C: 915: {
		//;ZX-CH2-M25-60E121.C: 916: Time.hitCount2++;
		INCR	21H,1 			//041D 	09A1

		//;ZX-CH2-M25-60E121.C: 917: }
		//;ZX-CH2-M25-60E121.C: 918: Time.onOffCount2 = 0;
		CLRR 	28H 			//041E 	0128
		CLRR 	29H 			//041F 	0129

		//;ZX-CH2-M25-60E121.C: 920: if (keyState == 0 && Time.hitCount2 >= 3)
		LDR 	2EH,0 			//0420 	082E
		BTSS 	STATUS,2 		//0421 	1D03
		RET		 					//0422 	0004
		LDWI 	3H 			//0423 	2A03
		SUBWR 	21H,0 			//0424 	0C21
		BTSS 	STATUS,0 		//0425 	1C03
		RET		 					//0426 	0004
		LDWI 	19H 			//0427 	2A19

		//;ZX-CH2-M25-60E121.C: 921: {
		//;ZX-CH2-M25-60E121.C: 922: keyState = 1;
		CLRR 	2EH 			//0428 	012E
		INCR	2EH,1 			//0429 	09AE

		//;ZX-CH2-M25-60E121.C: 923: Flag.bits.keyHit2 = 1;
		BSR 	2CH,1 			//042A 	18AC

		//;ZX-CH2-M25-60E121.C: 925: dang = (dang >= 25) ? 0 : (dang + 1);
		SUBWR 	3AH,0 			//042B 	0C3A
		BTSC 	STATUS,0 		//042C 	1403
		LJUMP 	435H 			//042D 	3C35
		LDR 	3AH,0 			//042E 	083A
		STR 	72H 			//042F 	01F2
		CLRR 	73H 			//0430 	0173
		INCR	72H,1 			//0431 	09F2
		BTSC 	STATUS,2 		//0432 	1503
		INCR	73H,1 			//0433 	09F3
		LJUMP 	437H 			//0434 	3C37
		CLRR 	72H 			//0435 	0172
		CLRR 	73H 			//0436 	0173
		LDR 	72H,0 			//0437 	0872

		//;ZX-CH2-M25-60E121.C: 926: eepromWrite(0x00, dang);
		LCALL 	3D3H 			//0438 	33D3
		LCALL 	5EAH 			//0439 	35EA

		//;ZX-CH2-M25-60E121.C: 927: initVariables(dang);
		BCR 	STATUS,5 		//043A 	1283
		LDR 	3AH,0 			//043B 	083A
		LJUMP 	257H 			//043C 	3A57

		//;ZX-CH2-M25-60E121.C: 930: else
		//;ZX-CH2-M25-60E121.C: 931: {
		//;ZX-CH2-M25-60E121.C: 932: if (Time.onOffCount2 < 60)
		LDWI 	0H 			//043D 	2A00
		SUBWR 	29H,0 			//043E 	0C29
		LDWI 	3CH 			//043F 	2A3C
		BTSC 	STATUS,2 		//0440 	1503
		SUBWR 	28H,0 			//0441 	0C28
		BTSC 	STATUS,0 		//0442 	1403
		LJUMP 	447H 			//0443 	3C47

		//;ZX-CH2-M25-60E121.C: 933: {
		//;ZX-CH2-M25-60E121.C: 934: Time.onOffCount2++;
		INCR	28H,1 			//0444 	09A8
		BTSC 	STATUS,2 		//0445 	1503
		INCR	29H,1 			//0446 	09A9

		//;ZX-CH2-M25-60E121.C: 935: }
		//;ZX-CH2-M25-60E121.C: 936: Time.hitCount2 = 0;
		CLRR 	21H 			//0447 	0121

		//;ZX-CH2-M25-60E121.C: 938: if (keyState == 1 && Time.onOffCount2 >= 60)
		DECRSZ 	2EH,0 		//0448 	0E2E
		RET		 					//0449 	0004
		LDWI 	0H 			//044A 	2A00
		SUBWR 	29H,0 			//044B 	0C29
		LDWI 	3CH 			//044C 	2A3C
		BTSC 	STATUS,2 		//044D 	1503
		SUBWR 	28H,0 			//044E 	0C28
		BTSS 	STATUS,0 		//044F 	1C03
		RET		 					//0450 	0004

		//;ZX-CH2-M25-60E121.C: 939: {
		//;ZX-CH2-M25-60E121.C: 940: keyState = 0;
		CLRR 	2EH 			//0451 	012E

		//;ZX-CH2-M25-60E121.C: 941: Flag.bits.keyHit2 = 0;
		BCR 	2CH,1 			//0452 	10AC
		RET		 					//0453 	0004
		STR 	44H 			//0454 	01C4

		//;ZX-CH2-M25-60E121.C: 463: shinking(109, 327);
		LDWI 	6DH 			//0455 	2A6D
		STR 	76H 			//0456 	01F6
		LDWI 	47H 			//0457 	2A47
		LCALL 	488H 			//0458 	3488
		LCALL 	62DH 			//0459 	362D

		//;ZX-CH2-M25-60E121.C: 465: if (delayCounter == 0)
		LDR 	2AH,0 			//045A 	082A
		IORWR 	2BH,0 			//045B 	032B
		BTSS 	STATUS,2 		//045C 	1D03
		LJUMP 	47AH 			//045D 	3C7A

		//;ZX-CH2-M25-60E121.C: 466: {
		//;ZX-CH2-M25-60E121.C: 467: shinking2(109, 327);
		LDWI 	6DH 			//045E 	2A6D
		STR 	70H 			//045F 	01F0
		LDWI 	47H 			//0460 	2A47
		CLRR 	71H 			//0461 	0171
		STR 	72H 			//0462 	01F2
		LDWI 	1H 			//0463 	2A01
		STR 	73H 			//0464 	01F3
		LCALL 	618H 			//0465 	3618

		//;ZX-CH2-M25-60E121.C: 468: ledBits = (dang == 19) ? ((shinkBits & 0x01) | (shinkBits2 &
		//+                          0x02)) : ((shinkBits & 0x02) | (shinkBits2 & 0x01));
		LDWI 	13H 			//0466 	2A13
		XORWR 	44H,0 			//0467 	0444
		BTSC 	STATUS,2 		//0468 	1503
		LJUMP 	470H 			//0469 	3C70
		LDWI 	1H 			//046A 	2A01
		ANDWR 	3CH,0 			//046B 	023C
		STR 	7AH 			//046C 	01FA
		LDR 	3BH,0 			//046D 	083B
		ANDWI 	2H 			//046E 	2402
		LJUMP 	475H 			//046F 	3C75
		LDWI 	2H 			//0470 	2A02
		ANDWR 	3CH,0 			//0471 	023C
		STR 	7AH 			//0472 	01FA
		LDR 	3BH,0 			//0473 	083B
		ANDWI 	1H 			//0474 	2401
		IORWR 	7AH,0 			//0475 	037A
		STR 	40H 			//0476 	01C0
		CLRR 	41H 			//0477 	0141
		STR 	39H 			//0478 	01B9

		//;ZX-CH2-M25-60E121.C: 469: }
		RET		 					//0479 	0004

		//;ZX-CH2-M25-60E121.C: 470: else
		//;ZX-CH2-M25-60E121.C: 471: {
		//;ZX-CH2-M25-60E121.C: 473: delayCounter--;
		LCALL 	12CH 			//047A 	312C

		//;ZX-CH2-M25-60E121.C: 474: ledBits = (dang == 19) ? (shinkBits & 0x01) : (shinkBits & 0x
		//+                          02);
		LDWI 	13H 			//047B 	2A13
		XORWR 	44H,0 			//047C 	0444
		BTSC 	STATUS,2 		//047D 	1503
		LJUMP 	482H 			//047E 	3C82
		LDR 	3BH,0 			//047F 	083B
		ANDWI 	2H 			//0480 	2402
		LJUMP 	484H 			//0481 	3C84
		LDR 	3BH,0 			//0482 	083B
		ANDWI 	1H 			//0483 	2401
		STR 	42H 			//0484 	01C2
		CLRR 	43H 			//0485 	0143
		STR 	39H 			//0486 	01B9
		RET		 					//0487 	0004
		CLRR 	77H 			//0488 	0177
		STR 	78H 			//0489 	01F8
		LDWI 	1H 			//048A 	2A01
		STR 	79H 			//048B 	01F9
		RET		 					//048C 	0004
		STR 	40H 			//048D 	01C0

		//;ZX-CH2-M25-60E121.C: 184: if (ledPhase == 0)
		LDR 	38H,0 			//048E 	0838
		BTSS 	STATUS,2 		//048F 	1D03
		LJUMP 	4A5H 			//0490 	3CA5

		//;ZX-CH2-M25-60E121.C: 185: {
		//;ZX-CH2-M25-60E121.C: 186: if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0)
		LDWI 	4H 			//0491 	2A04
		SUBWR 	3FH,0 			//0492 	0C3F
		BTSS 	STATUS,0 		//0493 	1C03
		LJUMP 	49EH 			//0494 	3C9E
		LDR 	3BH,0 			//0495 	083B
		BTSS 	STATUS,2 		//0496 	1D03
		LJUMP 	49EH 			//0497 	3C9E
		LDR 	22H,0 			//0498 	0822
		IORWR 	23H,0 			//0499 	0323
		BTSS 	STATUS,2 		//049A 	1D03
		LJUMP 	49EH 			//049B 	3C9E

		//;ZX-CH2-M25-60E121.C: 187: {
		//;ZX-CH2-M25-60E121.C: 188: shanCnt = 0;
		//;ZX-CH2-M25-60E121.C: 189: shinkBits = 0;
		//;ZX-CH2-M25-60E121.C: 190: ledBits = 0;
		//;ZX-CH2-M25-60E121.C: 191: ledPhase = 1;
		LCALL 	514H 			//049C 	3514

		//;ZX-CH2-M25-60E121.C: 192: } else {
		LJUMP 	4BCH 			//049D 	3CBC

		//;ZX-CH2-M25-60E121.C: 193: shinking(flashTime, flashTime);
		LDR 	40H,0 			//049E 	0840
		STR 	76H 			//049F 	01F6
		CLRR 	77H 			//04A0 	0177
		LDR 	40H,0 			//04A1 	0840
		STR 	78H 			//04A2 	01F8
		CLRR 	79H 			//04A3 	0179
		LJUMP 	4BBH 			//04A4 	3CBB

		//;ZX-CH2-M25-60E121.C: 196: else if (ledPhase == 1)
		DECRSZ 	38H,0 		//04A5 	0E38
		LJUMP 	4BCH 			//04A6 	3CBC

		//;ZX-CH2-M25-60E121.C: 197: {
		//;ZX-CH2-M25-60E121.C: 198: if (shanCnt >= 1 && shinkBits == 0 && Time.dutyCount == 0)
		LDR 	3FH,0 			//04A7 	083F
		BTSC 	STATUS,2 		//04A8 	1503
		LJUMP 	4B3H 			//04A9 	3CB3
		LDR 	3BH,0 			//04AA 	083B
		BTSS 	STATUS,2 		//04AB 	1D03
		LJUMP 	4B3H 			//04AC 	3CB3
		LDR 	22H,0 			//04AD 	0822
		IORWR 	23H,0 			//04AE 	0323
		BTSS 	STATUS,2 		//04AF 	1D03
		LJUMP 	4B3H 			//04B0 	3CB3

		//;ZX-CH2-M25-60E121.C: 199: {
		//;ZX-CH2-M25-60E121.C: 200: shanCnt = 0;
		//;ZX-CH2-M25-60E121.C: 201: shinkBits = 0;
		//;ZX-CH2-M25-60E121.C: 202: ledBits = 0;
		//;ZX-CH2-M25-60E121.C: 203: ledPhase = 0;
		LCALL 	51AH 			//04B1 	351A

		//;ZX-CH2-M25-60E121.C: 204: } else {
		LJUMP 	4BCH 			//04B2 	3CBC

		//;ZX-CH2-M25-60E121.C: 205: shinking(holdTime, offTime);
		LDR 	7BH,0 			//04B3 	087B
		STR 	77H 			//04B4 	01F7
		LDR 	7AH,0 			//04B5 	087A
		STR 	76H 			//04B6 	01F6
		LDR 	7DH,0 			//04B7 	087D
		STR 	79H 			//04B8 	01F9
		LDR 	7CH,0 			//04B9 	087C
		STR 	78H 			//04BA 	01F8
		LCALL 	62DH 			//04BB 	362D

		//;ZX-CH2-M25-60E121.C: 206: }
		//;ZX-CH2-M25-60E121.C: 207: }
		//;ZX-CH2-M25-60E121.C: 208: ledBits = shinkBits & 0x03;
		LJUMP 	4BDH 			//04BC 	3CBD
		LDR 	3BH,0 			//04BD 	083B
		STR 	39H 			//04BE 	01B9
		LDWI 	3H 			//04BF 	2A03
		ANDWR 	39H,1 			//04C0 	02B9
		RET		 					//04C1 	0004

		//;ZX-CH2-M25-60E121.C: 381: if (ledPhase < 2) {
		LDWI 	2H 			//04C2 	2A02
		SUBWR 	38H,0 			//04C3 	0C38
		BTSC 	STATUS,0 		//04C4 	1403
		LJUMP 	4DCH 			//04C5 	3CDC

		//;ZX-CH2-M25-60E121.C: 383: u8 prevShinkBits = shinkBits;
		LDR 	3BH,0 			//04C6 	083B
		STR 	7BH 			//04C7 	01FB

		//;ZX-CH2-M25-60E121.C: 384: shinking(238, 238);
		LDWI 	EEH 			//04C8 	2AEE
		LCALL 	133H 			//04C9 	3133
		LCALL 	62DH 			//04CA 	362D

		//;ZX-CH2-M25-60E121.C: 385: if (prevShinkBits != 0 && shinkBits == 0) {
		LDR 	7BH,0 			//04CB 	087B
		BTSC 	STATUS,2 		//04CC 	1503
		LJUMP 	4D3H 			//04CD 	3CD3
		LDR 	3BH,0 			//04CE 	083B
		BTSS 	STATUS,2 		//04CF 	1D03
		LJUMP 	4D3H 			//04D0 	3CD3

		//;ZX-CH2-M25-60E121.C: 386: currentLed ^= 0x03;
		LDWI 	3H 			//04D1 	2A03
		XORWR 	4FH,1 			//04D2 	04CF

		//;ZX-CH2-M25-60E121.C: 387: }
		//;ZX-CH2-M25-60E121.C: 388: ledBits = shinkBits & currentLed;
		//;ZX-CH2-M25-60E121.C: 390: if (shanCnt >= 4) {
		LCALL 	334H 			//04D3 	3334
		BTSS 	STATUS,0 		//04D4 	1C03
		RET		 					//04D5 	0004

		//;ZX-CH2-M25-60E121.C: 391: shanCnt = shinkBits = 0;
		//;ZX-CH2-M25-60E121.C: 392: if (++ledPhase == 2) {
		LCALL 	341H 			//04D6 	3341
		BTSS 	STATUS,2 		//04D7 	1D03
		RET		 					//04D8 	0004

		//;ZX-CH2-M25-60E121.C: 393: phase2SwitchCnt = lastShanCnt2Div4 = 0;
		CLRR 	36H 			//04D9 	0136
		CLRR 	37H 			//04DA 	0137
		RET		 					//04DB 	0004

		//;ZX-CH2-M25-60E121.C: 398: shinking2(120, 120);
		LDWI 	78H 			//04DC 	2A78
		LCALL 	13FH 			//04DD 	313F
		LCALL 	618H 			//04DE 	3618

		//;ZX-CH2-M25-60E121.C: 399: ledBits = shinkBits2 & currentLed;
		//;ZX-CH2-M25-60E121.C: 401: u8 currentDiv4 = shanCnt2 >> 2;
		LCALL 	347H 			//04DF 	3347
		STR 	7AH 			//04E0 	01FA
		BCR 	STATUS,0 		//04E1 	1003
		RRR	7AH,1 			//04E2 	06FA
		BCR 	STATUS,0 		//04E3 	1003
		RRR	7AH,1 			//04E4 	06FA
		LDR 	7AH,0 			//04E5 	087A
		STR 	7CH 			//04E6 	01FC

		//;ZX-CH2-M25-60E121.C: 402: if (currentDiv4 > 0 && currentDiv4 > lastShanCnt2Div4) {
		LDR 	7CH,0 			//04E7 	087C
		BTSC 	STATUS,2 		//04E8 	1503
		RET		 					//04E9 	0004
		SUBWR 	36H,0 			//04EA 	0C36
		BTSC 	STATUS,0 		//04EB 	1403
		RET		 					//04EC 	0004

		//;ZX-CH2-M25-60E121.C: 403: currentLed ^= 0x03;
		LDWI 	3H 			//04ED 	2A03
		XORWR 	4FH,1 			//04EE 	04CF

		//;ZX-CH2-M25-60E121.C: 404: lastShanCnt2Div4 = currentDiv4;
		LDR 	7CH,0 			//04EF 	087C

		//;ZX-CH2-M25-60E121.C: 405: if (++phase2SwitchCnt >= 4) {
		LCALL 	34DH 			//04F0 	334D
		BTSS 	STATUS,0 		//04F1 	1C03
		RET		 					//04F2 	0004

		//;ZX-CH2-M25-60E121.C: 406: ledPhase = shanCnt2 = shinkBits2 = phase2SwitchCnt = lastShan
		//+                          Cnt2Div4 = 0;
		LJUMP 	33BH 			//04F3 	3B3B

		//;ZX-CH2-M25-60E121.C: 212: if (ledPhase == 0)
		LDR 	38H,0 			//04F4 	0838
		BTSS 	STATUS,2 		//04F5 	1D03
		LJUMP 	50CH 			//04F6 	3D0C

		//;ZX-CH2-M25-60E121.C: 213: {
		//;ZX-CH2-M25-60E121.C: 214: if (shanCnt >= 4 && shinkBits == 0 && Time.dutyCount == 0)
		LDWI 	4H 			//04F7 	2A04
		SUBWR 	3FH,0 			//04F8 	0C3F
		BTSS 	STATUS,0 		//04F9 	1C03
		LJUMP 	508H 			//04FA 	3D08
		LDR 	3BH,0 			//04FB 	083B
		BTSS 	STATUS,2 		//04FC 	1D03
		LJUMP 	508H 			//04FD 	3D08
		LDR 	22H,0 			//04FE 	0822
		IORWR 	23H,0 			//04FF 	0323
		BTSS 	STATUS,2 		//0500 	1D03
		LJUMP 	508H 			//0501 	3D08

		//;ZX-CH2-M25-60E121.C: 215: {
		//;ZX-CH2-M25-60E121.C: 216: shanCnt = 0;
		//;ZX-CH2-M25-60E121.C: 217: shinkBits = 0;
		//;ZX-CH2-M25-60E121.C: 218: ledBits = 0;
		//;ZX-CH2-M25-60E121.C: 219: ledPhase = 1;
		LCALL 	514H 			//0502 	3514

		//;ZX-CH2-M25-60E121.C: 220: Time.dutyCount = 1070;
		LDWI 	2EH 			//0503 	2A2E
		STR 	22H 			//0504 	01A2
		LDWI 	4H 			//0505 	2A04
		STR 	23H 			//0506 	01A3

		//;ZX-CH2-M25-60E121.C: 221: } else {
		LJUMP 	513H 			//0507 	3D13

		//;ZX-CH2-M25-60E121.C: 222: shinking(119, 119);
		LDWI 	77H 			//0508 	2A77
		LCALL 	133H 			//0509 	3133
		LCALL 	62DH 			//050A 	362D
		LJUMP 	513H 			//050B 	3D13

		//;ZX-CH2-M25-60E121.C: 225: else if (ledPhase == 1)
		DECRSZ 	38H,0 		//050C 	0E38
		LJUMP 	513H 			//050D 	3D13

		//;ZX-CH2-M25-60E121.C: 226: {
		//;ZX-CH2-M25-60E121.C: 227: if (Time.dutyCount == 0)
		LDR 	22H,0 			//050E 	0822
		IORWR 	23H,0 			//050F 	0323
		BTSS 	STATUS,2 		//0510 	1D03
		LJUMP 	513H 			//0511 	3D13

		//;ZX-CH2-M25-60E121.C: 228: {
		//;ZX-CH2-M25-60E121.C: 229: shanCnt = 0;
		//;ZX-CH2-M25-60E121.C: 230: shinkBits = 0;
		//;ZX-CH2-M25-60E121.C: 231: ledBits = 0;
		//;ZX-CH2-M25-60E121.C: 232: ledPhase = 0;
		LCALL 	51AH 			//0512 	351A

		//;ZX-CH2-M25-60E121.C: 233: }
		//;ZX-CH2-M25-60E121.C: 234: }
		//;ZX-CH2-M25-60E121.C: 235: ledBits = shinkBits & 0x03;
		LJUMP 	4BDH 			//0513 	3CBD
		CLRR 	3FH 			//0514 	013F
		CLRR 	3BH 			//0515 	013B
		CLRR 	39H 			//0516 	0139
		LDWI 	1H 			//0517 	2A01
		STR 	38H 			//0518 	01B8
		RET		 					//0519 	0004
		CLRR 	3FH 			//051A 	013F
		CLRR 	3BH 			//051B 	013B
		CLRR 	39H 			//051C 	0139
		CLRR 	38H 			//051D 	0138
		RET		 					//051E 	0004

		//;ZX-CH2-M25-60E121.C: 1027: u8 i;
		//;ZX-CH2-M25-60E121.C: 1029: powerInitial();
		LCALL 	56FH 			//051F 	356F

		//;ZX-CH2-M25-60E121.C: 1031: for (i = 0; i < 250; i++)
		CLRR 	4DH 			//0520 	014D

		//;ZX-CH2-M25-60E121.C: 1032: delayUs(197);
		LDWI 	C5H 			//0521 	2AC5
		LCALL 	64DH 			//0522 	364D
		LDWI 	FAH 			//0523 	2AFA
		INCR	4DH,1 			//0524 	09CD
		SUBWR 	4DH,0 			//0525 	0C4D
		BTSS 	STATUS,0 		//0526 	1C03
		LJUMP 	521H 			//0527 	3D21
		CLRWDT	 			//0528 	0001

		//;ZX-CH2-M25-60E121.C: 1035: eepromWrite(0xff, 0xaa);
		LCALL 	544H 			//0529 	3544
		LCALL 	603H 			//052A 	3603

		//;ZX-CH2-M25-60E121.C: 1036: eepromWrite(0xff, 0xaa);
		LCALL 	544H 			//052B 	3544
		LCALL 	603H 			//052C 	3603

		//;ZX-CH2-M25-60E121.C: 1037: dang = eepromRead(0x00);
		LDWI 	0H 			//052D 	2A00
		LCALL 	657H 			//052E 	3657
		STR 	3AH 			//052F 	01BA

		//;ZX-CH2-M25-60E121.C: 1038: if (dang > 25)
		LDWI 	1AH 			//0530 	2A1A
		SUBWR 	3AH,0 			//0531 	0C3A
		BTSS 	STATUS,0 		//0532 	1C03
		LJUMP 	536H 			//0533 	3D36

		//;ZX-CH2-M25-60E121.C: 1039: {
		//;ZX-CH2-M25-60E121.C: 1040: dang = 0;
		CLRR 	3AH 			//0534 	013A

		//;ZX-CH2-M25-60E121.C: 1041: Flag.bits.toEeprom = 1;
		BSR 	2CH,2 			//0535 	192C

		//;ZX-CH2-M25-60E121.C: 1042: }
		//;ZX-CH2-M25-60E121.C: 1044: T0IF = 0;
		BCR 	INTCON,2 		//0536 	110B

		//;ZX-CH2-M25-60E121.C: 1045: GIE = 1;
		BSR 	INTCON,7 		//0537 	1B8B

		//;ZX-CH2-M25-60E121.C: 1046: T0IE = 1;
		BSR 	INTCON,5 		//0538 	1A8B

		//;ZX-CH2-M25-60E121.C: 1048: while (1)
		CLRWDT	 			//0539 	0001

		//;ZX-CH2-M25-60E121.C: 1051: if (Flag.bits.toEeprom)
		BCR 	STATUS,5 		//053A 	1283
		BTSS 	2CH,2 			//053B 	1D2C
		LJUMP 	539H 			//053C 	3D39

		//;ZX-CH2-M25-60E121.C: 1052: {
		//;ZX-CH2-M25-60E121.C: 1053: eepromWrite(0x00, dang);
		LDR 	3AH,0 			//053D 	083A
		STR 	4BH 			//053E 	01CB
		LDWI 	0H 			//053F 	2A00
		LCALL 	603H 			//0540 	3603

		//;ZX-CH2-M25-60E121.C: 1054: Flag.bits.toEeprom = 0;
		BCR 	STATUS,5 		//0541 	1283
		BCR 	2CH,2 			//0542 	112C
		LJUMP 	539H 			//0543 	3D39
		LDWI 	AAH 			//0544 	2AAA
		BCR 	STATUS,5 		//0545 	1283
		STR 	4BH 			//0546 	01CB
		RETW 	FFH 			//0547 	21FF

		//;ZX-CH2-M25-60E121.C: 974: if (T0IE && T0IF)
		BTSC 	INTCON,5 		//0548 	168B
		BTSS 	INTCON,2 		//0549 	1D0B
		LJUMP 	566H 			//054A 	3D66

		//;ZX-CH2-M25-60E121.C: 975: {
		//;ZX-CH2-M25-60E121.C: 976: T0IF = 0;
		BCR 	INTCON,2 		//054B 	110B

		//;ZX-CH2-M25-60E121.C: 977: TMR0 = 5;
		LDWI 	5H 			//054C 	2A05
		STR 	1H 			//054D 	0181

		//;ZX-CH2-M25-60E121.C: 978: if (Time.dutyCount > 0)
		LDR 	22H,0 			//054E 	0822
		IORWR 	23H,0 			//054F 	0323
		BTSC 	STATUS,2 		//0550 	1503
		LJUMP 	558H 			//0551 	3D58

		//;ZX-CH2-M25-60E121.C: 979: Time.dutyCount--;
		LDWI 	1H 			//0552 	2A01
		SUBWR 	22H,1 			//0553 	0CA2
		LDWI 	0H 			//0554 	2A00
		BTSS 	STATUS,0 		//0555 	1C03
		DECR 	23H,1 			//0556 	0DA3
		SUBWR 	23H,1 			//0557 	0CA3

		//;ZX-CH2-M25-60E121.C: 980: if (Time.dutyCount2 > 0)
		LDR 	26H,0 			//0558 	0826
		IORWR 	27H,0 			//0559 	0327
		BTSC 	STATUS,2 		//055A 	1503
		LJUMP 	562H 			//055B 	3D62

		//;ZX-CH2-M25-60E121.C: 981: Time.dutyCount2--;
		LDWI 	1H 			//055C 	2A01
		SUBWR 	26H,1 			//055D 	0CA6
		LDWI 	0H 			//055E 	2A00
		BTSS 	STATUS,0 		//055F 	1C03
		DECR 	27H,1 			//0560 	0DA7
		SUBWR 	27H,1 			//0561 	0CA7

		//;ZX-CH2-M25-60E121.C: 982: keyCheck();
		LCALL 	396H 			//0562 	3396

		//;ZX-CH2-M25-60E121.C: 983: keyPosCheck();
		LCALL 	417H 			//0563 	3417

		//;ZX-CH2-M25-60E121.C: 984: modeMachine();
		LCALL 	144H 			//0564 	3144

		//;ZX-CH2-M25-60E121.C: 985: ledDisplay();
		LCALL 	642H 			//0565 	3642
		LDR 	4AH,0 			//0566 	084A
		STR 	PCLATH 			//0567 	018A
		LDR 	49H,0 			//0568 	0849
		STR 	FSR 			//0569 	0184
		SWAPR 	48H,0 			//056A 	0748
		STR 	STATUS 			//056B 	0183
		SWAPR 	7EH,1 			//056C 	07FE
		SWAPR 	7EH,0 			//056D 	077E
		RETI		 			//056E 	0009

		//;ZX-CH2-M25-60E121.C: 948: OSCCON = 0B01110001;
		LDWI 	71H 			//056F 	2A71
		BSR 	STATUS,5 		//0570 	1A83
		STR 	FH 			//0571 	018F

		//;ZX-CH2-M25-60E121.C: 949: INTCON = 0;
		CLRR 	INTCON 			//0572 	010B

		//;ZX-CH2-M25-60E121.C: 950: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0573 	1283
		CLRR 	5H 			//0574 	0105

		//;ZX-CH2-M25-60E121.C: 951: TRISA = 0B01000101;
		LDWI 	45H 			//0575 	2A45
		BSR 	STATUS,5 		//0576 	1A83
		STR 	5H 			//0577 	0185

		//;ZX-CH2-M25-60E121.C: 952: WPUA = 0B01000001;
		LDWI 	41H 			//0578 	2A41
		STR 	15H 			//0579 	0195

		//;ZX-CH2-M25-60E121.C: 954: PORTC = 0B00000000;
		BCR 	STATUS,5 		//057A 	1283
		CLRR 	7H 			//057B 	0107

		//;ZX-CH2-M25-60E121.C: 955: TRISC = 0B11101011;
		LDWI 	EBH 			//057C 	2AEB
		BSR 	STATUS,5 		//057D 	1A83
		STR 	7H 			//057E 	0187

		//;ZX-CH2-M25-60E121.C: 956: WPUC = 0B11101011;
		STR 	13H 			//057F 	0193
		CLRWDT	 			//0580 	0001

		//;ZX-CH2-M25-60E121.C: 960: OPTION = 0B00000100;
		LDWI 	4H 			//0581 	2A04
		BSR 	STATUS,5 		//0582 	1A83
		STR 	1H 			//0583 	0181

		//;ZX-CH2-M25-60E121.C: 961: WDTCON = 0B00010000;
		LDWI 	10H 			//0584 	2A10
		BCR 	STATUS,5 		//0585 	1283
		STR 	18H 			//0586 	0198

		//;ZX-CH2-M25-60E121.C: 962: TMR0 = 5;
		LDWI 	5H 			//0587 	2A05
		STR 	1H 			//0588 	0181

		//;ZX-CH2-M25-60E121.C: 964: PSRCA = 0B11111111;
		LDWI 	FFH 			//0589 	2AFF
		BSR 	STATUS,5 		//058A 	1A83
		STR 	8H 			//058B 	0188

		//;ZX-CH2-M25-60E121.C: 965: PSRCC = 0B11111111;
		STR 	14H 			//058C 	0194

		//;ZX-CH2-M25-60E121.C: 966: PSINKA = 0B11111111;
		STR 	17H 			//058D 	0197

		//;ZX-CH2-M25-60E121.C: 967: PSINKC = 0B11111111;
		STR 	1FH 			//058E 	019F

		//;ZX-CH2-M25-60E121.C: 969: MSCON = 0B00110000;
		LDWI 	30H 			//058F 	2A30
		BCR 	STATUS,5 		//0590 	1283
		STR 	1BH 			//0591 	019B
		RET		 					//0592 	0004

		//;ZX-CH2-M25-60E121.C: 240: shinking(flashOn, flashOff);
		LDR 	7BH,0 			//0593 	087B
		STR 	77H 			//0594 	01F7
		LDR 	7AH,0 			//0595 	087A
		STR 	76H 			//0596 	01F6
		LDR 	7DH,0 			//0597 	087D
		STR 	79H 			//0598 	01F9
		LDR 	7CH,0 			//0599 	087C
		STR 	78H 			//059A 	01F8
		LCALL 	62DH 			//059B 	362D

		//;ZX-CH2-M25-60E121.C: 241: if (delayCounter == 0)
		LDR 	2AH,0 			//059C 	082A
		IORWR 	2BH,0 			//059D 	032B
		BTSS 	STATUS,2 		//059E 	1D03
		LJUMP 	5B1H 			//059F 	3DB1

		//;ZX-CH2-M25-60E121.C: 242: {
		//;ZX-CH2-M25-60E121.C: 243: shinking2(flashOn, flashOff);
		LDR 	7BH,0 			//05A0 	087B
		STR 	71H 			//05A1 	01F1
		LDR 	7AH,0 			//05A2 	087A
		STR 	70H 			//05A3 	01F0
		LDR 	7DH,0 			//05A4 	087D
		STR 	73H 			//05A5 	01F3
		LDR 	7CH,0 			//05A6 	087C
		STR 	72H 			//05A7 	01F2
		LCALL 	618H 			//05A8 	3618

		//;ZX-CH2-M25-60E121.C: 244: ledBits = (shinkBits & 0x01) | (shinkBits2 & 0x02);
		LDWI 	2H 			//05A9 	2A02
		ANDWR 	3CH,0 			//05AA 	023C
		STR 	40H 			//05AB 	01C0
		LDR 	3BH,0 			//05AC 	083B
		ANDWI 	1H 			//05AD 	2401
		IORWR 	40H,0 			//05AE 	0340
		STR 	39H 			//05AF 	01B9

		//;ZX-CH2-M25-60E121.C: 245: }
		RET		 					//05B0 	0004

		//;ZX-CH2-M25-60E121.C: 246: else
		//;ZX-CH2-M25-60E121.C: 247: {
		//;ZX-CH2-M25-60E121.C: 248: delayCounter--;
		LCALL 	12CH 			//05B1 	312C

		//;ZX-CH2-M25-60E121.C: 249: ledBits = shinkBits & 0x01;
		LDR 	3BH,0 			//05B2 	083B
		STR 	39H 			//05B3 	01B9
		LDWI 	1H 			//05B4 	2A01
		ANDWR 	39H,1 			//05B5 	02B9
		RET		 					//05B6 	0004
		LJUMP 	145H 			//05B7 	3945
		LJUMP 	14FH 			//05B8 	394F
		LJUMP 	154H 			//05B9 	3954
		LJUMP 	15DH 			//05BA 	395D
		LJUMP 	163H 			//05BB 	3963
		LJUMP 	16DH 			//05BC 	396D
		LJUMP 	171H 			//05BD 	3971
		LJUMP 	179H 			//05BE 	3979
		LJUMP 	17DH 			//05BF 	397D
		LJUMP 	17EH 			//05C0 	397E
		LJUMP 	187H 			//05C1 	3987
		LJUMP 	191H 			//05C2 	3991
		LJUMP 	19AH 			//05C3 	399A
		LJUMP 	1A2H 			//05C4 	39A2
		LJUMP 	1A4H 			//05C5 	39A4
		LJUMP 	1A6H 			//05C6 	39A6
		LJUMP 	1A7H 			//05C7 	39A7
		LJUMP 	1A8H 			//05C8 	39A8
		LJUMP 	1A9H 			//05C9 	39A9
		LJUMP 	1AAH 			//05CA 	39AA
		LJUMP 	1ACH 			//05CB 	39AC
		LJUMP 	1AEH 			//05CC 	39AE
		LJUMP 	1C5H 			//05CD 	39C5
		LJUMP 	1C8H 			//05CE 	39C8
		LJUMP 	1C9H 			//05CF 	39C9
		LJUMP 	1D5H 			//05D0 	39D5
		CLRR 	74H 			//05D1 	0174
		CLRR 	75H 			//05D2 	0175
		BTSS 	70H,0 			//05D3 	1C70
		LJUMP 	5DBH 			//05D4 	3DDB
		LDR 	72H,0 			//05D5 	0872
		ADDWR 	74H,1 			//05D6 	0BF4
		BTSC 	STATUS,0 		//05D7 	1403
		INCR	75H,1 			//05D8 	09F5
		LDR 	73H,0 			//05D9 	0873
		ADDWR 	75H,1 			//05DA 	0BF5
		BCR 	STATUS,0 		//05DB 	1003
		RLR 	72H,1 			//05DC 	05F2
		RLR 	73H,1 			//05DD 	05F3
		BCR 	STATUS,0 		//05DE 	1003
		RRR	71H,1 			//05DF 	06F1
		RRR	70H,1 			//05E0 	06F0
		LDR 	70H,0 			//05E1 	0870
		IORWR 	71H,0 			//05E2 	0371
		BTSS 	STATUS,2 		//05E3 	1D03
		LJUMP 	5D3H 			//05E4 	3DD3
		LDR 	75H,0 			//05E5 	0875
		STR 	71H 			//05E6 	01F1
		LDR 	74H,0 			//05E7 	0874
		STR 	70H 			//05E8 	01F0
		RET		 					//05E9 	0004
		STR 	71H 			//05EA 	01F1

		//;ZX-CH2-M25-60E121.C: 1009: while (GIE)
		BTSS 	INTCON,7 		//05EB 	1F8B
		LJUMP 	5EFH 			//05EC 	3DEF

		//;ZX-CH2-M25-60E121.C: 1010: {
		//;ZX-CH2-M25-60E121.C: 1011: GIE = 0;
		BCR 	INTCON,7 		//05ED 	138B
		LJUMP 	5EBH 			//05EE 	3DEB

		//;ZX-CH2-M25-60E121.C: 1012: }
		//;ZX-CH2-M25-60E121.C: 1013: EEADR = eeAddr;
		LDR 	71H,0 			//05EF 	0871
		BSR 	STATUS,5 		//05F0 	1A83
		STR 	1BH 			//05F1 	019B

		//;ZX-CH2-M25-60E121.C: 1014: EEDAT = data;
		LDR 	70H,0 			//05F2 	0870

		//;ZX-CH2-M25-60E121.C: 1015: EEIF = 0;
		//;ZX-CH2-M25-60E121.C: 1016: EECON1 |= 0x34;
		LCALL 	5FDH 			//05F3 	35FD
		IORWR 	1CH,1 			//05F4 	039C

		//;ZX-CH2-M25-60E121.C: 1017: WR = 1;
		BSR 	1DH,0 			//05F5 	181D

		//;ZX-CH2-M25-60E121.C: 1018: __nop();
		NOP		 					//05F6 	0000

		//;ZX-CH2-M25-60E121.C: 1019: __nop();
		NOP		 					//05F7 	0000

		//;ZX-CH2-M25-60E121.C: 1020: GIE = 1;
		BSR 	INTCON,7 		//05F8 	1B8B

		//;ZX-CH2-M25-60E121.C: 1022: ;
		BSR 	STATUS,5 		//05F9 	1A83
		BTSC 	1DH,0 			//05FA 	141D
		LJUMP 	5F9H 			//05FB 	3DF9
		RET		 					//05FC 	0004
		STR 	1AH 			//05FD 	019A
		BCR 	STATUS,5 		//05FE 	1283
		BCR 	CH,7 			//05FF 	138C
		LDWI 	34H 			//0600 	2A34
		BSR 	STATUS,5 		//0601 	1A83
		RET		 					//0602 	0004
		STR 	4CH 			//0603 	01CC

		//;ZX-CH2-M25-60E121.C: 1009: while (GIE)
		BTSS 	INTCON,7 		//0604 	1F8B
		LJUMP 	608H 			//0605 	3E08

		//;ZX-CH2-M25-60E121.C: 1010: {
		//;ZX-CH2-M25-60E121.C: 1011: GIE = 0;
		BCR 	INTCON,7 		//0606 	138B
		LJUMP 	604H 			//0607 	3E04

		//;ZX-CH2-M25-60E121.C: 1012: }
		//;ZX-CH2-M25-60E121.C: 1013: EEADR = eeAddr;
		LDR 	4CH,0 			//0608 	084C
		BSR 	STATUS,5 		//0609 	1A83
		STR 	1BH 			//060A 	019B

		//;ZX-CH2-M25-60E121.C: 1014: EEDAT = data;
		BCR 	STATUS,5 		//060B 	1283
		LDR 	4BH,0 			//060C 	084B
		BSR 	STATUS,5 		//060D 	1A83

		//;ZX-CH2-M25-60E121.C: 1015: EEIF = 0;
		//;ZX-CH2-M25-60E121.C: 1016: EECON1 |= 0x34;
		LCALL 	5FDH 			//060E 	35FD
		IORWR 	1CH,1 			//060F 	039C

		//;ZX-CH2-M25-60E121.C: 1017: WR = 1;
		BSR 	1DH,0 			//0610 	181D

		//;ZX-CH2-M25-60E121.C: 1018: __nop();
		NOP		 					//0611 	0000

		//;ZX-CH2-M25-60E121.C: 1019: __nop();
		NOP		 					//0612 	0000

		//;ZX-CH2-M25-60E121.C: 1020: GIE = 1;
		BSR 	INTCON,7 		//0613 	1B8B

		//;ZX-CH2-M25-60E121.C: 1022: ;
		BSR 	STATUS,5 		//0614 	1A83
		BTSC 	1DH,0 			//0615 	141D
		LJUMP 	614H 			//0616 	3E14
		RET		 					//0617 	0004

		//;ZX-CH2-M25-60E121.C: 115: if (Time.dutyCount2 == 0)
		LDR 	26H,0 			//0618 	0826
		IORWR 	27H,0 			//0619 	0327
		BTSS 	STATUS,2 		//061A 	1D03
		RET		 					//061B 	0004

		//;ZX-CH2-M25-60E121.C: 116: {
		//;ZX-CH2-M25-60E121.C: 117: if (shinkBits2)
		LDR 	3CH,0 			//061C 	083C
		BTSC 	STATUS,2 		//061D 	1503
		LJUMP 	626H 			//061E 	3E26

		//;ZX-CH2-M25-60E121.C: 118: {
		//;ZX-CH2-M25-60E121.C: 119: shinkBits2 = 0;
		CLRR 	3CH 			//061F 	013C

		//;ZX-CH2-M25-60E121.C: 120: Time.dutyCount2 = dutyoff;
		LDR 	73H,0 			//0620 	0873
		STR 	27H 			//0621 	01A7
		LDR 	72H,0 			//0622 	0872
		STR 	26H 			//0623 	01A6

		//;ZX-CH2-M25-60E121.C: 121: shanCnt2++;
		INCR	3DH,1 			//0624 	09BD

		//;ZX-CH2-M25-60E121.C: 122: }
		RET		 					//0625 	0004

		//;ZX-CH2-M25-60E121.C: 123: else
		//;ZX-CH2-M25-60E121.C: 124: {
		//;ZX-CH2-M25-60E121.C: 125: shinkBits2 = 0xffffffff;
		LDWI 	FFH 			//0626 	2AFF
		STR 	3CH 			//0627 	01BC

		//;ZX-CH2-M25-60E121.C: 126: Time.dutyCount2 = dutyon;
		LDR 	71H,0 			//0628 	0871
		STR 	27H 			//0629 	01A7
		LDR 	70H,0 			//062A 	0870
		STR 	26H 			//062B 	01A6
		RET		 					//062C 	0004

		//;ZX-CH2-M25-60E121.C: 133: if (Time.dutyCount == 0)
		LDR 	22H,0 			//062D 	0822
		IORWR 	23H,0 			//062E 	0323
		BTSS 	STATUS,2 		//062F 	1D03
		RET		 					//0630 	0004

		//;ZX-CH2-M25-60E121.C: 134: {
		//;ZX-CH2-M25-60E121.C: 135: if (shinkBits)
		LDR 	3BH,0 			//0631 	083B
		BTSC 	STATUS,2 		//0632 	1503
		LJUMP 	63BH 			//0633 	3E3B

		//;ZX-CH2-M25-60E121.C: 136: {
		//;ZX-CH2-M25-60E121.C: 137: shinkBits = 0;
		CLRR 	3BH 			//0634 	013B

		//;ZX-CH2-M25-60E121.C: 138: Time.dutyCount = dutyOff;
		LDR 	79H,0 			//0635 	0879
		STR 	23H 			//0636 	01A3
		LDR 	78H,0 			//0637 	0878
		STR 	22H 			//0638 	01A2

		//;ZX-CH2-M25-60E121.C: 139: shanCnt++;
		INCR	3FH,1 			//0639 	09BF

		//;ZX-CH2-M25-60E121.C: 140: }
		RET		 					//063A 	0004

		//;ZX-CH2-M25-60E121.C: 141: else
		//;ZX-CH2-M25-60E121.C: 142: {
		//;ZX-CH2-M25-60E121.C: 143: shinkBits = 0xff;
		LDWI 	FFH 			//063B 	2AFF
		STR 	3BH 			//063C 	01BB

		//;ZX-CH2-M25-60E121.C: 144: Time.dutyCount = dutyOn;
		LDR 	77H,0 			//063D 	0877
		STR 	23H 			//063E 	01A3
		LDR 	76H,0 			//063F 	0876
		STR 	22H 			//0640 	01A2
		RET		 					//0641 	0004

		//;ZX-CH2-M25-60E121.C: 103: if (ledBits & 0x01)
		BTSS 	39H,0 			//0642 	1C39
		LJUMP 	646H 			//0643 	3E46

		//;ZX-CH2-M25-60E121.C: 104: RA5 = 1;
		BSR 	5H,5 			//0644 	1A85
		LJUMP 	647H 			//0645 	3E47

		//;ZX-CH2-M25-60E121.C: 105: else
		//;ZX-CH2-M25-60E121.C: 106: RA5 = 0;
		BCR 	5H,5 			//0646 	1285

		//;ZX-CH2-M25-60E121.C: 108: if (ledBits & 0x02)
		BTSS 	39H,1 			//0647 	1CB9
		LJUMP 	64BH 			//0648 	3E4B

		//;ZX-CH2-M25-60E121.C: 109: RA4 = 1;
		BSR 	5H,4 			//0649 	1A05
		RET		 					//064A 	0004

		//;ZX-CH2-M25-60E121.C: 110: else
		//;ZX-CH2-M25-60E121.C: 111: RA4 = 0;
		BCR 	5H,4 			//064B 	1205
		RET		 					//064C 	0004
		STR 	4BH 			//064D 	01CB

		//;ZX-CH2-M25-60E121.C: 991: u8 a;
		//;ZX-CH2-M25-60E121.C: 992: for (a = 0; a < timeUs; a++)
		CLRR 	4CH 			//064E 	014C
		LDR 	4BH,0 			//064F 	084B
		SUBWR 	4CH,0 			//0650 	0C4C
		BTSC 	STATUS,0 		//0651 	1403
		RET		 					//0652 	0004

		//;ZX-CH2-M25-60E121.C: 993: {
		//;ZX-CH2-M25-60E121.C: 994: __nop();
		NOP		 					//0653 	0000
		BCR 	STATUS,5 		//0654 	1283
		INCR	4CH,1 			//0655 	09CC
		LJUMP 	64FH 			//0656 	3E4F
		BCR 	STATUS,5 		//0657 	1283
		STR 	4BH 			//0658 	01CB

		//;ZX-CH2-M25-60E121.C: 1000: u8 reEepromRead;
		//;ZX-CH2-M25-60E121.C: 1002: EEADR = eeAddr;
		BSR 	STATUS,5 		//0659 	1A83
		STR 	1BH 			//065A 	019B

		//;ZX-CH2-M25-60E121.C: 1003: RD = 1;
		BSR 	1CH,0 			//065B 	181C

		//;ZX-CH2-M25-60E121.C: 1004: reEepromRead = EEDAT;
		LDR 	1AH,0 			//065C 	081A
		BCR 	STATUS,5 		//065D 	1283
		STR 	4CH 			//065E 	01CC

		//;ZX-CH2-M25-60E121.C: 1005: return reEepromRead;
		RET		 					//065F 	0004
		CLRWDT	 			//0660 	0001
		CLRR 	INDF 			//0661 	0100
		INCR	FSR,1 			//0662 	0984
		XORWR 	FSR,0 			//0663 	0404
		BTSC 	STATUS,2 		//0664 	1503
		RETW 	0H 			//0665 	2100
		XORWR 	FSR,0 			//0666 	0404
		LJUMP 	661H 			//0667 	3E61
			END
