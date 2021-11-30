#include<pic.h>
#include<math.h>

__CONFIG (0xff29);

#define F_T 21
#define T 200
#define RS RA5
#define RW RA4
#define E RA3

char a[15];
char s[20]={"1000000"};
enum{INS,DATA} ;
void init();
void delay (int t);
void enable (int t);
void show_a(long x,char *s);
void show();
void tostring ( long x , char *s);

bit showflag,flag;
long data=0,showdata=0;
char end=0;
void interrupt ccp1()
{
	if(CCP1IF){
			if(CCP1M0){
				CCP1CON=0x04;
				CCP1IF=0;
				if(CCPR1H<=0){//低电平
					data<<=1;
				}			
				else if(CCPR1H<=1){//高电平
					data<<=1;
					++data;
				}
				else if(CCPR1H<=3){//结束位
					showdata=data;
					showflag=1;
					data=0;
					return;
				}
			}
			else{	
				CCP1CON=0x05;
				CCP1IF=0;
				TMR1L=0;
				TMR1H=0;
			}
		}
}

main () 
{
	
   	init ();
   	show();
	TMR1ON=1;
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
	TRISC2=1;
	TRISC7=0;
	TRISB=0x0;
	ADCON1=7;
	
	PORTD=0;
	RC7=0;
	E=1;
	
	delay(1000);
	PORTD=0x38;enable (INS);
	PORTD=0x0c;enable (INS);

	showflag=0;

	GIE=1; PEIE=1;CCP1IE=1;CCP1IF=0;
	TMR1IF=0;
	T1CON=0B00000000;
	CCP1CON=4;//捕捉每个下降沿
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

void tostring ( long x , char *s){
	for(int i=6;i>=0;--i){
		s[i]=x%10;
		x/=10;
	}
}


void show_a(long x,char *s){
	tostring(x,s);
	for(int i=0;i<=6;++i){
		PORTD=s[i]+'0';
		enable(DATA);
	}
}

void show (){
	PORTD=0x80; 
	enable (INS); //到第一行
	show_a(showdata,s);  
}