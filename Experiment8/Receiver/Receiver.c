#include<pic.h>

__CONFIG (0xff29);

volatile unsigned char OPTION_REG @0x81;

#define F_T 21
#define T 200
#define RS RA5
#define RW RA4
#define E RA3

//PORTA=0;写在后面了，导致只能输出一行
//RBIE=1在Y=RBIF;RBIF=0;之后写第一次不会进中断
char s[20]={"1000000"};
char cdata;
enum{INS,DATA} ;
void init();
void delay (int t);
void enable (int t);
void show_a(long x);
void show();
void tostring ( long x);

char a,b;
union{
	char c[3];
	long i;
}data;
bit flag,cflag,cleanflag;
char cdata,nowcdata,x,y,z,redata;
int cnt=0;
void interrupt tmr2()
{
	if(TMR2IF==1){
		++cnt;
		if(cnt==1){
			cnt=0;
			SSPBUF=cdata;
		}
		TMR2IF=0;
	}
	if(SSPIF==1){
		SSPIF=0;
		if((SSPBUF&0x80)==0){
			data.i=(SSPBUF&0B00011111);
			redata=((SSPBUF&0B01100000)>>5);
		}
		else{
			data.i+=((SSPBUF&0B00011111)<<5);
			redata+=((SSPBUF&0B00100000)>>3);
			flag=1;
		}
	
	}
	else if(RBIF==1){
		if(PORTD==0x0f)
			return;
		y=y^PORTB;
		TRISB=0X0F;
		delay(10);
		x=PORTB&0X0F;
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
		delay(10);
		TRISB=0XF0;
		PORTB=0;
		y=PORTB;

		RC0=cdata&1;
		RC1=(cdata&0b10)>>1;
		RC2=(cdata&0b100)>>2;
		RBIF=0;
		//SSPBUF=cdata;
		//SSPIF=0;
	}
}
main () 
{
   	init ();
	flag=1;
	cflag=1;
	PORTD=1;
    while(1){
		if(flag){
			show();
			flag=0;
		}
	}
}

void init ( ) 
{

	TRISB=0XF0;
	TRISA=0;
	TRISD=0;
	ADCON1=7;
	TRISC=0xFF;
	TRISC0=0;
	TRISC1=0;
	TRISC2=0;
	TRISC5=0;
	nRBPU=0;

	PORTD=0;
	PORTB=0;
	PORTC=0;
	PORTA=0;

	E=1;

	SSPSTAT=0;SSPCON=0X25;
	GIE=1;PEIE=1;
	SSPIE=1;SSPIF=0;

	delay(1000);
	PORTD=0x38;enable(INS);
	PORTD=0x0C;enable(INS);

	T2CON=0B01111111;PR2=255;
	TMR2IF=0;TMR2IE=1;

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
//	show_a(data.c[0]);//1*data.i/1023
/*	PORTD='V';
	enable(DATA);
	PORTD=0XC0;enable(INS);
	show_a(data.c[1]);//1*data.i/1023
	PORTD='V';
	enable(DATA);*/
	show_a(49*data.i);
	PORTD=0XC0;enable(INS);
	PORTD=redata+'0';enable(DATA);
//	show_a(5*data.i*10000/1023);//1*data.i/1023
}