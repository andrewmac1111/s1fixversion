SegaScreen:
		move.b	#$E4,d0
		bsr.w	PlaySound_Special ; stop music
		bsr.w	ClearPLC
		bsr.w	Pal_FadeFrom
		lea	($C00004).l,a6
		move.w	#$8004,(a6)
		move.w	#$8230,(a6)
		move.w	#$8407,(a6)
		move.w	#$8700,(a6)
		move.w	#$8B00,(a6)
		move.w	($FFFFF60C).w,d0
		andi.b	#$BF,d0
		move.w	d0,($C00004).l

SegaScreenJP:
		bsr.w	ClearScreen
		move.l	#$40000000,($C00004).l
		lea	(ArtSega).l,a0
		bsr.w	NemDec
		lea	($FF0000).l,a1
		lea	(MapSega).l,a0
		move.w	#0,d0
		bsr.w	EniDec
		tst.b	($FFFFFFF8).w	; check	if the machine is US or	Japanese
		bpl.s   @cont
		; Display TM
		move.w   #$30,($FF0000+$14).l
		move.w   #$31,($FF0000+$16).l
@cont:
		lea	($FF0000).l,a1
		move.l	#$461C0003,d0
		moveq	#$B,d1
		moveq	#3,d2
		bsr.w	ShowVDPGraphics
		moveq	#0,d0
		bsr.w	PalLoad2
		move.w	#$28,($FFFFF632).w
		move.w	#0,($FFFFF662).w
		move.w	#0,($FFFFF660).w
		move.w	#$B4,($FFFFF614).w
		move.w	($FFFFF60C).w,d0
		ori.b	#$40,d0
		move.w	d0,($C00004).l

Sega_WaitEnd:
		move.b	#2,($FFFFF62A).w
		bsr.w	DelayProgram
		bsr.w	sub_1A3A
		tst.w	($FFFFF614).w
		beq.s	Sega_GotoTitle
		andi.b	#$80,($FFFFF605).w ; is	Start button pressed?
		beq.s	Sega_WaitEnd	; if not, branch

Sega_GotoTitle:
		move.b	#4,($FFFFF600).w ; go to title screen
		rts	

sub_1A3A:
		subq.w	#1,($FFFFF634).w
		bpl.s	locret_1A68
		move.w	#3,($FFFFF634).w
		move.w	($FFFFF632).w,d0
		bmi.s	locret_1A68
		subq.w	#2,($FFFFF632).w
		lea	(word_1A6A).l,a0
		lea	($FFFFFB04).w,a1
		adda.w	d0,a0
		move.l	(a0)+,(a1)+
		move.l	(a0)+,(a1)+
		move.l	(a0)+,(a1)+
		move.l	(a0)+,(a1)+
		move.l	(a0)+,(a1)+
		move.w	(a0)+,(a1)+

locret_1A68:
		rts
; ---------------------------------------------------------------------------
word_1A6A:	incbin "beta/segabetaani.bin"
		even
ArtSega:	incbin "beta/segabeta.bin"
		even
MapSega:	incbin "beta/segabetamap.bin"
		even