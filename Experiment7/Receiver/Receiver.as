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
# 3 "D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
	dw 0xff29 ;#
	FNCALL	_main,_init
	FNCALL	_main,_enable
	FNCALL	_main,_show
	FNCALL	_show,_enable
	FNCALL	_show,___lmul
	FNCALL	_show,_show_a
	FNCALL	_show_a,_tostring
	FNCALL	_show_a,_enable
	FNCALL	_init,_delay
	FNCALL	_init,_enable
	FNCALL	_tostring,___almod
	FNCALL	_tostring,___aldiv
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
	file	"D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
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
	global	_data
	global	_a
	global	_b
	global	_cnt
	global	_nowcdata
	global	_redata
	global	_x
	global	_y
	global	_cdata
	global	_z
	global	_cflag
	global	_cleanflag
	global	_flag
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
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_CREN
_CREN	set	196
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
	global	_RBIE
_RBIE	set	91
	global	_RBIF
_RBIF	set	88
	global	_RCIF
_RCIF	set	101
	global	_RX9
_RX9	set	198
	global	_RX9D
_RX9D	set	192
	global	_SPEN
_SPEN	set	199
	global	_ADCON1
_ADCON1	set	159
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
	file	"Receiver.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_cflag:
       ds      1

_cleanflag:
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
_data:
       ds      4

_a:
       ds      1

_b:
       ds      1

_cnt:
       ds      1

_nowcdata:
       ds      1

_redata:
       ds      1

_x:
       ds      1

_y:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
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
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
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
	global	?_show
?_show:	; 0 bytes @ 0x0
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
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	?___almod
?___almod:	; 4 bytes @ 0x0
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x0
	global	delay@t
delay@t:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
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
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
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
	global	??___lmul
??___lmul:	; 0 bytes @ 0x8
	global	??___almod
??___almod:	; 0 bytes @ 0x8
	global	??___aldiv
??___aldiv:	; 0 bytes @ 0x8
	ds	1
	global	___almod@counter
___almod@counter:	; 1 bytes @ 0x9
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x9
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x9
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
;;Data sizes: Strings 0, constant 0, data 20, bss 13, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80     28      59
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___aldiv	long  size(1) Largest target is 0
;;
;; ?___almod	long  size(1) Largest target is 0
;;


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
;;   _show->_show_a
;;   _show_a->_tostring
;;   _init->_enable
;;   _tostring->___aldiv
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
;; (0) _main                                                 0     0      0    1231
;;                               _init
;;                             _enable
;;                               _show
;; ---------------------------------------------------------------------------------
;; (1) _show                                                 0     0      0    1049
;;                             _enable
;;                             ___lmul
;;                             _show_a
;; ---------------------------------------------------------------------------------
;; (2) _show_a                                               6     2      4     889
;;                                             22 BANK0      6     2      4
;;                           _tostring
;;                             _enable
;;                             ___lmul (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 1     1      0     114
;;                                              7 BANK0      1     1      0
;;                              _delay
;;                             _enable
;; ---------------------------------------------------------------------------------
;; (3) _tostring                                             7     3      4     709
;;                                             15 BANK0      7     3      4
;;                            ___almod
;;                            ___aldiv
;; ---------------------------------------------------------------------------------
;; (3) _enable                                               2     0      2      68
;;                                              5 BANK0      2     0      2
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4) ___aldiv                                             15     7      8     300
;;                                              0 BANK0     15     7      8
;; ---------------------------------------------------------------------------------
;; (4) ___almod                                             11     3      8     296
;;                                              0 BANK0     11     3      8
;; ---------------------------------------------------------------------------------
;; (2) ___lmul                                              13     5      8      92
;;                                              0 BANK0     13     5      8
;; ---------------------------------------------------------------------------------
;; (4) _delay                                                5     3      2      46
;;                                              0 BANK0      5     3      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _tmr2                                                 6     6      0     150
;;                                              5 COMMON     6     6      0
;;                            i1_delay
;; ---------------------------------------------------------------------------------
;; (6) i1_delay                                              5     3      2     150
;;                                              0 COMMON     5     3      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;     _delay
;;     _enable
;;       _delay
;;   _enable
;;     _delay
;;   _show
;;     _enable
;;       _delay
;;     ___lmul
;;     _show_a
;;       _tostring
;;         ___almod
;;         ___aldiv
;;       _enable
;;         _delay
;;       ___lmul (ARG)
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
;;DATA                 0      0      51      12        0.0%
;;ABS                  0      0      49       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       8       2        0.0%
;;BANK0               50     1C      3B       5       73.8%
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
;;		line 76 in file "D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  743[COMMON] int 
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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_init
;;		_enable
;;		_show
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
	line	76
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	77
	
l3262:	
;Receiver.c: 77: init ();
	fcall	_init
	line	79
	
l3264:	
;Receiver.c: 79: flag=1;
	bsf	(_flag/8),(_flag)&7
	line	80
	
l3266:	
;Receiver.c: 80: cflag=1;
	bsf	(_cflag/8),(_cflag)&7
	goto	l3268
	line	81
;Receiver.c: 81: while(1){
	
l744:	
	line	82
	
l3268:	
;Receiver.c: 82: if(flag){
	btfss	(_flag/8),(_flag)&7
	goto	u2911
	goto	u2910
u2911:
	goto	l3268
u2910:
	line	83
	
l3270:	
;Receiver.c: 83: if(cleanflag==1){
	btfss	(_cleanflag/8),(_cleanflag)&7
	goto	u2921
	goto	u2920
u2921:
	goto	l3278
u2920:
	line	84
	
l3272:	
;Receiver.c: 84: cleanflag=0;
	bcf	(_cleanflag/8),(_cleanflag)&7
	line	85
	
l3274:	
;Receiver.c: 85: PORTD=1;enable(INS);
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3276:	
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	goto	l3278
	line	86
	
l746:	
	line	87
	
l3278:	
;Receiver.c: 86: }
;Receiver.c: 87: show();
	fcall	_show
	line	88
	
l3280:	
;Receiver.c: 88: flag=0;
	bcf	(_flag/8),(_flag)&7
	goto	l3268
	line	89
	
l745:	
	goto	l3268
	line	90
	
l747:	
	line	81
	goto	l3268
	
l748:	
	line	91
	
l749:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_show
psect	text327,local,class=CODE,delta=2
global __ptext327
__ptext327:

;; *************** function _show *****************
;; Defined at:
;;		line 168 in file "D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_enable
;;		___lmul
;;		_show_a
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text327
	file	"D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
	line	168
	global	__size_of_show
	__size_of_show	equ	__end_of_show-_show
	
_show:	
	opt	stack 2
; Regs used in _show: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	169
	
l3236:	
;Receiver.c: 169: PORTD=0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	170
	
l3238:	
;Receiver.c: 170: enable (INS);
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	176
	
l3240:	
;Receiver.c: 176: show_a(data.i*49);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_data+3),w
	movwf	(?___lmul+3)
	movf	(_data+2),w
	movwf	(?___lmul+2)
	movf	(_data+1),w
	movwf	(?___lmul+1)
	movf	(_data),w
	movwf	(?___lmul)

	movlw	0
	movwf	3+(?___lmul)+04h
	movlw	0
	movwf	2+(?___lmul)+04h
	movlw	0
	movwf	1+(?___lmul)+04h
	movlw	031h
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(3+(?___lmul)),w
	movwf	(?_show_a+3)
	movf	(2+(?___lmul)),w
	movwf	(?_show_a+2)
	movf	(1+(?___lmul)),w
	movwf	(?_show_a+1)
	movf	(0+(?___lmul)),w
	movwf	(?_show_a)

	fcall	_show_a
	line	177
	
l3242:	
;Receiver.c: 177: PORTD='V';
	movlw	(056h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	178
	
l3244:	
;Receiver.c: 178: enable(DATA);
	movlw	low(01h)
	movwf	(?_enable)
	movlw	high(01h)
	movwf	((?_enable))+1
	fcall	_enable
	line	179
	
l3246:	
;Receiver.c: 179: PORTD=' ';enable(DATA);
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3248:	
	movlw	low(01h)
	movwf	(?_enable)
	movlw	high(01h)
	movwf	((?_enable))+1
	fcall	_enable
	line	180
	
l3250:	
;Receiver.c: 180: PORTD=cdata+'0';enable(DATA);
	movf	(_cdata),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3252:	
	movlw	low(01h)
	movwf	(?_enable)
	movlw	high(01h)
	movwf	((?_enable))+1
	fcall	_enable
	line	181
	
l3254:	
;Receiver.c: 181: PORTD=' ';enable(DATA);
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3256:	
	movlw	low(01h)
	movwf	(?_enable)
	movlw	high(01h)
	movwf	((?_enable))+1
	fcall	_enable
	line	182
	
l3258:	
;Receiver.c: 182: PORTD=redata+'0';enable(DATA);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_redata),w
	addlw	030h
	movwf	(8)	;volatile
	
l3260:	
	movlw	low(01h)
	movwf	(?_enable)
	movlw	high(01h)
	movwf	((?_enable))+1
	fcall	_enable
	line	184
	
l775:	
	return
	opt stack 0
GLOBAL	__end_of_show
	__end_of_show:
;; =============== function _show ends ============

	signat	_show,88
	global	_show_a
psect	text328,local,class=CODE,delta=2
global __ptext328
__ptext328:

;; *************** function _show_a *****************
;; Defined at:
;;		line 156 in file "D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_tostring
;;		_enable
;; This function is called by:
;;		_show
;; This function uses a non-reentrant model
;;
psect	text328
	file	"D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
	line	156
	global	__size_of_show_a
	__size_of_show_a	equ	__end_of_show_a-_show_a
	
_show_a:	
	opt	stack 2
; Regs used in _show_a: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	157
	
l3214:	
;Receiver.c: 157: tostring(x);
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
	line	158
	
l3216:	
;Receiver.c: 158: for(int i=0;i<=6;++i){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(show_a@i)
	clrf	(show_a@i+1)
	
l3218:	
	movf	(show_a@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2885
	movlw	low(07h)
	subwf	(show_a@i),w
u2885:

	skipc
	goto	u2881
	goto	u2880
u2881:
	goto	l3222
u2880:
	goto	l772
	
l3220:	
	goto	l772
	
l769:	
	line	159
	
l3222:	
;Receiver.c: 159: if(i==3){
	movlw	03h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(show_a@i),w
	iorwf	(show_a@i+1),w
	skipz
	goto	u2891
	goto	u2890
u2891:
	goto	l3228
u2890:
	line	160
	
l3224:	
;Receiver.c: 160: PORTD='.';
	movlw	(02Eh)
	movwf	(8)	;volatile
	line	161
	
l3226:	
;Receiver.c: 161: enable(DATA);
	movlw	low(01h)
	movwf	(?_enable)
	movlw	high(01h)
	movwf	((?_enable))+1
	fcall	_enable
	goto	l3228
	line	162
	
l771:	
	line	163
	
l3228:	
;Receiver.c: 162: }
;Receiver.c: 163: PORTD=s[i];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(show_a@i),w
	addlw	_s&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	line	164
	
l3230:	
;Receiver.c: 164: enable(DATA);
	movlw	low(01h)
	movwf	(?_enable)
	movlw	high(01h)
	movwf	((?_enable))+1
	fcall	_enable
	line	158
	
l3232:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(show_a@i),f
	skipnc
	incf	(show_a@i+1),f
	movlw	high(01h)
	addwf	(show_a@i+1),f
	
l3234:	
	movf	(show_a@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2905
	movlw	low(07h)
	subwf	(show_a@i),w
u2905:

	skipc
	goto	u2901
	goto	u2900
u2901:
	goto	l3222
u2900:
	goto	l772
	
l770:	
	line	166
	
l772:	
	return
	opt stack 0
GLOBAL	__end_of_show_a
	__end_of_show_a:
;; =============== function _show_a ends ============

	signat	_show_a,4216
	global	_init
psect	text329,local,class=CODE,delta=2
global __ptext329
__ptext329:

;; *************** function _init *****************
;; Defined at:
;;		line 94 in file "D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
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
psect	text329
	file	"D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
	line	94
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 3
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	104
	
l3156:	
;Receiver.c: 104: TRISB=0XF0;
	movlw	(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	105
	
l3158:	
;Receiver.c: 105: TRISA=0;
	clrf	(133)^080h	;volatile
	line	106
	
l3160:	
;Receiver.c: 106: TRISD=0;
	clrf	(136)^080h	;volatile
	line	107
;Receiver.c: 107: ADCON1=7;
	movlw	(07h)
	movwf	(159)^080h	;volatile
	line	108
;Receiver.c: 108: TRISC=0xC0;
	movlw	(0C0h)
	movwf	(135)^080h	;volatile
	line	109
	
l3162:	
;Receiver.c: 109: nRBPU=0;
	bcf	(1039/8)^080h,(1039)&7
	line	111
	
l3164:	
;Receiver.c: 111: PORTD=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	112
	
l3166:	
;Receiver.c: 112: PORTE=0;
	clrf	(9)	;volatile
	line	113
	
l3168:	
;Receiver.c: 113: PORTB=0;
	clrf	(6)	;volatile
	line	114
	
l3170:	
;Receiver.c: 114: PORTC=0;
	clrf	(7)	;volatile
	line	115
	
l3172:	
;Receiver.c: 115: PORTA=0;
	clrf	(5)	;volatile
	line	116
	
l3174:	
;Receiver.c: 116: RA3=1;
	bsf	(43/8),(43)&7
	line	118
	
l3176:	
;Receiver.c: 118: delay(1000);
	movlw	low(03E8h)
	movwf	(?_delay)
	movlw	high(03E8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	119
	
l3178:	
;Receiver.c: 119: PORTD=0x38;enable(INS);
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3180:	
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	120
	
l3182:	
;Receiver.c: 120: PORTD=0x0C;enable(INS);
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l3184:	
	movlw	low(0)
	movwf	(?_enable)
	movlw	high(0)
	movwf	((?_enable))+1
	fcall	_enable
	line	122
	
l3186:	
;Receiver.c: 122: SPBRG=38;
	movlw	(026h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	123
	
l3188:	
;Receiver.c: 123: TXSTA=0;SYNC=0;
	clrf	(152)^080h	;volatile
	
l3190:	
	bcf	(1220/8)^080h,(1220)&7
	line	124
	
l3192:	
;Receiver.c: 124: RCSTA=0;RX9=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(24)	;volatile
	
l3194:	
	bsf	(198/8),(198)&7
	line	125
	
l3196:	
;Receiver.c: 125: SPEN=1;
	bsf	(199/8),(199)&7
	line	126
	
l3198:	
;Receiver.c: 126: TXEN=1;CREN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1221/8)^080h,(1221)&7
	
l3200:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(196/8),(196)&7
	line	128
	
l3202:	
;Receiver.c: 128: GIE=1;RBIE=1;
	bsf	(95/8),(95)&7
	
l3204:	
	bsf	(91/8),(91)&7
	line	129
	
l3206:	
;Receiver.c: 129: y=PORTB;RBIF=0;
	movf	(6),w	;volatile
	movwf	(??_init+0)+0
	movf	(??_init+0)+0,w
	movwf	(_y)
	
l3208:	
	bcf	(88/8),(88)&7
	line	131
	
l3210:	
;Receiver.c: 131: PEIE=1;
	bsf	(94/8),(94)&7
	line	132
	
l3212:	
;Receiver.c: 132: RCIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	135
	
l752:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_tostring
psect	text330,local,class=CODE,delta=2
global __ptext330
__ptext330:

;; *************** function _tostring *****************
;; Defined at:
;;		line 150 in file "D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___almod
;;		___aldiv
;; This function is called by:
;;		_show_a
;; This function uses a non-reentrant model
;;
psect	text330
	file	"D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
	line	150
	global	__size_of_tostring
	__size_of_tostring	equ	__end_of_tostring-_tostring
	
_tostring:	
	opt	stack 2
; Regs used in _tostring: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	151
	
l3142:	
;Receiver.c: 151: for(int i=6;i>=0;--i){
	movlw	low(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(tostring@i)
	movlw	high(06h)
	movwf	((tostring@i))+1
	
l3144:	
	btfss	(tostring@i+1),7
	goto	u2861
	goto	u2860
u2861:
	goto	l3148
u2860:
	goto	l766
	
l3146:	
	goto	l766
	
l764:	
	line	152
	
l3148:	
;Receiver.c: 152: s[i]=x%10+'0';
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
	line	153
	
l3150:	
;Receiver.c: 153: x/=10;
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

	line	151
	
l3152:	
	movlw	low(-1)
	addwf	(tostring@i),f
	skipnc
	incf	(tostring@i+1),f
	movlw	high(-1)
	addwf	(tostring@i+1),f
	
l3154:	
	btfss	(tostring@i+1),7
	goto	u2871
	goto	u2870
u2871:
	goto	l3148
u2870:
	goto	l766
	
l765:	
	line	155
	
l766:	
	return
	opt stack 0
GLOBAL	__end_of_tostring
	__end_of_tostring:
;; =============== function _tostring ends ============

	signat	_tostring,4216
	global	_enable
psect	text331,local,class=CODE,delta=2
global __ptext331
__ptext331:

;; *************** function _enable *****************
;; Defined at:
;;		line 142 in file "D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
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
;;		_main
;;		_init
;;		_show_a
;;		_show
;; This function uses a non-reentrant model
;;
psect	text331
	file	"D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
	line	142
	global	__size_of_enable
	__size_of_enable	equ	__end_of_enable-_enable
	
_enable:	
	opt	stack 2
; Regs used in _enable: [wreg+status,2+status,0+pclath+cstack]
	line	143
	
l3136:	
;Receiver.c: 143: RA5=t;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(enable@t),0
	goto	u2841
	goto	u2840
	
u2841:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	goto	u2854
u2840:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
u2854:
	line	144
;Receiver.c: 144: RA4=0;
	bcf	(44/8),(44)&7
	line	145
;Receiver.c: 145: RA3=0;
	bcf	(43/8),(43)&7
	line	146
	
l3138:	
;Receiver.c: 146: delay(30);
	movlw	low(01Eh)
	movwf	(?_delay)
	movlw	high(01Eh)
	movwf	((?_delay))+1
	fcall	_delay
	line	147
	
l3140:	
;Receiver.c: 147: RA3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	line	148
	
l761:	
	return
	opt stack 0
GLOBAL	__end_of_enable
	__end_of_enable:
;; =============== function _enable ends ============

	signat	_enable,4216
	global	___aldiv
psect	text332,local,class=CODE,delta=2
global __ptext332
__ptext332:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tostring
;; This function uses a non-reentrant model
;;
psect	text332
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\aldiv.c"
	line	5
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:	
	opt	stack 2
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	9
	
l3090:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___aldiv@sign)
	line	10
	btfss	(___aldiv@divisor+3),7
	goto	u2731
	goto	u2730
u2731:
	goto	l3096
u2730:
	line	11
	
l3092:	
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
	
l3094:	
	clrf	(___aldiv@sign)
	bsf	status,0
	rlf	(___aldiv@sign),f
	goto	l3096
	line	13
	
l1653:	
	line	14
	
l3096:	
	btfss	(___aldiv@dividend+3),7
	goto	u2741
	goto	u2740
u2741:
	goto	l3102
u2740:
	line	15
	
l3098:	
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
	
l3100:	
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	xorwf	(___aldiv@sign),f
	goto	l3102
	line	17
	
l1654:	
	line	18
	
l3102:	
	movlw	0
	movwf	(___aldiv@quotient+3)
	movlw	0
	movwf	(___aldiv@quotient+2)
	movlw	0
	movwf	(___aldiv@quotient+1)
	movlw	0
	movwf	(___aldiv@quotient)

	line	19
	
l3104:	
	movf	(___aldiv@divisor+3),w
	iorwf	(___aldiv@divisor+2),w
	iorwf	(___aldiv@divisor+1),w
	iorwf	(___aldiv@divisor),w
	skipnz
	goto	u2751
	goto	u2750
u2751:
	goto	l3124
u2750:
	line	20
	
l3106:	
	clrf	(___aldiv@counter)
	bsf	status,0
	rlf	(___aldiv@counter),f
	line	21
	goto	l3110
	
l1657:	
	line	22
	
l3108:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2765:
	clrc
	rlf	(___aldiv@divisor),f
	rlf	(___aldiv@divisor+1),f
	rlf	(___aldiv@divisor+2),f
	rlf	(___aldiv@divisor+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2765
	line	23
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	addwf	(___aldiv@counter),f
	goto	l3110
	line	24
	
l1656:	
	line	21
	
l3110:	
	btfss	(___aldiv@divisor+3),(31)&7
	goto	u2771
	goto	u2770
u2771:
	goto	l3108
u2770:
	goto	l3112
	
l1658:	
	goto	l3112
	line	25
	
l1659:	
	line	26
	
l3112:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2785:
	clrc
	rlf	(___aldiv@quotient),f
	rlf	(___aldiv@quotient+1),f
	rlf	(___aldiv@quotient+2),f
	rlf	(___aldiv@quotient+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2785
	line	27
	
l3114:	
	movf	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),w
	skipz
	goto	u2795
	movf	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),w
	skipz
	goto	u2795
	movf	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),w
	skipz
	goto	u2795
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),w
u2795:
	skipc
	goto	u2791
	goto	u2790
u2791:
	goto	l3120
u2790:
	line	28
	
l3116:	
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
	
l3118:	
	bsf	(___aldiv@quotient)+(0/8),(0)&7
	goto	l3120
	line	30
	
l1660:	
	line	31
	
l3120:	
	movlw	01h
u2805:
	clrc
	rrf	(___aldiv@divisor+3),f
	rrf	(___aldiv@divisor+2),f
	rrf	(___aldiv@divisor+1),f
	rrf	(___aldiv@divisor),f
	addlw	-1
	skipz
	goto	u2805

	line	32
	
l3122:	
	movlw	low(01h)
	subwf	(___aldiv@counter),f
	btfss	status,2
	goto	u2811
	goto	u2810
u2811:
	goto	l3112
u2810:
	goto	l3124
	
l1661:	
	goto	l3124
	line	33
	
l1655:	
	line	34
	
l3124:	
	movf	(___aldiv@sign),w
	skipz
	goto	u2820
	goto	l3128
u2820:
	line	35
	
l3126:	
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
	goto	l3128
	
l1662:	
	line	36
	
l3128:	
	movf	(___aldiv@quotient+3),w
	movwf	(?___aldiv+3)
	movf	(___aldiv@quotient+2),w
	movwf	(?___aldiv+2)
	movf	(___aldiv@quotient+1),w
	movwf	(?___aldiv+1)
	movf	(___aldiv@quotient),w
	movwf	(?___aldiv)

	goto	l1663
	
l3130:	
	line	37
	
l1663:	
	return
	opt stack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
;; =============== function ___aldiv ends ============

	signat	___aldiv,8316
	global	___almod
psect	text333,local,class=CODE,delta=2
global __ptext333
__ptext333:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tostring
;; This function uses a non-reentrant model
;;
psect	text333
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\almod.c"
	line	5
	global	__size_of___almod
	__size_of___almod	equ	__end_of___almod-___almod
	
___almod:	
	opt	stack 2
; Regs used in ___almod: [wreg+status,2+status,0]
	line	8
	
l3056:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___almod@sign)
	line	9
	btfss	(___almod@dividend+3),7
	goto	u2641
	goto	u2640
u2641:
	goto	l3062
u2640:
	line	10
	
l3058:	
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
	
l3060:	
	clrf	(___almod@sign)
	bsf	status,0
	rlf	(___almod@sign),f
	goto	l3062
	line	12
	
l1640:	
	line	13
	
l3062:	
	btfss	(___almod@divisor+3),7
	goto	u2651
	goto	u2650
u2651:
	goto	l3066
u2650:
	line	14
	
l3064:	
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
	goto	l3066
	
l1641:	
	line	15
	
l3066:	
	movf	(___almod@divisor+3),w
	iorwf	(___almod@divisor+2),w
	iorwf	(___almod@divisor+1),w
	iorwf	(___almod@divisor),w
	skipnz
	goto	u2661
	goto	u2660
u2661:
	goto	l3082
u2660:
	line	16
	
l3068:	
	clrf	(___almod@counter)
	bsf	status,0
	rlf	(___almod@counter),f
	line	17
	goto	l3072
	
l1644:	
	line	18
	
l3070:	
	movlw	01h
	movwf	(??___almod+0)+0
u2675:
	clrc
	rlf	(___almod@divisor),f
	rlf	(___almod@divisor+1),f
	rlf	(___almod@divisor+2),f
	rlf	(___almod@divisor+3),f
	decfsz	(??___almod+0)+0
	goto	u2675
	line	19
	movlw	(01h)
	movwf	(??___almod+0)+0
	movf	(??___almod+0)+0,w
	addwf	(___almod@counter),f
	goto	l3072
	line	20
	
l1643:	
	line	17
	
l3072:	
	btfss	(___almod@divisor+3),(31)&7
	goto	u2681
	goto	u2680
u2681:
	goto	l3070
u2680:
	goto	l3074
	
l1645:	
	goto	l3074
	line	21
	
l1646:	
	line	22
	
l3074:	
	movf	(___almod@divisor+3),w
	subwf	(___almod@dividend+3),w
	skipz
	goto	u2695
	movf	(___almod@divisor+2),w
	subwf	(___almod@dividend+2),w
	skipz
	goto	u2695
	movf	(___almod@divisor+1),w
	subwf	(___almod@dividend+1),w
	skipz
	goto	u2695
	movf	(___almod@divisor),w
	subwf	(___almod@dividend),w
u2695:
	skipc
	goto	u2691
	goto	u2690
u2691:
	goto	l3078
u2690:
	line	23
	
l3076:	
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
	goto	l3078
	
l1647:	
	line	24
	
l3078:	
	movlw	01h
u2705:
	clrc
	rrf	(___almod@divisor+3),f
	rrf	(___almod@divisor+2),f
	rrf	(___almod@divisor+1),f
	rrf	(___almod@divisor),f
	addlw	-1
	skipz
	goto	u2705

	line	25
	
l3080:	
	movlw	low(01h)
	subwf	(___almod@counter),f
	btfss	status,2
	goto	u2711
	goto	u2710
u2711:
	goto	l3074
u2710:
	goto	l3082
	
l1648:	
	goto	l3082
	line	26
	
l1642:	
	line	27
	
l3082:	
	movf	(___almod@sign),w
	skipz
	goto	u2720
	goto	l3086
u2720:
	line	28
	
l3084:	
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
	goto	l3086
	
l1649:	
	line	29
	
l3086:	
	movf	(___almod@dividend+3),w
	movwf	(?___almod+3)
	movf	(___almod@dividend+2),w
	movwf	(?___almod+2)
	movf	(___almod@dividend+1),w
	movwf	(?___almod+1)
	movf	(___almod@dividend),w
	movwf	(?___almod)

	goto	l1650
	
l3088:	
	line	30
	
l1650:	
	return
	opt stack 0
GLOBAL	__end_of___almod
	__end_of___almod:
;; =============== function ___almod ends ============

	signat	___almod,8316
	global	___lmul
psect	text334,local,class=CODE,delta=2
global __ptext334
__ptext334:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[BANK0 ] unsigned long 
;;  multiplicand    4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    9[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_show
;; This function uses a non-reentrant model
;;
psect	text334
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 4
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l3042:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___lmul@product+3)
	movlw	0
	movwf	(___lmul@product+2)
	movlw	0
	movwf	(___lmul@product+1)
	movlw	0
	movwf	(___lmul@product)

	goto	l3044
	line	6
	
l1533:	
	line	7
	
l3044:	
	btfss	(___lmul@multiplier),(0)&7
	goto	u2591
	goto	u2590
u2591:
	goto	l3048
u2590:
	line	8
	
l3046:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2601
	addwf	(___lmul@product+1),f
u2601:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2602
	addwf	(___lmul@product+2),f
u2602:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2603
	addwf	(___lmul@product+3),f
u2603:

	goto	l3048
	
l1534:	
	line	9
	
l3048:	
	movlw	01h
	movwf	(??___lmul+0)+0
u2615:
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	decfsz	(??___lmul+0)+0
	goto	u2615
	line	10
	
l3050:	
	movlw	01h
u2625:
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	addlw	-1
	skipz
	goto	u2625

	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u2631
	goto	u2630
u2631:
	goto	l3044
u2630:
	goto	l3052
	
l1535:	
	line	12
	
l3052:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	goto	l1536
	
l3054:	
	line	13
	
l1536:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	_delay
psect	text335,local,class=CODE,delta=2
global __ptext335
__ptext335:

;; *************** function _delay *****************
;; Defined at:
;;		line 137 in file "D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
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
psect	text335
	file	"D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
	line	137
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 2
; Regs used in _delay: [wreg+status,2]
	line	138
	
l3038:	
;Receiver.c: 138: for (int i=0;i<t;++i) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l755
	
l756:	
	
l3040:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l755:	
	movf	(delay@i+1),w
	xorlw	80h
	movwf	(??_delay+0)+0
	movf	(delay@t+1),w
	xorlw	80h
	subwf	(??_delay+0)+0,w
	skipz
	goto	u2585
	movf	(delay@t),w
	subwf	(delay@i),w
u2585:

	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l3040
u2580:
	goto	l758
	
l757:	
	line	139
	
l758:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_tmr2
psect	text336,local,class=CODE,delta=2
global __ptext336
__ptext336:

;; *************** function _tmr2 *****************
;; Defined at:
;;		line 31 in file "D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
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
psect	text336
	file	"D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
	line	31
	global	__size_of_tmr2
	__size_of_tmr2	equ	__end_of_tmr2-_tmr2
	
_tmr2:	
	opt	stack 2
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
psect	text336
	line	32
	
i1l2968:	
;Receiver.c: 32: if(RCIF==1){
	btfss	(101/8),(101)&7
	goto	u246_21
	goto	u246_20
u246_21:
	goto	i1l721
u246_20:
	line	33
	
i1l2970:	
;Receiver.c: 33: if(RX9D==1){
	btfss	(192/8),(192)&7
	goto	u247_21
	goto	u247_20
u247_21:
	goto	i1l2976
u247_20:
	line	34
	
i1l2972:	
;Receiver.c: 34: data.c[1]=RCREG&0x0F;
	movf	(26),w
	andlw	0Fh
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	0+(_data)+01h
	line	35
	
i1l2974:	
;Receiver.c: 35: redata=(RCREG&0xF0)>>5;
	movf	(26),w
	movwf	(??_tmr2+0)+0
	movlw	05h
u248_25:
	clrc
	rrf	(??_tmr2+0)+0,f
	addlw	-1
	skipz
	goto	u248_25
	movf	0+(??_tmr2+0)+0,w
	andlw	07h
	movwf	(??_tmr2+1)+0
	movf	(??_tmr2+1)+0,w
	movwf	(_redata)
	line	36
;Receiver.c: 36: }
	goto	i1l2978
	line	37
	
i1l722:	
	line	38
	
i1l2976:	
;Receiver.c: 37: else
;Receiver.c: 38: data.c[0]=RCREG;
	movf	(26),w	;volatile
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_data)
	goto	i1l2978
	
i1l723:	
	line	40
	
i1l2978:	
;Receiver.c: 40: flag=1;
	bsf	(_flag/8),(_flag)&7
	line	41
	
i1l2980:	
;Receiver.c: 41: PORTD=0;
	clrf	(8)	;volatile
	line	42
;Receiver.c: 42: }
	goto	i1l741
	line	43
	
i1l721:	
;Receiver.c: 43: else if(RBIF==1){
	btfss	(88/8),(88)&7
	goto	u249_21
	goto	u249_20
u249_21:
	goto	i1l741
u249_20:
	line	45
	
i1l2982:	
;Receiver.c: 45: flag=1;
	bsf	(_flag/8),(_flag)&7
	line	46
	
i1l2984:	
;Receiver.c: 46: y=y^PORTB;
	movf	(_y),w
	xorwf	(6),w	;volatile
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_y)
	line	47
	
i1l2986:	
;Receiver.c: 47: TRISB=0X0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	48
	
i1l2988:	
;Receiver.c: 48: delay(10);
	movlw	low(0Ah)
	movwf	(?i1_delay)
	movlw	high(0Ah)
	movwf	((?i1_delay))+1
	fcall	i1_delay
	line	49
	
i1l2990:	
;Receiver.c: 49: x=PORTB&0X0F;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(6),w
	andlw	0Fh
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_x)
	line	50
	
i1l2992:	
;Receiver.c: 50: z=y|x;
	movf	(_y),w
	iorwf	(_x),w
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_z)
	line	51
	
i1l2994:	
;Receiver.c: 51: if(z==0x1E)
	movf	(_z),w
	xorlw	01Eh
	skipz
	goto	u250_21
	goto	u250_20
u250_21:
	goto	i1l2998
u250_20:
	line	52
	
i1l2996:	
;Receiver.c: 52: cdata=0;
	clrf	(_cdata)
	goto	i1l3026
	line	53
	
i1l726:	
	
i1l2998:	
;Receiver.c: 53: else if(z==0x2E)
	movf	(_z),w
	xorlw	02Eh
	skipz
	goto	u251_21
	goto	u251_20
u251_21:
	goto	i1l3002
u251_20:
	line	54
	
i1l3000:	
;Receiver.c: 54: cdata=1;
	clrf	(_cdata)
	bsf	status,0
	rlf	(_cdata),f
	goto	i1l3026
	line	55
	
i1l728:	
	
i1l3002:	
;Receiver.c: 55: else if(z==0x4E)
	movf	(_z),w
	xorlw	04Eh
	skipz
	goto	u252_21
	goto	u252_20
u252_21:
	goto	i1l3006
u252_20:
	line	56
	
i1l3004:	
;Receiver.c: 56: cdata=2;
	movlw	(02h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3026
	line	57
	
i1l730:	
	
i1l3006:	
;Receiver.c: 57: else if(z==0x8E)
	movf	(_z),w
	xorlw	08Eh
	skipz
	goto	u253_21
	goto	u253_20
u253_21:
	goto	i1l3010
u253_20:
	line	58
	
i1l3008:	
;Receiver.c: 58: cdata=3;
	movlw	(03h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3026
	line	59
	
i1l732:	
	
i1l3010:	
;Receiver.c: 59: else if(z==0x1D)
	movf	(_z),w
	xorlw	01Dh
	skipz
	goto	u254_21
	goto	u254_20
u254_21:
	goto	i1l3014
u254_20:
	line	60
	
i1l3012:	
;Receiver.c: 60: cdata=4;
	movlw	(04h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3026
	line	61
	
i1l734:	
	
i1l3014:	
;Receiver.c: 61: else if(z==0x2D)
	movf	(_z),w
	xorlw	02Dh
	skipz
	goto	u255_21
	goto	u255_20
u255_21:
	goto	i1l3018
u255_20:
	line	62
	
i1l3016:	
;Receiver.c: 62: cdata=5;
	movlw	(05h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3026
	line	63
	
i1l736:	
	
i1l3018:	
;Receiver.c: 63: else if(z==0x4D)
	movf	(_z),w
	xorlw	04Dh
	skipz
	goto	u256_21
	goto	u256_20
u256_21:
	goto	i1l3022
u256_20:
	line	64
	
i1l3020:	
;Receiver.c: 64: cdata=6;
	movlw	(06h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3026
	line	65
	
i1l738:	
	
i1l3022:	
;Receiver.c: 65: else if(z==0x8D)
	movf	(_z),w
	xorlw	08Dh
	skipz
	goto	u257_21
	goto	u257_20
u257_21:
	goto	i1l3026
u257_20:
	line	66
	
i1l3024:	
;Receiver.c: 66: cdata=7;
	movlw	(07h)
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_cdata)
	goto	i1l3026
	
i1l740:	
	goto	i1l3026
	line	67
	
i1l739:	
	goto	i1l3026
	
i1l737:	
	goto	i1l3026
	
i1l735:	
	goto	i1l3026
	
i1l733:	
	goto	i1l3026
	
i1l731:	
	goto	i1l3026
	
i1l729:	
	goto	i1l3026
	
i1l727:	
	
i1l3026:	
;Receiver.c: 67: delay(10);
	movlw	low(0Ah)
	movwf	(?i1_delay)
	movlw	high(0Ah)
	movwf	((?i1_delay))+1
	fcall	i1_delay
	line	68
	
i1l3028:	
;Receiver.c: 68: TRISB=0XF0;
	movlw	(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	69
	
i1l3030:	
;Receiver.c: 69: PORTB=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	70
	
i1l3032:	
;Receiver.c: 70: y=PORTB;
	movf	(6),w	;volatile
	movwf	(??_tmr2+0)+0
	movf	(??_tmr2+0)+0,w
	movwf	(_y)
	line	71
	
i1l3034:	
;Receiver.c: 71: RBIF=0;
	bcf	(88/8),(88)&7
	line	72
	
i1l3036:	
;Receiver.c: 72: TXREG=cdata;
	movf	(_cdata),w
	movwf	(25)	;volatile
	goto	i1l741
	line	73
	
i1l725:	
	goto	i1l741
	line	74
	
i1l724:	
	
i1l741:	
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
psect	text337,local,class=CODE,delta=2
global __ptext337
__ptext337:

;; *************** function i1_delay *****************
;; Defined at:
;;		line 137 in file "D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
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
psect	text337
	file	"D:\EE\Mplabcode\Experiment7\Receiver\Receiver.c"
	line	137
	global	__size_ofi1_delay
	__size_ofi1_delay	equ	__end_ofi1_delay-i1_delay
	
i1_delay:	
	opt	stack 2
; Regs used in i1_delay: [wreg+status,2]
	line	138
	
i1l3132:	
;Receiver.c: 138: for (int i=0;i<t;++i) ;
	clrf	(i1delay@i)
	clrf	(i1delay@i+1)
	goto	i1l755
	
i1l756:	
	
i1l3134:	
	movlw	low(01h)
	addwf	(i1delay@i),f
	skipnc
	incf	(i1delay@i+1),f
	movlw	high(01h)
	addwf	(i1delay@i+1),f
	
i1l755:	
	movf	(i1delay@i+1),w
	xorlw	80h
	movwf	(??i1_delay+0)+0
	movf	(i1delay@t+1),w
	xorlw	80h
	subwf	(??i1_delay+0)+0,w
	skipz
	goto	u283_25
	movf	(i1delay@t),w
	subwf	(i1delay@i),w
u283_25:

	skipc
	goto	u283_21
	goto	u283_20
u283_21:
	goto	i1l3134
u283_20:
	goto	i1l758
	
i1l757:	
	line	139
	
i1l758:	
	return
	opt stack 0
GLOBAL	__end_ofi1_delay
	__end_ofi1_delay:
;; =============== function i1_delay ends ============

	signat	i1_delay,88
psect	text338,local,class=CODE,delta=2
global __ptext338
__ptext338:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
