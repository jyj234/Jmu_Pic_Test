#include<pic.h>

__CONFIG (0xff29);

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

char tout=0,cnt=24,icnt=0,end=0;
bit tsmflag,showflag,hflag,upflag;
union{
	char c[3];
	long l;
}showdata,data;
long redata,trdata;
void interrupt ccp1()
{
		if(CCP1IF==1){
			CCP1IF=0;
			if(tsmflag==1){//发射信号
				hflag=!hflag;
				if(hflag){//是否发送同步头
					RC7=1;
					
					CCPR1H=TMR1H;
					CCPR1L=TMR1L+158;
					CCPR1H=CCPR1H+CARRY;
	
					TMR2=0;
					TMR2ON=1;
					CCPR2L=13;
				}
				else if(cnt==1){//发送最后的结束标志
					RC7=0;
					TMR2ON=0;
					CCPR2L=0;
	
					CCPR1H=TMR1H+2;
					CCPR1L=TMR1L+152;
					CCPR1H=CCPR1H+CARRY;
	
					--cnt;
				}
				else if(cnt==0){//为下面的捕捉输入周期做准备
					RC7=0;
					TMR2ON=0;
					CCPR2L=0;

					CCP1CON=5;
					tsmflag=0;
					//trdata=1;
					icnt=0;
					hflag=0;
				}
				else{			//发送高低电平
					RC7=0;
					TMR2ON=0;
					CCPR2L=0;
					if(trdata&0x800000){
					CCPR1H=TMR1H+1;
					CCPR1L=TMR1L+130;//141
					CCPR1H=CCPR1H+CARRY;
					}
					else{
					CCPR1H=TMR1H;
					CCPR1L=TMR1L+126;//137
					CCPR1H=CCPR1H+CARRY;
					}
					--cnt;
					trdata<<=1;
				}
			}
			else{
				if(CCP1M0==0){
					CCP1CON=0x05;
					if(CCPR1H<=0){//低电平
						redata<<=1;
					}			
					else if(CCPR1H<=1){//高电平
						redata<<=1;
						++redata;
					}
					else if(CCPR1H<=2){//结束位
						showdata.l=redata;
						trdata=redata;
						showflag=1;
						redata=0;
						//准备发送信号
						tsmflag=1;
						CCP1CON=10;
						cnt=25;
						return;
					}
				}
				else{	
					CCP1CON=0x04;
					TMR1L=0;
					TMR1H=0;
				}
			}
		}

}
main () 
{
   	init ();
   	show();
	TMR1ON=1;
	tsmflag=0;
    while(1){
		if(showflag){
			showflag=0;
			show();
		}
	}
}

void init ( ) 
{
	TRISD=0;
	TRISA=0;
	TRISC1=0;
	TRISC2=1;
	TRISC7=0;
	TRISC4=0;
	TRISB=0x0;
	ADCON1=7;
	
	PORTD=0;
	RC7=0;
	E=1;
	
	delay(1000);
	PORTD=0x38;enable (INS);
	PORTD=0x0c;enable (INS);

	tsmflag=0;
	showflag=0;
	hflag=0;

	T2CON=0;
	PR2=26;
	CCPR2L=13;
	CCP2CON=0X0C;
	TMR2ON=0;

	GIE=1; PEIE=1;
	CCP1IE=1;CCP1IF=0;
	T1CON=0B00000000;
	CCP1CON=0X05;//捕捉每个上升沿

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

void tostring ( long x){
	for(int i=6;i>=0;--i){
		s[i]=x%10+'0';
		x/=10;
	}
}


void show_a(long x){
	tostring(x);
	for(int i=0;i<=6;++i){
		PORTD=s[i];
		enable(DATA);
	}
}
long tmp;
void show (){
	PORTD=0x80; 
	enable (INS); //第一行
/*	tmp=showdata.l;
	for(int i=23;i>=0;--i){
		PORTD=(tmp&1)+'0';
		enable(DATA);
		if(i==12){
			PORTD=0xC0;
			enable(INS);
		}
		tmp>>=1;
	}*/
	show_a(showdata.l);  
}