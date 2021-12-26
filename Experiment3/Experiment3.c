#include<pic.h>
__CONFIG(0xff29);
char x,y;
void delay(long t){
	for(long i=0;i<t;++i);
}
enum {S_1=40,S_2=50,S_3=60,S_4=70,S_5=20};
const char d_show[11]={0x3f,0x6,0x5b,0x4f,0x66,0x6d,0x7c,0x7,0x7f,0x6f,0x00};
char tcnt1=6,tcnt0=0;//十位和个位
char cnt=2,p=10;
void sound_delay(int S)//发声子程序
{	
	for(int i=0;i<300;++i){
		RE0=!RE0;
		delay(S);
	}
}
void sound_3(int S){
	sound_delay(S);
	delay(10000);
	sound_delay(S);
	delay(10000);
	sound_delay(S);
}
void show(){
	PORTA=0x02;
	PORTD=d_show[tcnt1];
	delay(100);

	PORTA=0x01;
	PORTD=d_show[tcnt0];
	delay(100);

	if(p!=10){
		PORTA=0x08;
		PORTD=d_show[p];
		delay(100);
	}
	
}
void interrupt int_rb()

{

	if(INTF==1){//开启抢答
		PORTA=0x00;
		tcnt1=6;
		tcnt0=0;
		x=0;
		INTF=0;
		sound_delay(S_5);
		TMR1IE=1;
		p=10;
	}//优先判断外部中断标志位
	else if(RBIF==1)
	{
		if(x==0){	
			x=1;y=y^PORTB;
			PORTA=0X08;
			if(y==0x80){
				p=4;PORTD=d_show[4];sound_3(S_4);
			}
			else if(y==0x40){
				p=3;PORTD=d_show[3];sound_3(S_3);
			}
			else if(y==0x20){
				p=2;PORTD=d_show[2];sound_3(S_2);
			}
			else if(y==0x10){
				p=1;PORTD=d_show[1];sound_3(S_1);
			}
			else{//异常
				PORTD=d_show[0];
			}
			TMR1IE=0;
		}
		else{
		y=PORTB;RBIF=0;//如果x=1，已经抢答过，直接出中断
		}
	}
	else{//倒计时
		/*if(tcnt1!=0)
		--tcnt1;*/
		TMR1H=0x0b;TMR1L=0xdc+4;
		TMR1IF=0;
		--cnt;
		if(cnt==0){
				cnt=2;
			if(tcnt0==0){//手动退位
				if(tcnt1!=0){
					--tcnt1;tcnt0=9;
				}
				else
				TMR1IE=0;
			}
			else
				--tcnt0;
		}
	}

}

main()

{

	TRISD=0;PORTD=0;TRISB=0XFF;nRBPU=0;INTEDG=1;ADCON1=7;
	TRISE0=0;RE0=1;TRISA=0;PORTA=0xfe;
	x=1;
	
	GIE=1;INTE=1;INTF=0;
	PEIE=1;TMR1IE=0;TMR1IF=0;
	TMR1H=0x0b;TMR1L=0xdc+4;
	T1CON=0B00110001;
	
	y=PORTB;RBIF=0;//读RB端口电平，只要有输入动作，既是读端口(*/
	RBIE=1;

	while(1){
		show();
	}

}
