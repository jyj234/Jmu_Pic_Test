#include<pic.h>
#include<math.h>

__CONFIG (0xff29);

#define F_T 21
#define T 100
#define RS RA5
#define RW RA4
#define E RA3

//int div[2][15]={{2499,1250,625,312,156,78,39},
//				{2499,1250,625,312,156,78,39}};
int div[2]={5000,5000};
float fdiv[2]={5000,5000};
int f_hz[2]={1,1},addflag=1;
int cnt0=0 ,cnt1=0;
char a[2][10]={ {'0','0','0','H','Z',' ','R','A','0','\0'},
                {'0','0','0','H','Z',' ','R','A','1','\0'}};
long tmp=0;
char level[2]={0,0};
enum{INS,DATA} ;
volatile unsigned char OPTION_REG @0x81;
void init();
void delay (int t);
void enable (int t);
void show_a(long x,char *s);
void show();
char tostring ( long x , char *s);
void change (int i, char op);

void interrupt tmr0()
{
   TMR0=256-T+F_T;
	++cnt0;
	++cnt1;
   if(cnt0>=div[0])
   {
   cnt0=0;
   RC0=!RC0;
   }
   if (cnt1>=div[1])
   {
   cnt1=0;
   RC1=!RC1;
   }
	T0IF=0;
}

main () 
{
   init ();
   show();
	GIE=1; T0IE=1; T0IF=0;
	OPTION_REG=0B00001000;
   TMR0=256-T+F_T;
   while(1){
   if(RB0==0){
   change (0,'+');
   }
   else if(RB1==0){
   change (0 ,'-');
   }
   else if(RB2==0){
   change (1,'+');
   }
   else if(RB3==0){
   change (1,'-') ;
   }
   else
   addflag=1;
   }
}

void init ( ) 
{
	TRISD=0;
	TRISA=0;
	TRISC=0;
	TRISB=0xff;
	ADCON1=7;
	
	PORTE=0;
	PORTA=0;
	PORTC=0;
	E=1;
	
	delay(100);
	PORTD=0x38;enable (INS);
	PORTD=0x0c;enable (INS);
}


void change (int i, char op) {
	if (addflag==1)     //判断—次按健是否执行两次change
		addflag=0;
	else
		return;
	if(op=='+'&&f_hz[i] >=5000)  //频率超过64Hz，退出return;
		return;
	if(op=='-'&&f_hz[i]<=1)  //频率小于1HZ，退出return;
		return;
	if(op=='+'){
		f_hz[i]<<=1;
		fdiv[i]/=2;
	}
	else {
		f_hz [i]>>=1;
		fdiv[i]=fdiv[i]*2;
	}
	div[i]=(int)(fdiv[i]+0.5);
	show ( );    //显示改变后的内容
}

void delay(int t){
for (int i=0;i<t;++i) ;
}


void enable (int t) {
RS=t;
RW=0;
E=0;
delay(10);
E=1;
}

char tostring ( long x , char *s){
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


void show_a(long x,char *s){
	int end=tostring(x,s);
	for(int i=end-1;i>=0;--i){
		PORTD=s[i];
		enable(DATA);
	}
}


void show ( ){
PORTD=0x01; 
enable (INS); //清屏
show_a(f_hz[0] ,a[ 0] );  //显示RA0频率
PORTD='H';enable(DATA);
PORTD='Z';enable(DATA);
PORTD=' ';enable(DATA);
PORTD='R';enable(DATA);
PORTD='C';enable(DATA);
PORTD='0';enable(DATA);
PORTD=0xC0; enable(INS); //进入第二行
show_a(f_hz[1],a[1] );//显示RA1频率
PORTD='H';enable(DATA);
PORTD='Z';enable(DATA);
PORTD=' ';enable(DATA);
PORTD='R';enable(DATA);
PORTD='C';enable(DATA);
PORTD='1';enable(DATA);
}

