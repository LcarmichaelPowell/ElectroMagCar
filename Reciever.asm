;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Dec 11 2012) (MSVC)
; This file was generated Thu Mar 26 13:56:07 2015
;--------------------------------------------------------
$name Reciever
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _Follow
	public _Read_Distance
	public _Clear_Pins
	public _Right
	public _Left
	public _Backwards
	public _Forward
	public _SpinR
	public _SpinL
	public _TIMER0_Init
	public _UART0_Init
	public _SYSCLK_Init
	public _PORT_Init
	public _rx_byte
	public _wait_one_and_half_bit_time
	public _wait_bit_time
	public _Timer3us
	public _change_Dist
	public __c51_external_startup
	public _OrientFlag
	public _Dist
	public _command
	public _overflow_count
	public _waitms
	public _GetADC
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_P0             DATA 0x80
_SP             DATA 0x81
_DPL            DATA 0x82
_DPH            DATA 0x83
_EMI0TC         DATA 0x84
_EMI0CF         DATA 0x85
_OSCLCN         DATA 0x86
_PCON           DATA 0x87
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_CKCON          DATA 0x8e
_PSCTL          DATA 0x8f
_P1             DATA 0x90
_TMR3CN         DATA 0x91
_TMR4CN         DATA 0x91
_TMR3RLL        DATA 0x92
_TMR4RLL        DATA 0x92
_TMR3RLH        DATA 0x93
_TMR4RLH        DATA 0x93
_TMR3L          DATA 0x94
_TMR4L          DATA 0x94
_TMR3H          DATA 0x95
_TMR4H          DATA 0x95
_USB0ADR        DATA 0x96
_USB0DAT        DATA 0x97
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_CPT1CN         DATA 0x9a
_CPT0CN         DATA 0x9b
_CPT1MD         DATA 0x9c
_CPT0MD         DATA 0x9d
_CPT1MX         DATA 0x9e
_CPT0MX         DATA 0x9f
_P2             DATA 0xa0
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0DAT        DATA 0xa3
_P0MDOUT        DATA 0xa4
_P1MDOUT        DATA 0xa5
_P2MDOUT        DATA 0xa6
_P3MDOUT        DATA 0xa7
_IE             DATA 0xa8
_CLKSEL         DATA 0xa9
_EMI0CN         DATA 0xaa
__XPAGE         DATA 0xaa
_SBCON1         DATA 0xac
_P4MDOUT        DATA 0xae
_PFE0CN         DATA 0xaf
_P3             DATA 0xb0
_OSCXCN         DATA 0xb1
_OSCICN         DATA 0xb2
_OSCICL         DATA 0xb3
_SBRLL1         DATA 0xb4
_SBRLH1         DATA 0xb5
_FLSCL          DATA 0xb6
_FLKEY          DATA 0xb7
_IP             DATA 0xb8
_CLKMUL         DATA 0xb9
_SMBTC          DATA 0xb9
_AMX0N          DATA 0xba
_AMX0P          DATA 0xbb
_ADC0CF         DATA 0xbc
_ADC0L          DATA 0xbd
_ADC0H          DATA 0xbe
_SFRPAGE        DATA 0xbf
_SMB0CN         DATA 0xc0
_SMB1CN         DATA 0xc0
_SMB0CF         DATA 0xc1
_SMB1CF         DATA 0xc1
_SMB0DAT        DATA 0xc2
_SMB1DAT        DATA 0xc2
_ADC0GTL        DATA 0xc3
_ADC0GTH        DATA 0xc4
_ADC0LTL        DATA 0xc5
_ADC0LTH        DATA 0xc6
_P4             DATA 0xc7
_TMR2CN         DATA 0xc8
_TMR5CN         DATA 0xc8
_REG01CN        DATA 0xc9
_TMR2RLL        DATA 0xca
_TMR5RLL        DATA 0xca
_TMR2RLH        DATA 0xcb
_TMR5RLH        DATA 0xcb
_TMR2L          DATA 0xcc
_TMR5L          DATA 0xcc
_TMR2H          DATA 0xcd
_TMR5H          DATA 0xcd
_SMB0ADM        DATA 0xce
_SMB1ADM        DATA 0xce
_SMB0ADR        DATA 0xcf
_SMB1ADR        DATA 0xcf
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_SCON1          DATA 0xd2
_SBUF1          DATA 0xd3
_P0SKIP         DATA 0xd4
_P1SKIP         DATA 0xd5
_P2SKIP         DATA 0xd6
_USB0XCN        DATA 0xd7
_PCA0CN         DATA 0xd8
_PCA0MD         DATA 0xd9
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xdd
_PCA0CPM4       DATA 0xde
_P3SKIP         DATA 0xdf
_ACC            DATA 0xe0
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_IT01CF         DATA 0xe4
_CKCON1         DATA 0xe4
_SMOD1          DATA 0xe5
_EIE1           DATA 0xe6
_EIE2           DATA 0xe7
_ADC0CN         DATA 0xe8
_PCA0CPL1       DATA 0xe9
_PCA0CPH1       DATA 0xea
_PCA0CPL2       DATA 0xeb
_PCA0CPH2       DATA 0xec
_PCA0CPL3       DATA 0xed
_PCA0CPH3       DATA 0xee
_RSTSRC         DATA 0xef
_B              DATA 0xf0
_P0MDIN         DATA 0xf1
_P1MDIN         DATA 0xf2
_P2MDIN         DATA 0xf3
_P3MDIN         DATA 0xf4
_P4MDIN         DATA 0xf5
_EIP1           DATA 0xf6
_EIP2           DATA 0xf7
_SPI0CN         DATA 0xf8
_PCA0L          DATA 0xf9
_PCA0H          DATA 0xfa
_PCA0CPL0       DATA 0xfb
_PCA0CPH0       DATA 0xfc
_PCA0CPL4       DATA 0xfd
_PCA0CPH4       DATA 0xfe
_VDM0CN         DATA 0xff
_DP             DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0x9392
_TMR5RL         DATA 0xcbca
_TMR2           DATA 0xcdcc
_TMR3           DATA 0x9594
_TMR4           DATA 0x9594
_TMR5           DATA 0xcdcc
_SBRL1          DATA 0xb5b4
_ADC0           DATA 0xbebd
_ADC0GT         DATA 0xc4c3
_ADC0LT         DATA 0xc6c5
_PCA0           DATA 0xfaf9
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xeeed
_PCA0CP0        DATA 0xfcfb
_PCA0CP4        DATA 0xfefd
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_TF1            BIT 0x8f
_TR1            BIT 0x8e
_TF0            BIT 0x8d
_TR0            BIT 0x8c
_IE1            BIT 0x8b
_IT1            BIT 0x8a
_IE0            BIT 0x89
_IT0            BIT 0x88
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_S0MODE         BIT 0x9f
_SCON0_6        BIT 0x9e
_MCE0           BIT 0x9d
_REN0           BIT 0x9c
_TB80           BIT 0x9b
_RB80           BIT 0x9a
_TI0            BIT 0x99
_RI0            BIT 0x98
_SCON_6         BIT 0x9e
_MCE            BIT 0x9d
_REN            BIT 0x9c
_TB8            BIT 0x9b
_RB8            BIT 0x9a
_TI             BIT 0x99
_RI             BIT 0x98
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_EA             BIT 0xaf
_ESPI0          BIT 0xae
_ET2            BIT 0xad
_ES0            BIT 0xac
_ET1            BIT 0xab
_EX1            BIT 0xaa
_ET0            BIT 0xa9
_EX0            BIT 0xa8
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_IP_7           BIT 0xbf
_PSPI0          BIT 0xbe
_PT2            BIT 0xbd
_PS0            BIT 0xbc
_PT1            BIT 0xbb
_PX1            BIT 0xba
_PT0            BIT 0xb9
_PX0            BIT 0xb8
_MASTER0        BIT 0xc7
_TXMODE0        BIT 0xc6
_STA0           BIT 0xc5
_STO0           BIT 0xc4
_ACKRQ0         BIT 0xc3
_ARBLOST0       BIT 0xc2
_ACK0           BIT 0xc1
_SI0            BIT 0xc0
_MASTER1        BIT 0xc7
_TXMODE1        BIT 0xc6
_STA1           BIT 0xc5
_STO1           BIT 0xc4
_ACKRQ1         BIT 0xc3
_ARBLOST1       BIT 0xc2
_ACK1           BIT 0xc1
_SI1            BIT 0xc0
_TF2            BIT 0xcf
_TF2H           BIT 0xcf
_TF2L           BIT 0xce
_TF2LEN         BIT 0xcd
_TF2CEN         BIT 0xcc
_T2SPLIT        BIT 0xcb
_TR2            BIT 0xca
_T2CSS          BIT 0xc9
_T2XCLK         BIT 0xc8
_TF5H           BIT 0xcf
_TF5L           BIT 0xce
_TF5LEN         BIT 0xcd
_TMR5CN_4       BIT 0xcc
_T5SPLIT        BIT 0xcb
_TR5            BIT 0xca
_TMR5CN_1       BIT 0xc9
_T5XCLK         BIT 0xc8
_CY             BIT 0xd7
_AC             BIT 0xd6
_F0             BIT 0xd5
_RS1            BIT 0xd4
_RS0            BIT 0xd3
_OV             BIT 0xd2
_F1             BIT 0xd1
_PARITY         BIT 0xd0
_CF             BIT 0xdf
_CR             BIT 0xde
_PCA0CN_5       BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
_ACC_7          BIT 0xe7
_ACC_6          BIT 0xe6
_ACC_5          BIT 0xe5
_ACC_4          BIT 0xe4
_ACC_3          BIT 0xe3
_ACC_2          BIT 0xe2
_ACC_1          BIT 0xe1
_ACC_0          BIT 0xe0
_AD0EN          BIT 0xef
_AD0TM          BIT 0xee
_AD0INT         BIT 0xed
_AD0BUSY        BIT 0xec
_AD0WINT        BIT 0xeb
_AD0CM2         BIT 0xea
_AD0CM1         BIT 0xe9
_AD0CM0         BIT 0xe8
_B_7            BIT 0xf7
_B_6            BIT 0xf6
_B_5            BIT 0xf5
_B_4            BIT 0xf4
_B_3            BIT 0xf3
_B_2            BIT 0xf2
_B_1            BIT 0xf1
_B_0            BIT 0xf0
_SPIF           BIT 0xff
_WCOL           BIT 0xfe
_MODF           BIT 0xfd
_RXOVRN         BIT 0xfc
_NSSMD1         BIT 0xfb
_NSSMD0         BIT 0xfa
_TXBMT          BIT 0xf9
_SPIEN          BIT 0xf8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_overflow_count:
	ds 1
_command:
	ds 2
_Dist:
	ds 2
_OrientFlag:
	ds 2
_Follow_RightD_1_70:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:59: volatile unsigned int Dist = 100;  // This is a number I made up, it is supposed to be changed somewhere else in the program
	mov	_Dist,#0x64
	clr	a
	mov	(_Dist + 1),a
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:65: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:67: PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:68: VDM0CN=0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:69: RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:77: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:81: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:84: SCON0 = 0x10; 
	mov	_SCON0,#0x10
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:86: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:87: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:88: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:101: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:102: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:103: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:104: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:105: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:108: P2MDOUT|=0b_0001_0111;
	orl	_P2MDOUT,#0x17
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:109: P0MDOUT |= 0x10; // Enable UTX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:110: XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:111: XBR1     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:114: TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN,#0x00
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:115: CKCON|=0b_0001_0000;
	orl	_CKCON,#0x10
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:116: TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	mov	_TMR2RL,#0x78
	mov	(_TMR2RL >> 8),#0xEC
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:117: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:118: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:119: TR2=1;         // Start Timer2
	setb	_TR2
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:121: EA=1; // Enable interrupts
	setb	_EA
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:123: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'change_Dist'
;------------------------------------------------------------
;new                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:125: void change_Dist(int new){  //call to change the distance
;	-----------------------------------------
;	 function change_Dist
;	-----------------------------------------
_change_Dist:
	mov	_Dist,dpl
	mov	(_Dist + 1),dph
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:127: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 r3 r4 r5 
;i                         Allocated to registers r6 r7 r0 r1 
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:131: void Timer3us(unsigned long us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:136: CKCON|=0b_0100_0000;
	orl	_CKCON,#0x40
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:138: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xD0
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:139: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:141: TMR3CN = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN,#0x04
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:142: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r6,#0x00
	mov	r7,#0x00
	mov	r0,#0x00
	mov	r1,#0x00
L004004?:
	clr	c
	mov	a,r6
	subb	a,r2
	mov	a,r7
	subb	a,r3
	mov	a,r0
	subb	a,r4
	mov	a,r1
	subb	a,r5
	jnc	L004007?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:144: while (!(TMR3CN & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR3CN
	jnb	acc.7,L004001?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:145: TMR3CN &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN,#0x7F
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:142: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r6
	cjne	r6,#0x00,L004016?
	inc	r7
	cjne	r7,#0x00,L004016?
	inc	r0
	cjne	r0,#0x00,L004004?
	inc	r1
L004016?:
	sjmp	L004004?
L004007?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:147: TMR3CN = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_bit_time'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:149: void wait_bit_time(){
;	-----------------------------------------
;	 function wait_bit_time
;	-----------------------------------------
_wait_bit_time:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:150: waitms(4);
	mov	dptr,#0x0004
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:151: return;
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_one_and_half_bit_time'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:154: void wait_one_and_half_bit_time(){
;	-----------------------------------------
;	 function wait_one_and_half_bit_time
;	-----------------------------------------
_wait_one_and_half_bit_time:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:155: waitms(6);
	mov	dptr,#0x0006
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:156: return;
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'rx_byte'
;------------------------------------------------------------
;j                         Allocated to registers r3 
;val                       Allocated to registers r2 
;v                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:160: unsigned char rx_byte (){ 
;	-----------------------------------------
;	 function rx_byte
;	-----------------------------------------
_rx_byte:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:164: val= 0;
	mov	r2,#0x00
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:165: wait_one_and_half_bit_time();
	push	ar2
	lcall	_wait_one_and_half_bit_time
	pop	ar2
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:166: for(j= 0; j < 8; j++){	
	mov	r3,#0x00
L007001?:
	cjne	r3,#0x08,L007013?
L007013?:
	jnc	L007004?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:167: v=GetADC(0);
	mov	dptr,#0x0000
	push	ar2
	push	ar3
	lcall	_GetADC
	lcall	___fs2sint
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:168: val|=(v>MIN)?(0x01<<j):0x00;  // MIN defined up top
	clr	c
	mov	a,#0x03
	subb	a,r4
	clr	a
	xrl	a,#0x80
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jnc	L007007?
	mov	b,r3
	inc	b
	mov	a,#0x01
	sjmp	L007018?
L007016?:
	add	a,acc
L007018?:
	djnz	b,L007016?
	mov	r4,a
	sjmp	L007008?
L007007?:
	mov	r4,#0x00
L007008?:
	mov	a,r4
	orl	ar2,a
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:169: wait_bit_time();}
	push	ar2
	push	ar3
	lcall	_wait_bit_time
	pop	ar3
	pop	ar2
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:166: for(j= 0; j < 8; j++){	
	inc	r3
	sjmp	L007001?
L007004?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:171: wait_one_and_half_bit_time();
	push	ar2
	lcall	_wait_one_and_half_bit_time
	pop	ar2
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:172: return val;
	mov	dpl,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:174: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:177: for(j=ms; j!=0; j--)
L008001?:
	cjne	r2,#0x00,L008010?
	cjne	r3,#0x00,L008010?
	ret
L008010?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:179: Timer3us(249);
	mov	dptr,#(0xF9&0x00ff)
	clr	a
	mov	b,a
	push	ar2
	push	ar3
	lcall	_Timer3us
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:180: Timer3us(249);
	mov	dptr,#(0xF9&0x00ff)
	clr	a
	mov	b,a
	lcall	_Timer3us
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:181: Timer3us(249);
	mov	dptr,#(0xF9&0x00ff)
	clr	a
	mov	b,a
	lcall	_Timer3us
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:182: Timer3us(250);
	mov	dptr,#(0xFA&0x00ff)
	clr	a
	mov	b,a
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:177: for(j=ms; j!=0; j--)
	dec	r2
	cjne	r2,#0xff,L008011?
	dec	r3
L008011?:
	sjmp	L008001?
;------------------------------------------------------------
;Allocation info for local variables in function 'PORT_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:186: void PORT_Init (void)
;	-----------------------------------------
;	 function PORT_Init
;	-----------------------------------------
_PORT_Init:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:188: P0MDOUT |= 0x10; // Enable UART TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:189: XBR0=0b_0000_0001; // Enable UART on P0.4(TX) and P0.5(RX)                    
	mov	_XBR0,#0x01
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:190: XBR1=0b_0101_0000; // Enable crossbar.  Enable T0 input.
	mov	_XBR1,#0x50
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:191: XBR2=0b_0000_0000;
	mov	_XBR2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SYSCLK_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:194: void SYSCLK_Init (void)
;	-----------------------------------------
;	 function SYSCLK_Init
;	-----------------------------------------
_SYSCLK_Init:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:202: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:206: OSCICN |= 0x03;   // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:207: RSTSRC  = 0x04;   // Enable missing clock detector
	mov	_RSTSRC,#0x04
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:210: void UART0_Init (void)
;	-----------------------------------------
;	 function UART0_Init
;	-----------------------------------------
_UART0_Init:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:212: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:215: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:216: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:217: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:230: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:231: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:232: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:233: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:234: TI = 1;  // Indicate TX0 ready
	setb	_TI
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:237: void TIMER0_Init(void)
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:239: TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:240: TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:241: TR0=0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SpinL'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:243: void SpinL (void)
;	-----------------------------------------
;	 function SpinL
;	-----------------------------------------
_SpinL:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:247: M1P1 = HIGH; 
	setb	_P2_7
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:248: M1P2 = LOW; 
	clr	_P2_5
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:249: M2P1 = LOW; 
	clr	_P2_4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:250: M2P2 = HIGH; 
	setb	_P2_3
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:252: waitms(20);// Change the MS here for however long it takes to do a full rotation 
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:255: M1P1 = LOW; 
	clr	_P2_7
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:256: M1P2 = LOW; 
	clr	_P2_5
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:257: M2P1 = LOW; 
	clr	_P2_4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:258: M2P2 = LOW;
	clr	_P2_3
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:260: OrientFlag = 0;
	clr	a
	mov	_OrientFlag,a
	mov	(_OrientFlag + 1),a
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:261: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SpinR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:263: void SpinR (void){
;	-----------------------------------------
;	 function SpinR
;	-----------------------------------------
_SpinR:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:267: M1P1 = LOW; 
	clr	_P2_7
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:268: M1P2 = HIGH; 
	setb	_P2_5
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:269: M2P1 = HIGH; 
	setb	_P2_4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:270: M2P2 = LOW; 
	clr	_P2_3
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:272: waitms(20);// Change the MS here for however long it takes to do a full rotation 
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:275: M1P1 = LOW; 
	clr	_P2_7
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:276: M1P2 = LOW; 
	clr	_P2_5
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:277: M2P1 = LOW; 
	clr	_P2_4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:278: M2P2 = LOW;
	clr	_P2_3
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:280: OrientFlag = 0;
	clr	a
	mov	_OrientFlag,a
	mov	(_OrientFlag + 1),a
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:281: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Forward'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:284: void Forward (void){
;	-----------------------------------------
;	 function Forward
;	-----------------------------------------
_Forward:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:285: while ( command == 1){
L015001?:
	mov	a,#0x01
	cjne	a,_command,L015008?
	clr	a
	cjne	a,(_command + 1),L015008?
	sjmp	L015009?
L015008?:
	sjmp	L015003?
L015009?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:286: M1P1 = HIGH;
	setb	_P2_7
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:287: M2P1 = HIGH;
	setb	_P2_4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:288: M1P2 = LOW;
	clr	_P2_5
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:289: M2P2 = LOW;}
	clr	_P2_3
	sjmp	L015001?
L015003?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:290: return;}
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Backwards'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:292: void Backwards (void){
;	-----------------------------------------
;	 function Backwards
;	-----------------------------------------
_Backwards:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:293: M1P1 = LOW;
	clr	_P2_7
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:294: M2P1 = LOW;
	clr	_P2_4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:295: M1P2 = HIGH;
	setb	_P2_5
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:296: M2P2 = HIGH;
	setb	_P2_3
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:297: return;}
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Left'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:299: void Left (void){
;	-----------------------------------------
;	 function Left
;	-----------------------------------------
_Left:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:300: M1P1 = HIGH;
	setb	_P2_7
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:301: M2P1 = LOW;
	clr	_P2_4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:302: M1P2 = HIGH;
	setb	_P2_5
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:303: M2P2 = LOW;
	clr	_P2_3
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:304: return;}
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Right'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:306: void Right (void){
;	-----------------------------------------
;	 function Right
;	-----------------------------------------
_Right:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:307: M1P1 = LOW;
	clr	_P2_7
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:308: M2P1 = HIGH;
	setb	_P2_4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:309: M1P2 = LOW;
	clr	_P2_5
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:310: M2P2 = HIGH;
	setb	_P2_3
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:311: return;}
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Clear_Pins'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:313: void Clear_Pins(void){
;	-----------------------------------------
;	 function Clear_Pins
;	-----------------------------------------
_Clear_Pins:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:314: M1P1 = LOW;
	clr	_P2_7
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:315: M1P2 = LOW;
	clr	_P2_5
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:316: M2P1 = LOW;
	clr	_P2_4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:317: M2P2 = LOW;
	clr	_P2_3
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:318: return;}
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetADC'
;------------------------------------------------------------
;channel                   Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:320: double GetADC (int channel)
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:322: if ( channel ==1 )
	cjne	r2,#0x01,L020002?
	cjne	r3,#0x00,L020002?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:323: AMX0P=LQFP32_MUX_P2_4;
	mov	_AMX0P,#0x0C
L020002?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:324: if (channel == 0)
	mov	a,r2
	orl	a,r3
	jnz	L020004?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:325: AMX0P=LQFP32_MUX_P2_3;
	mov	_AMX0P,#0x0B
L020004?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:327: AD0BUSY = 1;
	setb	_AD0BUSY
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:328: while(AD0BUSY);
L020005?:
	jb	_AD0BUSY,L020005?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:330: return (((ADC0L+(ADC0H*0x100))*VDD)/1023.0);
	mov	r2,_ADC0L
	mov	r3,#0x00
	mov	r5,_ADC0H
	mov	r4,#0x00
	mov	a,r4
	add	a,r2
	mov	dpl,a
	mov	a,r5
	addc	a,r3
	mov	dph,a
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xCCCD
	mov	b,#0x54
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xC0
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Read_Distance'
;------------------------------------------------------------
;num                       Allocated to registers r2 r3 
;v                         Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:350: double Read_Distance(int num){
;	-----------------------------------------
;	 function Read_Distance
;	-----------------------------------------
_Read_Distance:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:351: double v = 0;
	mov	r4,#0x00
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:354: if (num == 0){
	clr	a
	mov	r5,a
	mov	r6,a
	mov	r7,a
	mov	a,r2
	orl	a,r3
	jnz	L021002?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:355: v = GetADC(0);
	mov	dptr,#0x0000
	push	ar2
	push	ar3
	lcall	_GetADC
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	pop	ar3
	pop	ar2
L021002?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:357: if (num == 1){
	cjne	r2,#0x01,L021004?
	cjne	r3,#0x00,L021004?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:358: v = GetADC(1);}
	mov	dptr,#0x0001
	lcall	_GetADC
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L021004?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:360: return v;
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Follow'
;------------------------------------------------------------
;LeftD                     Allocated to registers r2 r3 r4 r5 
;RightD                    Allocated with name '_Follow_RightD_1_70'
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:362: void Follow(void)
;	-----------------------------------------
;	 function Follow
;	-----------------------------------------
_Follow:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:367: LeftD  = Read_Distance(0);
	mov	dptr,#0x0000
	lcall	_Read_Distance
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:368: RightD = Read_Distance(1);
	mov	dptr,#0x0001
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Read_Distance
	mov	_Follow_RightD_1_70,dpl
	mov	(_Follow_RightD_1_70 + 1),dph
	mov	(_Follow_RightD_1_70 + 2),b
	mov	(_Follow_RightD_1_70 + 3),a
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:370: if (LeftD > Dist && RightD > Dist){ // Move Forward
	mov	dpl,_Dist
	mov	dph,(_Dist + 1)
	lcall	___uint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L022002?
	mov	dpl,_Dist
	mov	dph,(_Dist + 1)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_Follow_RightD_1_70
	mov	dph,(_Follow_RightD_1_70 + 1)
	mov	b,(_Follow_RightD_1_70 + 2)
	mov	a,(_Follow_RightD_1_70 + 3)
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L022002?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:371: M1P1 = HIGH;
	setb	_P2_7
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:372: M2P1 = HIGH;
	setb	_P2_4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:373: M1P2 = LOW;
	clr	_P2_5
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:374: M2P2 = LOW;}
	clr	_P2_3
L022002?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:376: if (LeftD < Dist && RightD < Dist){ // Backwards
	mov	dpl,_Dist
	mov	dph,(_Dist + 1)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L022005?
	mov	dpl,_Dist
	mov	dph,(_Dist + 1)
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_Follow_RightD_1_70
	mov	dph,(_Follow_RightD_1_70 + 1)
	mov	b,(_Follow_RightD_1_70 + 2)
	mov	a,(_Follow_RightD_1_70 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L022005?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:377: M1P1 = LOW;
	clr	_P2_7
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:378: M2P1 = LOW;
	clr	_P2_4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:379: M1P2 = HIGH;
	setb	_P2_5
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:380: M2P2 = HIGH;}
	setb	_P2_3
	ret
L022005?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:383: Clear_Pins();
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:385: return;
	ljmp	_Clear_Pins
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:387: void main (void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:389: while(1){
L023013?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:390: command = rx_byte();  // reads the command being sent from the transmitter
	lcall	_rx_byte
	mov	r2,dpl
	mov	_command,r2
	mov	(_command + 1),#0x00
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:392: if (command == 8){	
	mov	a,#0x08
	cjne	a,_command,L023023?
	clr	a
	cjne	a,(_command + 1),L023023?
	sjmp	L023024?
L023023?:
	sjmp	L023002?
L023024?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:393: Follow();}
	lcall	_Follow
L023002?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:395: if (command == 2){
	mov	a,#0x02
	cjne	a,_command,L023025?
	clr	a
	cjne	a,(_command + 1),L023025?
	sjmp	L023026?
L023025?:
	sjmp	L023004?
L023026?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:396: Forward();}
	lcall	_Forward
L023004?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:398: if (command == 3){
	mov	a,#0x03
	cjne	a,_command,L023027?
	clr	a
	cjne	a,(_command + 1),L023027?
	sjmp	L023028?
L023027?:
	sjmp	L023006?
L023028?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:399: Backwards();}
	lcall	_Backwards
L023006?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:401: if (command == 4){
	mov	a,#0x04
	cjne	a,_command,L023029?
	clr	a
	cjne	a,(_command + 1),L023029?
	sjmp	L023030?
L023029?:
	sjmp	L023008?
L023030?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:402: Left();}
	lcall	_Left
L023008?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:404: if (command == 5){
	mov	a,#0x05
	cjne	a,_command,L023031?
	clr	a
	cjne	a,(_command + 1),L023031?
	sjmp	L023032?
L023031?:
	sjmp	L023010?
L023032?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:405: Right();}
	lcall	_Right
	sjmp	L023013?
L023010?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Reciever.c:407: Clear_Pins();
	lcall	_Clear_Pins
	sjmp	L023013?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST

	CSEG

end
