//Deviec:FT60F12X
//-----------------------Variable---------------------------------
		_Time		EQU		47H
		_Flag.bits.KeyHit		EQU		4BH
		_Flag.bits.ToEEPROM		EQU		4BH
		_Flag.bits.ToWhite		EQU		4BH
		_Flag.bits..		EQU		4CH
		_Flag.bits		EQU		4BH
		_Flag.allBits		EQU		4BH
		_Flag		EQU		4BH
		_Dang		EQU		7DH
		_ModeState		EQU		7CH
		_LEDBits		EQU		7BH
		_ShanCnt		EQU		50H
		_Shinkbits		EQU		7AH
		_TempH		EQU		79H
		_TempM		EQU		4FH
		_TempL		EQU		4EH
		_TempW2		EQU		4DH
//		main@i		EQU		34H
//		EEPROMwrite@EEAddr		EQU		33H
//		EEPROMwrite@EEAddr		EQU		33H
//		EEPROMwrite@Data		EQU		32H
//		EEPROMwrite@EEAddr		EQU		33H
//		EEPROMread@EEAddr		EQU		32H
//		EEPROMread@ReEEPROMread		EQU		33H
//		EEPROMread@EEAddr		EQU		32H
//		EEPROMread@EEAddr		EQU		32H
//		DelayUs@TimeUs		EQU		32H
//		DelayUs@a		EQU		33H
//		DelayUs@TimeUs		EQU		32H
//		DelayUs@TimeUs		EQU		32H
//		ModeMachine@led_sequence		EQU		20H
//		ModeMachine@F1098		EQU		35H
//		Shinking@dutyon		EQU		71H
//		Shinking@dutyon		EQU		71H
//		Shinking@dutyoff		EQU		70H
//		Shinking@dutyon		EQU		71H
//		i1EEPROMwrite@EEAddr		EQU		71H
//		i1EEPROMwrite@EEAddr		EQU		71H
//		i1EEPROMwrite@Data		EQU		70H
//		i1EEPROMwrite@EEAddr		EQU		71H
//-----------------------Variable END---------------------------------

		LJUMP 	0CH 			//0000 	380C
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	76H 			//0006 	01F6
		LDR 	FSR,0 			//0007 	0804
		STR 	77H 			//0008 	01F7
		LDR 	PCLATH,0 		//0009 	080A
		STR 	78H 			//000A 	01F8
		LJUMP 	4D2H 			//000B 	3CD2
		LJUMP 	0DH 			//000C 	380D
		LDWI 	3H 			//000D 	2A03
		STR 	35H 			//000E 	01B5
		LDWI 	6H 			//000F 	2A06
		STR 	36H 			//0010 	01B6
		LDWI 	CH 			//0011 	2A0C
		STR 	37H 			//0012 	01B7
		LDWI 	8H 			//0013 	2A08
		STR 	38H 			//0014 	01B8
		LDWI 	2H 			//0015 	2A02
		STR 	39H 			//0016 	01B9
		LDWI 	4H 			//0017 	2A04
		STR 	3AH 			//0018 	01BA
		LDWI 	1H 			//0019 	2A01
		STR 	3BH 			//001A 	01BB
		LDWI 	9H 			//001B 	2A09
		STR 	3CH 			//001C 	01BC
		LDWI 	8H 			//001D 	2A08
		STR 	3DH 			//001E 	01BD
		LDWI 	CH 			//001F 	2A0C
		STR 	3EH 			//0020 	01BE
		LDWI 	6H 			//0021 	2A06
		STR 	3FH 			//0022 	01BF
		LDWI 	3H 			//0023 	2A03
		STR 	40H 			//0024 	01C0
		LDWI 	1H 			//0025 	2A01
		STR 	41H 			//0026 	01C1
		LDWI 	8H 			//0027 	2A08
		STR 	42H 			//0028 	01C2
		LDWI 	4H 			//0029 	2A04
		STR 	43H 			//002A 	01C3
		LDWI 	CH 			//002B 	2A0C
		STR 	44H 			//002C 	01C4
		LDWI 	8H 			//002D 	2A08
		STR 	45H 			//002E 	01C5
		LDWI 	1H 			//002F 	2A01
		STR 	46H 			//0030 	01C6
		LDWI 	47H 			//0031 	2A47
		BCR 	STATUS,7 		//0032 	1383
		STR 	FSR 			//0033 	0184
		LDWI 	51H 			//0034 	2A51
		LCALL 	59AH 			//0035 	359A
		LDWI 	79H 			//0036 	2A79
		STR 	FSR 			//0037 	0184
		LDWI 	7EH 			//0038 	2A7E
		LCALL 	59AH 			//0039 	359A
		CLRR 	STATUS 			//003A 	0103
		LJUMP 	486H 			//003B 	3C86

		//;ZX-FT60F12X-4BIT.C: 197: switch (Dang)
		LJUMP 	359H 			//003C 	3B59

		//;ZX-FT60F12X-4BIT.C: 200: Shinking(5, 2);
		LDWI 	2H 			//003D 	2A02
		STR 	70H 			//003E 	01F0
		LDWI 	5H 			//003F 	2A05
		LCALL 	56CH 			//0040 	356C

		//;ZX-FT60F12X-4BIT.C: 201: LEDBits = Shinkbits;
		LDR 	7AH,0 			//0041 	087A
		STR 	7BH 			//0042 	01FB

		//;ZX-FT60F12X-4BIT.C: 202: break;
		RET		 					//0043 	0004

		//;ZX-FT60F12X-4BIT.C: 205: {
		//;ZX-FT60F12X-4BIT.C: 211: if (Time.OnOffCount == 0)
		BCR 	STATUS,5 		//0044 	1283
		LDR 	48H,0 			//0045 	0848
		IORWR 	49H,0 			//0046 	0349
		BTSS 	STATUS,2 		//0047 	1D03
		RET		 					//0048 	0004

		//;ZX-FT60F12X-4BIT.C: 212: {
		//;ZX-FT60F12X-4BIT.C: 213: Time.OnOffCount = 160;
		LDWI 	A0H 			//0049 	2AA0
		STR 	48H 			//004A 	01C8
		CLRR 	49H 			//004B 	0149

		//;ZX-FT60F12X-4BIT.C: 215: if (TempW2 == 0)
		LDR 	4DH,0 			//004C 	084D
		BTSS 	STATUS,2 		//004D 	1D03
		LJUMP 	54H 			//004E 	3854

		//;ZX-FT60F12X-4BIT.C: 216: {
		//;ZX-FT60F12X-4BIT.C: 217: LEDBits = 0x06;
		LDWI 	6H 			//004F 	2A06
		STR 	7BH 			//0050 	01FB

		//;ZX-FT60F12X-4BIT.C: 218: TempW2 = 1;
		CLRR 	4DH 			//0051 	014D
		INCR	4DH,1 			//0052 	09CD

		//;ZX-FT60F12X-4BIT.C: 219: }
		RET		 					//0053 	0004

		//;ZX-FT60F12X-4BIT.C: 220: else
		//;ZX-FT60F12X-4BIT.C: 221: {
		//;ZX-FT60F12X-4BIT.C: 222: LEDBits = 0x09;
		LDWI 	9H 			//0054 	2A09
		STR 	7BH 			//0055 	01FB

		//;ZX-FT60F12X-4BIT.C: 223: TempW2 = 0;
		CLRR 	4DH 			//0056 	014D

		//;ZX-FT60F12X-4BIT.C: 224: }
		//;ZX-FT60F12X-4BIT.C: 225: }
		//;ZX-FT60F12X-4BIT.C: 226: }
		//;ZX-FT60F12X-4BIT.C: 227: break;
		RET		 					//0057 	0004

		//;ZX-FT60F12X-4BIT.C: 230: {
		//;ZX-FT60F12X-4BIT.C: 234: if (TempM == 0)
		BCR 	STATUS,5 		//0058 	1283
		LDR 	4FH,0 			//0059 	084F
		BTSS 	STATUS,2 		//005A 	1D03
		LJUMP 	71H 			//005B 	3871

		//;ZX-FT60F12X-4BIT.C: 235: {
		//;ZX-FT60F12X-4BIT.C: 237: if (Time.DutyCount == 0)
		LDR 	47H,0 			//005C 	0847
		BTSS 	STATUS,2 		//005D 	1D03
		LJUMP 	65H 			//005E 	3865

		//;ZX-FT60F12X-4BIT.C: 238: {
		//;ZX-FT60F12X-4BIT.C: 239: if (Shinkbits)
		LDR 	7AH,0 			//005F 	087A
		BTSC 	STATUS,2 		//0060 	1503
		LJUMP 	64H 			//0061 	3864

		//;ZX-FT60F12X-4BIT.C: 240: {
		//;ZX-FT60F12X-4BIT.C: 241: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 242: Time.DutyCount = 50;
		//;ZX-FT60F12X-4BIT.C: 243: ShanCnt++;
		LCALL 	36AH 			//0062 	336A

		//;ZX-FT60F12X-4BIT.C: 244: }
		LJUMP 	65H 			//0063 	3865

		//;ZX-FT60F12X-4BIT.C: 245: else
		//;ZX-FT60F12X-4BIT.C: 246: {
		//;ZX-FT60F12X-4BIT.C: 247: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 248: Time.DutyCount = 50;
		LCALL 	365H 			//0064 	3365

		//;ZX-FT60F12X-4BIT.C: 249: }
		//;ZX-FT60F12X-4BIT.C: 250: }
		//;ZX-FT60F12X-4BIT.C: 252: LEDBits = Shinkbits;
		//;ZX-FT60F12X-4BIT.C: 254: if (ShanCnt >= 10)
		LCALL 	379H 			//0065 	3379
		BTSS 	STATUS,0 		//0066 	1C03
		RET		 					//0067 	0004

		//;ZX-FT60F12X-4BIT.C: 255: {
		//;ZX-FT60F12X-4BIT.C: 256: ShanCnt = 0;
		CLRR 	50H 			//0068 	0150
		LDWI 	F4H 			//0069 	2AF4

		//;ZX-FT60F12X-4BIT.C: 257: LEDBits = 0;
		CLRR 	7BH 			//006A 	017B

		//;ZX-FT60F12X-4BIT.C: 258: TempM = 1;
		CLRR 	4FH 			//006B 	014F
		INCR	4FH,1 			//006C 	09CF

		//;ZX-FT60F12X-4BIT.C: 259: Time.OnOffCount = 500;
		STR 	48H 			//006D 	01C8
		LDWI 	1H 			//006E 	2A01
		STR 	49H 			//006F 	01C9
		RET		 					//0070 	0004

		//;ZX-FT60F12X-4BIT.C: 262: else if (TempM == 1)
		DECRSZ 	4FH,0 		//0071 	0E4F
		RET		 					//0072 	0004

		//;ZX-FT60F12X-4BIT.C: 263: {
		//;ZX-FT60F12X-4BIT.C: 264: LEDBits = 0;
		CLRR 	7BH 			//0073 	017B

		//;ZX-FT60F12X-4BIT.C: 266: if (Time.OnOffCount == 0)
		LDR 	48H,0 			//0074 	0848
		IORWR 	49H,0 			//0075 	0349
		BTSS 	STATUS,2 		//0076 	1D03
		RET		 					//0077 	0004

		//;ZX-FT60F12X-4BIT.C: 267: {
		//;ZX-FT60F12X-4BIT.C: 268: TempM = 0;
		//;ZX-FT60F12X-4BIT.C: 269: ShanCnt = 0;
		//;ZX-FT60F12X-4BIT.C: 270: Shinkbits = 0;
		LJUMP 	386H 			//0078 	3B86

		//;ZX-FT60F12X-4BIT.C: 277: {
		//;ZX-FT60F12X-4BIT.C: 285: if (TempM == 0)
		BCR 	STATUS,5 		//0079 	1283
		LDR 	4FH,0 			//007A 	084F
		BTSS 	STATUS,2 		//007B 	1D03
		LJUMP 	91H 			//007C 	3891

		//;ZX-FT60F12X-4BIT.C: 286: {
		//;ZX-FT60F12X-4BIT.C: 288: if (Time.DutyCount == 0)
		LDR 	47H,0 			//007D 	0847
		BTSS 	STATUS,2 		//007E 	1D03
		LJUMP 	86H 			//007F 	3886

		//;ZX-FT60F12X-4BIT.C: 289: {
		//;ZX-FT60F12X-4BIT.C: 290: if (Shinkbits)
		LDR 	7AH,0 			//0080 	087A
		BTSC 	STATUS,2 		//0081 	1503
		LJUMP 	85H 			//0082 	3885

		//;ZX-FT60F12X-4BIT.C: 291: {
		//;ZX-FT60F12X-4BIT.C: 292: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 293: Time.DutyCount = 50;
		//;ZX-FT60F12X-4BIT.C: 294: ShanCnt++;
		LCALL 	36AH 			//0083 	336A

		//;ZX-FT60F12X-4BIT.C: 295: }
		LJUMP 	86H 			//0084 	3886

		//;ZX-FT60F12X-4BIT.C: 296: else
		//;ZX-FT60F12X-4BIT.C: 297: {
		//;ZX-FT60F12X-4BIT.C: 298: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 299: Time.DutyCount = 50;
		LCALL 	365H 			//0085 	3365

		//;ZX-FT60F12X-4BIT.C: 300: }
		//;ZX-FT60F12X-4BIT.C: 301: }
		//;ZX-FT60F12X-4BIT.C: 303: LEDBits = Shinkbits;
		LDR 	7AH,0 			//0086 	087A
		STR 	7BH 			//0087 	01FB

		//;ZX-FT60F12X-4BIT.C: 305: if (ShanCnt >= 10)
		LDWI 	AH 			//0088 	2A0A
		SUBWR 	50H,0 			//0089 	0C50
		BTSS 	STATUS,0 		//008A 	1C03
		RET		 					//008B 	0004
		LDWI 	64H 			//008C 	2A64

		//;ZX-FT60F12X-4BIT.C: 306: {
		//;ZX-FT60F12X-4BIT.C: 307: ShanCnt = 0;
		CLRR 	50H 			//008D 	0150

		//;ZX-FT60F12X-4BIT.C: 308: TempM = 1;
		CLRR 	4FH 			//008E 	014F
		INCR	4FH,1 			//008F 	09CF

		//;ZX-FT60F12X-4BIT.C: 309: TempL = 0;
		//;ZX-FT60F12X-4BIT.C: 310: Time.OnOffCount = 100;
		LJUMP 	38FH 			//0090 	3B8F

		//;ZX-FT60F12X-4BIT.C: 313: else if (TempM == 1)
		DECRSZ 	4FH,0 		//0091 	0E4F
		LJUMP 	D0H 			//0092 	38D0

		//;ZX-FT60F12X-4BIT.C: 314: {
		//;ZX-FT60F12X-4BIT.C: 315: if (Time.OnOffCount == 0)
		LDR 	48H,0 			//0093 	0848
		IORWR 	49H,0 			//0094 	0349
		BTSS 	STATUS,2 		//0095 	1D03
		RET		 					//0096 	0004

		//;ZX-FT60F12X-4BIT.C: 316: {
		//;ZX-FT60F12X-4BIT.C: 317: Time.OnOffCount = 100;
		//;ZX-FT60F12X-4BIT.C: 319: if (TempL == 0)
		LCALL 	38AH 			//0097 	338A
		BTSS 	STATUS,2 		//0098 	1D03
		LJUMP 	9FH 			//0099 	389F

		//;ZX-FT60F12X-4BIT.C: 320: {
		//;ZX-FT60F12X-4BIT.C: 321: LEDBits = 0x01;
		CLRR 	7BH 			//009A 	017B
		INCR	7BH,1 			//009B 	09FB

		//;ZX-FT60F12X-4BIT.C: 322: TempL = 1;
		CLRR 	4EH 			//009C 	014E
		INCR	4EH,1 			//009D 	09CE

		//;ZX-FT60F12X-4BIT.C: 323: }
		RET		 					//009E 	0004

		//;ZX-FT60F12X-4BIT.C: 324: else if (TempL == 1)
		DECRSZ 	4EH,0 		//009F 	0E4E
		LJUMP 	A5H 			//00A0 	38A5

		//;ZX-FT60F12X-4BIT.C: 325: {
		//;ZX-FT60F12X-4BIT.C: 326: LEDBits = 0x02;
		LDWI 	2H 			//00A1 	2A02
		STR 	7BH 			//00A2 	01FB

		//;ZX-FT60F12X-4BIT.C: 327: TempL = 2;
		STR 	4EH 			//00A3 	01CE

		//;ZX-FT60F12X-4BIT.C: 328: }
		RET		 					//00A4 	0004

		//;ZX-FT60F12X-4BIT.C: 329: else if (TempL == 2)
		LDWI 	2H 			//00A5 	2A02
		XORWR 	4EH,0 			//00A6 	044E
		BTSS 	STATUS,2 		//00A7 	1D03
		LJUMP 	ABH 			//00A8 	38AB

		//;ZX-FT60F12X-4BIT.C: 330: {
		//;ZX-FT60F12X-4BIT.C: 331: LEDBits = 0x04;
		LDWI 	4H 			//00A9 	2A04

		//;ZX-FT60F12X-4BIT.C: 332: TempL = 3;
		//;ZX-FT60F12X-4BIT.C: 333: }
		LJUMP 	36FH 			//00AA 	3B6F

		//;ZX-FT60F12X-4BIT.C: 334: else if (TempL == 3)
		LDWI 	3H 			//00AB 	2A03
		XORWR 	4EH,0 			//00AC 	044E
		BTSS 	STATUS,2 		//00AD 	1D03
		LJUMP 	B4H 			//00AE 	38B4

		//;ZX-FT60F12X-4BIT.C: 335: {
		//;ZX-FT60F12X-4BIT.C: 336: LEDBits = 0x08;
		LDWI 	8H 			//00AF 	2A08
		STR 	7BH 			//00B0 	01FB

		//;ZX-FT60F12X-4BIT.C: 337: TempL = 4;
		LDWI 	4H 			//00B1 	2A04
		STR 	4EH 			//00B2 	01CE

		//;ZX-FT60F12X-4BIT.C: 338: }
		RET		 					//00B3 	0004

		//;ZX-FT60F12X-4BIT.C: 339: else if (TempL == 4)
		LDWI 	4H 			//00B4 	2A04
		XORWR 	4EH,0 			//00B5 	044E
		LDWI 	5H 			//00B6 	2A05
		BTSS 	STATUS,2 		//00B7 	1D03
		LJUMP 	BAH 			//00B8 	38BA

		//;ZX-FT60F12X-4BIT.C: 340: {
		//;ZX-FT60F12X-4BIT.C: 341: LEDBits = 0x01;
		//;ZX-FT60F12X-4BIT.C: 342: TempL = 5;
		//;ZX-FT60F12X-4BIT.C: 343: }
		LJUMP 	382H 			//00B9 	3B82

		//;ZX-FT60F12X-4BIT.C: 344: else if (TempL == 5)
		XORWR 	4EH,0 			//00BA 	044E
		BTSS 	STATUS,2 		//00BB 	1D03
		LJUMP 	BFH 			//00BC 	38BF

		//;ZX-FT60F12X-4BIT.C: 345: {
		//;ZX-FT60F12X-4BIT.C: 346: LEDBits = 0x02;
		LDWI 	2H 			//00BD 	2A02

		//;ZX-FT60F12X-4BIT.C: 347: TempL = 6;
		//;ZX-FT60F12X-4BIT.C: 348: }
		LJUMP 	398H 			//00BE 	3B98

		//;ZX-FT60F12X-4BIT.C: 349: else if (TempL == 6)
		LDWI 	6H 			//00BF 	2A06
		XORWR 	4EH,0 			//00C0 	044E
		BTSS 	STATUS,2 		//00C1 	1D03
		LJUMP 	C5H 			//00C2 	38C5

		//;ZX-FT60F12X-4BIT.C: 350: {
		//;ZX-FT60F12X-4BIT.C: 351: LEDBits = 0x04;
		LDWI 	4H 			//00C3 	2A04

		//;ZX-FT60F12X-4BIT.C: 352: TempL = 7;
		//;ZX-FT60F12X-4BIT.C: 353: }
		LJUMP 	39CH 			//00C4 	3B9C

		//;ZX-FT60F12X-4BIT.C: 354: else if (TempL == 7)
		LDWI 	7H 			//00C5 	2A07
		XORWR 	4EH,0 			//00C6 	044E
		BTSS 	STATUS,2 		//00C7 	1D03
		RET		 					//00C8 	0004
		LDWI 	2H 			//00C9 	2A02

		//;ZX-FT60F12X-4BIT.C: 355: {
		//;ZX-FT60F12X-4BIT.C: 356: LEDBits = 0;
		CLRR 	7BH 			//00CA 	017B

		//;ZX-FT60F12X-4BIT.C: 357: TempL = 0;
		CLRR 	4EH 			//00CB 	014E

		//;ZX-FT60F12X-4BIT.C: 358: TempM = 2;
		STR 	4FH 			//00CC 	01CF

		//;ZX-FT60F12X-4BIT.C: 359: ShanCnt = 0;
		CLRR 	50H 			//00CD 	0150

		//;ZX-FT60F12X-4BIT.C: 360: Shinkbits = 0;
		CLRR 	7AH 			//00CE 	017A
		RET		 					//00CF 	0004

		//;ZX-FT60F12X-4BIT.C: 364: else if (TempM == 2)
		LDWI 	2H 			//00D0 	2A02
		XORWR 	4FH,0 			//00D1 	044F
		BTSS 	STATUS,2 		//00D2 	1D03
		LJUMP 	E8H 			//00D3 	38E8

		//;ZX-FT60F12X-4BIT.C: 365: {
		//;ZX-FT60F12X-4BIT.C: 367: if (Time.DutyCount == 0)
		LDR 	47H,0 			//00D4 	0847
		BTSS 	STATUS,2 		//00D5 	1D03
		LJUMP 	DDH 			//00D6 	38DD

		//;ZX-FT60F12X-4BIT.C: 368: {
		//;ZX-FT60F12X-4BIT.C: 369: if (Shinkbits)
		LDR 	7AH,0 			//00D7 	087A
		BTSC 	STATUS,2 		//00D8 	1503
		LJUMP 	DCH 			//00D9 	38DC

		//;ZX-FT60F12X-4BIT.C: 370: {
		//;ZX-FT60F12X-4BIT.C: 371: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 372: Time.DutyCount = 50;
		//;ZX-FT60F12X-4BIT.C: 373: ShanCnt++;
		LCALL 	36AH 			//00DA 	336A

		//;ZX-FT60F12X-4BIT.C: 374: }
		LJUMP 	DDH 			//00DB 	38DD

		//;ZX-FT60F12X-4BIT.C: 375: else
		//;ZX-FT60F12X-4BIT.C: 376: {
		//;ZX-FT60F12X-4BIT.C: 377: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 378: Time.DutyCount = 50;
		LCALL 	365H 			//00DC 	3365

		//;ZX-FT60F12X-4BIT.C: 379: }
		//;ZX-FT60F12X-4BIT.C: 380: }
		//;ZX-FT60F12X-4BIT.C: 382: LEDBits = Shinkbits;
		LDR 	7AH,0 			//00DD 	087A
		STR 	7BH 			//00DE 	01FB

		//;ZX-FT60F12X-4BIT.C: 384: if (ShanCnt >= 10)
		LDWI 	AH 			//00DF 	2A0A
		SUBWR 	50H,0 			//00E0 	0C50
		BTSS 	STATUS,0 		//00E1 	1C03
		RET		 					//00E2 	0004
		LDWI 	3H 			//00E3 	2A03

		//;ZX-FT60F12X-4BIT.C: 385: {
		//;ZX-FT60F12X-4BIT.C: 386: ShanCnt = 0;
		CLRR 	50H 			//00E4 	0150

		//;ZX-FT60F12X-4BIT.C: 387: TempM = 3;
		STR 	4FH 			//00E5 	01CF
		LDWI 	64H 			//00E6 	2A64

		//;ZX-FT60F12X-4BIT.C: 388: TempL = 0;
		//;ZX-FT60F12X-4BIT.C: 389: Time.OnOffCount = 100;
		LJUMP 	38FH 			//00E7 	3B8F

		//;ZX-FT60F12X-4BIT.C: 392: else if (TempM == 3)
		LDWI 	3H 			//00E8 	2A03
		XORWR 	4FH,0 			//00E9 	044F
		BTSS 	STATUS,2 		//00EA 	1D03
		RET		 					//00EB 	0004

		//;ZX-FT60F12X-4BIT.C: 393: {
		//;ZX-FT60F12X-4BIT.C: 394: if (Time.OnOffCount == 0)
		LDR 	48H,0 			//00EC 	0848
		IORWR 	49H,0 			//00ED 	0349
		BTSS 	STATUS,2 		//00EE 	1D03
		RET		 					//00EF 	0004

		//;ZX-FT60F12X-4BIT.C: 395: {
		//;ZX-FT60F12X-4BIT.C: 396: Time.OnOffCount = 100;
		//;ZX-FT60F12X-4BIT.C: 398: if (TempL == 0)
		LCALL 	38AH 			//00F0 	338A
		BTSS 	STATUS,2 		//00F1 	1D03
		LJUMP 	F8H 			//00F2 	38F8

		//;ZX-FT60F12X-4BIT.C: 399: {
		//;ZX-FT60F12X-4BIT.C: 400: LEDBits = 0x08;
		LDWI 	8H 			//00F3 	2A08
		STR 	7BH 			//00F4 	01FB

		//;ZX-FT60F12X-4BIT.C: 401: TempL = 1;
		CLRR 	4EH 			//00F5 	014E
		INCR	4EH,1 			//00F6 	09CE

		//;ZX-FT60F12X-4BIT.C: 402: }
		RET		 					//00F7 	0004

		//;ZX-FT60F12X-4BIT.C: 403: else if (TempL == 1)
		DECRSZ 	4EH,0 		//00F8 	0E4E
		LJUMP 	FCH 			//00F9 	38FC

		//;ZX-FT60F12X-4BIT.C: 404: {
		//;ZX-FT60F12X-4BIT.C: 405: LEDBits = 0x04;
		LDWI 	4H 			//00FA 	2A04

		//;ZX-FT60F12X-4BIT.C: 406: TempL = 2;
		//;ZX-FT60F12X-4BIT.C: 407: }
		LJUMP 	37EH 			//00FB 	3B7E

		//;ZX-FT60F12X-4BIT.C: 408: else if (TempL == 2)
		LDWI 	2H 			//00FC 	2A02
		XORWR 	4EH,0 			//00FD 	044E
		BTSS 	STATUS,2 		//00FE 	1D03
		LJUMP 	102H 			//00FF 	3902

		//;ZX-FT60F12X-4BIT.C: 409: {
		//;ZX-FT60F12X-4BIT.C: 410: LEDBits = 0x02;
		LDWI 	2H 			//0100 	2A02

		//;ZX-FT60F12X-4BIT.C: 411: TempL = 3;
		//;ZX-FT60F12X-4BIT.C: 412: }
		LJUMP 	36FH 			//0101 	3B6F

		//;ZX-FT60F12X-4BIT.C: 413: else if (TempL == 3)
		LDWI 	3H 			//0102 	2A03
		XORWR 	4EH,0 			//0103 	044E
		LDWI 	4H 			//0104 	2A04
		BTSS 	STATUS,2 		//0105 	1D03
		LJUMP 	108H 			//0106 	3908

		//;ZX-FT60F12X-4BIT.C: 414: {
		//;ZX-FT60F12X-4BIT.C: 415: LEDBits = 0x01;
		//;ZX-FT60F12X-4BIT.C: 416: TempL = 4;
		//;ZX-FT60F12X-4BIT.C: 417: }
		LJUMP 	382H 			//0107 	3B82

		//;ZX-FT60F12X-4BIT.C: 418: else if (TempL == 4)
		XORWR 	4EH,0 			//0108 	044E
		BTSS 	STATUS,2 		//0109 	1D03
		LJUMP 	110H 			//010A 	3910

		//;ZX-FT60F12X-4BIT.C: 419: {
		//;ZX-FT60F12X-4BIT.C: 420: LEDBits = 0x08;
		LDWI 	8H 			//010B 	2A08
		STR 	7BH 			//010C 	01FB

		//;ZX-FT60F12X-4BIT.C: 421: TempL = 5;
		LDWI 	5H 			//010D 	2A05
		STR 	4EH 			//010E 	01CE

		//;ZX-FT60F12X-4BIT.C: 422: }
		RET		 					//010F 	0004

		//;ZX-FT60F12X-4BIT.C: 423: else if (TempL == 5)
		LDWI 	5H 			//0110 	2A05
		XORWR 	4EH,0 			//0111 	044E
		BTSS 	STATUS,2 		//0112 	1D03
		LJUMP 	116H 			//0113 	3916

		//;ZX-FT60F12X-4BIT.C: 424: {
		//;ZX-FT60F12X-4BIT.C: 425: LEDBits = 0x04;
		LDWI 	4H 			//0114 	2A04

		//;ZX-FT60F12X-4BIT.C: 426: TempL = 6;
		//;ZX-FT60F12X-4BIT.C: 427: }
		LJUMP 	398H 			//0115 	3B98

		//;ZX-FT60F12X-4BIT.C: 428: else if (TempL == 6)
		LDWI 	6H 			//0116 	2A06
		XORWR 	4EH,0 			//0117 	044E
		BTSS 	STATUS,2 		//0118 	1D03
		LJUMP 	11CH 			//0119 	391C

		//;ZX-FT60F12X-4BIT.C: 429: {
		//;ZX-FT60F12X-4BIT.C: 430: LEDBits = 0x02;
		LDWI 	2H 			//011A 	2A02

		//;ZX-FT60F12X-4BIT.C: 431: TempL = 7;
		//;ZX-FT60F12X-4BIT.C: 432: }
		LJUMP 	39CH 			//011B 	3B9C

		//;ZX-FT60F12X-4BIT.C: 433: else if (TempL == 7)
		LDWI 	7H 			//011C 	2A07
		XORWR 	4EH,0 			//011D 	044E
		BTSS 	STATUS,2 		//011E 	1D03
		RET		 					//011F 	0004

		//;ZX-FT60F12X-4BIT.C: 434: {
		//;ZX-FT60F12X-4BIT.C: 435: LEDBits = 0;
		CLRR 	7BH 			//0120 	017B

		//;ZX-FT60F12X-4BIT.C: 436: TempL = 0;
		CLRR 	4EH 			//0121 	014E

		//;ZX-FT60F12X-4BIT.C: 437: TempM = 0;
		//;ZX-FT60F12X-4BIT.C: 438: ShanCnt = 0;
		//;ZX-FT60F12X-4BIT.C: 439: Shinkbits = 0;
		LJUMP 	386H 			//0122 	3B86

		//;ZX-FT60F12X-4BIT.C: 447: D8ToDo();
		LJUMP 	3AAH 			//0123 	3BAA

		//;ZX-FT60F12X-4BIT.C: 448: break;
		//;ZX-FT60F12X-4BIT.C: 451: {
		//;ZX-FT60F12X-4BIT.C: 456: Shinking(70, 70);
		LDWI 	46H 			//0124 	2A46
		STR 	70H 			//0125 	01F0
		LJUMP 	40H 			//0126 	3840

		//;ZX-FT60F12X-4BIT.C: 463: {
		//;ZX-FT60F12X-4BIT.C: 469: if (Time.OnOffCount == 0)
		BCR 	STATUS,5 		//0127 	1283
		LDR 	48H,0 			//0128 	0848
		IORWR 	49H,0 			//0129 	0349
		BTSS 	STATUS,2 		//012A 	1D03
		RET		 					//012B 	0004

		//;ZX-FT60F12X-4BIT.C: 470: {
		//;ZX-FT60F12X-4BIT.C: 471: Time.OnOffCount = 80;
		LDWI 	50H 			//012C 	2A50
		STR 	48H 			//012D 	01C8
		CLRR 	49H 			//012E 	0149

		//;ZX-FT60F12X-4BIT.C: 473: if (TempM == 0)
		LDR 	4FH,0 			//012F 	084F
		BTSS 	STATUS,2 		//0130 	1D03
		LJUMP 	146H 			//0131 	3946

		//;ZX-FT60F12X-4BIT.C: 474: {
		//;ZX-FT60F12X-4BIT.C: 475: if (TempL == 0)
		LDR 	4EH,0 			//0132 	084E
		BTSC 	STATUS,2 		//0133 	1503
		LJUMP 	9AH 			//0134 	389A

		//;ZX-FT60F12X-4BIT.C: 480: else if (TempL == 1)
		DECRSZ 	4EH,0 		//0135 	0E4E
		LJUMP 	138H 			//0136 	3938
		LJUMP 	A1H 			//0137 	38A1

		//;ZX-FT60F12X-4BIT.C: 485: else if (TempL == 2)
		LDWI 	2H 			//0138 	2A02
		XORWR 	4EH,0 			//0139 	044E
		BTSC 	STATUS,2 		//013A 	1503
		LJUMP 	A9H 			//013B 	38A9

		//;ZX-FT60F12X-4BIT.C: 490: else if (TempL == 3)
		LDWI 	3H 			//013C 	2A03
		XORWR 	4EH,0 			//013D 	044E
		BTSS 	STATUS,2 		//013E 	1D03
		RET		 					//013F 	0004

		//;ZX-FT60F12X-4BIT.C: 491: {
		//;ZX-FT60F12X-4BIT.C: 492: LEDBits = 0x08;
		LDWI 	8H 			//0140 	2A08
		STR 	7BH 			//0141 	01FB

		//;ZX-FT60F12X-4BIT.C: 493: TempL = 0;
		CLRR 	4EH 			//0142 	014E

		//;ZX-FT60F12X-4BIT.C: 494: TempM = 1;
		CLRR 	4FH 			//0143 	014F
		INCR	4FH,1 			//0144 	09CF
		RET		 					//0145 	0004

		//;ZX-FT60F12X-4BIT.C: 497: else if (TempM == 1)
		DECRSZ 	4FH,0 		//0146 	0E4F
		RET		 					//0147 	0004

		//;ZX-FT60F12X-4BIT.C: 498: {
		//;ZX-FT60F12X-4BIT.C: 499: if (TempL == 0)
		LDR 	4EH,0 			//0148 	084E
		BTSC 	STATUS,2 		//0149 	1503
		LJUMP 	F3H 			//014A 	38F3

		//;ZX-FT60F12X-4BIT.C: 504: else if (TempL == 1)
		DECRSZ 	4EH,0 		//014B 	0E4E
		LJUMP 	14EH 			//014C 	394E
		LJUMP 	FAH 			//014D 	38FA

		//;ZX-FT60F12X-4BIT.C: 509: else if (TempL == 2)
		LDWI 	2H 			//014E 	2A02
		XORWR 	4EH,0 			//014F 	044E
		BTSC 	STATUS,2 		//0150 	1503
		LJUMP 	100H 			//0151 	3900

		//;ZX-FT60F12X-4BIT.C: 514: else if (TempL == 3)
		LDWI 	3H 			//0152 	2A03
		XORWR 	4EH,0 			//0153 	044E
		BTSS 	STATUS,2 		//0154 	1D03
		RET		 					//0155 	0004

		//;ZX-FT60F12X-4BIT.C: 515: {
		//;ZX-FT60F12X-4BIT.C: 516: LEDBits = 0x01;
		CLRR 	7BH 			//0156 	017B
		INCR	7BH,1 			//0157 	09FB

		//;ZX-FT60F12X-4BIT.C: 517: TempL = 0;
		CLRR 	4EH 			//0158 	014E

		//;ZX-FT60F12X-4BIT.C: 518: TempM = 0;
		CLRR 	4FH 			//0159 	014F
		RET		 					//015A 	0004

		//;ZX-FT60F12X-4BIT.C: 526: {
		//;ZX-FT60F12X-4BIT.C: 533: if (TempM == 0)
		BCR 	STATUS,5 		//015B 	1283
		LDR 	4FH,0 			//015C 	084F
		BTSS 	STATUS,2 		//015D 	1D03
		LJUMP 	16DH 			//015E 	396D

		//;ZX-FT60F12X-4BIT.C: 534: {
		//;ZX-FT60F12X-4BIT.C: 536: Shinking(50, 50);
		LDWI 	32H 			//015F 	2A32
		STR 	70H 			//0160 	01F0
		LCALL 	56CH 			//0161 	356C

		//;ZX-FT60F12X-4BIT.C: 538: LEDBits = Shinkbits & 0x0C;
		LDR 	7AH,0 			//0162 	087A
		STR 	7BH 			//0163 	01FB
		LDWI 	CH 			//0164 	2A0C
		ANDWR 	7BH,1 			//0165 	02FB

		//;ZX-FT60F12X-4BIT.C: 540: if (ShanCnt >= 6)
		LDWI 	6H 			//0166 	2A06
		SUBWR 	50H,0 			//0167 	0C50
		BTSS 	STATUS,0 		//0168 	1C03
		RET		 					//0169 	0004

		//;ZX-FT60F12X-4BIT.C: 541: {
		//;ZX-FT60F12X-4BIT.C: 542: ShanCnt = 0;
		CLRR 	50H 			//016A 	0150

		//;ZX-FT60F12X-4BIT.C: 543: Shinkbits = 0;
		CLRR 	7AH 			//016B 	017A
		LJUMP 	143H 			//016C 	3943

		//;ZX-FT60F12X-4BIT.C: 547: else if (TempM == 1)
		DECRSZ 	4FH,0 		//016D 	0E4F
		LJUMP 	17FH 			//016E 	397F

		//;ZX-FT60F12X-4BIT.C: 548: {
		//;ZX-FT60F12X-4BIT.C: 550: Shinking(50, 50);
		LDWI 	32H 			//016F 	2A32
		STR 	70H 			//0170 	01F0
		LCALL 	56CH 			//0171 	356C

		//;ZX-FT60F12X-4BIT.C: 552: LEDBits = Shinkbits & 0x03;
		LDR 	7AH,0 			//0172 	087A
		STR 	7BH 			//0173 	01FB
		LDWI 	3H 			//0174 	2A03
		ANDWR 	7BH,1 			//0175 	02FB

		//;ZX-FT60F12X-4BIT.C: 554: if (ShanCnt >= 6)
		LDWI 	6H 			//0176 	2A06
		SUBWR 	50H,0 			//0177 	0C50
		BTSS 	STATUS,0 		//0178 	1C03
		RET		 					//0179 	0004

		//;ZX-FT60F12X-4BIT.C: 555: {
		//;ZX-FT60F12X-4BIT.C: 556: ShanCnt = 0;
		CLRR 	50H 			//017A 	0150

		//;ZX-FT60F12X-4BIT.C: 557: Shinkbits = 0;
		CLRR 	7AH 			//017B 	017A

		//;ZX-FT60F12X-4BIT.C: 558: TempM = 2;
		LDWI 	2H 			//017C 	2A02
		STR 	4FH 			//017D 	01CF
		RET		 					//017E 	0004

		//;ZX-FT60F12X-4BIT.C: 561: else if (TempM == 2)
		LDWI 	2H 			//017F 	2A02
		XORWR 	4FH,0 			//0180 	044F
		BTSS 	STATUS,2 		//0181 	1D03
		RET		 					//0182 	0004

		//;ZX-FT60F12X-4BIT.C: 562: {
		//;ZX-FT60F12X-4BIT.C: 564: Shinking(50, 50);
		LDWI 	32H 			//0183 	2A32
		STR 	70H 			//0184 	01F0
		LCALL 	56CH 			//0185 	356C

		//;ZX-FT60F12X-4BIT.C: 566: LEDBits = Shinkbits & 0x0F;
		LDR 	7AH,0 			//0186 	087A
		STR 	7BH 			//0187 	01FB
		LDWI 	FH 			//0188 	2A0F
		ANDWR 	7BH,1 			//0189 	02FB

		//;ZX-FT60F12X-4BIT.C: 568: if (ShanCnt >= 12)
		LDWI 	CH 			//018A 	2A0C
		SUBWR 	50H,0 			//018B 	0C50
		BTSS 	STATUS,0 		//018C 	1C03
		RET		 					//018D 	0004

		//;ZX-FT60F12X-4BIT.C: 569: {
		//;ZX-FT60F12X-4BIT.C: 570: ShanCnt = 0;
		CLRR 	50H 			//018E 	0150

		//;ZX-FT60F12X-4BIT.C: 571: Shinkbits = 0;
		CLRR 	7AH 			//018F 	017A

		//;ZX-FT60F12X-4BIT.C: 572: TempM = 0;
		CLRR 	4FH 			//0190 	014F
		RET		 					//0191 	0004

		//;ZX-FT60F12X-4BIT.C: 579: {
		//;ZX-FT60F12X-4BIT.C: 585: if (TempM == 0)
		BCR 	STATUS,5 		//0192 	1283
		LDR 	4FH,0 			//0193 	084F
		BTSS 	STATUS,2 		//0194 	1D03
		LJUMP 	19FH 			//0195 	399F

		//;ZX-FT60F12X-4BIT.C: 586: {
		//;ZX-FT60F12X-4BIT.C: 588: Shinking(50, 50);
		LDWI 	32H 			//0196 	2A32
		STR 	70H 			//0197 	01F0
		LCALL 	56CH 			//0198 	356C

		//;ZX-FT60F12X-4BIT.C: 590: LEDBits = Shinkbits & 0x0C;
		LDR 	7AH,0 			//0199 	087A
		STR 	7BH 			//019A 	01FB
		LDWI 	CH 			//019B 	2A0C
		ANDWR 	7BH,1 			//019C 	02FB

		//;ZX-FT60F12X-4BIT.C: 592: if (ShanCnt >= 10)
		LDWI 	AH 			//019D 	2A0A
		LJUMP 	167H 			//019E 	3967

		//;ZX-FT60F12X-4BIT.C: 599: else if (TempM == 1)
		DECRSZ 	4FH,0 		//019F 	0E4F
		RET		 					//01A0 	0004

		//;ZX-FT60F12X-4BIT.C: 600: {
		//;ZX-FT60F12X-4BIT.C: 602: Shinking(50, 50);
		LDWI 	32H 			//01A1 	2A32
		STR 	70H 			//01A2 	01F0
		LCALL 	56CH 			//01A3 	356C

		//;ZX-FT60F12X-4BIT.C: 604: LEDBits = Shinkbits & 0x03;
		LDR 	7AH,0 			//01A4 	087A
		STR 	7BH 			//01A5 	01FB
		LDWI 	3H 			//01A6 	2A03
		ANDWR 	7BH,1 			//01A7 	02FB

		//;ZX-FT60F12X-4BIT.C: 606: if (ShanCnt >= 10)
		LDWI 	AH 			//01A8 	2A0A
		LJUMP 	18BH 			//01A9 	398B

		//;ZX-FT60F12X-4BIT.C: 617: {
		//;ZX-FT60F12X-4BIT.C: 622: if (Time.OnOffCount == 0)
		BCR 	STATUS,5 		//01AA 	1283
		LDR 	48H,0 			//01AB 	0848
		IORWR 	49H,0 			//01AC 	0349
		BTSS 	STATUS,2 		//01AD 	1D03
		RET		 					//01AE 	0004

		//;ZX-FT60F12X-4BIT.C: 623: {
		//;ZX-FT60F12X-4BIT.C: 624: Time.OnOffCount = 60;
		LDWI 	3CH 			//01AF 	2A3C
		STR 	48H 			//01B0 	01C8
		LDWI 	20H 			//01B1 	2A20
		CLRR 	49H 			//01B2 	0149

		//;ZX-FT60F12X-4BIT.C: 627: u8 led_sequence[18] = {
		//;ZX-FT60F12X-4BIT.C: 628: 0x03, 0x06, 0x0C, 0x08, 0x02, 0x04, 0x01, 0x09,
		//;ZX-FT60F12X-4BIT.C: 629: 0x08, 0x0C, 0x06, 0x03, 0x01, 0x08, 0x04, 0x0C,
		//;ZX-FT60F12X-4BIT.C: 630: 0x08, 0x01
		//;ZX-FT60F12X-4BIT.C: 631: };
		STR 	FSR 			//01B3 	0184
		LDWI 	35H 			//01B4 	2A35
		STR 	72H 			//01B5 	01F2
		LDR 	FSR,0 			//01B6 	0804
		STR 	73H 			//01B7 	01F3
		LDWI 	12H 			//01B8 	2A12
		STR 	74H 			//01B9 	01F4
		LDR 	72H,0 			//01BA 	0872
		STR 	FSR 			//01BB 	0184
		BCR 	STATUS,7 		//01BC 	1383
		LDR 	INDF,0 			//01BD 	0800
		STR 	75H 			//01BE 	01F5
		INCR	72H,1 			//01BF 	09F2
		LDR 	73H,0 			//01C0 	0873
		STR 	FSR 			//01C1 	0184
		LDR 	75H,0 			//01C2 	0875
		STR 	INDF 			//01C3 	0180
		INCR	73H,1 			//01C4 	09F3
		DECRSZ 	74H,1 		//01C5 	0EF4
		LJUMP 	1BAH 			//01C6 	39BA

		//;ZX-FT60F12X-4BIT.C: 634: LEDBits = led_sequence[TempL];
		LDR 	4EH,0 			//01C7 	084E
		ADDWI 	20H 			//01C8 	2720
		STR 	FSR 			//01C9 	0184
		LDR 	INDF,0 			//01CA 	0800
		STR 	7BH 			//01CB 	01FB
		LDWI 	12H 			//01CC 	2A12

		//;ZX-FT60F12X-4BIT.C: 637: TempL++;
		INCR	4EH,1 			//01CD 	09CE

		//;ZX-FT60F12X-4BIT.C: 638: if (TempL >= 18)
		SUBWR 	4EH,0 			//01CE 	0C4E
		BTSS 	STATUS,0 		//01CF 	1C03
		RET		 					//01D0 	0004

		//;ZX-FT60F12X-4BIT.C: 639: TempL = 0;
		CLRR 	4EH 			//01D1 	014E
		RET		 					//01D2 	0004

		//;ZX-FT60F12X-4BIT.C: 645: {
		//;ZX-FT60F12X-4BIT.C: 654: if (Time.OnOffCount == 0)
		BCR 	STATUS,5 		//01D3 	1283
		LDR 	48H,0 			//01D4 	0848
		IORWR 	49H,0 			//01D5 	0349
		BTSS 	STATUS,2 		//01D6 	1D03
		RET		 					//01D7 	0004

		//;ZX-FT60F12X-4BIT.C: 655: {
		//;ZX-FT60F12X-4BIT.C: 656: if (TempM == 0)
		LDR 	4FH,0 			//01D8 	084F
		BTSS 	STATUS,2 		//01D9 	1D03
		LJUMP 	1E1H 			//01DA 	39E1

		//;ZX-FT60F12X-4BIT.C: 657: {
		//;ZX-FT60F12X-4BIT.C: 658: LEDBits = 0x06;
		LDWI 	6H 			//01DB 	2A06
		STR 	7BH 			//01DC 	01FB

		//;ZX-FT60F12X-4BIT.C: 659: Time.OnOffCount = 50;
		LDWI 	32H 			//01DD 	2A32
		STR 	48H 			//01DE 	01C8
		CLRR 	49H 			//01DF 	0149
		LJUMP 	143H 			//01E0 	3943

		//;ZX-FT60F12X-4BIT.C: 662: else if (TempM == 1)
		DECRSZ 	4FH,0 		//01E1 	0E4F
		LJUMP 	1E8H 			//01E2 	39E8
		LDWI 	78H 			//01E3 	2A78

		//;ZX-FT60F12X-4BIT.C: 663: {
		//;ZX-FT60F12X-4BIT.C: 664: LEDBits = 0;
		CLRR 	7BH 			//01E4 	017B

		//;ZX-FT60F12X-4BIT.C: 665: Time.OnOffCount = 120;
		STR 	48H 			//01E5 	01C8
		CLRR 	49H 			//01E6 	0149
		LJUMP 	17CH 			//01E7 	397C

		//;ZX-FT60F12X-4BIT.C: 668: else if (TempM == 2)
		LDWI 	2H 			//01E8 	2A02
		XORWR 	4FH,0 			//01E9 	044F
		BTSS 	STATUS,2 		//01EA 	1D03
		LJUMP 	1F4H 			//01EB 	39F4

		//;ZX-FT60F12X-4BIT.C: 669: {
		//;ZX-FT60F12X-4BIT.C: 670: LEDBits = 0x0F;
		LDWI 	FH 			//01EC 	2A0F
		STR 	7BH 			//01ED 	01FB

		//;ZX-FT60F12X-4BIT.C: 671: Time.OnOffCount = 50;
		LDWI 	32H 			//01EE 	2A32
		STR 	48H 			//01EF 	01C8
		LDWI 	3H 			//01F0 	2A03
		CLRR 	49H 			//01F1 	0149

		//;ZX-FT60F12X-4BIT.C: 672: TempM = 3;
		STR 	4FH 			//01F2 	01CF

		//;ZX-FT60F12X-4BIT.C: 673: }
		RET		 					//01F3 	0004

		//;ZX-FT60F12X-4BIT.C: 674: else if (TempM == 3)
		LDWI 	3H 			//01F4 	2A03
		XORWR 	4FH,0 			//01F5 	044F
		BTSS 	STATUS,2 		//01F6 	1D03
		RET		 					//01F7 	0004
		LDWI 	32H 			//01F8 	2A32

		//;ZX-FT60F12X-4BIT.C: 675: {
		//;ZX-FT60F12X-4BIT.C: 676: LEDBits = 0;
		CLRR 	7BH 			//01F9 	017B

		//;ZX-FT60F12X-4BIT.C: 677: Time.OnOffCount = 50;
		STR 	48H 			//01FA 	01C8
		CLRR 	49H 			//01FB 	0149

		//;ZX-FT60F12X-4BIT.C: 678: TempM = 0;
		CLRR 	4FH 			//01FC 	014F
		RET		 					//01FD 	0004

		//;ZX-FT60F12X-4BIT.C: 685: {
		//;ZX-FT60F12X-4BIT.C: 692: if (Time.OnOffCount == 0)
		BCR 	STATUS,5 		//01FE 	1283
		LDR 	48H,0 			//01FF 	0848
		IORWR 	49H,0 			//0200 	0349
		BTSS 	STATUS,2 		//0201 	1D03
		RET		 					//0202 	0004

		//;ZX-FT60F12X-4BIT.C: 693: {
		//;ZX-FT60F12X-4BIT.C: 694: if (TempM == 0)
		LDR 	4FH,0 			//0203 	084F
		BTSS 	STATUS,2 		//0204 	1D03
		LJUMP 	213H 			//0205 	3A13

		//;ZX-FT60F12X-4BIT.C: 695: {
		//;ZX-FT60F12X-4BIT.C: 697: if (Time.DutyCount == 0)
		LDR 	47H,0 			//0206 	0847
		BTSS 	STATUS,2 		//0207 	1D03
		LJUMP 	20FH 			//0208 	3A0F

		//;ZX-FT60F12X-4BIT.C: 698: {
		//;ZX-FT60F12X-4BIT.C: 699: if (Shinkbits)
		LDR 	7AH,0 			//0209 	087A
		BTSC 	STATUS,2 		//020A 	1503
		LJUMP 	20EH 			//020B 	3A0E

		//;ZX-FT60F12X-4BIT.C: 700: {
		//;ZX-FT60F12X-4BIT.C: 701: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 702: Time.DutyCount = 40;
		//;ZX-FT60F12X-4BIT.C: 703: ShanCnt++;
		LCALL 	3A5H 			//020C 	33A5

		//;ZX-FT60F12X-4BIT.C: 704: }
		LJUMP 	20FH 			//020D 	3A0F

		//;ZX-FT60F12X-4BIT.C: 705: else
		//;ZX-FT60F12X-4BIT.C: 706: {
		//;ZX-FT60F12X-4BIT.C: 707: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 708: Time.DutyCount = 40;
		LCALL 	393H 			//020E 	3393

		//;ZX-FT60F12X-4BIT.C: 709: }
		//;ZX-FT60F12X-4BIT.C: 710: }
		//;ZX-FT60F12X-4BIT.C: 712: LEDBits = Shinkbits & 0x05;
		LDR 	7AH,0 			//020F 	087A
		STR 	7BH 			//0210 	01FB
		LDWI 	5H 			//0211 	2A05
		LJUMP 	165H 			//0212 	3965

		//;ZX-FT60F12X-4BIT.C: 714: if (ShanCnt >= 6)
		//;ZX-FT60F12X-4BIT.C: 721: else if (TempM == 1)
		DECRSZ 	4FH,0 		//0213 	0E4F
		RET		 					//0214 	0004

		//;ZX-FT60F12X-4BIT.C: 722: {
		//;ZX-FT60F12X-4BIT.C: 724: if (Time.DutyCount == 0)
		LDR 	47H,0 			//0215 	0847
		BTSS 	STATUS,2 		//0216 	1D03
		LJUMP 	21EH 			//0217 	3A1E

		//;ZX-FT60F12X-4BIT.C: 725: {
		//;ZX-FT60F12X-4BIT.C: 726: if (Shinkbits)
		LDR 	7AH,0 			//0218 	087A
		BTSC 	STATUS,2 		//0219 	1503
		LJUMP 	21DH 			//021A 	3A1D

		//;ZX-FT60F12X-4BIT.C: 727: {
		//;ZX-FT60F12X-4BIT.C: 728: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 729: Time.DutyCount = 40;
		//;ZX-FT60F12X-4BIT.C: 730: ShanCnt++;
		LCALL 	3A5H 			//021B 	33A5

		//;ZX-FT60F12X-4BIT.C: 731: }
		LJUMP 	21EH 			//021C 	3A1E

		//;ZX-FT60F12X-4BIT.C: 732: else
		//;ZX-FT60F12X-4BIT.C: 733: {
		//;ZX-FT60F12X-4BIT.C: 734: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 735: Time.DutyCount = 40;
		LCALL 	393H 			//021D 	3393

		//;ZX-FT60F12X-4BIT.C: 736: }
		//;ZX-FT60F12X-4BIT.C: 737: }
		//;ZX-FT60F12X-4BIT.C: 739: LEDBits = Shinkbits & 0x0A;
		LDR 	7AH,0 			//021E 	087A
		STR 	7BH 			//021F 	01FB
		LDWI 	AH 			//0220 	2A0A
		ANDWR 	7BH,1 			//0221 	02FB

		//;ZX-FT60F12X-4BIT.C: 741: if (ShanCnt >= 6)
		LDWI 	6H 			//0222 	2A06
		LJUMP 	18BH 			//0223 	398B

		//;ZX-FT60F12X-4BIT.C: 753: {
		//;ZX-FT60F12X-4BIT.C: 759: if (Time.OnOffCount == 0)
		BCR 	STATUS,5 		//0224 	1283
		LDR 	48H,0 			//0225 	0848
		IORWR 	49H,0 			//0226 	0349
		BTSS 	STATUS,2 		//0227 	1D03
		RET		 					//0228 	0004

		//;ZX-FT60F12X-4BIT.C: 760: {
		//;ZX-FT60F12X-4BIT.C: 761: Time.OnOffCount = 20;
		LDWI 	14H 			//0229 	2A14
		LJUMP 	12DH 			//022A 	392D

		//;ZX-FT60F12X-4BIT.C: 804: else if (TempL == 3)
		//;ZX-FT60F12X-4BIT.C: 799: else if (TempL == 2)
		//;ZX-FT60F12X-4BIT.C: 794: else if (TempL == 1)
		//;ZX-FT60F12X-4BIT.C: 788: {
		//;ZX-FT60F12X-4BIT.C: 789: if (TempL == 0)
		//;ZX-FT60F12X-4BIT.C: 787: else if (TempM == 1)
		//;ZX-FT60F12X-4BIT.C: 780: else if (TempL == 3)
		//;ZX-FT60F12X-4BIT.C: 775: else if (TempL == 2)
		//;ZX-FT60F12X-4BIT.C: 770: else if (TempL == 1)
		//;ZX-FT60F12X-4BIT.C: 764: {
		//;ZX-FT60F12X-4BIT.C: 765: if (TempL == 0)
		//;ZX-FT60F12X-4BIT.C: 763: if (TempM == 0)
		//;ZX-FT60F12X-4BIT.C: 816: {
		//;ZX-FT60F12X-4BIT.C: 824: if (Time.OnOffCount == 0)
		BCR 	STATUS,5 		//022B 	1283
		LDR 	48H,0 			//022C 	0848
		IORWR 	49H,0 			//022D 	0349
		BTSS 	STATUS,2 		//022E 	1D03
		RET		 					//022F 	0004

		//;ZX-FT60F12X-4BIT.C: 825: {
		//;ZX-FT60F12X-4BIT.C: 826: Time.OnOffCount = 80;
		LDWI 	50H 			//0230 	2A50
		STR 	48H 			//0231 	01C8
		CLRR 	49H 			//0232 	0149

		//;ZX-FT60F12X-4BIT.C: 828: if (TempM == 0)
		LDR 	4FH,0 			//0233 	084F
		BTSS 	STATUS,2 		//0234 	1D03
		LJUMP 	249H 			//0235 	3A49

		//;ZX-FT60F12X-4BIT.C: 829: {
		//;ZX-FT60F12X-4BIT.C: 830: if (TempL == 0)
		LDR 	4EH,0 			//0236 	084E
		BTSC 	STATUS,2 		//0237 	1503
		LJUMP 	9AH 			//0238 	389A

		//;ZX-FT60F12X-4BIT.C: 835: else if (TempL == 1)
		DECRSZ 	4EH,0 		//0239 	0E4E
		LJUMP 	23DH 			//023A 	3A3D

		//;ZX-FT60F12X-4BIT.C: 836: {
		//;ZX-FT60F12X-4BIT.C: 837: LEDBits = 0x03;
		LDWI 	3H 			//023B 	2A03

		//;ZX-FT60F12X-4BIT.C: 838: TempL = 2;
		//;ZX-FT60F12X-4BIT.C: 839: }
		LJUMP 	37EH 			//023C 	3B7E

		//;ZX-FT60F12X-4BIT.C: 840: else if (TempL == 2)
		LDWI 	2H 			//023D 	2A02
		XORWR 	4EH,0 			//023E 	044E
		BTSS 	STATUS,2 		//023F 	1D03
		LJUMP 	243H 			//0240 	3A43

		//;ZX-FT60F12X-4BIT.C: 841: {
		//;ZX-FT60F12X-4BIT.C: 842: LEDBits = 0x07;
		LDWI 	7H 			//0241 	2A07

		//;ZX-FT60F12X-4BIT.C: 843: TempL = 3;
		//;ZX-FT60F12X-4BIT.C: 844: }
		LJUMP 	36FH 			//0242 	3B6F

		//;ZX-FT60F12X-4BIT.C: 845: else if (TempL == 3)
		LDWI 	3H 			//0243 	2A03
		XORWR 	4EH,0 			//0244 	044E
		BTSS 	STATUS,2 		//0245 	1D03
		RET		 					//0246 	0004

		//;ZX-FT60F12X-4BIT.C: 846: {
		//;ZX-FT60F12X-4BIT.C: 847: LEDBits = 0x0F;
		LDWI 	FH 			//0247 	2A0F
		LJUMP 	141H 			//0248 	3941

		//;ZX-FT60F12X-4BIT.C: 852: else if (TempM == 1)
		DECRSZ 	4FH,0 		//0249 	0E4F
		LJUMP 	261H 			//024A 	3A61

		//;ZX-FT60F12X-4BIT.C: 853: {
		//;ZX-FT60F12X-4BIT.C: 854: if (TempL == 0)
		LDR 	4EH,0 			//024B 	084E
		BTSS 	STATUS,2 		//024C 	1D03
		LJUMP 	250H 			//024D 	3A50

		//;ZX-FT60F12X-4BIT.C: 855: {
		//;ZX-FT60F12X-4BIT.C: 856: LEDBits = 0x0E;
		LDWI 	EH 			//024E 	2A0E
		LJUMP 	F4H 			//024F 	38F4

		//;ZX-FT60F12X-4BIT.C: 859: else if (TempL == 1)
		DECRSZ 	4EH,0 		//0250 	0E4E
		LJUMP 	254H 			//0251 	3A54

		//;ZX-FT60F12X-4BIT.C: 860: {
		//;ZX-FT60F12X-4BIT.C: 861: LEDBits = 0x0C;
		LDWI 	CH 			//0252 	2A0C

		//;ZX-FT60F12X-4BIT.C: 862: TempL = 2;
		//;ZX-FT60F12X-4BIT.C: 863: }
		LJUMP 	37EH 			//0253 	3B7E

		//;ZX-FT60F12X-4BIT.C: 864: else if (TempL == 2)
		LDWI 	2H 			//0254 	2A02
		XORWR 	4EH,0 			//0255 	044E
		BTSS 	STATUS,2 		//0256 	1D03
		LJUMP 	25AH 			//0257 	3A5A

		//;ZX-FT60F12X-4BIT.C: 865: {
		//;ZX-FT60F12X-4BIT.C: 866: LEDBits = 0x08;
		LDWI 	8H 			//0258 	2A08

		//;ZX-FT60F12X-4BIT.C: 867: TempL = 3;
		//;ZX-FT60F12X-4BIT.C: 868: }
		LJUMP 	36FH 			//0259 	3B6F

		//;ZX-FT60F12X-4BIT.C: 869: else if (TempL == 3)
		LDWI 	3H 			//025A 	2A03
		XORWR 	4EH,0 			//025B 	044E
		BTSS 	STATUS,2 		//025C 	1D03
		RET		 					//025D 	0004

		//;ZX-FT60F12X-4BIT.C: 870: {
		//;ZX-FT60F12X-4BIT.C: 871: LEDBits = 0x00;
		CLRR 	7BH 			//025E 	017B

		//;ZX-FT60F12X-4BIT.C: 872: TempL = 0;
		CLRR 	4EH 			//025F 	014E
		LJUMP 	17CH 			//0260 	397C

		//;ZX-FT60F12X-4BIT.C: 876: else if (TempM == 2)
		LDWI 	2H 			//0261 	2A02
		XORWR 	4FH,0 			//0262 	044F
		BTSS 	STATUS,2 		//0263 	1D03
		LJUMP 	277H 			//0264 	3A77

		//;ZX-FT60F12X-4BIT.C: 877: {
		//;ZX-FT60F12X-4BIT.C: 878: if (TempL == 0)
		LDR 	4EH,0 			//0265 	084E
		BTSC 	STATUS,2 		//0266 	1503
		LJUMP 	F3H 			//0267 	38F3

		//;ZX-FT60F12X-4BIT.C: 883: else if (TempL == 1)
		DECRSZ 	4EH,0 		//0268 	0E4E
		LJUMP 	26BH 			//0269 	3A6B
		LJUMP 	252H 			//026A 	3A52

		//;ZX-FT60F12X-4BIT.C: 888: else if (TempL == 2)
		LDWI 	2H 			//026B 	2A02
		XORWR 	4EH,0 			//026C 	044E
		BTSS 	STATUS,2 		//026D 	1D03
		LJUMP 	271H 			//026E 	3A71

		//;ZX-FT60F12X-4BIT.C: 889: {
		//;ZX-FT60F12X-4BIT.C: 890: LEDBits = 0x0E;
		LDWI 	EH 			//026F 	2A0E

		//;ZX-FT60F12X-4BIT.C: 891: TempL = 3;
		//;ZX-FT60F12X-4BIT.C: 892: }
		LJUMP 	36FH 			//0270 	3B6F

		//;ZX-FT60F12X-4BIT.C: 893: else if (TempL == 3)
		LDWI 	3H 			//0271 	2A03
		XORWR 	4EH,0 			//0272 	044E
		BTSS 	STATUS,2 		//0273 	1D03
		RET		 					//0274 	0004

		//;ZX-FT60F12X-4BIT.C: 894: {
		//;ZX-FT60F12X-4BIT.C: 895: LEDBits = 0x0F;
		//;ZX-FT60F12X-4BIT.C: 896: TempL = 0;
		//;ZX-FT60F12X-4BIT.C: 897: TempM = 3;
		LCALL 	373H 			//0275 	3373
		RET		 					//0276 	0004

		//;ZX-FT60F12X-4BIT.C: 900: else if (TempM == 3)
		LDWI 	3H 			//0277 	2A03
		XORWR 	4FH,0 			//0278 	044F
		BTSS 	STATUS,2 		//0279 	1D03
		RET		 					//027A 	0004

		//;ZX-FT60F12X-4BIT.C: 901: {
		//;ZX-FT60F12X-4BIT.C: 902: if (TempL == 0)
		LDR 	4EH,0 			//027B 	084E
		BTSS 	STATUS,2 		//027C 	1D03
		LJUMP 	280H 			//027D 	3A80

		//;ZX-FT60F12X-4BIT.C: 903: {
		//;ZX-FT60F12X-4BIT.C: 904: LEDBits = 0x07;
		LDWI 	7H 			//027E 	2A07
		LJUMP 	F4H 			//027F 	38F4

		//;ZX-FT60F12X-4BIT.C: 907: else if (TempL == 1)
		DECRSZ 	4EH,0 		//0280 	0E4E
		LJUMP 	283H 			//0281 	3A83
		LJUMP 	23BH 			//0282 	3A3B

		//;ZX-FT60F12X-4BIT.C: 912: else if (TempL == 2)
		LDWI 	2H 			//0283 	2A02
		XORWR 	4EH,0 			//0284 	044E
		LDWI 	3H 			//0285 	2A03
		BTSS 	STATUS,2 		//0286 	1D03
		LJUMP 	289H 			//0287 	3A89

		//;ZX-FT60F12X-4BIT.C: 913: {
		//;ZX-FT60F12X-4BIT.C: 914: LEDBits = 0x01;
		//;ZX-FT60F12X-4BIT.C: 915: TempL = 3;
		//;ZX-FT60F12X-4BIT.C: 916: }
		LJUMP 	382H 			//0288 	3B82

		//;ZX-FT60F12X-4BIT.C: 917: else if (TempL == 3)
		XORWR 	4EH,0 			//0289 	044E
		BTSS 	STATUS,2 		//028A 	1D03
		RET		 					//028B 	0004

		//;ZX-FT60F12X-4BIT.C: 918: {
		//;ZX-FT60F12X-4BIT.C: 919: LEDBits = 0x00;
		CLRR 	7BH 			//028C 	017B

		//;ZX-FT60F12X-4BIT.C: 920: TempL = 0;
		CLRR 	4EH 			//028D 	014E

		//;ZX-FT60F12X-4BIT.C: 921: TempM = 0;
		CLRR 	4FH 			//028E 	014F
		RET		 					//028F 	0004

		//;ZX-FT60F12X-4BIT.C: 929: {
		//;ZX-FT60F12X-4BIT.C: 935: if (TempM == 0)
		BCR 	STATUS,5 		//0290 	1283
		LDR 	4FH,0 			//0291 	084F
		BTSS 	STATUS,2 		//0292 	1D03
		LJUMP 	71H 			//0293 	3871

		//;ZX-FT60F12X-4BIT.C: 936: {
		//;ZX-FT60F12X-4BIT.C: 938: if (Time.DutyCount == 0)
		LDR 	47H,0 			//0294 	0847
		BTSS 	STATUS,2 		//0295 	1D03
		LJUMP 	29DH 			//0296 	3A9D

		//;ZX-FT60F12X-4BIT.C: 939: {
		//;ZX-FT60F12X-4BIT.C: 940: if (Shinkbits)
		LDR 	7AH,0 			//0297 	087A
		BTSC 	STATUS,2 		//0298 	1503
		LJUMP 	29CH 			//0299 	3A9C

		//;ZX-FT60F12X-4BIT.C: 941: {
		//;ZX-FT60F12X-4BIT.C: 942: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 943: Time.DutyCount = 50;
		//;ZX-FT60F12X-4BIT.C: 944: ShanCnt++;
		LCALL 	36AH 			//029A 	336A

		//;ZX-FT60F12X-4BIT.C: 945: }
		LJUMP 	29DH 			//029B 	3A9D

		//;ZX-FT60F12X-4BIT.C: 946: else
		//;ZX-FT60F12X-4BIT.C: 947: {
		//;ZX-FT60F12X-4BIT.C: 948: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 949: Time.DutyCount = 50;
		LCALL 	365H 			//029C 	3365

		//;ZX-FT60F12X-4BIT.C: 950: }
		//;ZX-FT60F12X-4BIT.C: 951: }
		//;ZX-FT60F12X-4BIT.C: 953: LEDBits = Shinkbits;
		//;ZX-FT60F12X-4BIT.C: 955: if (ShanCnt >= 10)
		LCALL 	379H 			//029D 	3379
		BTSS 	STATUS,0 		//029E 	1C03
		RET		 					//029F 	0004

		//;ZX-FT60F12X-4BIT.C: 956: {
		//;ZX-FT60F12X-4BIT.C: 957: ShanCnt = 0;
		CLRR 	50H 			//02A0 	0150

		//;ZX-FT60F12X-4BIT.C: 958: Shinkbits = 0;
		CLRR 	7AH 			//02A1 	017A
		LJUMP 	69H 			//02A2 	3869

		//;ZX-FT60F12X-4BIT.C: 968: if (Time.OnOffCount == 0)
		//;ZX-FT60F12X-4BIT.C: 965: {
		//;ZX-FT60F12X-4BIT.C: 966: LEDBits = 0;
		//;ZX-FT60F12X-4BIT.C: 964: else if (TempM == 1)
		//;ZX-FT60F12X-4BIT.C: 959: LEDBits = 0;
		//;ZX-FT60F12X-4BIT.C: 979: {
		//;ZX-FT60F12X-4BIT.C: 985: if (Time.OnOffCount == 0)
		BCR 	STATUS,5 		//02A3 	1283
		LDR 	48H,0 			//02A4 	0848
		IORWR 	49H,0 			//02A5 	0349
		BTSS 	STATUS,2 		//02A6 	1D03
		RET		 					//02A7 	0004

		//;ZX-FT60F12X-4BIT.C: 986: {
		//;ZX-FT60F12X-4BIT.C: 987: Time.OnOffCount = 150;
		LDWI 	96H 			//02A8 	2A96
		LJUMP 	12DH 			//02A9 	392D

		//;ZX-FT60F12X-4BIT.C: 1030: else if (TempL == 3)
		//;ZX-FT60F12X-4BIT.C: 1025: else if (TempL == 2)
		//;ZX-FT60F12X-4BIT.C: 1020: else if (TempL == 1)
		//;ZX-FT60F12X-4BIT.C: 1014: {
		//;ZX-FT60F12X-4BIT.C: 1015: if (TempL == 0)
		//;ZX-FT60F12X-4BIT.C: 1013: else if (TempM == 1)
		//;ZX-FT60F12X-4BIT.C: 1006: else if (TempL == 3)
		//;ZX-FT60F12X-4BIT.C: 1001: else if (TempL == 2)
		//;ZX-FT60F12X-4BIT.C: 996: else if (TempL == 1)
		//;ZX-FT60F12X-4BIT.C: 990: {
		//;ZX-FT60F12X-4BIT.C: 991: if (TempL == 0)
		//;ZX-FT60F12X-4BIT.C: 989: if (TempM == 0)
		//;ZX-FT60F12X-4BIT.C: 1042: {
		//;ZX-FT60F12X-4BIT.C: 1050: if (TempM == 0)
		BCR 	STATUS,5 		//02AA 	1283
		LDR 	4FH,0 			//02AB 	084F
		BTSS 	STATUS,2 		//02AC 	1D03
		LJUMP 	2C6H 			//02AD 	3AC6

		//;ZX-FT60F12X-4BIT.C: 1051: {
		//;ZX-FT60F12X-4BIT.C: 1052: if (Time.OnOffCount == 0)
		LDR 	48H,0 			//02AE 	0848
		IORWR 	49H,0 			//02AF 	0349
		BTSS 	STATUS,2 		//02B0 	1D03
		RET		 					//02B1 	0004

		//;ZX-FT60F12X-4BIT.C: 1053: {
		//;ZX-FT60F12X-4BIT.C: 1054: Time.OnOffCount = 60;
		//;ZX-FT60F12X-4BIT.C: 1056: if (TempL == 0)
		LCALL 	3A0H 			//02B2 	33A0
		BTSC 	STATUS,2 		//02B3 	1503
		LJUMP 	9AH 			//02B4 	389A

		//;ZX-FT60F12X-4BIT.C: 1061: else if (TempL == 1)
		DECRSZ 	4EH,0 		//02B5 	0E4E
		LJUMP 	2B8H 			//02B6 	3AB8
		LJUMP 	23BH 			//02B7 	3A3B

		//;ZX-FT60F12X-4BIT.C: 1066: else if (TempL == 2)
		LDWI 	2H 			//02B8 	2A02
		XORWR 	4EH,0 			//02B9 	044E
		BTSC 	STATUS,2 		//02BA 	1503
		LJUMP 	241H 			//02BB 	3A41

		//;ZX-FT60F12X-4BIT.C: 1071: else if (TempL == 3)
		LDWI 	3H 			//02BC 	2A03
		XORWR 	4EH,0 			//02BD 	044E
		BTSS 	STATUS,2 		//02BE 	1D03
		RET		 					//02BF 	0004

		//;ZX-FT60F12X-4BIT.C: 1072: {
		//;ZX-FT60F12X-4BIT.C: 1073: LEDBits = 0x0F;
		LDWI 	FH 			//02C0 	2A0F
		STR 	7BH 			//02C1 	01FB

		//;ZX-FT60F12X-4BIT.C: 1074: TempL = 0;
		CLRR 	4EH 			//02C2 	014E

		//;ZX-FT60F12X-4BIT.C: 1075: TempM = 1;
		CLRR 	4FH 			//02C3 	014F
		INCR	4FH,1 			//02C4 	09CF
		LJUMP 	CDH 			//02C5 	38CD

		//;ZX-FT60F12X-4BIT.C: 1081: else if (TempM == 1)
		DECRSZ 	4FH,0 		//02C6 	0E4F
		LJUMP 	2DDH 			//02C7 	3ADD

		//;ZX-FT60F12X-4BIT.C: 1082: {
		//;ZX-FT60F12X-4BIT.C: 1084: if (Time.DutyCount == 0)
		LDR 	47H,0 			//02C8 	0847
		BTSS 	STATUS,2 		//02C9 	1D03
		LJUMP 	2D1H 			//02CA 	3AD1

		//;ZX-FT60F12X-4BIT.C: 1085: {
		//;ZX-FT60F12X-4BIT.C: 1086: if (Shinkbits)
		LDR 	7AH,0 			//02CB 	087A
		BTSC 	STATUS,2 		//02CC 	1503
		LJUMP 	2D0H 			//02CD 	3AD0

		//;ZX-FT60F12X-4BIT.C: 1087: {
		//;ZX-FT60F12X-4BIT.C: 1088: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 1089: Time.DutyCount = 50;
		//;ZX-FT60F12X-4BIT.C: 1090: ShanCnt++;
		LCALL 	36AH 			//02CE 	336A

		//;ZX-FT60F12X-4BIT.C: 1091: }
		LJUMP 	2D1H 			//02CF 	3AD1

		//;ZX-FT60F12X-4BIT.C: 1092: else
		//;ZX-FT60F12X-4BIT.C: 1093: {
		//;ZX-FT60F12X-4BIT.C: 1094: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 1095: Time.DutyCount = 50;
		LCALL 	365H 			//02D0 	3365

		//;ZX-FT60F12X-4BIT.C: 1096: }
		//;ZX-FT60F12X-4BIT.C: 1097: }
		//;ZX-FT60F12X-4BIT.C: 1099: LEDBits = Shinkbits;
		LDR 	7AH,0 			//02D1 	087A
		STR 	7BH 			//02D2 	01FB

		//;ZX-FT60F12X-4BIT.C: 1101: if (ShanCnt >= 10)
		LDWI 	AH 			//02D3 	2A0A
		SUBWR 	50H,0 			//02D4 	0C50
		BTSS 	STATUS,0 		//02D5 	1C03
		RET		 					//02D6 	0004
		LDWI 	2H 			//02D7 	2A02

		//;ZX-FT60F12X-4BIT.C: 1102: {
		//;ZX-FT60F12X-4BIT.C: 1103: ShanCnt = 0;
		CLRR 	50H 			//02D8 	0150

		//;ZX-FT60F12X-4BIT.C: 1104: Shinkbits = 0;
		CLRR 	7AH 			//02D9 	017A

		//;ZX-FT60F12X-4BIT.C: 1105: LEDBits = 0;
		CLRR 	7BH 			//02DA 	017B

		//;ZX-FT60F12X-4BIT.C: 1106: TempM = 2;
		STR 	4FH 			//02DB 	01CF
		LJUMP 	1D1H 			//02DC 	39D1

		//;ZX-FT60F12X-4BIT.C: 1110: else if (TempM == 2)
		LDWI 	2H 			//02DD 	2A02
		XORWR 	4FH,0 			//02DE 	044F
		BTSS 	STATUS,2 		//02DF 	1D03
		LJUMP 	2F7H 			//02E0 	3AF7

		//;ZX-FT60F12X-4BIT.C: 1111: {
		//;ZX-FT60F12X-4BIT.C: 1112: if (Time.OnOffCount == 0)
		LDR 	48H,0 			//02E1 	0848
		IORWR 	49H,0 			//02E2 	0349
		BTSS 	STATUS,2 		//02E3 	1D03
		RET		 					//02E4 	0004

		//;ZX-FT60F12X-4BIT.C: 1113: {
		//;ZX-FT60F12X-4BIT.C: 1114: Time.OnOffCount = 60;
		//;ZX-FT60F12X-4BIT.C: 1116: if (TempL == 0)
		LCALL 	3A0H 			//02E5 	33A0
		BTSC 	STATUS,2 		//02E6 	1503
		LJUMP 	F3H 			//02E7 	38F3

		//;ZX-FT60F12X-4BIT.C: 1121: else if (TempL == 1)
		DECRSZ 	4EH,0 		//02E8 	0E4E
		LJUMP 	2EBH 			//02E9 	3AEB
		LJUMP 	252H 			//02EA 	3A52

		//;ZX-FT60F12X-4BIT.C: 1126: else if (TempL == 2)
		LDWI 	2H 			//02EB 	2A02
		XORWR 	4EH,0 			//02EC 	044E
		BTSC 	STATUS,2 		//02ED 	1503
		LJUMP 	26FH 			//02EE 	3A6F

		//;ZX-FT60F12X-4BIT.C: 1131: else if (TempL == 3)
		LDWI 	3H 			//02EF 	2A03
		XORWR 	4EH,0 			//02F0 	044E
		BTSS 	STATUS,2 		//02F1 	1D03
		RET		 					//02F2 	0004

		//;ZX-FT60F12X-4BIT.C: 1132: {
		//;ZX-FT60F12X-4BIT.C: 1133: LEDBits = 0x0F;
		//;ZX-FT60F12X-4BIT.C: 1134: TempL = 0;
		//;ZX-FT60F12X-4BIT.C: 1135: TempM = 3;
		LCALL 	373H 			//02F3 	3373

		//;ZX-FT60F12X-4BIT.C: 1136: ShanCnt = 0;
		CLRR 	50H 			//02F4 	0150

		//;ZX-FT60F12X-4BIT.C: 1137: Shinkbits = 0;
		CLRR 	7AH 			//02F5 	017A
		RET		 					//02F6 	0004

		//;ZX-FT60F12X-4BIT.C: 1141: else if (TempM == 3)
		LDWI 	3H 			//02F7 	2A03
		XORWR 	4FH,0 			//02F8 	044F
		BTSS 	STATUS,2 		//02F9 	1D03
		RET		 					//02FA 	0004

		//;ZX-FT60F12X-4BIT.C: 1142: {
		//;ZX-FT60F12X-4BIT.C: 1144: if (Time.DutyCount == 0)
		LDR 	47H,0 			//02FB 	0847
		BTSS 	STATUS,2 		//02FC 	1D03
		LJUMP 	304H 			//02FD 	3B04

		//;ZX-FT60F12X-4BIT.C: 1145: {
		//;ZX-FT60F12X-4BIT.C: 1146: if (Shinkbits)
		LDR 	7AH,0 			//02FE 	087A
		BTSC 	STATUS,2 		//02FF 	1503
		LJUMP 	303H 			//0300 	3B03

		//;ZX-FT60F12X-4BIT.C: 1147: {
		//;ZX-FT60F12X-4BIT.C: 1148: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 1149: Time.DutyCount = 50;
		//;ZX-FT60F12X-4BIT.C: 1150: ShanCnt++;
		LCALL 	36AH 			//0301 	336A

		//;ZX-FT60F12X-4BIT.C: 1151: }
		LJUMP 	304H 			//0302 	3B04

		//;ZX-FT60F12X-4BIT.C: 1152: else
		//;ZX-FT60F12X-4BIT.C: 1153: {
		//;ZX-FT60F12X-4BIT.C: 1154: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 1155: Time.DutyCount = 50;
		LCALL 	365H 			//0303 	3365

		//;ZX-FT60F12X-4BIT.C: 1156: }
		//;ZX-FT60F12X-4BIT.C: 1157: }
		//;ZX-FT60F12X-4BIT.C: 1159: LEDBits = Shinkbits;
		//;ZX-FT60F12X-4BIT.C: 1161: if (ShanCnt >= 10)
		LCALL 	379H 			//0304 	3379
		BTSS 	STATUS,0 		//0305 	1C03
		RET		 					//0306 	0004

		//;ZX-FT60F12X-4BIT.C: 1162: {
		//;ZX-FT60F12X-4BIT.C: 1163: ShanCnt = 0;
		CLRR 	50H 			//0307 	0150

		//;ZX-FT60F12X-4BIT.C: 1164: Shinkbits = 0;
		CLRR 	7AH 			//0308 	017A

		//;ZX-FT60F12X-4BIT.C: 1165: LEDBits = 0;
		CLRR 	7BH 			//0309 	017B

		//;ZX-FT60F12X-4BIT.C: 1166: TempM = 0;
		CLRR 	4FH 			//030A 	014F

		//;ZX-FT60F12X-4BIT.C: 1167: TempL = 0;
		CLRR 	4EH 			//030B 	014E
		RET		 					//030C 	0004

		//;ZX-FT60F12X-4BIT.C: 1174: {
		//;ZX-FT60F12X-4BIT.C: 1181: if (Time.DutyCount == 0)
		BCR 	STATUS,5 		//030D 	1283
		LDR 	47H,0 			//030E 	0847
		BTSS 	STATUS,2 		//030F 	1D03
		LJUMP 	31DH 			//0310 	3B1D

		//;ZX-FT60F12X-4BIT.C: 1182: {
		//;ZX-FT60F12X-4BIT.C: 1183: if (Shinkbits)
		LDR 	7AH,0 			//0311 	087A
		BTSC 	STATUS,2 		//0312 	1503
		LJUMP 	319H 			//0313 	3B19
		LDWI 	1EH 			//0314 	2A1E

		//;ZX-FT60F12X-4BIT.C: 1184: {
		//;ZX-FT60F12X-4BIT.C: 1185: Shinkbits = 0;
		CLRR 	7AH 			//0315 	017A

		//;ZX-FT60F12X-4BIT.C: 1186: Time.DutyCount = 30;
		STR 	47H 			//0316 	01C7

		//;ZX-FT60F12X-4BIT.C: 1187: ShanCnt++;
		INCR	50H,1 			//0317 	09D0

		//;ZX-FT60F12X-4BIT.C: 1188: }
		LJUMP 	31DH 			//0318 	3B1D

		//;ZX-FT60F12X-4BIT.C: 1189: else
		//;ZX-FT60F12X-4BIT.C: 1190: {
		//;ZX-FT60F12X-4BIT.C: 1191: Shinkbits = 0x0F;
		LDWI 	FH 			//0319 	2A0F
		STR 	7AH 			//031A 	01FA

		//;ZX-FT60F12X-4BIT.C: 1192: Time.DutyCount = 30;
		LDWI 	1EH 			//031B 	2A1E
		STR 	47H 			//031C 	01C7

		//;ZX-FT60F12X-4BIT.C: 1193: }
		//;ZX-FT60F12X-4BIT.C: 1194: }
		//;ZX-FT60F12X-4BIT.C: 1196: if (Time.OnOffCount == 0)
		LDR 	48H,0 			//031D 	0848
		IORWR 	49H,0 			//031E 	0349
		BTSS 	STATUS,2 		//031F 	1D03
		LJUMP 	34DH 			//0320 	3B4D

		//;ZX-FT60F12X-4BIT.C: 1197: {
		//;ZX-FT60F12X-4BIT.C: 1198: if (TempM == 0)
		LDR 	4FH,0 			//0321 	084F
		BTSS 	STATUS,2 		//0322 	1D03
		LJUMP 	338H 			//0323 	3B38

		//;ZX-FT60F12X-4BIT.C: 1199: {
		//;ZX-FT60F12X-4BIT.C: 1200: Time.OnOffCount = 480;
		LDWI 	E0H 			//0324 	2AE0
		STR 	48H 			//0325 	01C8
		LDWI 	1H 			//0326 	2A01
		STR 	49H 			//0327 	01C9

		//;ZX-FT60F12X-4BIT.C: 1201: TempL++;
		INCR	4EH,1 			//0328 	09CE

		//;ZX-FT60F12X-4BIT.C: 1204: if (TempL % 2 == 0)
		BTSC 	4EH,0 			//0329 	144E
		LJUMP 	32FH 			//032A 	3B2F

		//;ZX-FT60F12X-4BIT.C: 1205: {
		//;ZX-FT60F12X-4BIT.C: 1206: LEDBits = Shinkbits & 0x09;
		LDR 	7AH,0 			//032B 	087A
		STR 	7BH 			//032C 	01FB
		LDWI 	9H 			//032D 	2A09
		LJUMP 	332H 			//032E 	3B32

		//;ZX-FT60F12X-4BIT.C: 1207: }
		//;ZX-FT60F12X-4BIT.C: 1208: else
		//;ZX-FT60F12X-4BIT.C: 1209: {
		//;ZX-FT60F12X-4BIT.C: 1210: LEDBits = Shinkbits & 0x06;
		LDR 	7AH,0 			//032F 	087A
		STR 	7BH 			//0330 	01FB
		LDWI 	6H 			//0331 	2A06
		ANDWR 	7BH,1 			//0332 	02FB

		//;ZX-FT60F12X-4BIT.C: 1211: }
		//;ZX-FT60F12X-4BIT.C: 1213: if (TempL >= 14)
		LDWI 	EH 			//0333 	2A0E
		SUBWR 	4EH,0 			//0334 	0C4E
		BTSS 	STATUS,0 		//0335 	1C03
		RET		 					//0336 	0004
		LJUMP 	142H 			//0337 	3942

		//;ZX-FT60F12X-4BIT.C: 1219: else if (TempM == 1)
		DECRSZ 	4FH,0 		//0338 	0E4F
		RET		 					//0339 	0004

		//;ZX-FT60F12X-4BIT.C: 1220: {
		//;ZX-FT60F12X-4BIT.C: 1221: Time.OnOffCount = 140;
		LDWI 	8CH 			//033A 	2A8C
		STR 	48H 			//033B 	01C8
		CLRR 	49H 			//033C 	0149

		//;ZX-FT60F12X-4BIT.C: 1222: TempL++;
		INCR	4EH,1 			//033D 	09CE

		//;ZX-FT60F12X-4BIT.C: 1224: if (TempL % 2 == 0)
		BTSC 	4EH,0 			//033E 	144E
		LJUMP 	344H 			//033F 	3B44

		//;ZX-FT60F12X-4BIT.C: 1225: {
		//;ZX-FT60F12X-4BIT.C: 1226: LEDBits = Shinkbits & 0x09;
		LDR 	7AH,0 			//0340 	087A
		STR 	7BH 			//0341 	01FB
		LDWI 	9H 			//0342 	2A09
		LJUMP 	347H 			//0343 	3B47

		//;ZX-FT60F12X-4BIT.C: 1227: }
		//;ZX-FT60F12X-4BIT.C: 1228: else
		//;ZX-FT60F12X-4BIT.C: 1229: {
		//;ZX-FT60F12X-4BIT.C: 1230: LEDBits = Shinkbits & 0x06;
		LDR 	7AH,0 			//0344 	087A
		STR 	7BH 			//0345 	01FB
		LDWI 	6H 			//0346 	2A06
		ANDWR 	7BH,1 			//0347 	02FB

		//;ZX-FT60F12X-4BIT.C: 1231: }
		//;ZX-FT60F12X-4BIT.C: 1233: if (TempL >= 10)
		LDWI 	AH 			//0348 	2A0A
		SUBWR 	4EH,0 			//0349 	0C4E
		BTSS 	STATUS,0 		//034A 	1C03
		RET		 					//034B 	0004
		LJUMP 	158H 			//034C 	3958

		//;ZX-FT60F12X-4BIT.C: 1240: else
		//;ZX-FT60F12X-4BIT.C: 1241: {
		//;ZX-FT60F12X-4BIT.C: 1243: if (TempL % 2 == 0)
		BTSC 	4EH,0 			//034D 	144E
		LJUMP 	354H 			//034E 	3B54

		//;ZX-FT60F12X-4BIT.C: 1244: {
		//;ZX-FT60F12X-4BIT.C: 1245: LEDBits = Shinkbits & 0x09;
		LDR 	7AH,0 			//034F 	087A
		STR 	7BH 			//0350 	01FB
		LDWI 	9H 			//0351 	2A09
		ANDWR 	7BH,1 			//0352 	02FB

		//;ZX-FT60F12X-4BIT.C: 1246: }
		RET		 					//0353 	0004

		//;ZX-FT60F12X-4BIT.C: 1247: else
		//;ZX-FT60F12X-4BIT.C: 1248: {
		//;ZX-FT60F12X-4BIT.C: 1249: LEDBits = Shinkbits & 0x06;
		LDR 	7AH,0 			//0354 	087A
		STR 	7BH 			//0355 	01FB
		LDWI 	6H 			//0356 	2A06
		ANDWR 	7BH,1 			//0357 	02FB
		RET		 					//0358 	0004
		LDR 	7DH,0 			//0359 	087D
		STR 	FSR 			//035A 	0184
		LDWI 	12H 			//035B 	2A12
		SUBWR 	FSR,0 			//035C 	0C04
		BTSC 	STATUS,0 		//035D 	1403
		RET		 					//035E 	0004
		LDWI 	5H 			//035F 	2A05
		STR 	PCLATH 			//0360 	018A
		LDWI 	5AH 			//0361 	2A5A
		ADDWR 	FSR,0 			//0362 	0B04
		STR 	PCL 			//0363 	0182
		RET		 					//0364 	0004
		LDWI 	FFH 			//0365 	2AFF
		STR 	7AH 			//0366 	01FA
		LDWI 	32H 			//0367 	2A32
		STR 	47H 			//0368 	01C7
		RET		 					//0369 	0004
		LDWI 	32H 			//036A 	2A32
		CLRR 	7AH 			//036B 	017A
		STR 	47H 			//036C 	01C7
		INCR	50H,1 			//036D 	09D0
		RET		 					//036E 	0004
		STR 	7BH 			//036F 	01FB
		LDWI 	3H 			//0370 	2A03
		STR 	4EH 			//0371 	01CE
		RET		 					//0372 	0004
		LDWI 	FH 			//0373 	2A0F
		STR 	7BH 			//0374 	01FB
		LDWI 	3H 			//0375 	2A03
		CLRR 	4EH 			//0376 	014E
		STR 	4FH 			//0377 	01CF
		RET		 					//0378 	0004
		LDR 	7AH,0 			//0379 	087A
		STR 	7BH 			//037A 	01FB
		LDWI 	AH 			//037B 	2A0A
		SUBWR 	50H,0 			//037C 	0C50
		RET		 					//037D 	0004
		STR 	7BH 			//037E 	01FB
		LDWI 	2H 			//037F 	2A02
		STR 	4EH 			//0380 	01CE
		RET		 					//0381 	0004
		CLRR 	7BH 			//0382 	017B
		INCR	7BH,1 			//0383 	09FB
		STR 	4EH 			//0384 	01CE
		RET		 					//0385 	0004
		CLRR 	4FH 			//0386 	014F
		CLRR 	50H 			//0387 	0150
		CLRR 	7AH 			//0388 	017A
		RET		 					//0389 	0004
		LDWI 	64H 			//038A 	2A64
		STR 	48H 			//038B 	01C8
		CLRR 	49H 			//038C 	0149
		LDR 	4EH,0 			//038D 	084E
		RET		 					//038E 	0004
		CLRR 	4EH 			//038F 	014E
		STR 	48H 			//0390 	01C8
		CLRR 	49H 			//0391 	0149
		RET		 					//0392 	0004
		LDWI 	FFH 			//0393 	2AFF
		STR 	7AH 			//0394 	01FA
		LDWI 	28H 			//0395 	2A28
		STR 	47H 			//0396 	01C7
		RET		 					//0397 	0004
		STR 	7BH 			//0398 	01FB
		LDWI 	6H 			//0399 	2A06
		STR 	4EH 			//039A 	01CE
		RET		 					//039B 	0004
		STR 	7BH 			//039C 	01FB
		LDWI 	7H 			//039D 	2A07
		STR 	4EH 			//039E 	01CE
		RET		 					//039F 	0004
		LDWI 	3CH 			//03A0 	2A3C
		STR 	48H 			//03A1 	01C8
		CLRR 	49H 			//03A2 	0149
		LDR 	4EH,0 			//03A3 	084E
		RET		 					//03A4 	0004
		LDWI 	28H 			//03A5 	2A28
		CLRR 	7AH 			//03A6 	017A
		STR 	47H 			//03A7 	01C7
		INCR	50H,1 			//03A8 	09D0
		RET		 					//03A9 	0004

		//;ZX-FT60F12X-4BIT.C: 1262: if (Time.OnOffCount == 0)
		BCR 	STATUS,5 		//03AA 	1283
		LDR 	48H,0 			//03AB 	0848
		IORWR 	49H,0 			//03AC 	0349
		BTSS 	STATUS,2 		//03AD 	1D03
		RET		 					//03AE 	0004

		//;ZX-FT60F12X-4BIT.C: 1263: {
		//;ZX-FT60F12X-4BIT.C: 1264: Time.OnOffCount = 30;
		LDWI 	1EH 			//03AF 	2A1E
		STR 	48H 			//03B0 	01C8
		CLRR 	49H 			//03B1 	0149

		//;ZX-FT60F12X-4BIT.C: 1265: switch (ModeState)
		LJUMP 	471H 			//03B2 	3C71

		//;ZX-FT60F12X-4BIT.C: 1268: if (TempH == 0)
		LDR 	79H,0 			//03B3 	0879
		BTSS 	STATUS,2 		//03B4 	1D03
		LJUMP 	3B8H 			//03B5 	3BB8

		//;ZX-FT60F12X-4BIT.C: 1269: TempH = 0x01;
		CLRR 	79H 			//03B6 	0179
		INCR	79H,1 			//03B7 	09F9

		//;ZX-FT60F12X-4BIT.C: 1271: if (Shinkbits)
		LDR 	7AH,0 			//03B8 	087A
		BTSC 	STATUS,2 		//03B9 	1503
		LJUMP 	3BEH 			//03BA 	3BBE

		//;ZX-FT60F12X-4BIT.C: 1272: {
		//;ZX-FT60F12X-4BIT.C: 1273: Shinkbits = 0;
		CLRR 	7AH 			//03BB 	017A

		//;ZX-FT60F12X-4BIT.C: 1274: LEDBits = 0;
		CLRR 	7BH 			//03BC 	017B

		//;ZX-FT60F12X-4BIT.C: 1275: }
		LJUMP 	3BFH 			//03BD 	3BBF

		//;ZX-FT60F12X-4BIT.C: 1276: else
		//;ZX-FT60F12X-4BIT.C: 1277: {
		//;ZX-FT60F12X-4BIT.C: 1278: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 1279: LEDBits = TempH;
		LCALL 	47DH 			//03BE 	347D
		LDWI 	6H 			//03BF 	2A06

		//;ZX-FT60F12X-4BIT.C: 1280: }
		//;ZX-FT60F12X-4BIT.C: 1281: ShanCnt++;
		INCR	50H,1 			//03C0 	09D0

		//;ZX-FT60F12X-4BIT.C: 1282: if (ShanCnt >= 6)
		SUBWR 	50H,0 			//03C1 	0C50
		BTSS 	STATUS,0 		//03C2 	1C03
		RET		 					//03C3 	0004

		//;ZX-FT60F12X-4BIT.C: 1283: {
		//;ZX-FT60F12X-4BIT.C: 1284: ShanCnt = 0;
		CLRR 	50H 			//03C4 	0150

		//;ZX-FT60F12X-4BIT.C: 1285: Shinkbits = 0;
		CLRR 	7AH 			//03C5 	017A

		//;ZX-FT60F12X-4BIT.C: 1286: ModeState = 1;
		CLRR 	7CH 			//03C6 	017C
		INCR	7CH,1 			//03C7 	09FC

		//;ZX-FT60F12X-4BIT.C: 1287: }
		//;ZX-FT60F12X-4BIT.C: 1288: break;
		RET		 					//03C8 	0004

		//;ZX-FT60F12X-4BIT.C: 1291: TempH = 0x03;
		LDWI 	3H 			//03C9 	2A03
		STR 	79H 			//03CA 	01F9

		//;ZX-FT60F12X-4BIT.C: 1293: if (Shinkbits)
		LDR 	7AH,0 			//03CB 	087A
		BTSC 	STATUS,2 		//03CC 	1503
		LJUMP 	3D1H 			//03CD 	3BD1

		//;ZX-FT60F12X-4BIT.C: 1294: {
		//;ZX-FT60F12X-4BIT.C: 1295: Shinkbits = 0;
		CLRR 	7AH 			//03CE 	017A

		//;ZX-FT60F12X-4BIT.C: 1296: LEDBits = 0;
		CLRR 	7BH 			//03CF 	017B

		//;ZX-FT60F12X-4BIT.C: 1297: }
		LJUMP 	3D2H 			//03D0 	3BD2

		//;ZX-FT60F12X-4BIT.C: 1298: else
		//;ZX-FT60F12X-4BIT.C: 1299: {
		//;ZX-FT60F12X-4BIT.C: 1300: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 1301: LEDBits = TempH;
		LCALL 	47DH 			//03D1 	347D
		LDWI 	6H 			//03D2 	2A06

		//;ZX-FT60F12X-4BIT.C: 1302: }
		//;ZX-FT60F12X-4BIT.C: 1303: ShanCnt++;
		INCR	50H,1 			//03D3 	09D0

		//;ZX-FT60F12X-4BIT.C: 1304: if (ShanCnt >= 6)
		SUBWR 	50H,0 			//03D4 	0C50
		BTSS 	STATUS,0 		//03D5 	1C03
		RET		 					//03D6 	0004
		LDWI 	2H 			//03D7 	2A02

		//;ZX-FT60F12X-4BIT.C: 1305: {
		//;ZX-FT60F12X-4BIT.C: 1306: ShanCnt = 0;
		//;ZX-FT60F12X-4BIT.C: 1307: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 1308: ModeState = 2;
		LJUMP 	482H 			//03D8 	3C82

		//;ZX-FT60F12X-4BIT.C: 1313: TempH = 0x07;
		LDWI 	7H 			//03D9 	2A07
		STR 	79H 			//03DA 	01F9

		//;ZX-FT60F12X-4BIT.C: 1315: if (Shinkbits)
		LDR 	7AH,0 			//03DB 	087A
		BTSC 	STATUS,2 		//03DC 	1503
		LJUMP 	3E1H 			//03DD 	3BE1

		//;ZX-FT60F12X-4BIT.C: 1316: {
		//;ZX-FT60F12X-4BIT.C: 1317: Shinkbits = 0;
		CLRR 	7AH 			//03DE 	017A

		//;ZX-FT60F12X-4BIT.C: 1318: LEDBits = 0;
		CLRR 	7BH 			//03DF 	017B

		//;ZX-FT60F12X-4BIT.C: 1319: }
		LJUMP 	3E2H 			//03E0 	3BE2

		//;ZX-FT60F12X-4BIT.C: 1320: else
		//;ZX-FT60F12X-4BIT.C: 1321: {
		//;ZX-FT60F12X-4BIT.C: 1322: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 1323: LEDBits = TempH;
		LCALL 	47DH 			//03E1 	347D
		LDWI 	6H 			//03E2 	2A06

		//;ZX-FT60F12X-4BIT.C: 1324: }
		//;ZX-FT60F12X-4BIT.C: 1325: ShanCnt++;
		INCR	50H,1 			//03E3 	09D0

		//;ZX-FT60F12X-4BIT.C: 1326: if (ShanCnt >= 6)
		SUBWR 	50H,0 			//03E4 	0C50
		BTSS 	STATUS,0 		//03E5 	1C03
		RET		 					//03E6 	0004
		LDWI 	3H 			//03E7 	2A03

		//;ZX-FT60F12X-4BIT.C: 1327: {
		//;ZX-FT60F12X-4BIT.C: 1328: ShanCnt = 0;
		//;ZX-FT60F12X-4BIT.C: 1329: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 1330: ModeState = 3;
		LJUMP 	482H 			//03E8 	3C82

		//;ZX-FT60F12X-4BIT.C: 1335: TempH = 0x0F;
		LDWI 	FH 			//03E9 	2A0F
		STR 	79H 			//03EA 	01F9

		//;ZX-FT60F12X-4BIT.C: 1337: if (Shinkbits)
		LDR 	7AH,0 			//03EB 	087A
		BTSC 	STATUS,2 		//03EC 	1503
		LJUMP 	3F1H 			//03ED 	3BF1

		//;ZX-FT60F12X-4BIT.C: 1338: {
		//;ZX-FT60F12X-4BIT.C: 1339: Shinkbits = 0;
		CLRR 	7AH 			//03EE 	017A

		//;ZX-FT60F12X-4BIT.C: 1340: LEDBits = 0;
		CLRR 	7BH 			//03EF 	017B

		//;ZX-FT60F12X-4BIT.C: 1341: }
		LJUMP 	3F2H 			//03F0 	3BF2

		//;ZX-FT60F12X-4BIT.C: 1342: else
		//;ZX-FT60F12X-4BIT.C: 1343: {
		//;ZX-FT60F12X-4BIT.C: 1344: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 1345: LEDBits = TempH;
		LCALL 	47DH 			//03F1 	347D
		LDWI 	6H 			//03F2 	2A06

		//;ZX-FT60F12X-4BIT.C: 1346: }
		//;ZX-FT60F12X-4BIT.C: 1347: ShanCnt++;
		INCR	50H,1 			//03F3 	09D0

		//;ZX-FT60F12X-4BIT.C: 1348: if (ShanCnt >= 6)
		SUBWR 	50H,0 			//03F4 	0C50
		BTSS 	STATUS,0 		//03F5 	1C03
		RET		 					//03F6 	0004
		LDWI 	4H 			//03F7 	2A04

		//;ZX-FT60F12X-4BIT.C: 1349: {
		//;ZX-FT60F12X-4BIT.C: 1350: ShanCnt = 0;
		//;ZX-FT60F12X-4BIT.C: 1351: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 1352: ModeState = 4;
		LJUMP 	482H 			//03F8 	3C82

		//;ZX-FT60F12X-4BIT.C: 1357: TempH = 0x0E;
		LDWI 	EH 			//03F9 	2A0E
		STR 	79H 			//03FA 	01F9

		//;ZX-FT60F12X-4BIT.C: 1359: if (Shinkbits)
		LDR 	7AH,0 			//03FB 	087A
		BTSC 	STATUS,2 		//03FC 	1503
		LJUMP 	401H 			//03FD 	3C01

		//;ZX-FT60F12X-4BIT.C: 1360: {
		//;ZX-FT60F12X-4BIT.C: 1361: Shinkbits = 0;
		CLRR 	7AH 			//03FE 	017A

		//;ZX-FT60F12X-4BIT.C: 1362: LEDBits = 0;
		CLRR 	7BH 			//03FF 	017B

		//;ZX-FT60F12X-4BIT.C: 1363: }
		LJUMP 	402H 			//0400 	3C02

		//;ZX-FT60F12X-4BIT.C: 1364: else
		//;ZX-FT60F12X-4BIT.C: 1365: {
		//;ZX-FT60F12X-4BIT.C: 1366: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 1367: LEDBits = TempH;
		LCALL 	47DH 			//0401 	347D
		LDWI 	6H 			//0402 	2A06

		//;ZX-FT60F12X-4BIT.C: 1368: }
		//;ZX-FT60F12X-4BIT.C: 1369: ShanCnt++;
		INCR	50H,1 			//0403 	09D0

		//;ZX-FT60F12X-4BIT.C: 1370: if (ShanCnt >= 6)
		SUBWR 	50H,0 			//0404 	0C50
		BTSS 	STATUS,0 		//0405 	1C03
		RET		 					//0406 	0004
		LDWI 	5H 			//0407 	2A05

		//;ZX-FT60F12X-4BIT.C: 1371: {
		//;ZX-FT60F12X-4BIT.C: 1372: ShanCnt = 0;
		//;ZX-FT60F12X-4BIT.C: 1373: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 1374: ModeState = 5;
		LJUMP 	482H 			//0408 	3C82

		//;ZX-FT60F12X-4BIT.C: 1379: TempH = 0x0C;
		LDWI 	CH 			//0409 	2A0C
		STR 	79H 			//040A 	01F9

		//;ZX-FT60F12X-4BIT.C: 1381: if (Shinkbits)
		LDR 	7AH,0 			//040B 	087A
		BTSC 	STATUS,2 		//040C 	1503
		LJUMP 	411H 			//040D 	3C11

		//;ZX-FT60F12X-4BIT.C: 1382: {
		//;ZX-FT60F12X-4BIT.C: 1383: Shinkbits = 0;
		CLRR 	7AH 			//040E 	017A

		//;ZX-FT60F12X-4BIT.C: 1384: LEDBits = 0;
		CLRR 	7BH 			//040F 	017B

		//;ZX-FT60F12X-4BIT.C: 1385: }
		LJUMP 	412H 			//0410 	3C12

		//;ZX-FT60F12X-4BIT.C: 1386: else
		//;ZX-FT60F12X-4BIT.C: 1387: {
		//;ZX-FT60F12X-4BIT.C: 1388: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 1389: LEDBits = TempH;
		LCALL 	47DH 			//0411 	347D
		LDWI 	6H 			//0412 	2A06

		//;ZX-FT60F12X-4BIT.C: 1390: }
		//;ZX-FT60F12X-4BIT.C: 1391: ShanCnt++;
		INCR	50H,1 			//0413 	09D0

		//;ZX-FT60F12X-4BIT.C: 1392: if (ShanCnt >= 6)
		SUBWR 	50H,0 			//0414 	0C50
		BTSS 	STATUS,0 		//0415 	1C03
		RET		 					//0416 	0004
		LDWI 	6H 			//0417 	2A06

		//;ZX-FT60F12X-4BIT.C: 1393: {
		//;ZX-FT60F12X-4BIT.C: 1394: ShanCnt = 0;
		//;ZX-FT60F12X-4BIT.C: 1395: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 1396: ModeState = 6;
		LJUMP 	482H 			//0418 	3C82

		//;ZX-FT60F12X-4BIT.C: 1401: TempH = 0x08;
		LDWI 	8H 			//0419 	2A08
		STR 	79H 			//041A 	01F9

		//;ZX-FT60F12X-4BIT.C: 1403: if (Shinkbits)
		LDR 	7AH,0 			//041B 	087A
		BTSC 	STATUS,2 		//041C 	1503
		LJUMP 	421H 			//041D 	3C21

		//;ZX-FT60F12X-4BIT.C: 1404: {
		//;ZX-FT60F12X-4BIT.C: 1405: Shinkbits = 0;
		CLRR 	7AH 			//041E 	017A

		//;ZX-FT60F12X-4BIT.C: 1406: LEDBits = 0;
		CLRR 	7BH 			//041F 	017B

		//;ZX-FT60F12X-4BIT.C: 1407: }
		LJUMP 	422H 			//0420 	3C22

		//;ZX-FT60F12X-4BIT.C: 1408: else
		//;ZX-FT60F12X-4BIT.C: 1409: {
		//;ZX-FT60F12X-4BIT.C: 1410: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 1411: LEDBits = TempH;
		LCALL 	47DH 			//0421 	347D
		LDWI 	6H 			//0422 	2A06

		//;ZX-FT60F12X-4BIT.C: 1412: }
		//;ZX-FT60F12X-4BIT.C: 1413: ShanCnt++;
		INCR	50H,1 			//0423 	09D0

		//;ZX-FT60F12X-4BIT.C: 1414: if (ShanCnt >= 6)
		SUBWR 	50H,0 			//0424 	0C50
		BTSS 	STATUS,0 		//0425 	1C03
		RET		 					//0426 	0004
		LDWI 	7H 			//0427 	2A07

		//;ZX-FT60F12X-4BIT.C: 1415: {
		//;ZX-FT60F12X-4BIT.C: 1416: ShanCnt = 0;
		//;ZX-FT60F12X-4BIT.C: 1417: Shinkbits = 0;
		//;ZX-FT60F12X-4BIT.C: 1418: ModeState = 7;
		LJUMP 	482H 			//0428 	3C82
		LDWI 	2H 			//0429 	2A02

		//;ZX-FT60F12X-4BIT.C: 1423: LEDBits = 0;
		CLRR 	7BH 			//042A 	017B

		//;ZX-FT60F12X-4BIT.C: 1424: ShanCnt++;
		INCR	50H,1 			//042B 	09D0

		//;ZX-FT60F12X-4BIT.C: 1425: if (ShanCnt >= 2)
		SUBWR 	50H,0 			//042C 	0C50
		BTSS 	STATUS,0 		//042D 	1C03
		RET		 					//042E 	0004
		LDWI 	8H 			//042F 	2A08

		//;ZX-FT60F12X-4BIT.C: 1426: {
		//;ZX-FT60F12X-4BIT.C: 1427: ShanCnt = 0;
		CLRR 	50H 			//0430 	0150

		//;ZX-FT60F12X-4BIT.C: 1428: ModeState = 8;
		STR 	7CH 			//0431 	01FC
		RET		 					//0432 	0004

		//;ZX-FT60F12X-4BIT.C: 1433: if (TempH == 0)
		LDR 	79H,0 			//0433 	0879
		BTSS 	STATUS,2 		//0434 	1D03
		LJUMP 	438H 			//0435 	3C38

		//;ZX-FT60F12X-4BIT.C: 1434: TempH = 0x08;
		LDWI 	8H 			//0436 	2A08
		STR 	79H 			//0437 	01F9

		//;ZX-FT60F12X-4BIT.C: 1436: if (Shinkbits)
		LDR 	7AH,0 			//0438 	087A
		BTSC 	STATUS,2 		//0439 	1503
		LJUMP 	43EH 			//043A 	3C3E

		//;ZX-FT60F12X-4BIT.C: 1437: {
		//;ZX-FT60F12X-4BIT.C: 1438: Shinkbits = 0;
		CLRR 	7AH 			//043B 	017A

		//;ZX-FT60F12X-4BIT.C: 1439: LEDBits = 0;
		CLRR 	7BH 			//043C 	017B

		//;ZX-FT60F12X-4BIT.C: 1440: }
		LJUMP 	43FH 			//043D 	3C3F

		//;ZX-FT60F12X-4BIT.C: 1441: else
		//;ZX-FT60F12X-4BIT.C: 1442: {
		//;ZX-FT60F12X-4BIT.C: 1443: Shinkbits = 0xFF;
		//;ZX-FT60F12X-4BIT.C: 1444: LEDBits = TempH;
		LCALL 	47DH 			//043E 	347D
		LDWI 	6H 			//043F 	2A06

		//;ZX-FT60F12X-4BIT.C: 1445: }
		//;ZX-FT60F12X-4BIT.C: 1446: ShanCnt++;
		INCR	50H,1 			//0440 	09D0

		//;ZX-FT60F12X-4BIT.C: 1447: if (ShanCnt >= 6)
		SUBWR 	50H,0 			//0441 	0C50
		BTSS 	STATUS,0 		//0442 	1C03
		RET		 					//0443 	0004
		LDWI 	8H 			//0444 	2A08

		//;ZX-FT60F12X-4BIT.C: 1448: {
		//;ZX-FT60F12X-4BIT.C: 1449: ShanCnt = 0;
		CLRR 	50H 			//0445 	0150

		//;ZX-FT60F12X-4BIT.C: 1450: Shinkbits = 0;
		CLRR 	7AH 			//0446 	017A

		//;ZX-FT60F12X-4BIT.C: 1451: if (TempH == 0x08)
		XORWR 	79H,0 			//0447 	0479

		//;ZX-FT60F12X-4BIT.C: 1452: TempH = 0x0C;
		LDWI 	CH 			//0448 	2A0C
		BTSS 	STATUS,2 		//0449 	1D03
		LJUMP 	44DH 			//044A 	3C4D
		STR 	79H 			//044B 	01F9
		RET		 					//044C 	0004

		//;ZX-FT60F12X-4BIT.C: 1453: else if (TempH == 0x0C)
		XORWR 	79H,0 			//044D 	0479

		//;ZX-FT60F12X-4BIT.C: 1454: TempH = 0x0E;
		LDWI 	EH 			//044E 	2A0E
		BTSS 	STATUS,2 		//044F 	1D03
		LJUMP 	453H 			//0450 	3C53
		STR 	79H 			//0451 	01F9
		RET		 					//0452 	0004

		//;ZX-FT60F12X-4BIT.C: 1455: else if (TempH == 0x0E)
		XORWR 	79H,0 			//0453 	0479

		//;ZX-FT60F12X-4BIT.C: 1456: TempH = 0x0F;
		LDWI 	FH 			//0454 	2A0F
		BTSS 	STATUS,2 		//0455 	1D03
		LJUMP 	459H 			//0456 	3C59
		STR 	79H 			//0457 	01F9
		RET		 					//0458 	0004

		//;ZX-FT60F12X-4BIT.C: 1457: else if (TempH == 0x0F)
		XORWR 	79H,0 			//0459 	0479

		//;ZX-FT60F12X-4BIT.C: 1458: TempH = 0x07;
		LDWI 	7H 			//045A 	2A07
		BTSS 	STATUS,2 		//045B 	1D03
		LJUMP 	45FH 			//045C 	3C5F
		STR 	79H 			//045D 	01F9
		RET		 					//045E 	0004

		//;ZX-FT60F12X-4BIT.C: 1459: else if (TempH == 0x07)
		XORWR 	79H,0 			//045F 	0479

		//;ZX-FT60F12X-4BIT.C: 1460: TempH = 0x03;
		LDWI 	3H 			//0460 	2A03
		BTSS 	STATUS,2 		//0461 	1D03
		LJUMP 	465H 			//0462 	3C65
		STR 	79H 			//0463 	01F9
		RET		 					//0464 	0004

		//;ZX-FT60F12X-4BIT.C: 1461: else if (TempH == 0x03)
		XORWR 	79H,0 			//0465 	0479
		BTSS 	STATUS,2 		//0466 	1D03
		LJUMP 	46BH 			//0467 	3C6B

		//;ZX-FT60F12X-4BIT.C: 1462: TempH = 0x01;
		CLRR 	79H 			//0468 	0179
		INCR	79H,1 			//0469 	09F9
		RET		 					//046A 	0004

		//;ZX-FT60F12X-4BIT.C: 1463: else if (TempH == 0x01)
		DECRSZ 	79H,0 		//046B 	0E79
		RET		 					//046C 	0004

		//;ZX-FT60F12X-4BIT.C: 1464: {
		//;ZX-FT60F12X-4BIT.C: 1465: TempH = 0x01;
		CLRR 	79H 			//046D 	0179
		INCR	79H,1 			//046E 	09F9

		//;ZX-FT60F12X-4BIT.C: 1466: ModeState = 0;
		CLRR 	7CH 			//046F 	017C
		RET		 					//0470 	0004
		LDR 	7CH,0 			//0471 	087C
		STR 	FSR 			//0472 	0184
		LDWI 	9H 			//0473 	2A09
		SUBWR 	FSR,0 			//0474 	0C04
		BTSC 	STATUS,0 		//0475 	1403
		RET		 					//0476 	0004
		LDWI 	5H 			//0477 	2A05
		STR 	PCLATH 			//0478 	018A
		LDWI 	91H 			//0479 	2A91
		ADDWR 	FSR,0 			//047A 	0B04
		STR 	PCL 			//047B 	0182
		RET		 					//047C 	0004
		LDWI 	FFH 			//047D 	2AFF
		STR 	7AH 			//047E 	01FA
		LDR 	79H,0 			//047F 	0879
		STR 	7BH 			//0480 	01FB
		RET		 					//0481 	0004
		CLRR 	50H 			//0482 	0150
		CLRR 	7AH 			//0483 	017A
		STR 	7CH 			//0484 	01FC
		RET		 					//0485 	0004

		//;ZX-FT60F12X-4BIT.C: 1498: u8 i;
		//;ZX-FT60F12X-4BIT.C: 1500: Power_Initial();
		LCALL 	4AFH 			//0486 	34AF

		//;ZX-FT60F12X-4BIT.C: 1502: for (i = 0; i < 250; i++)
		CLRR 	34H 			//0487 	0134

		//;ZX-FT60F12X-4BIT.C: 1503: DelayUs(197);
		LDWI 	C5H 			//0488 	2AC5
		LCALL 	57EH 			//0489 	357E
		LDWI 	FAH 			//048A 	2AFA
		INCR	34H,1 			//048B 	09B4
		SUBWR 	34H,0 			//048C 	0C34
		BTSS 	STATUS,0 		//048D 	1C03
		LJUMP 	488H 			//048E 	3C88
		CLRWDT	 			//048F 	0001

		//;ZX-FT60F12X-4BIT.C: 1506: EEPROMwrite(0xff, 0xaa);
		LCALL 	4ABH 			//0490 	34AB
		LCALL 	545H 			//0491 	3545

		//;ZX-FT60F12X-4BIT.C: 1507: EEPROMwrite(0xff, 0xaa);
		LCALL 	4ABH 			//0492 	34AB
		LCALL 	545H 			//0493 	3545

		//;ZX-FT60F12X-4BIT.C: 1508: Dang = EEPROMread(0x00);
		LDWI 	0H 			//0494 	2A00
		LCALL 	588H 			//0495 	3588
		STR 	7DH 			//0496 	01FD

		//;ZX-FT60F12X-4BIT.C: 1509: if (Dang > 17)
		LDWI 	12H 			//0497 	2A12
		SUBWR 	7DH,0 			//0498 	0C7D
		BTSS 	STATUS,0 		//0499 	1C03
		LJUMP 	49DH 			//049A 	3C9D

		//;ZX-FT60F12X-4BIT.C: 1510: {
		//;ZX-FT60F12X-4BIT.C: 1511: Dang = 0;
		CLRR 	7DH 			//049B 	017D

		//;ZX-FT60F12X-4BIT.C: 1512: Flag.bits.ToEEPROM = 1;
		BSR 	4BH,1 			//049C 	18CB

		//;ZX-FT60F12X-4BIT.C: 1513: }
		//;ZX-FT60F12X-4BIT.C: 1515: T0IF = 0;
		BCR 	INTCON,2 		//049D 	110B

		//;ZX-FT60F12X-4BIT.C: 1516: GIE = 1;
		BSR 	INTCON,7 		//049E 	1B8B

		//;ZX-FT60F12X-4BIT.C: 1517: T0IE = 1;
		BSR 	INTCON,5 		//049F 	1A8B

		//;ZX-FT60F12X-4BIT.C: 1519: while (1)
		CLRWDT	 			//04A0 	0001

		//;ZX-FT60F12X-4BIT.C: 1522: if (Flag.bits.ToEEPROM)
		BCR 	STATUS,5 		//04A1 	1283
		BTSS 	4BH,1 			//04A2 	1CCB
		LJUMP 	4A0H 			//04A3 	3CA0

		//;ZX-FT60F12X-4BIT.C: 1523: {
		//;ZX-FT60F12X-4BIT.C: 1524: EEPROMwrite(0x00, Dang);
		LDR 	7DH,0 			//04A4 	087D
		STR 	32H 			//04A5 	01B2
		LDWI 	0H 			//04A6 	2A00
		LCALL 	545H 			//04A7 	3545

		//;ZX-FT60F12X-4BIT.C: 1525: Flag.bits.ToEEPROM = 0;
		BCR 	STATUS,5 		//04A8 	1283
		BCR 	4BH,1 			//04A9 	10CB
		LJUMP 	4A0H 			//04AA 	3CA0
		LDWI 	AAH 			//04AB 	2AAA
		BCR 	STATUS,5 		//04AC 	1283
		STR 	32H 			//04AD 	01B2
		RETW 	FFH 			//04AE 	21FF

		//;ZX-FT60F12X-4BIT.C: 170: OSCCON = 0B01110001;
		LDWI 	71H 			//04AF 	2A71
		BSR 	STATUS,5 		//04B0 	1A83
		STR 	FH 			//04B1 	018F

		//;ZX-FT60F12X-4BIT.C: 171: INTCON = 0;
		CLRR 	INTCON 			//04B2 	010B

		//;ZX-FT60F12X-4BIT.C: 172: PORTA = 0B00000000;
		BCR 	STATUS,5 		//04B3 	1283
		CLRR 	5H 			//04B4 	0105

		//;ZX-FT60F12X-4BIT.C: 173: TRISA = 0B00100000;
		LDWI 	20H 			//04B5 	2A20
		BSR 	STATUS,5 		//04B6 	1A83
		STR 	5H 			//04B7 	0185

		//;ZX-FT60F12X-4BIT.C: 174: WPUA = 0B00100000;
		STR 	15H 			//04B8 	0195

		//;ZX-FT60F12X-4BIT.C: 176: PORTC = 0B00000000;
		BCR 	STATUS,5 		//04B9 	1283
		CLRR 	7H 			//04BA 	0107

		//;ZX-FT60F12X-4BIT.C: 177: TRISC = 0B11101011;
		LDWI 	EBH 			//04BB 	2AEB
		BSR 	STATUS,5 		//04BC 	1A83
		STR 	7H 			//04BD 	0187

		//;ZX-FT60F12X-4BIT.C: 178: WPUC = 0B11101011;
		STR 	13H 			//04BE 	0193
		CLRWDT	 			//04BF 	0001

		//;ZX-FT60F12X-4BIT.C: 182: OPTION = 0B00000100;
		LDWI 	4H 			//04C0 	2A04
		BSR 	STATUS,5 		//04C1 	1A83
		STR 	1H 			//04C2 	0181

		//;ZX-FT60F12X-4BIT.C: 183: WDTCON = 0B00010000;
		LDWI 	10H 			//04C3 	2A10
		BCR 	STATUS,5 		//04C4 	1283
		STR 	18H 			//04C5 	0198

		//;ZX-FT60F12X-4BIT.C: 184: TMR0 = 5;
		LDWI 	5H 			//04C6 	2A05
		STR 	1H 			//04C7 	0181

		//;ZX-FT60F12X-4BIT.C: 186: PSRCA = 0B11111111;
		LDWI 	FFH 			//04C8 	2AFF
		BSR 	STATUS,5 		//04C9 	1A83
		STR 	8H 			//04CA 	0188

		//;ZX-FT60F12X-4BIT.C: 187: PSRCC = 0B11111111;
		STR 	14H 			//04CB 	0194

		//;ZX-FT60F12X-4BIT.C: 188: PSINKA = 0B11111111;
		STR 	17H 			//04CC 	0197

		//;ZX-FT60F12X-4BIT.C: 189: PSINKC = 0B11111111;
		STR 	1FH 			//04CD 	019F

		//;ZX-FT60F12X-4BIT.C: 191: MSCON = 0B00110000;
		LDWI 	30H 			//04CE 	2A30
		BCR 	STATUS,5 		//04CF 	1283
		STR 	1BH 			//04D0 	019B
		RET		 					//04D1 	0004

		//;ZX-FT60F12X-4BIT.C: 1479: if (T0IE && T0IF)
		BTSC 	INTCON,5 		//04D2 	168B
		BTSS 	INTCON,2 		//04D3 	1D0B
		LJUMP 	4ECH 			//04D4 	3CEC

		//;ZX-FT60F12X-4BIT.C: 1480: {
		//;ZX-FT60F12X-4BIT.C: 1481: T0IF = 0;
		BCR 	INTCON,2 		//04D5 	110B

		//;ZX-FT60F12X-4BIT.C: 1482: TMR0 = 5;
		LDWI 	5H 			//04D6 	2A05
		BCR 	STATUS,5 		//04D7 	1283
		STR 	1H 			//04D8 	0181

		//;ZX-FT60F12X-4BIT.C: 1483: if (Time.DutyCount > 0)
		LDR 	47H,0 			//04D9 	0847
		BTSS 	STATUS,2 		//04DA 	1D03

		//;ZX-FT60F12X-4BIT.C: 1484: Time.DutyCount--;
		DECR 	47H,1 			//04DB 	0DC7

		//;ZX-FT60F12X-4BIT.C: 1485: if (Time.HitCount > 0)
		LDR 	4AH,0 			//04DC 	084A
		BTSS 	STATUS,2 		//04DD 	1D03

		//;ZX-FT60F12X-4BIT.C: 1486: Time.HitCount--;
		DECR 	4AH,1 			//04DE 	0DCA

		//;ZX-FT60F12X-4BIT.C: 1487: if (Time.OnOffCount > 0)
		LDR 	48H,0 			//04DF 	0848
		IORWR 	49H,0 			//04E0 	0349
		BTSC 	STATUS,2 		//04E1 	1503
		LJUMP 	4E9H 			//04E2 	3CE9

		//;ZX-FT60F12X-4BIT.C: 1488: Time.OnOffCount--;
		LDWI 	1H 			//04E3 	2A01
		SUBWR 	48H,1 			//04E4 	0CC8
		LDWI 	0H 			//04E5 	2A00
		BTSS 	STATUS,0 		//04E6 	1C03
		DECR 	49H,1 			//04E7 	0DC9
		SUBWR 	49H,1 			//04E8 	0CC9

		//;ZX-FT60F12X-4BIT.C: 1490: KeyCheck();
		LCALL 	4F5H 			//04E9 	34F5

		//;ZX-FT60F12X-4BIT.C: 1491: ModeMachine();
		LCALL 	3CH 			//04EA 	303C

		//;ZX-FT60F12X-4BIT.C: 1492: LEDDisplay();
		LCALL 	52EH 			//04EB 	352E
		LDR 	78H,0 			//04EC 	0878
		STR 	PCLATH 			//04ED 	018A
		LDR 	77H,0 			//04EE 	0877
		STR 	FSR 			//04EF 	0184
		SWAPR 	76H,0 			//04F0 	0776
		STR 	STATUS 			//04F1 	0183
		SWAPR 	7EH,1 			//04F2 	07FE
		SWAPR 	7EH,0 			//04F3 	077E
		RETI		 			//04F4 	0009

		//;ZX-FT60F12X-4BIT.C: 97: if (RA5 == 0)
		BTSC 	5H,5 			//04F5 	1685
		LJUMP 	511H 			//04F6 	3D11

		//;ZX-FT60F12X-4BIT.C: 98: {
		//;ZX-FT60F12X-4BIT.C: 99: if (Time.HitCount == 0)
		LDR 	4AH,0 			//04F7 	084A
		BTSC 	STATUS,2 		//04F8 	1503

		//;ZX-FT60F12X-4BIT.C: 100: {
		//;ZX-FT60F12X-4BIT.C: 101: if (Flag.bits.KeyHit == 0)
		BTSC 	4BH,0 			//04F9 	144B
		RET		 					//04FA 	0004
		LDWI 	11H 			//04FB 	2A11

		//;ZX-FT60F12X-4BIT.C: 102: {
		//;ZX-FT60F12X-4BIT.C: 103: Flag.bits.KeyHit = 1;
		BSR 	4BH,0 			//04FC 	184B

		//;ZX-FT60F12X-4BIT.C: 104: ModeState = 0;
		CLRR 	7CH 			//04FD 	017C

		//;ZX-FT60F12X-4BIT.C: 105: LEDBits = 0;
		CLRR 	7BH 			//04FE 	017B

		//;ZX-FT60F12X-4BIT.C: 106: TempH = 0;
		CLRR 	79H 			//04FF 	0179

		//;ZX-FT60F12X-4BIT.C: 107: TempM = 0;
		CLRR 	4FH 			//0500 	014F

		//;ZX-FT60F12X-4BIT.C: 110: TempW1 = 0;
		CLRR 	4EH 			//0501 	014E

		//;ZX-FT60F12X-4BIT.C: 111: TempW2 = 0;
		CLRR 	4DH 			//0502 	014D

		//;ZX-FT60F12X-4BIT.C: 112: ShanCnt = 0;
		CLRR 	50H 			//0503 	0150

		//;ZX-FT60F12X-4BIT.C: 113: Time.OnOffCount = 0;
		CLRR 	48H 			//0504 	0148
		CLRR 	49H 			//0505 	0149

		//;ZX-FT60F12X-4BIT.C: 114: if (Dang >= 17)
		SUBWR 	7DH,0 			//0506 	0C7D
		BTSS 	STATUS,0 		//0507 	1C03
		LJUMP 	50BH 			//0508 	3D0B

		//;ZX-FT60F12X-4BIT.C: 115: Dang = 0;
		CLRR 	7DH 			//0509 	017D
		LJUMP 	50CH 			//050A 	3D0C

		//;ZX-FT60F12X-4BIT.C: 116: else
		//;ZX-FT60F12X-4BIT.C: 117: {
		//;ZX-FT60F12X-4BIT.C: 118: Dang++;
		INCR	7DH,1 			//050B 	09FD

		//;ZX-FT60F12X-4BIT.C: 119: }
		//;ZX-FT60F12X-4BIT.C: 120: EEPROMwrite(0x00, Dang);
		LDR 	7DH,0 			//050C 	087D
		STR 	70H 			//050D 	01F0
		LDWI 	0H 			//050E 	2A00
		LCALL 	515H 			//050F 	3515
		RET		 					//0510 	0004
		LDWI 	3CH 			//0511 	2A3C

		//;ZX-FT60F12X-4BIT.C: 124: else
		//;ZX-FT60F12X-4BIT.C: 125: {
		//;ZX-FT60F12X-4BIT.C: 126: Flag.bits.KeyHit = 0;
		BCR 	4BH,0 			//0512 	104B

		//;ZX-FT60F12X-4BIT.C: 127: Time.HitCount = 60;
		STR 	4AH 			//0513 	01CA
		RET		 					//0514 	0004
		STR 	71H 			//0515 	01F1

		//;ZX-FT60F12X-4BIT.C: 152: while (GIE)
		BTSS 	INTCON,7 		//0516 	1F8B
		LJUMP 	51AH 			//0517 	3D1A

		//;ZX-FT60F12X-4BIT.C: 153: {
		//;ZX-FT60F12X-4BIT.C: 154: GIE = 0;
		BCR 	INTCON,7 		//0518 	138B
		LJUMP 	516H 			//0519 	3D16

		//;ZX-FT60F12X-4BIT.C: 155: }
		//;ZX-FT60F12X-4BIT.C: 156: EEADR = EEAddr;
		LDR 	71H,0 			//051A 	0871
		BSR 	STATUS,5 		//051B 	1A83
		STR 	1BH 			//051C 	019B

		//;ZX-FT60F12X-4BIT.C: 157: EEDAT = Data;
		LDR 	70H,0 			//051D 	0870

		//;ZX-FT60F12X-4BIT.C: 158: EEIF = 0;
		//;ZX-FT60F12X-4BIT.C: 159: EECON1 |= 0x34;
		LCALL 	528H 			//051E 	3528
		IORWR 	1CH,1 			//051F 	039C

		//;ZX-FT60F12X-4BIT.C: 160: WR = 1;
		BSR 	1DH,0 			//0520 	181D

		//;ZX-FT60F12X-4BIT.C: 161: __nop();
		NOP		 					//0521 	0000

		//;ZX-FT60F12X-4BIT.C: 162: __nop();
		NOP		 					//0522 	0000

		//;ZX-FT60F12X-4BIT.C: 163: GIE = 1;
		BSR 	INTCON,7 		//0523 	1B8B

		//;ZX-FT60F12X-4BIT.C: 165: ;
		BSR 	STATUS,5 		//0524 	1A83
		BTSC 	1DH,0 			//0525 	141D
		LJUMP 	524H 			//0526 	3D24
		RET		 					//0527 	0004
		STR 	1AH 			//0528 	019A
		BCR 	STATUS,5 		//0529 	1283
		BCR 	CH,7 			//052A 	138C
		LDWI 	34H 			//052B 	2A34
		BSR 	STATUS,5 		//052C 	1A83
		RET		 					//052D 	0004

		//;ZX-FT60F12X-4BIT.C: 74: if (LEDBits & 0x01)
		BTSS 	7BH,0 			//052E 	1C7B
		LJUMP 	533H 			//052F 	3D33

		//;ZX-FT60F12X-4BIT.C: 75: RA4 = 1;
		BCR 	STATUS,5 		//0530 	1283
		BSR 	5H,4 			//0531 	1A05
		LJUMP 	535H 			//0532 	3D35

		//;ZX-FT60F12X-4BIT.C: 76: else
		//;ZX-FT60F12X-4BIT.C: 77: RA4 = 0;
		BCR 	STATUS,5 		//0533 	1283
		BCR 	5H,4 			//0534 	1205

		//;ZX-FT60F12X-4BIT.C: 79: if (LEDBits & 0x02)
		BTSS 	7BH,1 			//0535 	1CFB
		LJUMP 	539H 			//0536 	3D39

		//;ZX-FT60F12X-4BIT.C: 80: RA0 = 1;
		BSR 	5H,0 			//0537 	1805
		LJUMP 	53AH 			//0538 	3D3A

		//;ZX-FT60F12X-4BIT.C: 81: else
		//;ZX-FT60F12X-4BIT.C: 82: RA0 = 0;
		BCR 	5H,0 			//0539 	1005

		//;ZX-FT60F12X-4BIT.C: 84: if (LEDBits & 0x04)
		BTSS 	7BH,2 			//053A 	1D7B
		LJUMP 	53EH 			//053B 	3D3E

		//;ZX-FT60F12X-4BIT.C: 85: RA1 = 1;
		BSR 	5H,1 			//053C 	1885
		LJUMP 	53FH 			//053D 	3D3F

		//;ZX-FT60F12X-4BIT.C: 86: else
		//;ZX-FT60F12X-4BIT.C: 87: RA1 = 0;
		BCR 	5H,1 			//053E 	1085

		//;ZX-FT60F12X-4BIT.C: 89: if (LEDBits & 0x08)
		BTSS 	7BH,3 			//053F 	1DFB
		LJUMP 	543H 			//0540 	3D43

		//;ZX-FT60F12X-4BIT.C: 90: RA2 = 1;
		BSR 	5H,2 			//0541 	1905
		RET		 					//0542 	0004

		//;ZX-FT60F12X-4BIT.C: 91: else
		//;ZX-FT60F12X-4BIT.C: 92: RA2 = 0;
		BCR 	5H,2 			//0543 	1105
		RET		 					//0544 	0004
		STR 	33H 			//0545 	01B3

		//;ZX-FT60F12X-4BIT.C: 152: while (GIE)
		BTSS 	INTCON,7 		//0546 	1F8B
		LJUMP 	54AH 			//0547 	3D4A

		//;ZX-FT60F12X-4BIT.C: 153: {
		//;ZX-FT60F12X-4BIT.C: 154: GIE = 0;
		BCR 	INTCON,7 		//0548 	138B
		LJUMP 	546H 			//0549 	3D46

		//;ZX-FT60F12X-4BIT.C: 155: }
		//;ZX-FT60F12X-4BIT.C: 156: EEADR = EEAddr;
		LDR 	33H,0 			//054A 	0833
		BSR 	STATUS,5 		//054B 	1A83
		STR 	1BH 			//054C 	019B

		//;ZX-FT60F12X-4BIT.C: 157: EEDAT = Data;
		BCR 	STATUS,5 		//054D 	1283
		LDR 	32H,0 			//054E 	0832
		BSR 	STATUS,5 		//054F 	1A83

		//;ZX-FT60F12X-4BIT.C: 158: EEIF = 0;
		//;ZX-FT60F12X-4BIT.C: 159: EECON1 |= 0x34;
		LCALL 	528H 			//0550 	3528
		IORWR 	1CH,1 			//0551 	039C

		//;ZX-FT60F12X-4BIT.C: 160: WR = 1;
		BSR 	1DH,0 			//0552 	181D

		//;ZX-FT60F12X-4BIT.C: 161: __nop();
		NOP		 					//0553 	0000

		//;ZX-FT60F12X-4BIT.C: 162: __nop();
		NOP		 					//0554 	0000

		//;ZX-FT60F12X-4BIT.C: 163: GIE = 1;
		BSR 	INTCON,7 		//0555 	1B8B

		//;ZX-FT60F12X-4BIT.C: 165: ;
		BSR 	STATUS,5 		//0556 	1A83
		BTSC 	1DH,0 			//0557 	141D
		LJUMP 	556H 			//0558 	3D56
		RET		 					//0559 	0004
		LJUMP 	3DH 			//055A 	383D
		LJUMP 	44H 			//055B 	3844
		LJUMP 	58H 			//055C 	3858
		LJUMP 	79H 			//055D 	3879
		LJUMP 	123H 			//055E 	3923
		LJUMP 	124H 			//055F 	3924
		LJUMP 	127H 			//0560 	3927
		LJUMP 	15BH 			//0561 	395B
		LJUMP 	192H 			//0562 	3992
		LJUMP 	1AAH 			//0563 	39AA
		LJUMP 	1D3H 			//0564 	39D3
		LJUMP 	1FEH 			//0565 	39FE
		LJUMP 	224H 			//0566 	3A24
		LJUMP 	22BH 			//0567 	3A2B
		LJUMP 	290H 			//0568 	3A90
		LJUMP 	2A3H 			//0569 	3AA3
		LJUMP 	2AAH 			//056A 	3AAA
		LJUMP 	30DH 			//056B 	3B0D
		STR 	71H 			//056C 	01F1

		//;ZX-FT60F12X-4BIT.C: 55: if (Time.DutyCount == 0)
		BCR 	STATUS,5 		//056D 	1283
		LDR 	47H,0 			//056E 	0847
		BTSS 	STATUS,2 		//056F 	1D03
		RET		 					//0570 	0004

		//;ZX-FT60F12X-4BIT.C: 56: {
		//;ZX-FT60F12X-4BIT.C: 57: if (Shinkbits)
		LDR 	7AH,0 			//0571 	087A
		BTSC 	STATUS,2 		//0572 	1503
		LJUMP 	579H 			//0573 	3D79

		//;ZX-FT60F12X-4BIT.C: 58: {
		//;ZX-FT60F12X-4BIT.C: 59: Shinkbits = 0;
		CLRR 	7AH 			//0574 	017A

		//;ZX-FT60F12X-4BIT.C: 60: Time.DutyCount = dutyoff;
		LDR 	70H,0 			//0575 	0870
		STR 	47H 			//0576 	01C7

		//;ZX-FT60F12X-4BIT.C: 61: ShanCnt++;
		INCR	50H,1 			//0577 	09D0

		//;ZX-FT60F12X-4BIT.C: 62: }
		RET		 					//0578 	0004

		//;ZX-FT60F12X-4BIT.C: 63: else
		//;ZX-FT60F12X-4BIT.C: 64: {
		//;ZX-FT60F12X-4BIT.C: 65: Shinkbits = 0xff;
		LDWI 	FFH 			//0579 	2AFF
		STR 	7AH 			//057A 	01FA

		//;ZX-FT60F12X-4BIT.C: 66: Time.DutyCount = dutyon;
		LDR 	71H,0 			//057B 	0871
		STR 	47H 			//057C 	01C7
		RET		 					//057D 	0004
		STR 	32H 			//057E 	01B2

		//;ZX-FT60F12X-4BIT.C: 133: u8 a;
		//;ZX-FT60F12X-4BIT.C: 134: for (a = 0; a < TimeUs; a++)
		CLRR 	33H 			//057F 	0133
		LDR 	32H,0 			//0580 	0832
		SUBWR 	33H,0 			//0581 	0C33
		BTSC 	STATUS,0 		//0582 	1403
		RET		 					//0583 	0004

		//;ZX-FT60F12X-4BIT.C: 135: {
		//;ZX-FT60F12X-4BIT.C: 136: __nop();
		NOP		 					//0584 	0000
		BCR 	STATUS,5 		//0585 	1283
		INCR	33H,1 			//0586 	09B3
		LJUMP 	580H 			//0587 	3D80
		BCR 	STATUS,5 		//0588 	1283
		STR 	32H 			//0589 	01B2

		//;ZX-FT60F12X-4BIT.C: 142: u8 ReEEPROMread;
		//;ZX-FT60F12X-4BIT.C: 144: EEADR = EEAddr;
		BSR 	STATUS,5 		//058A 	1A83
		STR 	1BH 			//058B 	019B

		//;ZX-FT60F12X-4BIT.C: 145: RD = 1;
		BSR 	1CH,0 			//058C 	181C

		//;ZX-FT60F12X-4BIT.C: 146: ReEEPROMread = EEDAT;
		LDR 	1AH,0 			//058D 	081A
		BCR 	STATUS,5 		//058E 	1283
		STR 	33H 			//058F 	01B3

		//;ZX-FT60F12X-4BIT.C: 147: return ReEEPROMread;
		RET		 					//0590 	0004
		LJUMP 	3B3H 			//0591 	3BB3
		LJUMP 	3C9H 			//0592 	3BC9
		LJUMP 	3D9H 			//0593 	3BD9
		LJUMP 	3E9H 			//0594 	3BE9
		LJUMP 	3F9H 			//0595 	3BF9
		LJUMP 	409H 			//0596 	3C09
		LJUMP 	419H 			//0597 	3C19
		LJUMP 	429H 			//0598 	3C29
		LJUMP 	433H 			//0599 	3C33
		CLRWDT	 			//059A 	0001
		CLRR 	INDF 			//059B 	0100
		INCR	FSR,1 			//059C 	0984
		XORWR 	FSR,0 			//059D 	0404
		BTSC 	STATUS,2 		//059E 	1503
		RETW 	0H 			//059F 	2100
		XORWR 	FSR,0 			//05A0 	0404
		LJUMP 	59BH 			//05A1 	3D9B
			END
