#include<pic.h>

__CONFIG (0xff29);

volatile unsigned char OPTION_REG @0x81;
#define F_T 21
#define T 200
#define RS RA5
#define RW RA4
#define E RA3

//位运算优先级
//发送完SSPIF=1
enum{INS,DATA};

static volatile const char table[16]={0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,
0x39,0x41,0x42,0x43,0x44,0x45,0x46};//字符显示，传给超级终端
char s[20]={"1000000"};
char cdata;
void init();
void delay(int t);
void enable (int t);
void tostring (long x);
void show_a(long x);
void show ();

bit flag=0,cflag,uflag;
char x,y,z;
union{
	char c[3];
	long i;
}data;
bit c0,c1,c2;
int tmp;
void interrupt tmr2()
{
	if(SSPIF==1){
		if(tmp!=SSPBUF){
			tmp=SSPBUF;
			cdata=tmp;
			CHS0=cdata&0B1;
			CHS1=(cdata&0B10)>>1;
			CHS2=(cdata&0B100)>>2;
		}
		SSPIF=0;
		
	}
	if(RCIF==1){
		cdata=RCREG&0x0f;
		CHS0=cdata&0B1;
		CHS1=(cdata&0B10)>>1;
		CHS2=(cdata&0B100)>>2;
	}
	if(TMR2IF==1){
		flag=!flag;
		TMR2IF=0;
		GO_nDONE=1;
		ADIF=0;
		uflag=1;
	    if(flag==1){
			SSPBUF=((ADRESH&0x03)<<3)+((ADRESL&0xe0)>>5)+((cdata&0B100)<<3)+(1<<7);//(ADRESH&0x03)<<3+(ADRESL&0xe0>>5)
		}
		else{
		SSPBUF=(ADRESL&0x1f)+((cdata&0B11)<<5);//(cdata&0B11)<<5;
		}
	}	
	if(RBIF==1){
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
		CHS0=cdata&0B1;
		CHS1=(cdata&0B10)>>1;
		CHS2=(cdata&0B100)>>2;
		//PORTD=cdata;
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
    while(1){
		if(uflag==1){
			uflag=0;
			while(TRMT==0);
			TXREG=table[cdata];
			while(TRMT==0);
			TXREG=':';
			while(TRMT==0);
			TXREG=table[ADRESH&0x0f];
			while(TRMT==0);
			TXREG=table[ADRESL>>4];
			while(TRMT==0);
			TXREG=table[ADRESL&0x0f];
			while(TRMT==0);
			TXREG=' ';
			
		}
	}
}

void init ( ) 
{
	TRISB=0XF0;
	TRISE0=1;
	TRISE1=1;
	TRISE2=1;
	TRISA=0XFF;
	//TRISD=0XFF;
TRISD=0;
	TRISC=0XFF;
	TRISC3=0;
	TRISC5=0;
	nRBPU=0;

	PORTE=0;
	PORTB=0;
	PORTC=0;
	PORTA=0;
	PORTD=0;
	E=1;
	
	delay(1000);
	PORTD=0x38;enable(INS);
	PORTD=0x0C;enable(INS);
	
	SPBRG=12;
	TXSTA=0B00100100;SYNC=0;//TX9=1;
	RCSTA=0;SPEN=1;
	TXEN=1;CREN=1;
	
	GIE=1;PEIE=1;TMR2IE=1;TMR2IF=0;ADIF=0;
	RCIE=1;
	ADCON0=0B01000001;ADCON1=0B10000000;
	T2CON=0B01111111;PR2=255;
	
	SSPSTAT=0;SSPCON=0X22;

	y=PORTB;RBIF=0;RBIE=1;

	SSPIE=1;
	SSPIF=0;
	
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