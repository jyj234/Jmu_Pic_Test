#include<pic.h>

__CONFIG (0xff29);

volatile unsigned char OPTION_REG @0x81;
#define F_T 21
#define T 200
#define RS RA5
#define RW RA4
#define E RA3

enum{INS,DATA};

char s[20]={"1000000"};
char cdata;
void init();
void delay(int t);
void enable (int t);
void tostring (long x);
void show_a(long x);
void show ();

bit flag=0,cflag;
char x,y,z;
union{
	char c[3];
	long i;
}data;
void interrupt tmr2()
{
	if(RCIF==1){
		cdata=RCREG;
		PORTD=RCREG;
		//PORTC=cdata;
		CHS0=cdata&0B1;
		CHS1=(cdata&0B10)>>1;
		CHS2=(cdata&0B100)>>2;
	}
	else if(TMR2IF==1){
		flag=!flag;
		TMR2IF=0;
		GO_nDONE=1;
		while(ADIF==0);
		data.c[1]=ADRESH;
		data.c[1]|=cdata<<5;
		data.c[0]=ADRESL;
		ADIF=0;
	    	
		if(flag){
		TX9D=1;
		TXREG=data.c[1];
		}
		else{
		TX9D=0;
		TXREG=data.c[0];
		}
	}	
	else if(RBIF==1){
		y=y^PORTB;
		PORTD=y;
		TRISB=0X0F;
		delay(10);
		x=PORTB&0X0F;
		PORTD=x;
		z=y|x;
		if(z==0x1E)
			cdata=0;
		else if(z==0x2E)
			cdata=1;
		else if(z==0x4E)
			cdata=2;
		else if(z==0x8E)
			cdata=3;
		else if(z==0x1D)
			cdata=4;
		else if(z==0x2D)
			cdata=5;
		else if(z==0x4D)
			cdata=6;
		else if(z==0x8D)
			cdata=7;
		CHS0=cdata&0B1;
		CHS1=(cdata&0B10)>>1;
		CHS2=(cdata&0B100)>>2;
		RD0=CHS0;
		RD1=CHS1;
		RD2=CHS2;
		delay(10);
		TRISB=0XF0;
		PORTB=0;
		y=PORTB;
		RBIF=0;
	}
}
main () 
{
   	init ();
	cflag=1;
	PORTD=0;
    while(1){
		//show();
	}
}

void init ( ) 
{
	TRISB=0XF0;
	TRISE0=1;
	TRISE1=1;
	TRISE2=1;
	TRISA=0XFF;
	TRISD=0;
	TRISC=0xC0;
	nRBPU=0;

	PORTE=0;
	PORTB=0;
	PORTC=0;
	PORTA=0;
	E=1;
	
	delay(1000);
	PORTD=0x38;enable(INS);
	PORTD=0x0C;enable(INS);
	
	SPBRG=38;
	TXSTA=0;SYNC=0;TX9=1;
	RCSTA=0;SPEN=1;
	TXEN=1;CREN=1;
	
	GIE=1;PEIE=1;TMR2IE=1;TMR2IF=0;ADIF=0;
	RCIE=1;
	ADCON0=0B01000001;ADCON1=0B10000000;
	T2CON=0B01111111;PR2=255;
	

	y=PORTB;RBIF=0;RBIE=1;

	
}

void delay(int t){
for (int i=0;i<t;++i) ;
}


void enable (int t) {
	RS=t;
	RW=0;
	E=0;
	delay(30);
	E=1;
}

void tostring (long x){
	for(int i=6;i>=0;--i){
		s[i]=x%10+'0';
		x/=10;
	}
}
void show_a(long x){
	tostring(x);
	for(int i=0;i<=6;++i){
		if(i==3){
		PORTD='.';
		enable(DATA);
		}
		
		PORTD=s[i];
		enable(DATA);
	}
}
void show (){
	PORTD=0x80; 
	enable (INS); //到第一行
	show_a(5*data.i*10000/1023);//1*data.i/1023
	PORTD='V';
	enable(DATA);
}																																																			`