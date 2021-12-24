#include<pic.h>
__CONFIG(0XFF29);
//LCD控制线宏定义，根据实验板的引脚定义修改
#define rs RA5
#define rw RA4
#define e  RA3
static volatile char TABLE[16]={0x30,0x31,0x32,0x33,0x34,0x35,
0x36,0x37,0x38,0x39,0x41,0x42,0x43,0x44,0x45,0x46};
char adh,adl,a,b,result,preres;
void  DELAY()    //延时子程序
{unsigned int i;for(i=999;i>0;i--);}
void ENABLE()    //写入控制命令的子程序
{ rs=0; rw=0;e=0;   DELAY();  e=1;}
void ENABLE1()    //写入字的子程序
{ rs=1; rw=0;e=0;   DELAY();  e=1;}
void main()  //主程序
{
TRISB=0X0F;RBPU=0;result=0x00;preres=0x00; 
 TRISD=0;RE2=1;ADCON1=7;TRISA=0;RA1=0;
 PORTD=0;e=1;//当前数据输出口清0  
  DELAY();  //调用廷时,刚上电LCD复位不一定有PIC快
  PORTD =1;ENABLE(); //清屏，调延时，因为LCD是慢速器件
  PORTD=0x38;ENABLE();//8位2行5x7点阵
  PORTD=0x0C;ENABLE(); //显示器开、光标关、闪烁关
  PORTD=0x06;ENABLE(); //文字不动，光标自动右移    
loop: PORTD=0x80;ENABLE();//光标指向第一行第一个字符位置
//-----以下程序是4X4键盘扫描--------
    PORTB = 0X7f;                 //RB7输出低电平，其他三位输出高电平
asm("nop");                 //插入一定延时，确保电平稳定
result = PORTB;               //读回B口低4位结果
result = result & 0x0f;         //清除高4位
if (result != 0x0f)            //判断低4位是否为全1（全1代表没按键按下）？
{
	result = result | 0x70;     //否，加上高4位0x70，做为按键扫描的结果
}
else                        //是，改变低4位输出，重新判断是否有按键按下
{
	PORTB = 0Xbf;               //RB6输出低电平，其他三位输出高电平
	asm("nop");               //插入一定延时，确保电平稳定
	result = PORTB;             //读回B口高低4位结果
	result = result & 0x0f;       //清除高4位
	if (result != 0xf)           //判断低4位是否为全1（全1代表没按键按下）
		result = result | 0xb0;     //否，加上高4位0xb0，做为按键扫描的结果
	else{                      //是，改变低4位输出，重新扫描
		PORTB = 0Xdf;           //RB5输出低电平，其他三位输出高电平
		asm("nop");           //插入一定延时，确保电平稳定
		result = PORTB;         //读回B口低4位结果
		result = result & 0x0f;   //清除高4位
			if (result != 0x0f)      //判断低4位是否为全1（全1代表没按键按下）
			result = result | 0xd0;  //否，加上高4位0xd0，做为按键扫描的结果
			else{                  //是，改变高4位的输出，重新扫描
			PORTB = 0Xef;        //B4输出低电平，其他三位输出高电平
			asm("nop");        //插入一定延时，确保电平稳定
			result = PORTB;      //读回B口低4位结果
			result = result & 0x0f; //清除高4位
				if (result != 0x0f)   //判断低四位是否为全1（全1代表没有按键按下）
				result = result | 0xe0; //否，加上高4位0x0e，做为按键扫描的结果
				else               //是，全部按键扫描结束，没有按键按下，置无按键按下标志位
				result = 0xff;    //扫描结果为0xff，做为没有按键按下的标志
         }
      }
 }
if(result==0xff)//无键按下显示‘X’
result=preres;
else
preres=result;
//-----以下程序是4X4键盘扫描结果送LCD显示部分--------
    switch (result)
{
case 0xe7:
PORTD = TABLE[3];break;   //K3
case 0xeb:
PORTD = TABLE[2];break;   //K2
case 0xed:
PORTD = TABLE[1];break;   //K1
case 0xee:
PORTD = TABLE[0];break;   //K0
case 0xd7:
PORTD = TABLE[7];break;   //K7
case 0xdb:
PORTD = TABLE[6];break;   //K6
case 0xdd:
PORTD = TABLE[5];break;   //K5
case 0xde:
PORTD = TABLE[4];break;   //K4
case 0xb7:
PORTD = TABLE[11];break;   //KB
case 0xbb:
PORTD = TABLE[10];break;   //KA
case 0xbd:
PORTD = TABLE[9];break;   //K9
case 0xbe:
PORTD = TABLE[8];break;   //K8
case 0x77:
PORTD = TABLE[15];break;   //KF
case 0x7b:
PORTD = TABLE[14];break;   //KE
case 0x7d:
PORTD = TABLE[13];break;   //KD
case 0x7e:
PORTD = TABLE[12];break;   //KC
case 0x00:
PORTD ='X';     
 }  ENABLE1();
goto loop;
}

