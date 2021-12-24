#include<pic.h>
__EEPROM_DATA(0,0,0,0,0,0,0,0);
__CONFIG(0XFF29);

volatile unsigned char OPTION_REG @0x81;

#define RS RA5
#define RW RA4
#define E RA3
#define INS 0
#define DATA 1

int cnt=0,tcnt=0,diftcnt=0,diftmr0=0;
char lasttmr1L=0,lasttmr1H=0,diftmr1H=0,diftmr1L=0;
char test=5,nowtmr1H=0,nowtmr1L=0,tmpout=0,nowout=0;
long v=0;
int p;
char vcnt=0,flag=1;
char dis_show[10]={'0'};
char v_show[10]={'0'};

union{
	long data_l;
	char data_c[3];
}dis,diftmr1;
void delay(int t);
void enable(int order);
int toString(long x, char *s);
void show(long x,char *s);
void interrupt cal_dis(){
	if(INTF==1){
		INTF=0;
		++cnt;
		++vcnt;
		if(vcnt==0){
			nowout=tmpout;
			tmpout=0;

			nowtmr1H=TMR1H;
			nowtmr1L=TMR1L;

			flag=1;
			
		}
		else if(vcnt==10){
			//lasttmr1L=TMR1L;
			//lasttmr1H=TMR1H;
			TMR1H=0;
			TMR1L=0;
			vcnt=255;
			tmpout=0;
		}
		if(dis.data_l==600000){
			INTE=0;
			RA0=1;
		}
		else if(cnt>=740){//1000/(pi*d)=600
			cnt=0;
			++dis.data_l;
			eeprom_write(0x00,dis.data_c[0]);
			eeprom_write(0x01,dis.data_c[1]);
			eeprom_write(0x02,dis.data_c[2]);
			//eeprom_write(0x03,dis.data_c[3]);
		}
	}
	if(TMR1IF==1){
		TMR1IF=0;
		++tmpout;
	}
}//1.6650441064025904163852009931381
void main()
{
	
	TRISB=0X0F;RBPU=0;
	TRISD=0;
	TRISA=0;
	E=1;
	ADCON1=7;
	PORTD=0;//LCD

	dis.data_c[0]=eeprom_read(0x00);
	dis.data_c[1]=eeprom_read(0x01);
	dis.data_c[2]=eeprom_read(0x02);
	//dis.data_c[3]=eeprom_read(0x03);

	dis.data_l=599998;
	delay(100);

	PORTD=1;enable(INS);
	PORTD=0X38;enable(INS);
	PORTD=0X0C;enable(INS);
	PORTD=0X06;enable(INS);

	GIE=1;
	PEIE=1;
	TMR1IE=1;
	TMR1IF=0;
	T1CON=0B00000000;
	TMR1H=0xFD;TMR1L=0xA8;

	INTEDG=1;
	INTE=1;
	INTF=0;

	TMR1ON=1;
	while(1){
		if(flag){
			PORTD=0x80;enable(INS);
			show(dis.data_l,dis_show);
			PORTD='k';enable(DATA);
			PORTD='m';enable(DATA);
			v=0.5+23414/(nowout*256+nowtmr1H);//(1665*1000/256*3.6)/(t/256)km/h
			//v=5277/(nowout*256+(nowtmr1H-lasttmr1H))*3.6;
			PORTD=0xC0;enable(INS);
			show(v,v_show);
			PORTD='k';enable(DATA);
			PORTD='m';enable(DATA);
			PORTD='/';enable(DATA);
			PORTD='h';enable(DATA);

			flag=0;
		}
	}
}
void delay(int t){
	for(int i=0;i<t;++i);
}

void enable(int order)
{
	RS=order;
	RW=0;
	E=0;
	delay(100);
	E=1;
}

int toString(long x, char *s){
	if(x==0)
		return 1;
	int i=0;
	while(x){
		s[i]=x%10+'0';
		x/=10;
		++i;
	}
	return i;
}

void show(long x,char *s){
	int end=toString(x,s);
	for(int i=end-1;i>=0;--i){
		PORTD=s[i];
		enable(DATA);
	}
}