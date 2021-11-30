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
# 4 "D:\EE\Mplabcode\Task_2\Transmitter.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "D:\EE\Mplabcode\Task_2\Transmitter.c"
	dw 0xff29 ;#
	FNCALL	_main,_init
	FNCALL	_main,_show
	FNCALL	_show,_enable
	FNCALL	_show,_show_a
	FNCALL	_show_a,_tostring
	FNCALL	_show_a,_enable
	FNCALL	_init,_delay
	FNCALL	_init,_enable
	FNCALL	_tostring,___almod
	FNCALL	_tostring,___aldiv
	FNCALL	_enable,_delay
	FNROOT	_main
	FNCALL	intlevel1,_ccp1
	global	intlevel1
	FNROOT	intlevel1
	global	_s
	global	_cnt
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\EE\Mplabcode\Task_2\Transmitter.c"
	line	12

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
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	line	21

;initializer for _cnt
	retlw	018h
	global	_data
	global	_showdata
	global	_end
	global	_icnt
	global	_tout
	global	_hflag
	global	_showflag
	global	_tsmflag
	global	_upflag
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1H
_CCPR1H	set	22
	global	_CCPR1L
_CCPR1L	set	21
	global	_PORTD
_PORTD	set	8
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_CARRY
_CARRY	set	24
	global	_CCP1IF
_CCP1IF	set	98
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_RC7
_RC7	set	63
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_ADCON1
_ADCON1	set	159
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_CCP1IE
_CCP1IE	set	1122
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TRISC2
_TRISC2	set	1082
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC7
_TRISC7	set	1087
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
	file	"Task_2.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_hflag:
       ds      1

_showflag:
       ds      1

_tsmflag:
       ds      1

_upflag:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_end:
       ds      1

_icnt:
       ds      1

_tout:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"D:\EE\Mplabcode\Task_2\Transmitter.c"
_cnt:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_data:
       ds      4

_showdata:
       ds      4

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\EE\Mplabcode\Task_2\Transmitter.c"
	line	12
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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
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
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
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
	global	?_show
?_show:	; 0 bytes @ 0x0
	global	?_ccp1
?_ccp1:	; 0 bytes @ 0x0
	global	??_ccp1
??_ccp1:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?___almod
?___almod:	; 4 bytes @ 0x0
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x0
	global	delay@t
delay@t:	; 2 bytes @ 0x0
	global	___almod@divisor
___almod@divisor:	; 4 bytes @ 0x0
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	ds	1
	global	delay@i
delay@i:	; 2 bytes @ 0x3
	ds	1
	global	___almod@dividend
___almod@dividend:	; 4 bytes @ 0x4
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x4
	ds	1
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
	global	??___almod
??___almod:	; 0 bytes @ 0x8
	global	??___aldiv
??___aldiv:	; 0 bytes @ 0x8
	ds	1
	global	___almod@counter
___almod@counter:	; 1 bytes @ 0x9
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x9
	ds	1
	global	___almod@sign
___almod@sign:	; 1 bytes @ 0xA
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0xA
	ds	1
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0xB
	ds	4
	global	?_tostring
?_tostring:	; 0 bytes @ 0xF
	global	tostring@x
tostring@x:	; 4 bytes @ 0xF
	ds	4
	global	??_tostring
??_tostring:	; 0 bytes @ 0x13
	ds	1
	global	tostring@i
tostring@i:	; 2 bytes @ 0x14
	ds	2
	global	?_show_a
?_show_a:	; 0 bytes @ 0x16
	global	show_a@x
show_a@x:	; 4 bytes @ 0x16
	ds	4
	global	??_show_a
??_show_a:	; 0 bytes @ 0x1A
	global	show_a@i
show_a@i:	; 2 bytes @ 0x1A
	ds	2
	global	??_show
??_show:	; 0 bytes @ 0x1C
	global	??_main
??_main:	; 0 bytes @ 0x1C
;;Data sizes: Strings 0, constant 0, data 21, bss 11, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      10
;; BANK0           80     28      56
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___aldiv	long  size(1) Largest target is 0
;;
;; ?___almod	long  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ccp1 in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _show->_show_a
;;   _show_a->_tostring
;;   _init->_enable
;;   _tostring->___aldiv
;;   _enable->_delay
;;
;; Critical Paths under _ccp1 in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ccp1 in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _ccp1 in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _ccp1 in BANK2
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
;; (0) _main                                                 0     0      0    1537
;;                               _init
;;                               _show
;; ---------------------------------------------------------------------------------
;; (1) _show                                                 0     0      0    1370
;;                             _enable
;;                             _show_a
;; ---------------------------------------------------------------------------------
;; (2) _show_a                                               6     2      4    1271
;;                                             22 BANK0      6     2      4
;;                           _tostring
;;                             _enable
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0     167
;;                              _delay
;;                             _enable
;; ---------------------------------------------------------------------------------
;; (3) _tostring                                             7     3      4    1042
;;                                             15 BANK0      7     3      4
;;                            ___almod
;;                            ___aldiv
;; ---------------------------------------------------------------------------------
;; (3) _enable                                               2     0      2      99
;;                                              5 BANK0      2     0      2
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4) ___aldiv                                             15     7      8     445
;;                                              0 BANK0     15     7      8
;; ---------------------------------------------------------------------------------
;; (4) ___almod                                             11     3      8     433
;;                                              0 BANK0     11     3      8
;; ---------------------------------------------------------------------------------
;; (4) _delay                                                5     3      2      68
;;                                              0 BANK0      5     3      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ccp1                                                 5     5      0       0
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;     _delay
;;     _enable
;;       _delay
;;   _show
;;     _enable
;;       _delay
;;     _show_a
;;       _tostring
;;         ___almod
;;         ___aldiv
;;       _enable
;;         _delay
;;
;; _ccp1 (ROOT)
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
;;DATA                 0      0      46      12        0.0%
;;ABS                  0      0      42       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50     1C      38       5       70.0%
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
;;		line 97 in file "D:\EE\Mplabcode\Task_2\Transmitter.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  731[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
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
;;		_show
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\EE\Mplabcode\Task_2\Transmitter.c"
	line	97
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	98
	
l3302:	
;Transmitter.c: 98: init ();
	fcall	_init
	line	99
	
l3304:	
;Transmitter.c: 99: show();
	fcall	_show
	line	100
	
l3306:	
;Transmitter.c: 100: TMR1ON=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(128/8),(128)&7
	goto	l3308
	line	101
;Transmitter.c: 101: while(1){
	
l732:	
	line	102
	
l3308:	
;Transmitter.c: 102: if(showflag){
	btfss	(_showflag/8),(_showflag)&7
	goto	u2991
	goto	u2990
u2991:
	goto	l3308
u2990:
	line	103
	
l3310:	
;Transmitter.c: 103: showflag=0;
	bcf	(_showflag/8),(_showflag)&7
	line	104
	
l3312:	
;Transmitter.c: 104: show();
	fcall	_show
	goto	l3308
	line	105
	
l733:	
	goto	l3308
	line	106
	
l734:	
	line	101
	goto	l3308
	
l735:	
	line	107
	
l736:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_show
psect	text374,local,class=CODE,delta=2
global __ptext374
__ptext374:

;; *************** function _show *****************
;; Defined at:
;;		line 168 in file "D:\EE\Mplabcode\Task_2\Transmitter.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_enable
;;		_show_a
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text374
	file	"D:\EE\Mplabcode\Task_2\Transmitter.c"
	line	168
	global	__size_of_show
	__size_of_show	equ	__end_of_show-_show
	
_show:	
	opt	stack 3
; Regs used in _show: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	169
	
l3296:	
;Transmitter.c: 169: PORTD=0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	170
	
l3298:	
;Transmitter.c: 170: enable (INS);
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	171
	
l3300:	
;Transmitter.c: 171: show_a(showdata.l);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_showdata+3),w
	movwf	(?_show_a+3)
	movf	(_showdata+2),w
	movwf	(?_show_a+2)
	movf	(_showdata+1),w
	movwf	(?_show_a+1)
	movf	(_showdata),w
	movwf	(?_show_a)

	fcall	_show_a
	line	172
	
l761:	
	return
	opt stack 0
GLOBAL	__end_of_show
	__end_of_show:
;; =============== function _show ends ============

	signat	_show,88
	global	_show_a
psect	text375,local,class=CODE,delta=2
global __ptext375
__ptext375:

;; *************** function _show_a *****************
;; Defined at:
;;		line 160 in file "D:\EE\Mplabcode\Task_2\Transmitter.c"
;; Parameters:    Size  Location     Type
;;  x               4   22[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  i               2   26[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_tostring
;;		_enable
;; This function is called by:
;;		_show
;; This function uses a non-reentrant model
;;
psect	text375
	file	"D:\EE\Mplabcode\Task_2\Transmitter.c"
	line	160
	global	__size_of_show_a
	__size_of_show_a	equ	__end_of_show_a-_show_a
	
_show_a:	
	opt	stack 3
; Regs used in _show_a: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	161
	
l3280:	
;Transmitter.c: 161: tostring(x);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(show_a@x+3),w
	movwf	(?_tostring+3)
	movf	(show_a@x+2),w
	movwf	(?_tostring+2)
	movf	(show_a@x+1),w
	movwf	(?_tostring+1)
	movf	(show_a@x),w
	movwf	(?_tostring)

	fcall	_tostring
	line	162
	
l3282:	
;Transmitter.c: 162: for(int i=0;i<=6;++i){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(show_a@i)
	clrf	(show_a@i+1)
	
l3284:	
	movf	(show_a@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2975
	movlw	low(07h)
	subwf	(show_a@i),w
u2975:

	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l3288
u2970:
	goto	l758
	
l3286:	
	goto	l758
	
l756:	
	line	163
	
l3288:	
;Transmitter.c: 163: PORTD=s[i];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(show_a@i),w
	addlw	_s&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	line	164
	
l3290:	
;Transmitter.c: 164: enable(DATA);
	movlw	low(01h)
	movwf	(?_enable)
	movlw	high(01h)
	movwf	((?_enable))+1
	fcall	_enable
	line	162
	
l3292:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(show_a@i),f
	skipnc
	incf	(show_a@i+1),f
	movlw	high(01h)
	addwf	(show_a@i+1),f
	
l3294:	
	movf	(show_a@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2985
	movlw	low(07h)
	subwf	(show_a@i),w
u2985:

	skipc
	goto	u2981
	goto	u2980
u2981:
	goto	l3288
u2980:
	goto	l758
	
l757:	
	line	166
	
l758:	
	return
	opt stack 0
GLOBAL	__end_of_show_a
	__end_of_show_a:
;; =============== function _show_a ends ============

	signat	_show_a,4216
	global	_init
psect	text376,local,class=CODE,delta=2
global __ptext376
__ptext376:

;; *************** function _init *****************
;; Defined at:
;;		line 110 in file "D:\EE\Mplabcode\Task_2\Transmitter.c"
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
psect	text376
	file	"D:\EE\Mplabcode\Task_2\Transmitter.c"
	line	110
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 4
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	111
	
l3234:	
;Transmitter.c: 111: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
;Transmitter.c: 112: TRISA=0;
	clrf	(133)^080h	;volatile
	line	113
	
l3236:	
;Transmitter.c: 113: TRISC2=1;
	bsf	(1082/8)^080h,(1082)&7
	line	114
	
l3238:	
;Transmitter.c: 114: TRISC7=0;
	bcf	(1087/8)^080h,(1087)&7
	line	115
	
l3240:	
;Transmitter.c: 115: TRISC4=0;
	bcf	(1084/8)^080h,(1084)&7
	line	116
;Transmitter.c: 116: TRISB=0x0;
	clrf	(134)^080h	;volatile
	line	117
	
l3242:	
;Transmitter.c: 117: ADCON1=7;
	movlw	(07h)
	movwf	(159)^080h	;volatile
	line	119
	
l3244:	
;Transmitter.c: 119: PORTD=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	120
	
l3246:	
;Transmitter.c: 120: RC7=0;
	bcf	(63/8),(63)&7
	line	121
	
l3248:	
;Transmitter.c: 121: RA3=1;
	bsf	(43/8),(43)&7
	line	123
	
l3250:	
;Transmitter.c: 123: delay(1000);
	movlw	low(03E8h)
	movwf	(?_delay)
	movlw	high(03E8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	124
	
l3252:	
;Transmitter.c: 124: PORTD=0x38;enable (INS);
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	125
	
l3254:	
;Transmitter.c: 125: PORTD=0x0c;enable (INS);
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3256:	
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	127
	
l3258:	
;Transmitter.c: 127: tsmflag=0;
	bcf	(_tsmflag/8),(_tsmflag)&7
	line	128
	
l3260:	
;Transmitter.c: 128: showflag=0;
	bcf	(_showflag/8),(_showflag)&7
	line	129
	
l3262:	
;Transmitter.c: 129: hflag=0;
	bcf	(_hflag/8),(_hflag)&7
	line	131
	
l3264:	
;Transmitter.c: 131: GIE=1; PEIE=1;CCP1IE=1;CCP1IF=0;
	bsf	(95/8),(95)&7
	
l3266:	
	bsf	(94/8),(94)&7
	
l3268:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1122/8)^080h,(1122)&7
	
l3270:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(98/8),(98)&7
	line	132
	
l3272:	
;Transmitter.c: 132: TMR1IE=1;TMR1IF=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1120/8)^080h,(1120)&7
	
l3274:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(96/8),(96)&7
	line	133
	
l3276:	
;Transmitter.c: 133: T1CON=0B00000000;
	clrf	(16)	;volatile
	line	134
	
l3278:	
;Transmitter.c: 134: CCP1CON=5;
	movlw	(05h)
	movwf	(23)	;volatile
	line	135
	
l739:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_tostring
psect	text377,local,class=CODE,delta=2
global __ptext377
__ptext377:

;; *************** function _tostring *****************
;; Defined at:
;;		line 152 in file "D:\EE\Mplabcode\Task_2\Transmitter.c"
;; Parameters:    Size  Location     Type
;;  x               4   15[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  i               2   20[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___almod
;;		___aldiv
;; This function is called by:
;;		_show_a
;; This function uses a non-reentrant model
;;
psect	text377
	file	"D:\EE\Mplabcode\Task_2\Transmitter.c"
	line	152
	global	__size_of_tostring
	__size_of_tostring	equ	__end_of_tostring-_tostring
	
_tostring:	
	opt	stack 3
; Regs used in _tostring: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	153
	
l3220:	
;Transmitter.c: 153: for(int i=6;i>=0;--i){
	movlw	low(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(tostring@i)
	movlw	high(06h)
	movwf	((tostring@i))+1
	
l3222:	
	btfss	(tostring@i+1),7
	goto	u2951
	goto	u2950
u2951:
	goto	l3226
u2950:
	goto	l753
	
l3224:	
	goto	l753
	
l751:	
	line	154
	
l3226:	
;Transmitter.c: 154: s[i]=x%10+'0';
	movlw	0
	movwf	(?___almod+3)
	movlw	0
	movwf	(?___almod+2)
	movlw	0
	movwf	(?___almod+1)
	movlw	0Ah
	movwf	(?___almod)

	movf	(tostring@x+3),w
	movwf	3+(?___almod)+04h
	movf	(tostring@x+2),w
	movwf	2+(?___almod)+04h
	movf	(tostring@x+1),w
	movwf	1+(?___almod)+04h
	movf	(tostring@x),w
	movwf	0+(?___almod)+04h

	fcall	___almod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___almod)))),w
	addlw	030h
	movwf	(??_tostring+0)+0
	movf	(tostring@i),w
	addlw	_s&0ffh
	movwf	fsr0
	movf	(??_tostring+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	155
	
l3228:	
;Transmitter.c: 155: x/=10;
	movlw	0
	movwf	(?___aldiv+3)
	movlw	0
	movwf	(?___aldiv+2)
	movlw	0
	movwf	(?___aldiv+1)
	movlw	0Ah
	movwf	(?___aldiv)

	movf	(tostring@x+3),w
	movwf	3+(?___aldiv)+04h
	movf	(tostring@x+2),w
	movwf	2+(?___aldiv)+04h
	movf	(tostring@x+1),w
	movwf	1+(?___aldiv)+04h
	movf	(tostring@x),w
	movwf	0+(?___aldiv)+04h

	fcall	___aldiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(3+(?___aldiv)),w
	movwf	(tostring@x+3)
	movf	(2+(?___aldiv)),w
	movwf	(tostring@x+2)
	movf	(1+(?___aldiv)),w
	movwf	(tostring@x+1)
	movf	(0+(?___aldiv)),w
	movwf	(tostring@x)

	line	153
	
l3230:	
	movlw	low(-1)
	addwf	(tostring@i),f
	skipnc
	incf	(tostring@i+1),f
	movlw	high(-1)
	addwf	(tostring@i+1),f
	
l3232:	
	btfss	(tostring@i+1),7
	goto	u2961
	goto	u2960
u2961:
	goto	l3226
u2960:
	goto	l753
	
l752:	
	line	157
	
l753:	
	return
	opt stack 0
GLOBAL	__end_of_tostring
	__end_of_tostring:
;; =============== function _tostring ends ============

	signat	_tostring,4216
	global	_enable
psect	text378,local,class=CODE,delta=2
global __ptext378
__ptext378:

;; *************** function _enable *****************
;; Defined at:
;;		line 144 in file "D:\EE\Mplabcode\Task_2\Transmitter.c"
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
psect	text378
	file	"D:\EE\Mplabcode\Task_2\Transmitter.c"
	line	144
	global	__size_of_enable
	__size_of_enable	equ	__end_of_enable-_enable
	
_enable:	
	opt	stack 3
; Regs used in _enable: [wreg+status,2+status,0+pclath+cstack]
	line	145
	
l3214:	
;Transmitter.c: 145: RA5=t;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(enable@t),0
	goto	u2931
	goto	u2930
	
u2931:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	goto	u2944
u2930:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
u2944:
	line	146
;Transmitter.c: 146: RA4=0;
	bcf	(44/8),(44)&7
	line	147
;Transmitter.c: 147: RA3=0;
	bcf	(43/8),(43)&7
	line	148
	
l3216:	
;Transmitter.c: 148: delay(30);
	movlw	low(01Eh)
	movwf	(?_delay)
	movlw	high(01Eh)
	movwf	((?_delay))+1
	fcall	_delay
	line	149
	
l3218:	
;Transmitter.c: 149: RA3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	line	150
	
l748:	
	return
	opt stack 0
GLOBAL	__end_of_enable
	__end_of_enable:
;; =============== function _enable ends ============

	signat	_enable,4216
	global	___aldiv
psect	text379,local,class=CODE,delta=2
global __ptext379
__ptext379:

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\aldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] long 
;;  dividend        4    4[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   11[BANK0 ] long 
;;  sign            1   10[BANK0 ] unsigned char 
;;  counter         1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tostring
;; This function uses a non-reentrant model
;;
psect	text379
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\aldiv.c"
	line	5
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:	
	opt	stack 3
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	9
	
l3172:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___aldiv@sign)
	line	10
	btfss	(___aldiv@divisor+3),7
	goto	u2831
	goto	u2830
u2831:
	goto	l3178
u2830:
	line	11
	
l3174:	
	comf	(___aldiv@divisor),f
	comf	(___aldiv@divisor+1),f
	comf	(___aldiv@divisor+2),f
	comf	(___aldiv@divisor+3),f
	incf	(___aldiv@divisor),f
	skipnz
	incf	(___aldiv@divisor+1),f
	skipnz
	incf	(___aldiv@divisor+2),f
	skipnz
	incf	(___aldiv@divisor+3),f
	line	12
	
l3176:	
	clrf	(___aldiv@sign)
	bsf	status,0
	rlf	(___aldiv@sign),f
	goto	l3178
	line	13
	
l1639:	
	line	14
	
l3178:	
	btfss	(___aldiv@dividend+3),7
	goto	u2841
	goto	u2840
u2841:
	goto	l3184
u2840:
	line	15
	
l3180:	
	comf	(___aldiv@dividend),f
	comf	(___aldiv@dividend+1),f
	comf	(___aldiv@dividend+2),f
	comf	(___aldiv@dividend+3),f
	incf	(___aldiv@dividend),f
	skipnz
	incf	(___aldiv@dividend+1),f
	skipnz
	incf	(___aldiv@dividend+2),f
	skipnz
	incf	(___aldiv@dividend+3),f
	line	16
	
l3182:	
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	xorwf	(___aldiv@sign),f
	goto	l3184
	line	17
	
l1640:	
	line	18
	
l3184:	
	movlw	0
	movwf	(___aldiv@quotient+3)
	movlw	0
	movwf	(___aldiv@quotient+2)
	movlw	0
	movwf	(___aldiv@quotient+1)
	movlw	0
	movwf	(___aldiv@quotient)

	line	19
	
l3186:	
	movf	(___aldiv@divisor+3),w
	iorwf	(___aldiv@divisor+2),w
	iorwf	(___aldiv@divisor+1),w
	iorwf	(___aldiv@divisor),w
	skipnz
	goto	u2851
	goto	u2850
u2851:
	goto	l3206
u2850:
	line	20
	
l3188:	
	clrf	(___aldiv@counter)
	bsf	status,0
	rlf	(___aldiv@counter),f
	line	21
	goto	l3192
	
l1643:	
	line	22
	
l3190:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2865:
	clrc
	rlf	(___aldiv@divisor),f
	rlf	(___aldiv@divisor+1),f
	rlf	(___aldiv@divisor+2),f
	rlf	(___aldiv@divisor+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2865
	line	23
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	addwf	(___aldiv@counter),f
	goto	l3192
	line	24
	
l1642:	
	line	21
	
l3192:	
	btfss	(___aldiv@divisor+3),(31)&7
	goto	u2871
	goto	u2870
u2871:
	goto	l3190
u2870:
	goto	l3194
	
l1644:	
	goto	l3194
	line	25
	
l1645:	
	line	26
	
l3194:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2885:
	clrc
	rlf	(___aldiv@quotient),f
	rlf	(___aldiv@quotient+1),f
	rlf	(___aldiv@quotient+2),f
	rlf	(___aldiv@quotient+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2885
	line	27
	
l3196:	
	movf	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),w
	skipz
	goto	u2895
	movf	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),w
	skipz
	goto	u2895
	movf	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),w
	skipz
	goto	u2895
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),w
u2895:
	skipc
	goto	u2891
	goto	u2890
u2891:
	goto	l3202
u2890:
	line	28
	
l3198:	
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),f
	movf	(___aldiv@divisor+1),w
	skipc
	incfsz	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),f
	movf	(___aldiv@divisor+2),w
	skipc
	incfsz	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),f
	movf	(___aldiv@divisor+3),w
	skipc
	incfsz	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),f
	line	29
	
l3200:	
	bsf	(___aldiv@quotient)+(0/8),(0)&7
	goto	l3202
	line	30
	
l1646:	
	line	31
	
l3202:	
	movlw	01h
u2905:
	clrc
	rrf	(___aldiv@divisor+3),f
	rrf	(___aldiv@divisor+2),f
	rrf	(___aldiv@divisor+1),f
	rrf	(___aldiv@divisor),f
	addlw	-1
	skipz
	goto	u2905

	line	32
	
l3204:	
	movlw	low(01h)
	subwf	(___aldiv@counter),f
	btfss	status,2
	goto	u2911
	goto	u2910
u2911:
	goto	l3194
u2910:
	goto	l3206
	
l1647:	
	goto	l3206
	line	33
	
l1641:	
	line	34
	
l3206:	
	movf	(___aldiv@sign),w
	skipz
	goto	u2920
	goto	l3210
u2920:
	line	35
	
l3208:	
	comf	(___aldiv@quotient),f
	comf	(___aldiv@quotient+1),f
	comf	(___aldiv@quotient+2),f
	comf	(___aldiv@quotient+3),f
	incf	(___aldiv@quotient),f
	skipnz
	incf	(___aldiv@quotient+1),f
	skipnz
	incf	(___aldiv@quotient+2),f
	skipnz
	incf	(___aldiv@quotient+3),f
	goto	l3210
	
l1648:	
	line	36
	
l3210:	
	movf	(___aldiv@quotient+3),w
	movwf	(?___aldiv+3)
	movf	(___aldiv@quotient+2),w
	movwf	(?___aldiv+2)
	movf	(___aldiv@quotient+1),w
	movwf	(?___aldiv+1)
	movf	(___aldiv@quotient),w
	movwf	(?___aldiv)

	goto	l1649
	
l3212:	
	line	37
	
l1649:	
	return
	opt stack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
;; =============== function ___aldiv ends ============

	signat	___aldiv,8316
	global	___almod
psect	text380,local,class=CODE,delta=2
global __ptext380
__ptext380:

;; *************** function ___almod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\almod.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] long 
;;  dividend        4    4[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  sign            1   10[BANK0 ] unsigned char 
;;  counter         1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      11       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tostring
;; This function uses a non-reentrant model
;;
psect	text380
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\almod.c"
	line	5
	global	__size_of___almod
	__size_of___almod	equ	__end_of___almod-___almod
	
___almod:	
	opt	stack 3
; Regs used in ___almod: [wreg+status,2+status,0]
	line	8
	
l3138:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___almod@sign)
	line	9
	btfss	(___almod@dividend+3),7
	goto	u2741
	goto	u2740
u2741:
	goto	l3144
u2740:
	line	10
	
l3140:	
	comf	(___almod@dividend),f
	comf	(___almod@dividend+1),f
	comf	(___almod@dividend+2),f
	comf	(___almod@dividend+3),f
	incf	(___almod@dividend),f
	skipnz
	incf	(___almod@dividend+1),f
	skipnz
	incf	(___almod@dividend+2),f
	skipnz
	incf	(___almod@dividend+3),f
	line	11
	
l3142:	
	clrf	(___almod@sign)
	bsf	status,0
	rlf	(___almod@sign),f
	goto	l3144
	line	12
	
l1626:	
	line	13
	
l3144:	
	btfss	(___almod@divisor+3),7
	goto	u2751
	goto	u2750
u2751:
	goto	l3148
u2750:
	line	14
	
l3146:	
	comf	(___almod@divisor),f
	comf	(___almod@divisor+1),f
	comf	(___almod@divisor+2),f
	comf	(___almod@divisor+3),f
	incf	(___almod@divisor),f
	skipnz
	incf	(___almod@divisor+1),f
	skipnz
	incf	(___almod@divisor+2),f
	skipnz
	incf	(___almod@divisor+3),f
	goto	l3148
	
l1627:	
	line	15
	
l3148:	
	movf	(___almod@divisor+3),w
	iorwf	(___almod@divisor+2),w
	iorwf	(___almod@divisor+1),w
	iorwf	(___almod@divisor),w
	skipnz
	goto	u2761
	goto	u2760
u2761:
	goto	l3164
u2760:
	line	16
	
l3150:	
	clrf	(___almod@counter)
	bsf	status,0
	rlf	(___almod@counter),f
	line	17
	goto	l3154
	
l1630:	
	line	18
	
l3152:	
	movlw	01h
	movwf	(??___almod+0)+0
u2775:
	clrc
	rlf	(___almod@divisor),f
	rlf	(___almod@divisor+1),f
	rlf	(___almod@divisor+2),f
	rlf	(___almod@divisor+3),f
	decfsz	(??___almod+0)+0
	goto	u2775
	line	19
	movlw	(01h)
	movwf	(??___almod+0)+0
	movf	(??___almod+0)+0,w
	addwf	(___almod@counter),f
	goto	l3154
	line	20
	
l1629:	
	line	17
	
l3154:	
	btfss	(___almod@divisor+3),(31)&7
	goto	u2781
	goto	u2780
u2781:
	goto	l3152
u2780:
	goto	l3156
	
l1631:	
	goto	l3156
	line	21
	
l1632:	
	line	22
	
l3156:	
	movf	(___almod@divisor+3),w
	subwf	(___almod@dividend+3),w
	skipz
	goto	u2795
	movf	(___almod@divisor+2),w
	subwf	(___almod@dividend+2),w
	skipz
	goto	u2795
	movf	(___almod@divisor+1),w
	subwf	(___almod@dividend+1),w
	skipz
	goto	u2795
	movf	(___almod@divisor),w
	subwf	(___almod@dividend),w
u2795:
	skipc
	goto	u2791
	goto	u2790
u2791:
	goto	l3160
u2790:
	line	23
	
l3158:	
	movf	(___almod@divisor),w
	subwf	(___almod@dividend),f
	movf	(___almod@divisor+1),w
	skipc
	incfsz	(___almod@divisor+1),w
	subwf	(___almod@dividend+1),f
	movf	(___almod@divisor+2),w
	skipc
	incfsz	(___almod@divisor+2),w
	subwf	(___almod@dividend+2),f
	movf	(___almod@divisor+3),w
	skipc
	incfsz	(___almod@divisor+3),w
	subwf	(___almod@dividend+3),f
	goto	l3160
	
l1633:	
	line	24
	
l3160:	
	movlw	01h
u2805:
	clrc
	rrf	(___almod@divisor+3),f
	rrf	(___almod@divisor+2),f
	rrf	(___almod@divisor+1),f
	rrf	(___almod@divisor),f
	addlw	-1
	skipz
	goto	u2805

	line	25
	
l3162:	
	movlw	low(01h)
	subwf	(___almod@counter),f
	btfss	status,2
	goto	u2811
	goto	u2810
u2811:
	goto	l3156
u2810:
	goto	l3164
	
l1634:	
	goto	l3164
	line	26
	
l1628:	
	line	27
	
l3164:	
	movf	(___almod@sign),w
	skipz
	goto	u2820
	goto	l3168
u2820:
	line	28
	
l3166:	
	comf	(___almod@dividend),f
	comf	(___almod@dividend+1),f
	comf	(___almod@dividend+2),f
	comf	(___almod@dividend+3),f
	incf	(___almod@dividend),f
	skipnz
	incf	(___almod@dividend+1),f
	skipnz
	incf	(___almod@dividend+2),f
	skipnz
	incf	(___almod@dividend+3),f
	goto	l3168
	
l1635:	
	line	29
	
l3168:	
	movf	(___almod@dividend+3),w
	movwf	(?___almod+3)
	movf	(___almod@dividend+2),w
	movwf	(?___almod+2)
	movf	(___almod@dividend+1),w
	movwf	(?___almod+1)
	movf	(___almod@dividend),w
	movwf	(?___almod)

	goto	l1636
	
l3170:	
	line	30
	
l1636:	
	return
	opt stack 0
GLOBAL	__end_of___almod
	__end_of___almod:
;; =============== function ___almod ends ============

	signat	___almod,8316
	global	_delay
psect	text381,local,class=CODE,delta=2
global __ptext381
__ptext381:

;; *************** function _delay *****************
;; Defined at:
;;		line 139 in file "D:\EE\Mplabcode\Task_2\Transmitter.c"
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
psect	text381
	file	"D:\EE\Mplabcode\Task_2\Transmitter.c"
	line	139
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 3
; Regs used in _delay: [wreg+status,2]
	line	140
	
l3134:	
;Transmitter.c: 140: for (int i=0;i<t;++i) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l742
	
l743:	
	
l3136:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l742:	
	movf	(delay@i+1),w
	xorlw	80h
	movwf	(??_delay+0)+0
	movf	(delay@t+1),w
	xorlw	80h
	subwf	(??_delay+0)+0,w
	skipz
	goto	u2735
	movf	(delay@t),w
	subwf	(delay@i),w
u2735:

	skipc
	goto	u2731
	goto	u2730
u2731:
	goto	l3136
u2730:
	goto	l745
	
l744:	
	line	141
	
l745:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_ccp1
psect	text382,local,class=CODE,delta=2
global __ptext382
__ptext382:

;; *************** function _ccp1 *****************
;; Defined at:
;;		line 29 in file "D:\EE\Mplabcode\Task_2\Transmitter.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
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
psect	text382
	file	"D:\EE\Mplabcode\Task_2\Transmitter.c"
	line	29
	global	__size_of_ccp1
	__size_of_ccp1	equ	__end_of_ccp1-_ccp1
	
_ccp1:	
	opt	stack 3
; Regs used in _ccp1: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ccp1+1)
	movf	fsr0,w
	movwf	(??_ccp1+2)
	movf	pclath,w
	movwf	(??_ccp1+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_ccp1+4)
	ljmp	_ccp1
psect	text382
	line	30
	
i1l2880:	
;Transmitter.c: 30: if(CCP1IF){
	btfss	(98/8),(98)&7
	goto	u238_21
	goto	u238_20
u238_21:
	goto	i1l715
u238_20:
	line	31
	
i1l2882:	
;Transmitter.c: 31: CCP1IF=0;
	bcf	(98/8),(98)&7
	line	32
;Transmitter.c: 32: if(tsmflag){
	btfss	(_tsmflag/8),(_tsmflag)&7
	goto	u239_21
	goto	u239_20
u239_21:
	goto	i1l2926
u239_20:
	line	33
	
i1l2884:	
;Transmitter.c: 33: hflag=!hflag;
	movlw	1<<((_hflag)&7)
	xorwf	((_hflag)/8),f
	line	34
	
i1l2886:	
;Transmitter.c: 34: if(hflag){
	btfss	(_hflag/8),(_hflag)&7
	goto	u240_21
	goto	u240_20
u240_21:
	goto	i1l2896
u240_20:
	line	35
	
i1l2888:	
;Transmitter.c: 35: RC7=1;
	bsf	(63/8),(63)&7
	line	36
	
i1l2890:	
;Transmitter.c: 36: CCPR1H=TMR1H;
	movf	(15),w	;volatile
	movwf	(22)	;volatile
	line	37
	
i1l2892:	
;Transmitter.c: 37: CCPR1L=TMR1L+55;
	movf	(14),w	;volatile
	addlw	037h
	movwf	(21)	;volatile
	line	38
	
i1l2894:	
;Transmitter.c: 38: CCPR1H=CCPR1H+CARRY;
	movlw	0
	btfsc	(24/8),(24)&7
	movlw	1
	addwf	(22),w	;volatile
	movwf	(22)	;volatile
	line	39
;Transmitter.c: 39: }
	goto	i1l729
	line	40
	
i1l717:	
	
i1l2896:	
;Transmitter.c: 40: else if(cnt==1){
	movf	(_cnt),w
	xorlw	01h
	skipz
	goto	u241_21
	goto	u241_20
u241_21:
	goto	i1l2902
u241_20:
	line	41
	
i1l2898:	
;Transmitter.c: 41: RC7=0;
	bcf	(63/8),(63)&7
	line	42
	
i1l2900:	
;Transmitter.c: 42: CCPR1L=TMR1L+79;
	movf	(14),w	;volatile
	addlw	04Fh
	movwf	(21)	;volatile
	line	43
;Transmitter.c: 43: CCPR1H=TMR1H+CARRY;
	movlw	0
	btfsc	(24/8),(24)&7
	movlw	1
	addwf	(15),w	;volatile
	movwf	(22)	;volatile
	line	44
;Transmitter.c: 44: CCPR1H=TMR1H+0x02;
	movf	(15),w	;volatile
	addlw	02h
	movwf	(22)	;volatile
	line	45
;Transmitter.c: 45: --cnt;
	movlw	low(01h)
	subwf	(_cnt),f
	line	46
;Transmitter.c: 46: }
	goto	i1l729
	line	47
	
i1l719:	
	
i1l2902:	
;Transmitter.c: 47: else if(cnt==0){
	movf	(_cnt),f
	skipz
	goto	u242_21
	goto	u242_20
u242_21:
	goto	i1l721
u242_20:
	line	48
	
i1l2904:	
;Transmitter.c: 48: RC7=0;
	bcf	(63/8),(63)&7
	line	49
	
i1l2906:	
;Transmitter.c: 49: CCP1CON=5;
	movlw	(05h)
	movwf	(23)	;volatile
	line	50
	
i1l2908:	
;Transmitter.c: 50: tsmflag=0;
	bcf	(_tsmflag/8),(_tsmflag)&7
	line	51
;Transmitter.c: 51: data.l=1;
	movlw	0
	movwf	(_data+3)
	movlw	0
	movwf	(_data+2)
	movlw	0
	movwf	(_data+1)
	movlw	01h
	movwf	(_data)

	line	52
	
i1l2910:	
;Transmitter.c: 52: icnt=0;
	clrf	(_icnt)
	line	53
	
i1l2912:	
;Transmitter.c: 53: hflag=0;
	bcf	(_hflag/8),(_hflag)&7
	line	54
;Transmitter.c: 54: }
	goto	i1l729
	line	55
	
i1l721:	
	line	56
;Transmitter.c: 55: else{
;Transmitter.c: 56: RC7=0;
	bcf	(63/8),(63)&7
	line	57
;Transmitter.c: 57: if(data.l&0x800000){
	btfss	(_data+2),(23)&7
	goto	u243_21
	goto	u243_20
u243_21:
	goto	i1l2916
u243_20:
	line	58
	
i1l2914:	
;Transmitter.c: 58: CCPR1H=TMR1H+1;
	movf	(15),w	;volatile
	addlw	01h
	movwf	(22)	;volatile
	line	59
;Transmitter.c: 59: CCPR1L=TMR1L+16;
	movf	(14),w	;volatile
	addlw	010h
	movwf	(21)	;volatile
	line	60
;Transmitter.c: 60: }
	goto	i1l2920
	line	61
	
i1l723:	
	line	62
	
i1l2916:	
;Transmitter.c: 61: else{
;Transmitter.c: 62: CCPR1H=TMR1H;
	movf	(15),w	;volatile
	movwf	(22)	;volatile
	line	63
	
i1l2918:	
;Transmitter.c: 63: CCPR1L=TMR1L+64;
	movf	(14),w	;volatile
	addlw	040h
	movwf	(21)	;volatile
	goto	i1l2920
	line	64
	
i1l724:	
	line	65
	
i1l2920:	
;Transmitter.c: 64: }
;Transmitter.c: 65: CCPR1H=CCPR1H+CARRY;
	movlw	0
	btfsc	(24/8),(24)&7
	movlw	1
	addwf	(22),w	;volatile
	movwf	(22)	;volatile
	line	66
	
i1l2922:	
;Transmitter.c: 66: --cnt;
	movlw	low(01h)
	subwf	(_cnt),f
	line	67
	
i1l2924:	
;Transmitter.c: 67: data.l<<=1;
	movlw	01h
	movwf	(??_ccp1+0)+0
u244_25:
	clrc
	rlf	(_data),f
	rlf	(_data+1),f
	rlf	(_data+2),f
	rlf	(_data+3),f
	decfsz	(??_ccp1+0)+0
	goto	u244_25
	goto	i1l729
	line	68
	
i1l722:	
	goto	i1l729
	
i1l720:	
	goto	i1l729
	
i1l718:	
	line	69
;Transmitter.c: 68: }
;Transmitter.c: 69: }
	goto	i1l729
	line	70
	
i1l716:	
	line	71
	
i1l2926:	
;Transmitter.c: 70: else{
;Transmitter.c: 71: icnt=!icnt;
	movf	(_icnt)
	movlw	0
	skipnz
	movlw	1
	movwf	(??_ccp1+0)+0
	movf	(??_ccp1+0)+0,w
	movwf	(_icnt)
	line	72
	
i1l2928:	
;Transmitter.c: 72: if(icnt==0){
	movf	(_icnt),f
	skipz
	goto	u245_21
	goto	u245_20
u245_21:
	goto	i1l2944
u245_20:
	line	73
	
i1l2930:	
;Transmitter.c: 73: showdata.c[0]=TMR1L+5;
	movf	(14),w	;volatile
	addlw	05h
	movwf	(??_ccp1+0)+0
	movf	(??_ccp1+0)+0,w
	movwf	(_showdata)
	line	74
;Transmitter.c: 74: showdata.c[1]=TMR1H+CARRY;
	movlw	0
	btfsc	(24/8),(24)&7
	movlw	1
	addwf	(15),w	;volatile
	movwf	(??_ccp1+0)+0
	movf	(??_ccp1+0)+0,w
	movwf	0+(_showdata)+01h
	line	75
	
i1l2932:	
;Transmitter.c: 75: showdata.c[2]=tout;
	movf	(_tout),w
	movwf	(??_ccp1+0)+0
	movf	(??_ccp1+0)+0,w
	movwf	0+(_showdata)+02h
	line	77
	
i1l2934:	
;Transmitter.c: 77: data.l=showdata.l;
	movf	(_showdata+3),w
	movwf	(_data+3)
	movf	(_showdata+2),w
	movwf	(_data+2)
	movf	(_showdata+1),w
	movwf	(_data+1)
	movf	(_showdata),w
	movwf	(_data)

	line	78
	
i1l2936:	
;Transmitter.c: 78: showflag=1;
	bsf	(_showflag/8),(_showflag)&7
	line	80
	
i1l2938:	
;Transmitter.c: 80: tsmflag=1;
	bsf	(_tsmflag/8),(_tsmflag)&7
	line	81
	
i1l2940:	
;Transmitter.c: 81: CCP1CON=10;
	movlw	(0Ah)
	movwf	(23)	;volatile
	line	82
	
i1l2942:	
;Transmitter.c: 82: cnt=25;
	movlw	(019h)
	movwf	(??_ccp1+0)+0
	movf	(??_ccp1+0)+0,w
	movwf	(_cnt)
	line	83
;Transmitter.c: 83: }
	goto	i1l729
	line	84
	
i1l726:	
	line	85
	
i1l2944:	
;Transmitter.c: 84: else{
;Transmitter.c: 85: TMR1L=0;
	clrf	(14)	;volatile
	line	86
;Transmitter.c: 86: TMR1H=0;
	clrf	(15)	;volatile
	line	87
	
i1l2946:	
;Transmitter.c: 87: tout=0;
	clrf	(_tout)
	goto	i1l729
	line	88
	
i1l727:	
	goto	i1l729
	line	89
	
i1l725:	
	line	90
;Transmitter.c: 88: }
;Transmitter.c: 89: }
;Transmitter.c: 90: }
	goto	i1l729
	line	91
	
i1l715:	
	line	92
;Transmitter.c: 91: else{
;Transmitter.c: 92: TMR1IF=0;
	bcf	(96/8),(96)&7
	line	93
	
i1l2948:	
;Transmitter.c: 93: ++tout;
	movlw	(01h)
	movwf	(??_ccp1+0)+0
	movf	(??_ccp1+0)+0,w
	addwf	(_tout),f
	goto	i1l729
	line	94
	
i1l728:	
	line	95
	
i1l729:	
	movf	(??_ccp1+4),w
	movwf	btemp+1
	movf	(??_ccp1+3),w
	movwf	pclath
	movf	(??_ccp1+2),w
	movwf	fsr0
	swapf	(??_ccp1+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ccp1
	__end_of_ccp1:
;; =============== function _ccp1 ends ============

	signat	_ccp1,88
psect	text383,local,class=CODE,delta=2
global __ptext383
__ptext383:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
