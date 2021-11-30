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
# 3 "D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
	dw 0xff29 ;#
	FNCALL	_main,_init
	FNCALL	_init,_delay
	FNCALL	_init,_enable
	FNCALL	_enable,_delay
	FNROOT	_main
	FNCALL	_tmr2,i1_delay
	FNCALL	intlevel1,_tmr2
	global	intlevel1
	FNROOT	intlevel1
	global	_s
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
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
	global	_x
	global	_y
	global	_cdata
	global	_z
	global	_cflag
	global	_flag
	global	_data
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_PORTE
_PORTE	set	9
	global	_RCREG
_RCREG	set	26
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
	global	_CHS0
_CHS0	set	251
	global	_CHS1
_CHS1	set	252
	global	_CHS2
_CHS2	set	253
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_GO_nDONE
_GO_nDONE	set	250
	global	_PEIE
_PEIE	set	94
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_RBIE
_RBIE	set	91
	global	_RBIF
_RBIF	set	88
	global	_RCIF
_RCIF	set	101
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_RD2
_RD2	set	66
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
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TXSTA
_TXSTA	set	152
	global	_RCIE
_RCIE	set	1125
	global	_SYNC
_SYNC	set	1220
	global	_TMR2IE
_TMR2IE	set	1121
	global	_TRISE0
_TRISE0	set	1096
	global	_TRISE1
_TRISE1	set	1097
	global	_TRISE2
_TRISE2	set	1098
	global	_TX9
_TX9	set	1222
	global	_TX9D
_TX9D	set	1216
	global	_TXEN
_TXEN	set	1221
	global	_nRBPU
_nRBPU	set	1039
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
	file	"Transmitter.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_cflag:
       ds      1

_flag:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_cdata:
       ds      1

_z:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_x:
       ds      1

_y:
       ds      1

_data:
       ds      4

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
_s:
       ds      20

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
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
	global	?i1_delay
?i1_delay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	i1delay@t
i1delay@t:	; 2 bytes @ 0x0
	ds	2
	global	??i1_delay
??i1_delay:	; 0 bytes @ 0x2
	ds	1
	global	i1delay@i
i1delay@i:	; 2 bytes @ 0x3
	ds	2
	global	??_tmr2
??_tmr2:	; 0 bytes @ 0x5
	ds	6
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
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x8
;;Data sizes: Strings 0, constant 0, data 20, bss 8, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80      8      34
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
;;   _tmr2->i1_delay
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_init
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
;; (0) _main                                                 0     0      0     114
;;                               _init
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 1     1      0     114
;;                                              7 BANK0      1     1      0
;;                              _delay
;;                             _enable
;; ---------------------------------------------------------------------------------
;; (2) _enable                                               2     0      2      68
;;                                              5 BANK0      2     0      2
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) _delay                                                5     3      2      46
;;                                              0 BANK0      5     3      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _tmr2                                                 6     6      0     150
;;                                              5 COMMON     6     6      0
;;                            i1_delay
;; ---------------------------------------------------------------------------------
;; (5) i1_delay                                              5     3      2     150
;;                                              0 COMMON     5     3      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;     _delay
;;     _enable
;;       _delay
;;
;; _tmr2 (ROOT)
;;   i1_delay
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
;;DATA                 0      0      37      12        0.0%
;;ABS                  0      0      30       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50      8      22       5       42.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      B       E       1      100.0%
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 96 in file "D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  734[COMMON] int 
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
	line	96
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	97
	
l3297:	
;Transmitter.c: 97: init ();
	fcall	_init
	line	98
	
l3299:	
;Transmitter.c: 98: cflag=1;
	bsf	(_cflag/8),(_cflag)&7
	line	99
	
l3301:	
;Transmitter.c: 99: PORTD=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	goto	l736
	line	100
;Transmitter.c: 100: while(1){
	
l735:	
	line	102
	
l736:	
	line	100
	goto	l736
	
l737:	
	line	103
	
l738:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_init
psect	text194,local,class=CODE,delta=2
global __ptext194
__ptext194:

;; *************** function _init *****************
;; Defined at:
;;		line 106 in file "D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
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
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_delay
;;		_enable
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text194
	file	"D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
	line	106
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 3
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	107
	
l3229:	
;Transmitter.c: 107: TRISB=0XF0;
	movlw	(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	108
	
l3231:	
;Transmitter.c: 108: TRISE0=1;
	bsf	(1096/8)^080h,(1096)&7
	line	109
	
l3233:	
;Transmitter.c: 109: TRISE1=1;
	bsf	(1097/8)^080h,(1097)&7
	line	110
	
l3235:	
;Transmitter.c: 110: TRISE2=1;
	bsf	(1098/8)^080h,(1098)&7
	line	111
;Transmitter.c: 111: TRISA=0XFF;
	movlw	(0FFh)
	movwf	(133)^080h	;volatile
	line	112
	
l3237:	
;Transmitter.c: 112: TRISD=0;
	clrf	(136)^080h	;volatile
	line	113
	
l3239:	
;Transmitter.c: 113: TRISC=0xC0;
	movlw	(0C0h)
	movwf	(135)^080h	;volatile
	line	114
	
l3241:	
;Transmitter.c: 114: nRBPU=0;
	bcf	(1039/8)^080h,(1039)&7
	line	116
;Transmitter.c: 116: PORTE=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(9)	;volatile
	line	117
;Transmitter.c: 117: PORTB=0;
	clrf	(6)	;volatile
	line	118
;Transmitter.c: 118: PORTC=0;
	clrf	(7)	;volatile
	line	119
;Transmitter.c: 119: PORTA=0;
	clrf	(5)	;volatile
	line	120
	
l3243:	
;Transmitter.c: 120: RA3=1;
	bsf	(43/8),(43)&7
	line	122
	
l3245:	
;Transmitter.c: 122: delay(1000);
	movlw	low(03E8h)
	movwf	(?_delay)
	movlw	high(03E8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	123
	
l3247:	
;Transmitter.c: 123: PORTD=0x38;enable(INS);
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3249:	
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	124
	
l3251:	
;Transmitter.c: 124: PORTD=0x0C;enable(INS);
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3253:	
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	126
	
l3255:	
;Transmitter.c: 126: SPBRG=38;
	movlw	(026h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	127
	
l3257:	
;Transmitter.c: 127: TXSTA=0;SYNC=0;TX9=1;
	clrf	(152)^080h	;volatile
	
l3259:	
	bcf	(1220/8)^080h,(1220)&7
	
l3261:	
	bsf	(1222/8)^080h,(1222)&7
	line	128
	
l3263:	
;Transmitter.c: 128: RCSTA=0;SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(24)	;volatile
	
l3265:	
	bsf	(199/8),(199)&7
	line	129
	
l3267:	
;Transmitter.c: 129: TXEN=1;CREN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1221/8)^080h,(1221)&7
	
l3269:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(196/8),(196)&7
	line	131
	
l3271:	
;Transmitter.c: 131: GIE=1;PEIE=1;TMR2IE=1;TMR2IF=0;ADIF=0;
	bsf	(95/8),(95)&7
	
l3273:	
	bsf	(94/8),(94)&7
	
l3275:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1121/8)^080h,(1121)&7
	
l3277:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7
	
l3279:	
	bcf	(102/8),(102)&7
	line	132
	
l3281:	
;Transmitter.c: 132: RCIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	133
	
l3283:	
;Transmitter.c: 133: ADCON0=0B01000001;ADCON1=0B10000000;
	movlw	(041h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	
l3285:	
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	134
	
l3287:	
;Transmitter.c: 134: T2CON=0B01111111;PR2=255;
	movlw	(07Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	
l3289:	
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	137
	
l3291:	
;Transmitter.c: 137: y=PORTB;RBIF=0;RBIE=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(6),w	;volatile
	movwf	(??_init+0)+0
	movf	(??_init+0)+0,w
	movwf	(_y)
	
l3293:	
	bcf	(88/8),(88)&7
	
l3295:	
	bsf	(91/8),(91)&7
	line	140
	
l741:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_enable
psect	text195,local,class=CODE,delta=2
global __ptext195
__ptext195:

;; *************** function _enable *****************
;; Defined at:
;;		line 147 in file "D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_delay
;; This function is called by:
;;		_init
;;		_show_a
;;		_show
;; This function uses a non-reentrant model
;;
psect	text195
	file	"D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
	line	147
	global	__size_of_enable
	__size_of_enable	equ	__end_of_enable-_enable
	
_enable:	
	opt	stack 3
; Regs used in _enable: [wreg+status,2+status,0+pclath+cstack]
	line	148
	
l3223:	
;Transmitter.c: 148: RA5=t;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(enable@t),0
	goto	u3351
	goto	u3350
	
u3351:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	goto	u3364
u3350:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
u3364:
	line	149
;Transmitter.c: 149: RA4=0;
	bcf	(44/8),(44)&7
	line	150
;Transmitter.c: 150: RA3=0;
	bcf	(43/8),(43)&7
	line	151
	
l3225:	
;Transmitter.c: 151: delay(30);
	movlw	low(01Eh)
	movwf	(?_delay)
	movlw	high(01Eh)
	movwf	((?_delay))+1
	fcall	_delay
	line	152
	
l3227:	
;Transmitter.c: 152: RA3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	line	153
	
l750:	
	return
	opt stack 0
GLOBAL	__end_of_enable
	__end_of_enable:
;; =============== function _enable ends ============

	signat	_enable,4216
	global	_delay
psect	text196,local,class=CODE,delta=2
global __ptext196
__ptext196:

;; *************** function _delay *****************
;; Defined at:
;;		line 142 in file "D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init
;;		_enable
;; This function uses a non-reentrant model
;;
psect	text196
	file	"D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
	line	142
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 3
; Regs used in _delay: [wreg+status,2]
	line	143
	
l3079:	
;Transmitter.c: 143: for (int i=0;i<t;++i) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l744
	
l745:	
	
l3081:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l744:	
	movf	(delay@i+1),w
	xorlw	80h
	movwf	(??_delay+0)+0
	movf	(delay@t+1),w
	xorlw	80h
	subwf	(??_delay+0)+0,w
	skipz
	goto	u3045
	movf	(delay@t),w
	subwf	(delay@i),w
u3045:

	skipc
	goto	u3041
	goto	u3040
u3041:
	goto	l3081
u3040:
	goto	l747
	
l746:	
	line	144
	
l747:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_tmr2
psect	text197,local,class=CODE,delta=2
global __ptext197
__ptext197:

;; *************** function _tmr2 *****************
;; Defined at:
;;		line 30 in file "D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
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
;;      Temps:          6       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_delay
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text197
	file	"D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
	line	30
	global	__size_of_tmr2
	__size_of_tmr2	equ	__end_of_tmr2-_tmr2
	
_tmr2:	
	opt	stack 3
; Regs used in _tmr2: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_tmr2+2)
	movf	fsr0,w
	movwf	(??_tmr2+3)
	movf	pclath,w
	movwf	(??_tmr2+4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_tmr2+5)
	ljmp	_tmr2
psect	text197
	line	31
	
i1l2979:	
;Transmitter.c: 31: if(RCIF==1){
	btfss	(101/8),(101)&7
	goto	u268_21
	goto	u268_20
u268_21:
	goto	i1l707
u268_20:
	line	32
	
i1l2981:	
;Transmitter.c: 32: cdata=RCREG;
	movf	(26),w	;volatile
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	line	33
;Transmitter.c: 33: PORTD=RCREG;
	movf	(26),w	;volatile
	movwf	(8)	;volatile
	line	35
	
i1l2983:	
;Transmitter.c: 35: CHS0=cdata&0B1;
	btfsc	(_cdata),0
	goto	u269_21
	goto	u269_20
	
u269_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(251/8),(251)&7
	goto	u270_24
u269_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(251/8),(251)&7
u270_24:
	line	36
	
i1l2985:	
;Transmitter.c: 36: CHS1=(cdata&0B10)>>1;
	movf	(_cdata),w
	movwf	(??_tmr2+0)+0
	movlw	01h
u271_25:
	clrc
	rrf	(??_tmr2+0)+0,f
	addlw	-1
	skipz
	goto	u271_25
	btfsc	0+(??_tmr2+0)+0,0
	goto	u272_21
	goto	u272_20
	
u272_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(252/8),(252)&7
	goto	u273_24
u272_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(252/8),(252)&7
u273_24:
	line	37
	
i1l2987:	
;Transmitter.c: 37: CHS2=(cdata&0B100)>>2;
	movf	(_cdata),w
	movwf	(??_tmr2+0)+0
	movlw	02h
u274_25:
	clrc
	rrf	(??_tmr2+0)+0,f
	addlw	-1
	skipz
	goto	u274_25
	btfsc	0+(??_tmr2+0)+0,0
	goto	u275_21
	goto	u275_20
	
u275_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(253/8),(253)&7
	goto	u276_24
u275_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(253/8),(253)&7
u276_24:
	line	38
;Transmitter.c: 38: }
	goto	i1l732
	line	39
	
i1l707:	
;Transmitter.c: 39: else if(TMR2IF==1){
	btfss	(97/8),(97)&7
	goto	u277_21
	goto	u277_20
u277_21:
	goto	i1l709
u277_20:
	line	40
	
i1l2989:	
;Transmitter.c: 40: flag=!flag;
	movlw	1<<((_flag)&7)
	xorwf	((_flag)/8),f
	line	41
	
i1l2991:	
;Transmitter.c: 41: TMR2IF=0;
	bcf	(97/8),(97)&7
	line	42
	
i1l2993:	
;Transmitter.c: 42: GO_nDONE=1;
	bsf	(250/8),(250)&7
	line	43
;Transmitter.c: 43: while(ADIF==0);
	goto	i1l710
	
i1l711:	
	
i1l710:	
	btfss	(102/8),(102)&7
	goto	u278_21
	goto	u278_20
u278_21:
	goto	i1l710
u278_20:
	goto	i1l2995
	
i1l712:	
	line	44
	
i1l2995:	
;Transmitter.c: 44: data.c[1]=ADRESH;
	movf	(30),w	;volatile
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	0+(_data)+01h
	line	45
	
i1l2997:	
;Transmitter.c: 45: data.c[1]|=cdata<<5;
	movf	(_cdata),w
	movwf	(??_tmr2+0)+0
	movlw	(05h)-1
u279_25:
	clrc
	rlf	(??_tmr2+0)+0,f
	addlw	-1
	skipz
	goto	u279_25
	clrc
	rlf	(??_tmr2+0)+0,w
	movwf	(??_tmr2+1)+0
	movf	(??_tmr2+1)+0,w
	iorwf	0+(_data)+01h,f
	line	46
	
i1l2999:	
;Transmitter.c: 46: data.c[0]=ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_data)
	line	47
	
i1l3001:	
;Transmitter.c: 47: ADIF=0;
	bcf	(102/8),(102)&7
	line	49
	
i1l3003:	
;Transmitter.c: 49: if(flag){
	btfss	(_flag/8),(_flag)&7
	goto	u280_21
	goto	u280_20
u280_21:
	goto	i1l713
u280_20:
	line	50
	
i1l3005:	
;Transmitter.c: 50: TX9D=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1216/8)^080h,(1216)&7
	line	51
	
i1l3007:	
;Transmitter.c: 51: TXREG=data.c[1];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_data)+01h,w
	movwf	(25)	;volatile
	line	52
;Transmitter.c: 52: }
	goto	i1l732
	line	53
	
i1l713:	
	line	54
;Transmitter.c: 53: else{
;Transmitter.c: 54: TX9D=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1216/8)^080h,(1216)&7
	line	55
	
i1l3009:	
;Transmitter.c: 55: TXREG=data.c[0];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_data),w
	movwf	(25)	;volatile
	goto	i1l732
	line	56
	
i1l714:	
	line	57
;Transmitter.c: 56: }
;Transmitter.c: 57: }
	goto	i1l732
	line	58
	
i1l709:	
;Transmitter.c: 58: else if(RBIF==1){
	btfss	(88/8),(88)&7
	goto	u281_21
	goto	u281_20
u281_21:
	goto	i1l732
u281_20:
	line	59
	
i1l3011:	
;Transmitter.c: 59: y=y^PORTB;
	movf	(_y),w
	xorwf	(6),w	;volatile
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_y)
	line	60
	
i1l3013:	
;Transmitter.c: 60: PORTD=y;
	movf	(_y),w
	movwf	(8)	;volatile
	line	61
	
i1l3015:	
;Transmitter.c: 61: TRISB=0X0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	62
	
i1l3017:	
;Transmitter.c: 62: delay(10);
	movlw	low(0Ah)
	movwf	(?i1_delay)
	movlw	high(0Ah)
	movwf	((?i1_delay))+1
	fcall	i1_delay
	line	63
	
i1l3019:	
;Transmitter.c: 63: x=PORTB&0X0F;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(6),w
	andlw	0Fh
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_x)
	line	64
	
i1l3021:	
;Transmitter.c: 64: PORTD=x;
	movf	(_x),w
	movwf	(8)	;volatile
	line	65
	
i1l3023:	
;Transmitter.c: 65: z=y|x;
	movf	(_y),w
	iorwf	(_x),w
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_z)
	line	66
	
i1l3025:	
;Transmitter.c: 66: if(z==0x1E)
	movf	(_z),w
	xorlw	01Eh
	skipz
	goto	u282_21
	goto	u282_20
u282_21:
	goto	i1l3029
u282_20:
	line	67
	
i1l3027:	
;Transmitter.c: 67: cdata=0;
	clrf	(_cdata)
	goto	i1l3057
	line	68
	
i1l717:	
	
i1l3029:	
;Transmitter.c: 68: else if(z==0x2E)
	movf	(_z),w
	xorlw	02Eh
	skipz
	goto	u283_21
	goto	u283_20
u283_21:
	goto	i1l3033
u283_20:
	line	69
	
i1l3031:	
;Transmitter.c: 69: cdata=1;
	clrf	(_cdata)
	bsf	status,0
	rlf	(_cdata),f
	goto	i1l3057
	line	70
	
i1l719:	
	
i1l3033:	
;Transmitter.c: 70: else if(z==0x4E)
	movf	(_z),w
	xorlw	04Eh
	skipz
	goto	u284_21
	goto	u284_20
u284_21:
	goto	i1l3037
u284_20:
	line	71
	
i1l3035:	
;Transmitter.c: 71: cdata=2;
	movlw	(02h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3057
	line	72
	
i1l721:	
	
i1l3037:	
;Transmitter.c: 72: else if(z==0x8E)
	movf	(_z),w
	xorlw	08Eh
	skipz
	goto	u285_21
	goto	u285_20
u285_21:
	goto	i1l3041
u285_20:
	line	73
	
i1l3039:	
;Transmitter.c: 73: cdata=3;
	movlw	(03h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3057
	line	74
	
i1l723:	
	
i1l3041:	
;Transmitter.c: 74: else if(z==0x1D)
	movf	(_z),w
	xorlw	01Dh
	skipz
	goto	u286_21
	goto	u286_20
u286_21:
	goto	i1l3045
u286_20:
	line	75
	
i1l3043:	
;Transmitter.c: 75: cdata=4;
	movlw	(04h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3057
	line	76
	
i1l725:	
	
i1l3045:	
;Transmitter.c: 76: else if(z==0x2D)
	movf	(_z),w
	xorlw	02Dh
	skipz
	goto	u287_21
	goto	u287_20
u287_21:
	goto	i1l3049
u287_20:
	line	77
	
i1l3047:	
;Transmitter.c: 77: cdata=5;
	movlw	(05h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3057
	line	78
	
i1l727:	
	
i1l3049:	
;Transmitter.c: 78: else if(z==0x4D)
	movf	(_z),w
	xorlw	04Dh
	skipz
	goto	u288_21
	goto	u288_20
u288_21:
	goto	i1l3053
u288_20:
	line	79
	
i1l3051:	
;Transmitter.c: 79: cdata=6;
	movlw	(06h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3057
	line	80
	
i1l729:	
	
i1l3053:	
;Transmitter.c: 80: else if(z==0x8D)
	movf	(_z),w
	xorlw	08Dh
	skipz
	goto	u289_21
	goto	u289_20
u289_21:
	goto	i1l3057
u289_20:
	line	81
	
i1l3055:	
;Transmitter.c: 81: cdata=7;
	movlw	(07h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3057
	
i1l731:	
	goto	i1l3057
	line	82
	
i1l730:	
	goto	i1l3057
	
i1l728:	
	goto	i1l3057
	
i1l726:	
	goto	i1l3057
	
i1l724:	
	goto	i1l3057
	
i1l722:	
	goto	i1l3057
	
i1l720:	
	goto	i1l3057
	
i1l718:	
	
i1l3057:	
;Transmitter.c: 82: CHS0=cdata&0B1;
	btfsc	(_cdata),0
	goto	u290_21
	goto	u290_20
	
u290_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(251/8),(251)&7
	goto	u291_24
u290_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(251/8),(251)&7
u291_24:
	line	83
	
i1l3059:	
;Transmitter.c: 83: CHS1=(cdata&0B10)>>1;
	movf	(_cdata),w
	movwf	(??_tmr2+0)+0
	movlw	01h
u292_25:
	clrc
	rrf	(??_tmr2+0)+0,f
	addlw	-1
	skipz
	goto	u292_25
	btfsc	0+(??_tmr2+0)+0,0
	goto	u293_21
	goto	u293_20
	
u293_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(252/8),(252)&7
	goto	u294_24
u293_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(252/8),(252)&7
u294_24:
	line	84
	
i1l3061:	
;Transmitter.c: 84: CHS2=(cdata&0B100)>>2;
	movf	(_cdata),w
	movwf	(??_tmr2+0)+0
	movlw	02h
u295_25:
	clrc
	rrf	(??_tmr2+0)+0,f
	addlw	-1
	skipz
	goto	u295_25
	btfsc	0+(??_tmr2+0)+0,0
	goto	u296_21
	goto	u296_20
	
u296_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(253/8),(253)&7
	goto	u297_24
u296_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(253/8),(253)&7
u297_24:
	line	85
	
i1l3063:	
;Transmitter.c: 85: RD0=CHS0;
	btfsc	(251/8),(251)&7
	goto	u298_21
	goto	u298_20
	
u298_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	goto	u299_24
u298_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
u299_24:
	line	86
	
i1l3065:	
;Transmitter.c: 86: RD1=CHS1;
	btfsc	(252/8),(252)&7
	goto	u300_21
	goto	u300_20
	
u300_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	goto	u301_24
u300_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
u301_24:
	line	87
	
i1l3067:	
;Transmitter.c: 87: RD2=CHS2;
	btfsc	(253/8),(253)&7
	goto	u302_21
	goto	u302_20
	
u302_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	goto	u303_24
u302_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
u303_24:
	line	88
	
i1l3069:	
;Transmitter.c: 88: delay(10);
	movlw	low(0Ah)
	movwf	(?i1_delay)
	movlw	high(0Ah)
	movwf	((?i1_delay))+1
	fcall	i1_delay
	line	89
	
i1l3071:	
;Transmitter.c: 89: TRISB=0XF0;
	movlw	(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	90
	
i1l3073:	
;Transmitter.c: 90: PORTB=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	91
	
i1l3075:	
;Transmitter.c: 91: y=PORTB;
	movf	(6),w	;volatile
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_y)
	line	92
	
i1l3077:	
;Transmitter.c: 92: RBIF=0;
	bcf	(88/8),(88)&7
	goto	i1l732
	line	93
	
i1l716:	
	goto	i1l732
	line	94
	
i1l715:	
	goto	i1l732
	
i1l708:	
	
i1l732:	
	movf	(??_tmr2+5),w
	movwf	btemp+1
	movf	(??_tmr2+4),w
	movwf	pclath
	movf	(??_tmr2+3),w
	movwf	fsr0
	swapf	(??_tmr2+2)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_tmr2
	__end_of_tmr2:
;; =============== function _tmr2 ends ============

	signat	_tmr2,88
	global	i1_delay
psect	text198,local,class=CODE,delta=2
global __ptext198
__ptext198:

;; *************** function i1_delay *****************
;; Defined at:
;;		line 142 in file "D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
;; Parameters:    Size  Location     Type
;;  delay           2    0[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  delay           2    3[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tmr2
;; This function uses a non-reentrant model
;;
psect	text198
	file	"D:\EE\Mplabcode\Experiment7\Transimitter\Transmitter.c"
	line	142
	global	__size_ofi1_delay
	__size_ofi1_delay	equ	__end_ofi1_delay-i1_delay
	
i1_delay:	
	opt	stack 3
; Regs used in i1_delay: [wreg+status,2]
	line	143
	
i1l3219:	
;Transmitter.c: 143: for (int i=0;i<t;++i) ;
	clrf	(i1delay@i)
	clrf	(i1delay@i+1)
	goto	i1l744
	
i1l745:	
	
i1l3221:	
	movlw	low(01h)
	addwf	(i1delay@i),f
	skipnc
	incf	(i1delay@i+1),f
	movlw	high(01h)
	addwf	(i1delay@i+1),f
	
i1l744:	
	movf	(i1delay@i+1),w
	xorlw	80h
	movwf	(??i1_delay+0)+0
	movf	(i1delay@t+1),w
	xorlw	80h
	subwf	(??i1_delay+0)+0,w
	skipz
	goto	u334_25
	movf	(i1delay@t),w
	subwf	(i1delay@i),w
u334_25:

	skipc
	goto	u334_21
	goto	u334_20
u334_21:
	goto	i1l3221
u334_20:
	goto	i1l747
	
i1l746:	
	line	144
	
i1l747:	
	return
	opt stack 0
GLOBAL	__end_ofi1_delay
	__end_ofi1_delay:
;; =============== function i1_delay ends ============

	signat	i1_delay,88
psect	text199,local,class=CODE,delta=2
global __ptext199
__ptext199:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
