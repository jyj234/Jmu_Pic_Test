#include<pic.h>
__CONFIG(0xFF29);
#define rs RA5
#define rw RA4
#define e RA3
char ad1,a,b,c,d,e1,f,rcreg;
bit flag;
int y;
unsigned long x,buf;
static volatile const long table1[6]={0,1,2,3,4,5};
static volatile char table[16]={0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,
                        0x38,0x39,0x41,0x42,0x43,0x44,0x45,0x46};
void DELAY()
{unsigned int i;for(i=999;i>0;i--);}
void ENABLE()
{rs=0;rw=0;e=0;DELAY();e=1;}
void ENABLE1()
{rs=1;rw=0;e=0;DELAY();e=1;}
void div(){
	a=buf/100000;
	x=buf-a*100000;
	b=x/10000;y=x-b*10000;
	c=y/1000;x=y-c*1000;
	d=x/100;y=x-d*100;
	e1=y/10;f=y-e1*10;
}
void interrupt usart_seve()
{rcreg=SSPBUF;}
main()
{
	TRISD=0;//ad_data.count=0;
	TRISA=0;ADCON1=7;e=1;
	GIE=1;
	PORTB=0;
	DELAY();//调用延时，刚上电的LCD复位不一定有PIC快
	PORTD=1;//清屏
	ENABLE();
	PORTD=0x38;//8位2行5x7点阵
	ENABLE();
	PORTD=0x0C;//显示器开，光标开，闪烁开
	ENABLE();
	PORTD=0X06;//文字不动，光标自动右移
	ENABLE();
	TRISC=0B11011111;//与SPI引脚相关
	SSPSTAT=0B01000000;SSPCON=0B00110100;//SPI接收初始化
	GIE=1;PEIE=1;SSPIE=1;SSPIF=0;//SSPIE=1为只开接收中断
loop:
	PORTD=0X80;ENABLE();//光标指向第一行位置
	PORTD=table[rcreg>>4];ENABLE1();
	PORTD=table[rcreg&0x0f];ENABLE1();
	PORTD='H';ENABLE1();//送第一行第三数据
	goto loop;
}
