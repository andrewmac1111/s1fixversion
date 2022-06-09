; ---------------------------------------------------------------------------
; Sprite mappings - swinging ball on a chain from GHZ boss
; ---------------------------------------------------------------------------
		dc.w byte_81B3-Map_obj19, byte_81D2-Map_obj19
		dc.w byte_81E7-Map_obj19, byte_81FC-Map_obj19
byte_81B3:	dc.b 6
		dc.b $F0, 4, 0,	$24, $F0
		dc.b $F8, 4, $10, $24, $F0
		dc.b $E8, $A, 0, 0, $E8
		dc.b $E8, $A, 8, 0, 0
		dc.b 0,	$A, $10, 0, $E8
		dc.b 0,	$A, $18, 0, 0
byte_81D2:	dc.b 4
		dc.b $E8, $A, 0, 9, $E8
		dc.b $E8, $A, 8, 9, 0
		dc.b 0,	$A, $10, 9, $E8
		dc.b 0,	$A, $18, 9, 0
byte_81E7:	dc.b 4
		dc.b $E8, $A, 0, $12, $E8
		dc.b $E8, $A, 0, $1B, 0
		dc.b 0,	$A, $18, $1B, $E8
		dc.b 0,	$A, $18, $12, 0
byte_81FC:	dc.b 4
		dc.b $E8, $A, 8, $1B, $E8
		dc.b $E8, $A, 8, $12, 0
		dc.b 0,	$A, $10, $12, $E8
		dc.b 0,	$A, $10, $1B, 0
		even