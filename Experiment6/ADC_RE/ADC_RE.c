#include<pic.h>

__CONFIG (0xff29);

volatile unsigned char OPTION_REG @0x81;

#define F_T 21
#define T 200
#define RS RA5
#define RW RA4
#define E RA3

char s[20]={"1000000"};
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
bit flag;
char cnt=0;
void interrupt tmr2()
{
	if(RX9D==0)
	data.c[1]=RCREG;
	else
	data.c[0]=RCREG;
	//PORTD=RCREG;
	flag=1;
	PORTD=0;
}
main () 
{
   	init ();
	//PORTD='1';enable(DATA);
	flag=1;
	PORTD=0XFF;
	show();
    while(1){
		if(flag){
		show();
		flag=0;
		}
	}
}

void init ( ) 
{
	ADCON1=7;
	TRISA=0;
	TRISD=0;
	TRISC=0XFF;
	
	PORTB=0;
	PORTD=0;
	E=1;
	
	delay(1000);
	PORTD=0x38;enable(INS);
	PORTD=0x0C;enable(INS);

	SPBRG=38;
	TXSTA=0;SYNC=0;
	RCSTA=0;RX9=1;
	SPEN=1;CREN=1;
	
	GIE=1;PEIE=1;
	RCIE=1;
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
/*	show_a(data.c[0]);//1*data.i/1023
	PORTD='V';
	enable(DATA);
	PORTD=0XC0;enable(INS);
	show_a(data.c[1]);//1*data.i/1023
	PORTD='V';
	enable(DATA);*/
	show_a(5*data.i*10000/1023);//1*data.i/1023
//show_a(data.i);
}