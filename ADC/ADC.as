opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 3 "D:\EE\Mplabcode\ADC\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "D:\EE\Mplabcode\ADC\main.c"
	dw 0xff29 ;#
	FNCALL	_main,_init
	FNCALL	_init,_delay
	FNCALL	_init,_enable
	FNCALL	_enable,_delay
	FNROOT	_main
	FNCALL	intlevel1,_tmr2
	global	intlevel1
	FNROOT	intlevel1
	global	_s
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\EE\Mplabcode\ADC\main.c"
	line	14

;initializer for _s
	retlw	031h
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_flag
	global	_data
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_RCSTA
_RCSTA	set	24
	global	_T2CON
_T2CON	set	18
	global	_TXREG
_TXREG	set	25
	global	_ADIF
_ADIF	set	102
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_GO_nDONE
_GO_nDONE	set	250
	global	_PEIE
_PEIE	set	94
	global	_RA0
_RA0	set	40
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_SPEN
_SPEN	set	199
	global	_TMR2IF
_TMR2IF	set	97
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_PR2
_PR2	set	146
	global	_SPBRG
_SPBRG	set	153
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TXSTA
_TXSTA	set	152
	global	_SYNC
_SYNC	set	1220
	global	_TMR2IE
_TMR2IE	set	1121
	global	_TX9
_TX9	set	1222
	global	_TX9D
_TX9D	set	1216
	global	_TXEN
_TXEN	set	1221
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"ADC.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_flag:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_data:
       ds      4

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\EE\Mplabcode\ADC\main.c"
_s:
       ds      20

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+20)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	?_tmr2
?_tmr2:	; 0 bytes @ 0x0
	global	??_tmr2
??_tmr2:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	delay@t
delay@t:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	ds	1
	global	delay@i
delay@i:	; 2 bytes @ 0x3
	ds	2
	global	?_enable
?_enable:	; 0 bytes @ 0x5
	global	enable@t
enable@t:	; 2 bytes @ 0x5
	ds	2
	global	??_init
??_init:	; 0 bytes @ 0x7
	global	??_enable
??_enable:	; 0 bytes @ 0x7
	global	??_main
??_main:	; 0 bytes @ 0x7
;;Data sizes: Strings 0, constant 0, data 20, bss 4, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      10
;; BANK0           80      7      27
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _tmr2 in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _init->_enable
;;   _enable->_delay
;;
;; Critical Paths under _tmr2 in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _tmr2 in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _tmr2 in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _tmr2 in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     167
;;                               _init
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0     167
;;                              _delay
;;                             _enable
;; ---------------------------------------------------------------------------------
;; (2) _enable                                               2     0      2      99
;;                                              5 BANK0      2     0      2
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) _delay                                                5     3      2      68
;;                                              0 BANK0      5     3      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _tmr2                                                 5     5      0       0
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;     _delay
;;     _enable
;;       _delay
;;
;; _tmr2 (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      28      12        0.0%
;;ABS                  0      0      25       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50      7      1B       5       33.8%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      5       A       1       71.4%
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 49 in file "D:\EE\Mplabcode\ADC\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  705[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\EE\Mplabcode\ADC\main.c"
	line	49
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	50
	
l3056:	
;main.c: 50: init ();
	fcall	_init
	goto	l707
	line	51
;main.c: 51: while(1){
	
l706:	
	line	53
	
l707:	
	line	51
	goto	l707
	
l708:	
	line	54
	
l709:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_init
psect	text218,local,class=CODE,delta=2
global __ptext218
__ptext218:

;; *************** function _init *****************
;; Defined at:
;;		line 57 in file "D:\EE\Mplabcode\ADC\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_delay
;;		_enable
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text218
	file	"D:\EE\Mplabcode\ADC\main.c"
	line	57
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 4
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	58
	
l2996:	
;main.c: 58: TRISA=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(133)^080h	;volatile
	line	59
	
l2998:	
;main.c: 59: RA0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	line	60
	
l3000:	
;main.c: 60: RA3=0;
	bcf	(43/8),(43)&7
	line	61
	
l3002:	
;main.c: 61: TRISC=0xff;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	62
	
l3004:	
;main.c: 62: TRISD=0;
	clrf	(136)^080h	;volatile
	line	64
	
l3006:	
;main.c: 64: PORTD=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	65
	
l3008:	
;main.c: 65: PORTC=0;
	clrf	(7)	;volatile
	line	66
	
l3010:	
;main.c: 66: PORTA=0;
	clrf	(5)	;volatile
	line	67
	
l3012:	
;main.c: 67: RA3=1;
	bsf	(43/8),(43)&7
	line	69
	
l3014:	
;main.c: 69: delay(1000);
	movlw	low(03E8h)
	movwf	(?_delay)
	movlw	high(03E8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	70
	
l3016:	
;main.c: 70: PORTD=0x38;enable(INS);
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3018:	
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	71
	
l3020:	
;main.c: 71: PORTD=0x0C;enable(INS);
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3022:	
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	73
	
l3024:	
;main.c: 73: SPBRG=38;
	movlw	(026h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	74
	
l3026:	
;main.c: 74: TXSTA=0;SYNC=0;TX9=1;
	clrf	(152)^080h	;volatile
	
l3028:	
	bcf	(1220/8)^080h,(1220)&7
	
l3030:	
	bsf	(1222/8)^080h,(1222)&7
	line	75
	
l3032:	
;main.c: 75: RCSTA=0;SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(24)	;volatile
	
l3034:	
	bsf	(199/8),(199)&7
	line	76
	
l3036:	
;main.c: 76: TXEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1221/8)^080h,(1221)&7
	line	78
	
l3038:	
;main.c: 78: GIE=1;PEIE=1;TMR2IE=1;TMR2IF=0;ADIF=0;
	bsf	(95/8),(95)&7
	
l3040:	
	bsf	(94/8),(94)&7
	
l3042:	
	bsf	(1121/8)^080h,(1121)&7
	
l3044:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7
	
l3046:	
	bcf	(102/8),(102)&7
	line	79
	
l3048:	
;main.c: 79: ADCON0=0B01000001;ADCON1=0B10000101;
	movlw	(041h)
	movwf	(31)	;volatile
	
l3050:	
	movlw	(085h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	80
	
l3052:	
;main.c: 80: T2CON=0B01111111;PR2=255;
	movlw	(07Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	
l3054:	
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	83
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_enable
psect	text219,local,class=CODE,delta=2
global __ptext219
__ptext219:

;; *************** function _enable *****************
;; Defined at:
;;		line 90 in file "D:\EE\Mplabcode\ADC\main.c"
;; Parameters:    Size  Location     Type
;;  t               2    5[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_init
;;		_show_a
;;		_show
;; This function uses a non-reentrant model
;;
psect	text219
	file	"D:\EE\Mplabcode\ADC\main.c"
	line	90
	global	__size_of_enable
	__size_of_enable	equ	__end_of_enable-_enable
	
_enable:	
	opt	stack 4
; Regs used in _enable: [wreg+status,2+status,0+pclath+cstack]
	line	91
	
l2990:	
;main.c: 91: RA5=t;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(enable@t),0
	goto	u2431
	goto	u2430
	
u2431:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	goto	u2444
u2430:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
u2444:
	line	92
;main.c: 92: RA4=0;
	bcf	(44/8),(44)&7
	line	93
;main.c: 93: RA3=0;
	bcf	(43/8),(43)&7
	line	94
	
l2992:	
;main.c: 94: delay(30);
	movlw	low(01Eh)
	movwf	(?_delay)
	movlw	high(01Eh)
	movwf	((?_delay))+1
	fcall	_delay
	line	95
	
l2994:	
;main.c: 95: RA3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	line	96
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_enable
	__end_of_enable:
;; =============== function _enable ends ============

	signat	_enable,4216
	global	_delay
psect	text220,local,class=CODE,delta=2
global __ptext220
__ptext220:

;; *************** function _delay *****************
;; Defined at:
;;		line 85 in file "D:\EE\Mplabcode\ADC\main.c"
;; Parameters:    Size  Location     Type
;;  t               2    0[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  i               2    3[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init
;;		_enable
;; This function uses a non-reentrant model
;;
psect	text220
	file	"D:\EE\Mplabcode\ADC\main.c"
	line	85
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 4
; Regs used in _delay: [wreg+status,2]
	line	86
	
l2954:	
;main.c: 86: for (int i=0;i<t;++i) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l715
	
l716:	
	
l2956:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l715:	
	movf	(delay@i+1),w
	xorlw	80h
	movwf	(??_delay+0)+0
	movf	(delay@t+1),w
	xorlw	80h
	subwf	(??_delay+0)+0,w
	skipz
	goto	u2395
	movf	(delay@t),w
	subwf	(delay@i),w
u2395:

	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l2956
u2390:
	goto	l718
	
l717:	
	line	87
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_tmr2
psect	text221,local,class=CODE,delta=2
global __ptext221
__ptext221:

;; *************** function _tmr2 *****************
;; Defined at:
;;		line 28 in file "D:\EE\Mplabcode\ADC\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          5       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text221
	file	"D:\EE\Mplabcode\ADC\main.c"
	line	28
	global	__size_of_tmr2
	__size_of_tmr2	equ	__end_of_tmr2-_tmr2
	
_tmr2:	
	opt	stack 4
; Regs used in _tmr2: [wreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_tmr2+1)
	movf	fsr0,w
	movwf	(??_tmr2+2)
	movf	pclath,w
	movwf	(??_tmr2+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_tmr2+4)
	ljmp	_tmr2
psect	text221
	line	29
	
i1l1838:	
;main.c: 29: if(TMR2IF){
	btfss	(97/8),(97)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l703
u1_20:
	line	30
	
i1l1840:	
;main.c: 30: flag=!flag;
	movlw	1<<((_flag)&7)
	xorwf	((_flag)/8),f
	line	31
	
i1l1842:	
;main.c: 31: TMR2IF=0;
	bcf	(97/8),(97)&7
	line	32
	
i1l1844:	
;main.c: 32: GO_nDONE=1;
	bsf	(250/8),(250)&7
	line	33
;main.c: 33: while(ADIF==0);
	goto	i1l698
	
i1l699:	
	
i1l698:	
	btfss	(102/8),(102)&7
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l698
u2_20:
	goto	i1l1846
	
i1l700:	
	line	34
	
i1l1846:	
;main.c: 34: data.c[1]=ADRESH;
	movf	(30),w	;volatile
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	0+(_data)+01h
	line	35
;main.c: 35: data.c[0]=ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_data)
	line	36
	
i1l1848:	
;main.c: 36: ADIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(102/8),(102)&7
	line	38
	
i1l1850:	
;main.c: 38: if(flag){
	btfss	(_flag/8),(_flag)&7
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l701
u3_20:
	line	39
	
i1l1852:	
;main.c: 39: TX9D=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1216/8)^080h,(1216)&7
	line	40
	
i1l1854:	
;main.c: 40: TXREG=data.c[1];
	movf	0+(_data)+01h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	41
;main.c: 41: }
	goto	i1l703
	line	42
	
i1l701:	
	line	43
;main.c: 42: else{
;main.c: 43: TX9D=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1216/8)^080h,(1216)&7
	line	44
	
i1l1856:	
;main.c: 44: TXREG=data.c[0];
	movf	(_data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	goto	i1l703
	line	45
	
i1l702:	
	goto	i1l703
	line	46
	
i1l697:	
	line	47
	
i1l703:	
	movf	(??_tmr2+4),w
	movwf	btemp+1
	movf	(??_tmr2+3),w
	movwf	pclath
	movf	(??_tmr2+2),w
	movwf	fsr0
	swapf	(??_tmr2+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_tmr2
	__end_of_tmr2:
;; =============== function _tmr2 ends ============

	signat	_tmr2,88
psect	text222,local,class=CODE,delta=2
global __ptext222
__ptext222:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
