;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Dec 11 2012) (MSVC)
; This file was generated Sat Mar 21 16:48:16 2015
;--------------------------------------------------------
$name Transmitter
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
	public _Timer2_ISR
	public _TIMER0_Init
	public _UART0_Init
	public _SYSCLK_Init
	public _PORT_Init
	public _waitms
	public _Timer3us
	public __c51_external_startup
	public _overflow_count
	public _Freq
	public _pulse2
	public _pulse1
	public _pwm_count
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
; overlayable bit register bank
;--------------------------------------------------------
	rseg BIT_BANK
bits:
	ds 1
	b0 equ  bits.0 
	b1 equ  bits.1 
	b2 equ  bits.2 
	b3 equ  bits.3 
	b4 equ  bits.4 
	b5 equ  bits.5 
	b6 equ  bits.6 
	b7 equ  bits.7 
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_pwm_count:
	ds 1
_pulse1:
	ds 2
_pulse2:
	ds 2
_Freq:
	ds 4
_overflow_count:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
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
_Timer2_ISR_sloc0_1_0:
	DBIT	1
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
	CSEG at 0x002b
	ljmp	_Timer2_ISR
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
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:10: volatile unsigned char pwm_count=0;
	mov	_pwm_count,#0x00
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:11: volatile unsigned int pulse1=100;
	mov	_pulse1,#0x64
	clr	a
	mov	(_pulse1 + 1),a
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:12: volatile unsigned int pulse2=50;
	mov	_pulse2,#0x32
	clr	a
	mov	(_pulse2 + 1),a
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:13: volatile double Freq=100.0;
	mov	_Freq,#0x00
	mov	(_Freq + 1),#0x00
	mov	(_Freq + 2),#0xC8
	mov	(_Freq + 3),#0x42
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:17: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:19: PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:20: VDM0CN=0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:21: RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:29: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:33: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:36: SCON0 = 0x10; 
	mov	_SCON0,#0x10
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:38: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:39: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:40: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:53: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:54: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:55: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:56: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:57: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:60: P2MDOUT|=0b_0001_0111;
	orl	_P2MDOUT,#0x17
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:61: P0MDOUT |= 0x10; // Enable UTX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:62: XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:63: XBR1     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:66: TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN,#0x00
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:67: CKCON|=0b_0001_0000;
	orl	_CKCON,#0x10
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:68: TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	mov	_TMR2RL,#0x78
	mov	(_TMR2RL >> 8),#0xEC
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:69: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:70: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:71: TR2=1;         // Start Timer2
	setb	_TR2
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:73: EA=1; // Enable interrupts
	setb	_EA
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:75: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 r3 r4 r5 
;i                         Allocated to registers r6 r7 r0 r1 
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:78: void Timer3us(unsigned long us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:83: CKCON|=0b_0100_0000;
	orl	_CKCON,#0x40
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:85: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xD0
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:86: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:88: TMR3CN = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN,#0x04
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:89: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r6,#0x00
	mov	r7,#0x00
	mov	r0,#0x00
	mov	r1,#0x00
L003004?:
	clr	c
	mov	a,r6
	subb	a,r2
	mov	a,r7
	subb	a,r3
	mov	a,r0
	subb	a,r4
	mov	a,r1
	subb	a,r5
	jnc	L003007?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:91: while (!(TMR3CN & 0x80));  // Wait for overflow
L003001?:
	mov	a,_TMR3CN
	jnb	acc.7,L003001?
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:92: TMR3CN &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN,#0x7F
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:89: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r6
	cjne	r6,#0x00,L003016?
	inc	r7
	cjne	r7,#0x00,L003016?
	inc	r0
	cjne	r0,#0x00,L003004?
	inc	r1
L003016?:
	sjmp	L003004?
L003007?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:94: TMR3CN = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:98: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:101: for(j=ms; j!=0; j--)
L004001?:
	cjne	r2,#0x00,L004010?
	cjne	r3,#0x00,L004010?
	ret
L004010?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:103: Timer3us(249);
	mov	dptr,#(0xF9&0x00ff)
	clr	a
	mov	b,a
	push	ar2
	push	ar3
	lcall	_Timer3us
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:104: Timer3us(249);
	mov	dptr,#(0xF9&0x00ff)
	clr	a
	mov	b,a
	lcall	_Timer3us
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:105: Timer3us(249);
	mov	dptr,#(0xF9&0x00ff)
	clr	a
	mov	b,a
	lcall	_Timer3us
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:106: Timer3us(250);
	mov	dptr,#(0xFA&0x00ff)
	clr	a
	mov	b,a
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:101: for(j=ms; j!=0; j--)
	dec	r2
	cjne	r2,#0xff,L004011?
	dec	r3
L004011?:
	sjmp	L004001?
;------------------------------------------------------------
;Allocation info for local variables in function 'PORT_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:110: void PORT_Init (void)
;	-----------------------------------------
;	 function PORT_Init
;	-----------------------------------------
_PORT_Init:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:112: P0MDOUT |= 0x10; // Enable UART TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:113: XBR0=0b_0000_0001; // Enable UART on P0.4(TX) and P0.5(RX)                    
	mov	_XBR0,#0x01
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:114: XBR1=0b_0101_0000; // Enable crossbar.  Enable T0 input.
	mov	_XBR1,#0x50
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:115: XBR2=0b_0000_0000;
	mov	_XBR2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SYSCLK_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:118: void SYSCLK_Init (void)
;	-----------------------------------------
;	 function SYSCLK_Init
;	-----------------------------------------
_SYSCLK_Init:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:126: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:130: OSCICN |= 0x03;   // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:131: RSTSRC  = 0x04;   // Enable missing clock detector
	mov	_RSTSRC,#0x04
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:134: void UART0_Init (void)
;	-----------------------------------------
;	 function UART0_Init
;	-----------------------------------------
_UART0_Init:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:136: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:139: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:140: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:141: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:154: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:155: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:156: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:157: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:158: TI = 1;  // Indicate TX0 ready
	setb	_TI
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:161: void TIMER0_Init(void)
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:163: TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:164: TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:165: TR0=0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:168: void Timer2_ISR (void) interrupt 5
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+2)
	push	(0+3)
	push	(0+4)
	push	(0+5)
	push	(0+6)
	push	(0+7)
	push	(0+0)
	push	(0+1)
	push	psw
	mov	psw,#0x00
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:171: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:172: pwm_count++;
	inc	_pwm_count
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:173: if(pwm_count>Freq) pwm_count=0;
	mov	dpl,_pwm_count
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	_Freq
	push	(_Freq + 1)
	push	(_Freq + 2)
	push	(_Freq + 3)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L009002?
	mov	_pwm_count,#0x00
L009002?:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:175: OUT0=pwm_count>pulse1?0:1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_pulse1
	subb	a,r2
	mov	a,(_pulse1 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_0,c
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:176: OUT1=pwm_count>pulse2?0:1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_pulse2
	subb	a,r2
	mov	a,(_pulse2 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_1,c
	pop	psw
	pop	(0+1)
	pop	(0+0)
	pop	(0+7)
	pop	(0+6)
	pop	(0+5)
	pop	(0+4)
	pop	(0+3)
	pop	(0+2)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:181: void main (void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Leighton Carmichael\Documents\GitStuff\ElectroMagCar\Transmitter.c:182: while(1){
L010002?:
	sjmp	L010002?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST

	CSEG

end
