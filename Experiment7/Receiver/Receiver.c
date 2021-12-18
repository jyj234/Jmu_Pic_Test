#include<pic.h>

__CONFIG (0xff29);

volatile unsigned char OPTION_REG @0x81;

#define F_T 21
#define T 200
#define RS RA5
#define RW RA4
#define E RA3

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
char cnt=0,cdata,nowcdata,x,y,z,redata;
void interrupt tmr2()
{
	if(RCIF==1){
		if(RX9D==1){
		data.c[1]=RCREG&0x0F;
		redata=(RCREG&0xF0)>>5;
		}
		else
		data.c[0]=RCREG;
		//PORTD=RCREG;
		flag=1;
		PORTD=0;
	}
	else if(RBIF==1){
		//cleanflag=1;
		flag=1;
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
		RBIF=0;
		TXREG=cdata;
	}
}
main () 
{
   	init ();
	//PORTD='1';enable(DATA);
	flag=1;
	cflag=1;
    while(1){
		if(flag){
			if(cleanflag==1){
			cleanflag=0;
			PORTD=1;enable(INS);
			}
			show();
			flag=0;
		}
	}
}

void init ( ) 
{
	/*TRISA=0;
	TRISD=0;
	TRISB=0xF0;
	TRISC=0xC0;
	
	nRBPU=0;
	PORTB=0;
	PORTD=0;
	E=1;*/
	TRISB=0XF0;
	TRISA=0;
	TRISD=0;
	ADCON1=7;
	TRISC=0xC0;
	nRBPU=0;

	PORTD=0;
	PORTE=0;
	PORTB=0;
	PORTC=0;
	PORTA=0;
	E=1;
	
	delay(1000);
	PORTD=0x38;enable(INS);
	PORTD=0x0C;enable(INS);

	SPBRG=38;
	TXSTA=0;SYNC=0;
	RCSTA=0;RX9=1;
	SPEN=1;
	TXEN=1;CREN=1;
	
	GIE=1;RBIE=1;
	y=PORTB;RBIF=0;

	PEIE=1;
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
	enable (INS); //����һ��
	/*show_a(data.c[0]);//1*data.i/1023
	PORTD=0XC0;enable(INS);
	show_a(data.c[1]);//1*data.i/1023
	PORTD='V';
	enable(DATA);*/
	show_a(data.i*49);//1*data.i/1023
	PORTD='V';
	enable(DATA);
	PORTD=' ';enable(DATA);
	PORTD=cdata+'0';enable(DATA);
	PORTD=' ';enable(DATA);
	PORTD=redata+'0';enable(DATA);
//show_a(data.i);
}