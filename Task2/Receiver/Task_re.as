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
# 4 "D:\EE\Mplabcode\Task_re\Receiver.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "D:\EE\Mplabcode\Task_re\Receiver.c"
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
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\EE\Mplabcode\Task_re\Receiver.c"
	line	13

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
	global	_a
	global	_data
	global	_showdata
	global	_end
	global	_flag
	global	_showflag
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1H
_CCPR1H	set	22
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
	global	_CCP1M0
_CCP1M0	set	184
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
	global	_TRISC2
_TRISC2	set	1082
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
	file	"Task_re.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_flag:
       ds      1

_showflag:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_end:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_a:
       ds      15

_data:
       ds      4

_showdata:
       ds      4

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\EE\Mplabcode\Task_re\Receiver.c"
_s:
       ds      20

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+017h)
	fcall	clear_ram
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
	global	?_show
?_show:	; 0 bytes @ 0x0
	global	?_ccp1
?_ccp1:	; 0 bytes @ 0x0
	global	??_ccp1
??_ccp1:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	5
	global	?_delay
?_delay:	; 0 bytes @ 0x5
	global	??___almod
??___almod:	; 0 bytes @ 0x5
	global	??___aldiv
??___aldiv:	; 0 bytes @ 0x5
	global	delay@t
delay@t:	; 2 bytes @ 0x5
	ds	2
	global	??_init
??_init:	; 0 bytes @ 0x7
	global	??_enable
??_enable:	; 0 bytes @ 0x7
	global	??_main
??_main:	; 0 bytes @ 0x7
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_delay
??_delay:	; 0 bytes @ 0x0
	global	?___almod
?___almod:	; 4 bytes @ 0x0
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x0
	global	___almod@divisor
___almod@divisor:	; 4 bytes @ 0x0
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x0
	ds	1
	global	delay@i
delay@i:	; 2 bytes @ 0x1
	ds	2
	global	?_enable
?_enable:	; 0 bytes @ 0x3
	global	enable@t
enable@t:	; 2 bytes @ 0x3
	ds	1
	global	___almod@dividend
___almod@dividend:	; 4 bytes @ 0x4
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x4
	ds	4
	global	___almod@counter
___almod@counter:	; 1 bytes @ 0x8
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x8
	ds	1
	global	___almod@sign
___almod@sign:	; 1 bytes @ 0x9
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0x9
	ds	1
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0xA
	ds	4
	global	?_tostring
?_tostring:	; 0 bytes @ 0xE
	global	tostring@x
tostring@x:	; 4 bytes @ 0xE
	ds	4
	global	tostring@s
tostring@s:	; 1 bytes @ 0x12
	ds	1
	global	??_tostring
??_tostring:	; 0 bytes @ 0x13
	ds	2
	global	tostring@i
tostring@i:	; 2 bytes @ 0x15
	ds	2
	global	?_show_a
?_show_a:	; 0 bytes @ 0x17
	global	show_a@x
show_a@x:	; 4 bytes @ 0x17
	ds	4
	global	show_a@s
show_a@s:	; 1 bytes @ 0x1B
	ds	1
	global	??_show_a
??_show_a:	; 0 bytes @ 0x1C
	ds	1
	global	show_a@i
show_a@i:	; 2 bytes @ 0x1D
	ds	2
	global	??_show
??_show:	; 0 bytes @ 0x1F
	ds	1
;;Data sizes: Strings 0, constant 0, data 20, bss 24, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7       9
;; BANK0           80     32      75
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___aldiv	long  size(1) Largest target is 0
;;
;; ?___almod	long  size(1) Largest target is 0
;;
;; show_a@s	PTR unsigned char  size(1) Largest target is 20
;;		 -> s(BANK0[20]), 
;;
;; tostring@s	PTR unsigned char  size(1) Largest target is 20
;;		 -> s(BANK0[20]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _init->_delay
;;   _tostring->___almod
;;   _tostring->___aldiv
;;   _enable->_delay
;;
;; Critical Paths under _ccp1 in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_show
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
;; (0) _main                                                 0     0      0    1485
;;                               _init
;;                               _show
;; ---------------------------------------------------------------------------------
;; (1) _show                                                 1     1      0    1318
;;                                             31 BANK0      1     1      0
;;                             _enable
;;                             _show_a
;; ---------------------------------------------------------------------------------
;; (2) _show_a                                               8     3      5    1219
;;                                             23 BANK0      8     3      5
;;                           _tostring
;;                             _enable
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0     167
;;                              _delay
;;                             _enable
;; ---------------------------------------------------------------------------------
;; (3) _tostring                                             9     4      5     928
;;                                             14 BANK0      9     4      5
;;                            ___almod
;;                            ___aldiv
;; ---------------------------------------------------------------------------------
;; (3) _enable                                               2     0      2      99
;;                                              3 BANK0      2     0      2
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4) ___aldiv                                             15     7      8     300
;;                                              5 COMMON     1     1      0
;;                                              0 BANK0     14     6      8
;; ---------------------------------------------------------------------------------
;; (4) ___almod                                             11     3      8     433
;;                                              5 COMMON     1     1      0
;;                                              0 BANK0     10     2      8
;; ---------------------------------------------------------------------------------
;; (4) _delay                                                5     3      2      68
;;                                              5 COMMON     2     0      2
;;                                              0 BANK0      3     3      0
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
;;DATA                 0      0      58      12        0.0%
;;ABS                  0      0      54       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50     20      4B       5       93.8%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      7       9       1       64.3%
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 55 in file "D:\EE\Mplabcode\Task_re\Receiver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  717[COMMON] int 
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
	file	"D:\EE\Mplabcode\Task_re\Receiver.c"
	line	55
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	57
	
l3150:	
;Receiver.c: 57: init ();
	fcall	_init
	line	58
	
l3152:	
;Receiver.c: 58: show();
	fcall	_show
	line	59
	
l3154:	
;Receiver.c: 59: TMR1ON=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(128/8),(128)&7
	goto	l3156
	line	60
;Receiver.c: 60: while(1){
	
l718:	
	line	61
	
l3156:	
;Receiver.c: 61: if(showflag){
	btfss	(_showflag/8),(_showflag)&7
	goto	u2871
	goto	u2870
u2871:
	goto	l3156
u2870:
	line	62
	
l3158:	
;Receiver.c: 62: showflag=0;
	bcf	(_showflag/8),(_showflag)&7
	line	63
	
l3160:	
;Receiver.c: 63: show();
	fcall	_show
	goto	l3156
	line	64
	
l719:	
	goto	l3156
	line	65
	
l720:	
	line	60
	goto	l3156
	
l721:	
	line	66
	
l722:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_show
psect	text372,local,class=CODE,delta=2
global __ptext372
__ptext372:

;; *************** function _show *****************
;; Defined at:
;;		line 124 in file "D:\EE\Mplabcode\Task_re\Receiver.c"
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
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_enable
;;		_show_a
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text372
	file	"D:\EE\Mplabcode\Task_re\Receiver.c"
	line	124
	global	__size_of_show
	__size_of_show	equ	__end_of_show-_show
	
_show:	
	opt	stack 3
; Regs used in _show: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	125
	
l3144:	
;Receiver.c: 125: PORTD=0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	126
	
l3146:	
;Receiver.c: 126: enable (INS);
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	127
	
l3148:	
;Receiver.c: 127: show_a(showdata,s);
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

	movlw	(_s)&0ffh
	movwf	(??_show+0)+0
	movf	(??_show+0)+0,w
	movwf	(0+?_show_a+04h)
	fcall	_show_a
	line	128
	
l747:	
	return
	opt stack 0
GLOBAL	__end_of_show
	__end_of_show:
;; =============== function _show ends ============

	signat	_show,88
	global	_show_a
psect	text373,local,class=CODE,delta=2
global __ptext373
__ptext373:

;; *************** function _show_a *****************
;; Defined at:
;;		line 116 in file "D:\EE\Mplabcode\Task_re\Receiver.c"
;; Parameters:    Size  Location     Type
;;  x               4   23[BANK0 ] long 
;;  s               1   27[BANK0 ] PTR unsigned char 
;;		 -> s(20), 
;; Auto vars:     Size  Location     Type
;;  i               2   29[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_tostring
;;		_enable
;; This function is called by:
;;		_show
;; This function uses a non-reentrant model
;;
psect	text373
	file	"D:\EE\Mplabcode\Task_re\Receiver.c"
	line	116
	global	__size_of_show_a
	__size_of_show_a	equ	__end_of_show_a-_show_a
	
_show_a:	
	opt	stack 3
; Regs used in _show_a: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	117
	
l3128:	
;Receiver.c: 117: tostring(x,s);
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

	movf	(show_a@s),w
	movwf	(??_show_a+0)+0
	movf	(??_show_a+0)+0,w
	movwf	(0+?_tostring+04h)
	fcall	_tostring
	line	118
	
l3130:	
;Receiver.c: 118: for(int i=0;i<=6;++i){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(show_a@i)
	clrf	(show_a@i+1)
	
l3132:	
	movf	(show_a@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2855
	movlw	low(07h)
	subwf	(show_a@i),w
u2855:

	skipc
	goto	u2851
	goto	u2850
u2851:
	goto	l3136
u2850:
	goto	l744
	
l3134:	
	goto	l744
	
l742:	
	line	119
	
l3136:	
;Receiver.c: 119: PORTD=s[i]+'0';
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(show_a@i),w
	addwf	(show_a@s),w
	movwf	(??_show_a+0)+0
	movf	0+(??_show_a+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	addlw	030h
	movwf	(8)	;volatile
	line	120
	
l3138:	
;Receiver.c: 120: enable(DATA);
	movlw	low(01h)
	movwf	(?_enable)
	movlw	high(01h)
	movwf	((?_enable))+1
	fcall	_enable
	line	118
	
l3140:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(show_a@i),f
	skipnc
	incf	(show_a@i+1),f
	movlw	high(01h)
	addwf	(show_a@i+1),f
	
l3142:	
	movf	(show_a@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2865
	movlw	low(07h)
	subwf	(show_a@i),w
u2865:

	skipc
	goto	u2861
	goto	u2860
u2861:
	goto	l3136
u2860:
	goto	l744
	
l743:	
	line	122
	
l744:	
	return
	opt stack 0
GLOBAL	__end_of_show_a
	__end_of_show_a:
;; =============== function _show_a ends ============

	signat	_show_a,8312
	global	_init
psect	text374,local,class=CODE,delta=2
global __ptext374
__ptext374:

;; *************** function _init *****************
;; Defined at:
;;		line 69 in file "D:\EE\Mplabcode\Task_re\Receiver.c"
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
psect	text374
	file	"D:\EE\Mplabcode\Task_re\Receiver.c"
	line	69
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 4
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	70
	
l3090:	
;Receiver.c: 70: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	71
;Receiver.c: 71: TRISA=0;
	clrf	(133)^080h	;volatile
	line	72
	
l3092:	
;Receiver.c: 72: TRISC2=1;
	bsf	(1082/8)^080h,(1082)&7
	line	73
	
l3094:	
;Receiver.c: 73: TRISC7=0;
	bcf	(1087/8)^080h,(1087)&7
	line	74
;Receiver.c: 74: TRISB=0x0;
	clrf	(134)^080h	;volatile
	line	75
	
l3096:	
;Receiver.c: 75: ADCON1=7;
	movlw	(07h)
	movwf	(159)^080h	;volatile
	line	77
	
l3098:	
;Receiver.c: 77: PORTD=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	78
	
l3100:	
;Receiver.c: 78: RC7=0;
	bcf	(63/8),(63)&7
	line	79
	
l3102:	
;Receiver.c: 79: RA3=1;
	bsf	(43/8),(43)&7
	line	81
	
l3104:	
;Receiver.c: 81: delay(1000);
	movlw	low(03E8h)
	movwf	(?_delay)
	movlw	high(03E8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	82
	
l3106:	
;Receiver.c: 82: PORTD=0x38;enable (INS);
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	83
	
l3108:	
;Receiver.c: 83: PORTD=0x0c;enable (INS);
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3110:	
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	85
	
l3112:	
;Receiver.c: 85: showflag=0;
	bcf	(_showflag/8),(_showflag)&7
	line	87
	
l3114:	
;Receiver.c: 87: GIE=1; PEIE=1;CCP1IE=1;CCP1IF=0;
	bsf	(95/8),(95)&7
	
l3116:	
	bsf	(94/8),(94)&7
	
l3118:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1122/8)^080h,(1122)&7
	
l3120:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(98/8),(98)&7
	line	88
	
l3122:	
;Receiver.c: 88: TMR1IF=0;
	bcf	(96/8),(96)&7
	line	89
	
l3124:	
;Receiver.c: 89: T1CON=0B00000000;
	clrf	(16)	;volatile
	line	90
	
l3126:	
;Receiver.c: 90: CCP1CON=4;
	movlw	(04h)
	movwf	(23)	;volatile
	line	91
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_tostring
psect	text375,local,class=CODE,delta=2
global __ptext375
__ptext375:

;; *************** function _tostring *****************
;; Defined at:
;;		line 108 in file "D:\EE\Mplabcode\Task_re\Receiver.c"
;; Parameters:    Size  Location     Type
;;  x               4   14[BANK0 ] long 
;;  s               1   18[BANK0 ] PTR unsigned char 
;;		 -> s(20), 
;; Auto vars:     Size  Location     Type
;;  i               2   21[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___almod
;;		___aldiv
;; This function is called by:
;;		_show_a
;; This function uses a non-reentrant model
;;
psect	text375
	file	"D:\EE\Mplabcode\Task_re\Receiver.c"
	line	108
	global	__size_of_tostring
	__size_of_tostring	equ	__end_of_tostring-_tostring
	
_tostring:	
	opt	stack 3
; Regs used in _tostring: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	109
	
l3076:	
;Receiver.c: 109: for(int i=6;i>=0;--i){
	movlw	low(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(tostring@i)
	movlw	high(06h)
	movwf	((tostring@i))+1
	
l3078:	
	btfss	(tostring@i+1),7
	goto	u2831
	goto	u2830
u2831:
	goto	l3082
u2830:
	goto	l739
	
l3080:	
	goto	l739
	
l737:	
	line	110
	
l3082:	
;Receiver.c: 110: s[i]=x%10;
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
	movwf	(??_tostring+0)+0
	movf	(tostring@i),w
	addwf	(tostring@s),w
	movwf	(??_tostring+1)+0
	movf	0+(??_tostring+1)+0,w
	movwf	fsr0
	movf	(??_tostring+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	111
	
l3084:	
;Receiver.c: 111: x/=10;
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

	line	109
	
l3086:	
	movlw	low(-1)
	addwf	(tostring@i),f
	skipnc
	incf	(tostring@i+1),f
	movlw	high(-1)
	addwf	(tostring@i+1),f
	
l3088:	
	btfss	(tostring@i+1),7
	goto	u2841
	goto	u2840
u2841:
	goto	l3082
u2840:
	goto	l739
	
l738:	
	line	113
	
l739:	
	return
	opt stack 0
GLOBAL	__end_of_tostring
	__end_of_tostring:
;; =============== function _tostring ends ============

	signat	_tostring,8312
	global	_enable
psect	text376,local,class=CODE,delta=2
global __ptext376
__ptext376:

;; *************** function _enable *****************
;; Defined at:
;;		line 100 in file "D:\EE\Mplabcode\Task_re\Receiver.c"
;; Parameters:    Size  Location     Type
;;  t               2    3[BANK0 ] int 
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
psect	text376
	file	"D:\EE\Mplabcode\Task_re\Receiver.c"
	line	100
	global	__size_of_enable
	__size_of_enable	equ	__end_of_enable-_enable
	
_enable:	
	opt	stack 3
; Regs used in _enable: [wreg+status,2+status,0+pclath+cstack]
	line	101
	
l3070:	
;Receiver.c: 101: RA5=t;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(enable@t),0
	goto	u2811
	goto	u2810
	
u2811:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	goto	u2824
u2810:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
u2824:
	line	102
;Receiver.c: 102: RA4=0;
	bcf	(44/8),(44)&7
	line	103
;Receiver.c: 103: RA3=0;
	bcf	(43/8),(43)&7
	line	104
	
l3072:	
;Receiver.c: 104: delay(30);
	movlw	low(01Eh)
	movwf	(?_delay)
	movlw	high(01Eh)
	movwf	((?_delay))+1
	fcall	_delay
	line	105
	
l3074:	
;Receiver.c: 105: RA3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	line	106
	
l734:	
	return
	opt stack 0
GLOBAL	__end_of_enable
	__end_of_enable:
;; =============== function _enable ends ============

	signat	_enable,4216
	global	___aldiv
psect	text377,local,class=CODE,delta=2
global __ptext377
__ptext377:

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\aldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] long 
;;  dividend        4    4[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   10[BANK0 ] long 
;;  sign            1    9[BANK0 ] unsigned char 
;;  counter         1    8[BANK0 ] unsigned char 
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
;;      Temps:          1       0       0       0       0
;;      Totals:         1      14       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tostring
;; This function uses a non-reentrant model
;;
psect	text377
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\aldiv.c"
	line	5
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:	
	opt	stack 3
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	9
	
l2894:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___aldiv@sign)
	line	10
	btfss	(___aldiv@divisor+3),7
	goto	u2541
	goto	u2540
u2541:
	goto	l2900
u2540:
	line	11
	
l2896:	
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
	
l2898:	
	clrf	(___aldiv@sign)
	bsf	status,0
	rlf	(___aldiv@sign),f
	goto	l2900
	line	13
	
l1625:	
	line	14
	
l2900:	
	btfss	(___aldiv@dividend+3),7
	goto	u2551
	goto	u2550
u2551:
	goto	l2906
u2550:
	line	15
	
l2902:	
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
	
l2904:	
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	xorwf	(___aldiv@sign),f
	goto	l2906
	line	17
	
l1626:	
	line	18
	
l2906:	
	movlw	0
	movwf	(___aldiv@quotient+3)
	movlw	0
	movwf	(___aldiv@quotient+2)
	movlw	0
	movwf	(___aldiv@quotient+1)
	movlw	0
	movwf	(___aldiv@quotient)

	line	19
	
l2908:	
	movf	(___aldiv@divisor+3),w
	iorwf	(___aldiv@divisor+2),w
	iorwf	(___aldiv@divisor+1),w
	iorwf	(___aldiv@divisor),w
	skipnz
	goto	u2561
	goto	u2560
u2561:
	goto	l2928
u2560:
	line	20
	
l2910:	
	clrf	(___aldiv@counter)
	bsf	status,0
	rlf	(___aldiv@counter),f
	line	21
	goto	l2914
	
l1629:	
	line	22
	
l2912:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2575:
	clrc
	rlf	(___aldiv@divisor),f
	rlf	(___aldiv@divisor+1),f
	rlf	(___aldiv@divisor+2),f
	rlf	(___aldiv@divisor+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2575
	line	23
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	addwf	(___aldiv@counter),f
	goto	l2914
	line	24
	
l1628:	
	line	21
	
l2914:	
	btfss	(___aldiv@divisor+3),(31)&7
	goto	u2581
	goto	u2580
u2581:
	goto	l2912
u2580:
	goto	l2916
	
l1630:	
	goto	l2916
	line	25
	
l1631:	
	line	26
	
l2916:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2595:
	clrc
	rlf	(___aldiv@quotient),f
	rlf	(___aldiv@quotient+1),f
	rlf	(___aldiv@quotient+2),f
	rlf	(___aldiv@quotient+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2595
	line	27
	
l2918:	
	movf	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),w
	skipz
	goto	u2605
	movf	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),w
	skipz
	goto	u2605
	movf	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),w
	skipz
	goto	u2605
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),w
u2605:
	skipc
	goto	u2601
	goto	u2600
u2601:
	goto	l2924
u2600:
	line	28
	
l2920:	
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
	
l2922:	
	bsf	(___aldiv@quotient)+(0/8),(0)&7
	goto	l2924
	line	30
	
l1632:	
	line	31
	
l2924:	
	movlw	01h
u2615:
	clrc
	rrf	(___aldiv@divisor+3),f
	rrf	(___aldiv@divisor+2),f
	rrf	(___aldiv@divisor+1),f
	rrf	(___aldiv@divisor),f
	addlw	-1
	skipz
	goto	u2615

	line	32
	
l2926:	
	movlw	low(01h)
	subwf	(___aldiv@counter),f
	btfss	status,2
	goto	u2621
	goto	u2620
u2621:
	goto	l2916
u2620:
	goto	l2928
	
l1633:	
	goto	l2928
	line	33
	
l1627:	
	line	34
	
l2928:	
	movf	(___aldiv@sign),w
	skipz
	goto	u2630
	goto	l2932
u2630:
	line	35
	
l2930:	
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
	goto	l2932
	
l1634:	
	line	36
	
l2932:	
	movf	(___aldiv@quotient+3),w
	movwf	(?___aldiv+3)
	movf	(___aldiv@quotient+2),w
	movwf	(?___aldiv+2)
	movf	(___aldiv@quotient+1),w
	movwf	(?___aldiv+1)
	movf	(___aldiv@quotient),w
	movwf	(?___aldiv)

	goto	l1635
	
l2934:	
	line	37
	
l1635:	
	return
	opt stack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
;; =============== function ___aldiv ends ============

	signat	___aldiv,8316
	global	___almod
psect	text378,local,class=CODE,delta=2
global __ptext378
__ptext378:

;; *************** function ___almod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\almod.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] long 
;;  dividend        4    4[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  sign            1    9[BANK0 ] unsigned char 
;;  counter         1    8[BANK0 ] unsigned char 
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
;;      Temps:          1       0       0       0       0
;;      Totals:         1      10       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tostring
;; This function uses a non-reentrant model
;;
psect	text378
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\almod.c"
	line	5
	global	__size_of___almod
	__size_of___almod	equ	__end_of___almod-___almod
	
___almod:	
	opt	stack 3
; Regs used in ___almod: [wreg+status,2+status,0]
	line	8
	
l3036:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___almod@sign)
	line	9
	btfss	(___almod@dividend+3),7
	goto	u2721
	goto	u2720
u2721:
	goto	l3042
u2720:
	line	10
	
l3038:	
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
	
l3040:	
	clrf	(___almod@sign)
	bsf	status,0
	rlf	(___almod@sign),f
	goto	l3042
	line	12
	
l1612:	
	line	13
	
l3042:	
	btfss	(___almod@divisor+3),7
	goto	u2731
	goto	u2730
u2731:
	goto	l3046
u2730:
	line	14
	
l3044:	
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
	goto	l3046
	
l1613:	
	line	15
	
l3046:	
	movf	(___almod@divisor+3),w
	iorwf	(___almod@divisor+2),w
	iorwf	(___almod@divisor+1),w
	iorwf	(___almod@divisor),w
	skipnz
	goto	u2741
	goto	u2740
u2741:
	goto	l3062
u2740:
	line	16
	
l3048:	
	clrf	(___almod@counter)
	bsf	status,0
	rlf	(___almod@counter),f
	line	17
	goto	l3052
	
l1616:	
	line	18
	
l3050:	
	movlw	01h
	movwf	(??___almod+0)+0
u2755:
	clrc
	rlf	(___almod@divisor),f
	rlf	(___almod@divisor+1),f
	rlf	(___almod@divisor+2),f
	rlf	(___almod@divisor+3),f
	decfsz	(??___almod+0)+0
	goto	u2755
	line	19
	movlw	(01h)
	movwf	(??___almod+0)+0
	movf	(??___almod+0)+0,w
	addwf	(___almod@counter),f
	goto	l3052
	line	20
	
l1615:	
	line	17
	
l3052:	
	btfss	(___almod@divisor+3),(31)&7
	goto	u2761
	goto	u2760
u2761:
	goto	l3050
u2760:
	goto	l3054
	
l1617:	
	goto	l3054
	line	21
	
l1618:	
	line	22
	
l3054:	
	movf	(___almod@divisor+3),w
	subwf	(___almod@dividend+3),w
	skipz
	goto	u2775
	movf	(___almod@divisor+2),w
	subwf	(___almod@dividend+2),w
	skipz
	goto	u2775
	movf	(___almod@divisor+1),w
	subwf	(___almod@dividend+1),w
	skipz
	goto	u2775
	movf	(___almod@divisor),w
	subwf	(___almod@dividend),w
u2775:
	skipc
	goto	u2771
	goto	u2770
u2771:
	goto	l3058
u2770:
	line	23
	
l3056:	
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
	goto	l3058
	
l1619:	
	line	24
	
l3058:	
	movlw	01h
u2785:
	clrc
	rrf	(___almod@divisor+3),f
	rrf	(___almod@divisor+2),f
	rrf	(___almod@divisor+1),f
	rrf	(___almod@divisor),f
	addlw	-1
	skipz
	goto	u2785

	line	25
	
l3060:	
	movlw	low(01h)
	subwf	(___almod@counter),f
	btfss	status,2
	goto	u2791
	goto	u2790
u2791:
	goto	l3054
u2790:
	goto	l3062
	
l1620:	
	goto	l3062
	line	26
	
l1614:	
	line	27
	
l3062:	
	movf	(___almod@sign),w
	skipz
	goto	u2800
	goto	l3066
u2800:
	line	28
	
l3064:	
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
	goto	l3066
	
l1621:	
	line	29
	
l3066:	
	movf	(___almod@dividend+3),w
	movwf	(?___almod+3)
	movf	(___almod@dividend+2),w
	movwf	(?___almod+2)
	movf	(___almod@dividend+1),w
	movwf	(?___almod+1)
	movf	(___almod@dividend),w
	movwf	(?___almod)

	goto	l1622
	
l3068:	
	line	30
	
l1622:	
	return
	opt stack 0
GLOBAL	__end_of___almod
	__end_of___almod:
;; =============== function ___almod ends ============

	signat	___almod,8316
	global	_delay
psect	text379,local,class=CODE,delta=2
global __ptext379
__ptext379:

;; *************** function _delay *****************
;; Defined at:
;;		line 95 in file "D:\EE\Mplabcode\Task_re\Receiver.c"
;; Parameters:    Size  Location     Type
;;  t               2    5[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  i               2    1[BANK0 ] int 
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
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         2       3       0       0       0
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
psect	text379
	file	"D:\EE\Mplabcode\Task_re\Receiver.c"
	line	95
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 3
; Regs used in _delay: [wreg+status,2]
	line	96
	
l3032:	
;Receiver.c: 96: for (int i=0;i<t;++i) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l728
	
l729:	
	
l3034:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l728:	
	movf	(delay@i+1),w
	xorlw	80h
	movwf	(??_delay+0)+0
	movf	(delay@t+1),w
	xorlw	80h
	subwf	(??_delay+0)+0,w
	skipz
	goto	u2715
	movf	(delay@t),w
	subwf	(delay@i),w
u2715:

	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l3034
u2710:
	goto	l731
	
l730:	
	line	97
	
l731:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_ccp1
psect	text380,local,class=CODE,delta=2
global __ptext380
__ptext380:

;; *************** function _ccp1 *****************
;; Defined at:
;;		line 26 in file "D:\EE\Mplabcode\Task_re\Receiver.c"
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
psect	text380
	file	"D:\EE\Mplabcode\Task_re\Receiver.c"
	line	26
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
psect	text380
	line	27
	
i1l2822:	
;Receiver.c: 27: if(CCP1IF){
	btfss	(98/8),(98)&7
	goto	u237_21
	goto	u237_20
u237_21:
	goto	i1l714
u237_20:
	line	28
	
i1l2824:	
;Receiver.c: 28: if(CCP1M0){
	btfss	(184/8),(184)&7
	goto	u238_21
	goto	u238_20
u238_21:
	goto	i1l2848
u238_20:
	line	29
	
i1l2826:	
;Receiver.c: 29: CCP1CON=0x04;
	movlw	(04h)
	movwf	(23)	;volatile
	line	30
	
i1l2828:	
;Receiver.c: 30: CCP1IF=0;
	bcf	(98/8),(98)&7
	line	31
	
i1l2830:	
;Receiver.c: 31: if(CCPR1H<=0){
	movf	(22),f
	skipz	;volatile
	goto	u239_21
	goto	u239_20
u239_21:
	goto	i1l2834
u239_20:
	line	32
	
i1l2832:	
;Receiver.c: 32: data<<=1;
	movlw	01h
	movwf	(??_ccp1+0)+0
u240_25:
	clrc
	rlf	(_data),f
	rlf	(_data+1),f
	rlf	(_data+2),f
	rlf	(_data+3),f
	decfsz	(??_ccp1+0)+0
	goto	u240_25
	line	33
;Receiver.c: 33: }
	goto	i1l714
	line	34
	
i1l709:	
	
i1l2834:	
;Receiver.c: 34: else if(CCPR1H<=1){
	movlw	(02h)
	subwf	(22),w	;volatile
	skipnc
	goto	u241_21
	goto	u241_20
u241_21:
	goto	i1l2840
u241_20:
	line	35
	
i1l2836:	
;Receiver.c: 35: data<<=1;
	movlw	01h
	movwf	(??_ccp1+0)+0
u242_25:
	clrc
	rlf	(_data),f
	rlf	(_data+1),f
	rlf	(_data+2),f
	rlf	(_data+3),f
	decfsz	(??_ccp1+0)+0
	goto	u242_25
	line	36
	
i1l2838:	
;Receiver.c: 36: ++data;
	movlw	01h
	addwf	(_data),f
	movlw	0
	skipnc
movlw 1
	addwf	(_data+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(_data+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(_data+3),f
	line	37
;Receiver.c: 37: }
	goto	i1l714
	line	38
	
i1l711:	
	
i1l2840:	
;Receiver.c: 38: else if(CCPR1H<=3){
	movlw	(04h)
	subwf	(22),w	;volatile
	skipnc
	goto	u243_21
	goto	u243_20
u243_21:
	goto	i1l714
u243_20:
	line	39
	
i1l2842:	
;Receiver.c: 39: showdata=data;
	movf	(_data+3),w
	movwf	(_showdata+3)
	movf	(_data+2),w
	movwf	(_showdata+2)
	movf	(_data+1),w
	movwf	(_showdata+1)
	movf	(_data),w
	movwf	(_showdata)

	line	40
	
i1l2844:	
;Receiver.c: 40: showflag=1;
	bsf	(_showflag/8),(_showflag)&7
	line	41
;Receiver.c: 41: data=0;
	movlw	0
	movwf	(_data+3)
	movlw	0
	movwf	(_data+2)
	movlw	0
	movwf	(_data+1)
	movlw	0
	movwf	(_data)

	goto	i1l714
	line	42
	
i1l2846:	
;Receiver.c: 42: return;
	goto	i1l714
	line	43
	
i1l713:	
	goto	i1l714
	line	44
	
i1l712:	
	goto	i1l714
	
i1l710:	
;Receiver.c: 43: }
;Receiver.c: 44: }
	goto	i1l714
	line	45
	
i1l708:	
	line	46
	
i1l2848:	
;Receiver.c: 45: else{
;Receiver.c: 46: CCP1CON=0x05;
	movlw	(05h)
	movwf	(23)	;volatile
	line	47
	
i1l2850:	
;Receiver.c: 47: CCP1IF=0;
	bcf	(98/8),(98)&7
	line	48
	
i1l2852:	
;Receiver.c: 48: TMR1L=0;
	clrf	(14)	;volatile
	line	49
	
i1l2854:	
;Receiver.c: 49: TMR1H=0;
	clrf	(15)	;volatile
	goto	i1l714
	line	50
	
i1l715:	
	goto	i1l714
	line	51
	
i1l707:	
	line	52
	
i1l714:	
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
psect	text381,local,class=CODE,delta=2
global __ptext381
__ptext381:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
