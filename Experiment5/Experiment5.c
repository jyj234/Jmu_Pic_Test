#include<pic.h>
#include<math.h>

__CONFIG (0xff29);

#define F_T 21
#define T 200
#define RS RA5
#define RW RA4
#define E RA3

int f_hz[2]={1,1},addflag=1;
long cnt0=0 , cnt1=0;
char a[15];
enum{INS,DATA} ;
volatile unsigned char OPTION_REG @0x81;
void init();
void delay (int t);
void enable (int t);
void show_a(long x,char *s);
void show();
char tostring ( long x , char *s);
void change (int i, char op);

char tout=0,cntH=0,cntL=0,outcnt=0,end=1,cnt=24,icnt=0;
bit tsmflag,showflag,hflag;
union{
	char c[3];
	long l;
}showdata,lastdata;

//long data=0x001312;
void interrupt ccp1()
{
	if(CCP1IF){
			CCP1IF=0;
			icnt=!icnt;
			if(icnt==0){
				lastdata.l=showdata.l;
				showdata.c[0]=CCPR1L+37;
				showdata.c[1]=CCPR1H+CARRY;
				showdata.c[2]=tout;
				if(lastdata.l!=showdata.l)
				showflag=1;
			}
			else{
				TMR1L=0;
				TMR1H=0;
				tout=0;
			}
		}
	else{
		TMR1IF=0;
		++tout;
	}
}

main () 
{
	
   	init ();
   	//show();
	TMR1ON=1;
	PORTD='0';enable(DATA);
    while(1){
		show();
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



	GIE=1; PEIE=1;CCP1IE=1;CCP1IF=0;
	TMR1IE=1;TMR1IF=0;
	T1CON=0B00000000;
	CCP1CON=5;//捕捉每个上升沿*/
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

char tostring ( long x , char *s){
	if(x==0){
		s[0]='0';
		return 1;
	}
	int i=0;
	while(x){
		s[i]=x%10+'0';
		x/=10;
		++i;
	}
	return i;
}


void show_a(long x,char *s){
	int end=tostring(x,s);
	for(int i=end-1;i>=0;--i){
		PORTD=s[i];
		enable(DATA);
	}
}


void show ( ){
PORTD=0x80; 
enable (INS); //清屏
show_a(showdata.l ,a);  //显示RA0频率
PORTD='u';enable(DATA);
PORTD='s',enable(DATA);
}

