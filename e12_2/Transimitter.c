#include<pic.h>
__CONFIG(0xFF29);
#define rs RA5
#define rw RA4
#define e RA3
union{
	unsigned long count;
	char data[2];
}ad_data;
char adh,adl,a,b,y,x,l,lasta;
static volatile const char table[16]={0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,
0x39,0x41,0x42,0x43,0x44,0x45,0x46};//�ַ���ʾ�����������ն�
static volatile char const table1[8]={0x41,0x49,0x51,0x59,0x61,0x69,0x71,0x79};//ADCON0
static volatile char table2[22]={"my name is pic16f877 "};
bit flag;//����
///////////����
void DELAY1()
{unsigned int i;for(i=99;i>0;i--);}
////////////
void interrupt ccp1_int()
{
	if(SSPIF==1){
		if(lasta!=SSPBUF){
			a=SSPBUF;
			lasta=a;
		}
		SSPIF=0;
	}
	else if(CCP2IF==1){
		CCP2IF=0;
		GO_nDONE=1;//����
		wait:if(ADIF==0) goto wait;
		adh=ADRESH;adl=ADRESL;ADIF=0;
		//SSPBUF=ADRESH;ɾȥ
		//����
		////////////////////////////
	    if(flag==1){
			SSPBUF=((adh&0x03)<<3)+((adl&0xe0)>>5)+((a&0B100)<<3)+(1<<7);
			flag=0;
		}
		else{
			SSPBUF=(adl&0x1f)+((a&0B11)<<5);
			flag=1;
		}
		////////////////////////////
		ADCON0=table1[a];
	}
	else if (RCIF==1){
		a=RCREG&0x0f;
	}
	else if(RBIF==1){
		y=y^PORTB;
	  TRISB=0x0F;
	  PORTB=(~y)&0xF0;
	  DELAY1();
	  x=PORTB&0x0F;
	  if(y==0x10&&x==0x0E)a=0;
	  if(y==0x10&&x==0x0D)a=4;
	  //if(y==0x10&&x==0x0B)a=8;
	  //if(y==0x10&&x==0x07)a=0X0C;
	  if(y==0x20&&x==0x0E)a=1;
	  if(y==0x20&&x==0x0D)a=5;
	  //if(y==0x20&&x==0x0B)a=9;
	  //if(y==0x20&&x==0x07)a=0X0D;
	  if(y==0x40&&x==0x0E)a=2;
	  if(y==0x40&&x==0x0D)a=6;
	  //if(y==0x40&&x==0x0B)a=0X0A;
	  //if(y==0x40&&x==0x07)a=0X0E;
	  if(y==0x80&&x==0x0E)a=3;
	  if(y==0x80&&x==0x0D)a=7;
	  //if(y==0x80&&x==0x0B)a=0X0B;
	  //if(y==0x80&&x==0x07)a=0X0F;
		//PORTC=table[a];ENABLE1();ɾ��
	  TRISB=0xF0;PORTB=0;
	  y=PORTB;RBIF=0;
	}
}
void main()
{	

	TRISC=0B11010111;
	SSPSTAT=0;SSPCON=0B00100010;//�޸�
	//TRISC=0xc0;//�Ͽ�RCģ����USART��TX��RX�Ĺ�ϵ ɾȥ
	SPBRG=12;
	TXSTA=0B00100100;
	RCSTA=0B0010000;
	GIE=1;PEIE=1;RCIE=1;
	//������������������
	TRISA=0B0010001;
	ADCON1=0X80;
	PEIE=1;GIE=1;
	CCP2IE=1;//PIE2.0 ����CCP2����
	CCPR2L=0xFF;CCPR2H=0XFF;//���ֵ�����ڼĴ��������ֵΪ65536
//��Ϊ1:1
	T1CON=0X00;//Ԥ��Ƶ��=1��8���ڲ�ʱ��Դ��ͬ������ֹ����
	CCP2CON=0X0B;//�趨CCP2Ϊ�����¼�ģʽ
	TMR1ON=1;//����TMR1��T1CON
	a=0;
	ADCON0=table1[a];//����RCʱ��Դ���ݲ���ADCѡ��ANO

	T2CON=0B01111111;PR2=255;
	TMR2IE=1;TMR2IF=0;
	TRISB=0XF0;nRBPU=0;PORTB=0;
	y=PORTB;RBIF=0;RBIE=1;
	
loop:
	TXREG=table[a];
	l:if(TRMT==0)goto l;
	TXREG=':';
	l0:if(TRMT==0)goto l0;
	TXREG=table[ADRESH>>4];
	l1:if(TRMT==0)goto l1;
	TXREG=table[ADRESH&0x0f];
	l2:if(TRMT==0)goto l2;
	TXREG='H';
	l3:if(TRMT==0)goto l3;
	TXREG=' ';
	l4:if(TRMT==0)goto l4;
	TXREG=' ';
	l5:if(TRMT==0)goto l5;
	TXREG=' ';
	goto loop;
}
