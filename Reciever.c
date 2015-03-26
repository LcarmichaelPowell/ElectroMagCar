#include <stdio.h>
#include <C8051F38x.h>

#define SYSCLK    48000000L // SYSCLK frequency in Hz#define SYSCLK      48000000L  // SYSCLK frequency in Hz
#define BAUDRATE     115200L // Baud rate of UART in bps

#define OUT0 P2_0
#define OUT1 P2_1


#define	COLOR_BLACK		0
#define	COLOR_RED		1
#define	COLOR_GREEN		2
#define	COLOR_YELLOW	3
#define	COLOR_BLUE		4
#define	COLOR_MAGENTA	5
#define	COLOR_CYAN		6
#define	COLOR_WHITE		7

// Some ANSI escape sequences
#define CURSOR_ON "\x1b[?25h"
#define CURSOR_OFF "\x1b[?25l"
#define CLEAR_SCREEN "\x1b[2J"
#define GOTO_YX "\x1B[%d;%dH"
#define CLR_TO_END_LINE "\x1B[K"

/* Black foreground, white background */
#define BKF_WTB "\x1B[0;30;47m"
#define FORE_BACK "\x1B[0;3%d;4%dm"
#define FONT_SELECT "\x1B[%dm"

#define VDD      3.325 // The measured value of VDD in volts
#define NUM_INS  2

#define HIGH 100
#define LOW 0


// Not Sure how the motors work completely, but just assign one to right one to left.  Adjust pins as needed
// M1P1 = Motor 1 Pulse 1...
#define M1P1 P2_7
#define M1P2 P2_5
#define M2P1 P2_4
#define M2P2 P2_3

//Buttons for different controller commands. Adjust pins as needed
#define FBUTTON    P0_0
#define BBUTTON    P0_1
#define TURNAROUND P0_2
#define PPARK      P0_3
#define BLEFT	   P0_5
#define BRIGHT     P0_6

#define MIN 3

unsigned volatile char overflow_count;
unsigned volatile int command;

volatile unsigned int Dist = 100;  // This is a number I made up, it is supposed to be changed somewhere else in the program

volatile unsigned int OrientFlag;

void waitms (unsigned int ms);
double GetADC (int channel);  
char _c51_external_startup (void)
{
	PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	VDM0CN=0x80; // enable VDD monitor
	RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD

	// CLKSEL&=0b_1111_1000; // Not needed because CLKSEL==0 after reset
	#if (SYSCLK == 12000000L)
		//CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4 
	#elif (SYSCLK == 24000000L)
		CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	#elif (SYSCLK == 48000000L)
		CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	#else
		#error SYSCLK must be either 12000000L, 24000000L, or 48000000L
	#endif
	OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency

	// Configure UART0
	SCON0 = 0x10; 
#if (SYSCLK/BAUDRATE/2L/256L < 1)
	TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	CKCON |=  0x08;
#elif (SYSCLK/BAUDRATE/2L/256L < 4)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/4L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 01                  
	CKCON |=  0x01;
#elif (SYSCLK/BAUDRATE/2L/256L < 12)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/12L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 00
#else
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2/48);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 10
	CKCON |=  0x02;
#endif
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
	
	// Configure the pins used for square output
	P2MDOUT|=0b_0001_0111;
	P0MDOUT |= 0x10; // Enable UTX as push-pull output
	XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)                     
	XBR1     = 0x40; // Enable crossbar and weak pull-ups

	// Initialize timer 2 for periodic interrupts
	TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	CKCON|=0b_0001_0000;
	TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2

	EA=1; // Enable interrupts
	
	return 0;
}
void change_Dist(int new){  //call to change the distance
	Dist = new;
	return;
}

	
void Timer3us(unsigned long us)
{
	unsigned long i;               // usec counter
	
	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON:
	CKCON|=0b_0100_0000;
	
	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	
	TMR3CN = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN & 0x80));  // Wait for overflow
		TMR3CN &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN = 0 ;                   // Stop Timer3 and clear overflow flag
}
void wait_bit_time(){
	waitms(4);
	return;
}

void wait_one_and_half_bit_time(){
	waitms(6);
	return;
}


unsigned char rx_byte (){ 
	unsigned char j, val;
	int v;
	//Skip the start bit
	val= 0;
	wait_one_and_half_bit_time();
	for(j= 0; j < 8; j++){	
		v=GetADC(0);
		val|=(v>MIN)?(0x01<<j):0x00;  // MIN defined up top
		wait_bit_time();}
	//Wait for stop bits
	wait_one_and_half_bit_time();
	return val;
}
void waitms (unsigned int ms)
{
	unsigned int j;
	for(j=ms; j!=0; j--)
	{
		Timer3us(249);
		Timer3us(249);
		Timer3us(249);
		Timer3us(250);
	}
}

void PORT_Init (void)
{
	P0MDOUT |= 0x10; // Enable UART TX as push-pull output
	XBR0=0b_0000_0001; // Enable UART on P0.4(TX) and P0.5(RX)                    
	XBR1=0b_0101_0000; // Enable crossbar.  Enable T0 input.
	XBR2=0b_0000_0000;
}

void SYSCLK_Init (void)
{
	// CLKSEL&=0b_1111_1000; // Not needed because CLKSEL==0 after reset
#if (SYSCLK == 12000000L)
	//CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4 
#elif (SYSCLK == 24000000L)
	CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
#elif (SYSCLK == 48000000L)
	CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
#else
	#error SYSCLK must be either 12000000L, 24000000L, or 48000000L
#endif
	OSCICN |= 0x03;   // Configure internal oscillator for its maximum frequency
	RSTSRC  = 0x04;   // Enable missing clock detector
}
 
void UART0_Init (void)
{
	SCON0 = 0x10;
   
#if (SYSCLK/BAUDRATE/2L/256L < 1)
	TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	CKCON |=  0x08;
#elif (SYSCLK/BAUDRATE/2L/256L < 4)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/4L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 01                  
	CKCON |=  0x01;
#elif (SYSCLK/BAUDRATE/2L/256L < 12)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/12L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 00
#else
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2/48);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 10
	CKCON |=  0x02;
#endif
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
}

void TIMER0_Init(void)
{
	TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	TR0=0; // Stop Timer/Counter 0
}
void SpinL (void)
{   //Do a 180 Left
    
    //Starts spinning 
    M1P1 = HIGH; 
    M1P2 = LOW; 
    M2P1 = LOW; 
    M2P2 = HIGH; 
    
    waitms(20);// Change the MS here for however long it takes to do a full rotation 
	
    //Stops Spinning
    M1P1 = LOW; 
    M1P2 = LOW; 
    M2P1 = LOW; 
    M2P2 = LOW;
    
	OrientFlag = 0;
	return;
}
void SpinR (void){
{   //Do a 180 Right
    
    //Starts spinning 
    M1P1 = LOW; 
    M1P2 = HIGH; 
    M2P1 = HIGH; 
    M2P2 = LOW; 
    
    waitms(20);// Change the MS here for however long it takes to do a full rotation 
	
    //Stops Spinning
    M1P1 = LOW; 
    M1P2 = LOW; 
    M2P1 = LOW; 
    M2P2 = LOW;
	
    OrientFlag = 0;
	return;
	}
}
void Forward (void){
	while ( command == 1){
		M1P1 = HIGH;
		M2P1 = HIGH;
		M1P2 = LOW;
		M2P2 = LOW;}
	return;}
	
void Backwards (void){
		M1P1 = LOW;
		M2P1 = LOW;
		M1P2 = HIGH;
		M2P2 = HIGH;
	return;}
	
void Left (void){
		M1P1 = HIGH;
		M2P1 = LOW;
		M1P2 = HIGH;
		M2P2 = LOW;
	return;}
	
void Right (void){
		M1P1 = LOW;
		M2P1 = HIGH;
		M1P2 = LOW;
		M2P2 = HIGH;
	return;}

void Clear_Pins(void){
	M1P1 = LOW;
	M1P2 = LOW;
	M2P1 = LOW;
	M2P2 = LOW;
	return;}
	
double GetADC (int channel)
{	
	if ( channel ==1 )
		AMX0P=LQFP32_MUX_P2_4;
	if (channel == 0)
		AMX0P=LQFP32_MUX_P2_3;
		
	AD0BUSY = 1;
	while(AD0BUSY);
	
	return (((ADC0L+(ADC0H*0x100))*VDD)/1023.0);
}

/*void Timer2_ISR (void) interrupt 5
{

	TF2H = 0; // Clear Timer2 interrupt flag
	pwm_count++;
	if(pwm_count>100) pwm_count=0;
		
	OUT0=pwm_count>pulse1?0:1;
	OUT1=pwm_count>pulse2?0:1;
	
}*/


/*
* This function is supposed to use Get_ADC and turn it into a LeftD and RightD Variable but its not implemented yet.
* Right now for now it just loads the different volatges into distances
*/
double Read_Distance(int num){
	double v = 0;

	
	if (num == 0){
	v = GetADC(0);
	}
	if (num == 1){
	v = GetADC(1);}
	
	return v;
	}
void Follow(void)
{
	double LeftD;
	double RightD;
	
	LeftD  = Read_Distance(0);
	RightD = Read_Distance(1);
	
	if (LeftD > Dist && RightD > Dist){ // Move Forward
	M1P1 = HIGH;
	M2P1 = HIGH;
	M1P2 = LOW;
	M2P2 = LOW;}
	
	if (LeftD < Dist && RightD < Dist){ // Backwards
	M1P1 = LOW;
	M2P1 = LOW;
	M1P2 = HIGH;
	M2P2 = HIGH;}
	
	else{
	Clear_Pins();
	}
	return;
	}
void main (void) {

	while(1){
		command = rx_byte();  // reads the command being sent from the transmitter
		
		if (command == 8){	
			Follow();}
		
		if (command == 2){
			Forward();}
				
		if (command == 3){
			Backwards();}
				
		if (command == 4){
			Left();}
				
		if (command == 5){
			Right();}
		else
			Clear_Pins();
	}			
}