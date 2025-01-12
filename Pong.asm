;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Header

	.equ ramarea, 0x02000000
	.equ BallX,ramarea+32
	.equ BallY,ramarea+33
	.equ BallVX,ramarea+34
	.equ BallVY,ramarea+35
	.equ BallR,4

	.org  0x08000000     ; GBA ROM Address starts at 0x08000000       

	b	ProgramStart	;000h    4     ROM Entry Point  (32bit ARM branch opcode, eg. "B rom_start") 
	
;004h    156   Nintendo Logo    (compressed bitmap, required!)
	.byte 0xC8,0x60,0x4F,0xE2,0x01,0x70,0x8F,0xE2,0x17,0xFF,0x2F,0xE1,0x12,0x4F,0x11,0x48     ; C
	.byte 0x12,0x4C,0x20,0x60,0x64,0x60,0x7C,0x62,0x30,0x1C,0x39,0x1C,0x10,0x4A,0x00,0xF0     ; D
    .byte 0x14,0xF8,0x30,0x6A,0x80,0x19,0xB1,0x6A,0xF2,0x6A,0x00,0xF0,0x0B,0xF8,0x30,0x6B     ; E
    .byte 0x80,0x19,0xB1,0x6B,0xF2,0x6B,0x00,0xF0,0x08,0xF8,0x70,0x6A,0x77,0x6B,0x07,0x4C     ; F
    .byte 0x60,0x60,0x38,0x47,0x07,0x4B,0xD2,0x18,0x9A,0x43,0x07,0x4B,0x92,0x08,0xD2,0x18     ; 10
    .byte 0x0C,0xDF,0xF7,0x46,0x04,0xF0,0x1F,0xE5,0x00,0xFE,0x7F,0x02,0xF0,0xFF,0x7F,0x02     ; 11
    .byte 0xF0,0x01,0x00,0x00,0xFF,0x01,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x00     ; 12
    .byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00     ; 13
    .byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00     ; 14
	.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x1A,0x9E,0x7B,0xEB     ; 15
	
    ;		123456789012
    .ascii "LEARNASM.NET";0A0h    12    Game Title       (uppercase ascii, max 12 characters)	
    .ascii "0000"	;0ACh    4     Game Code        (uppercase ascii, 4 characters)
    .ascii "00"		;0B0h    2     Maker Code       (uppercase ascii, 2 characters)
	.byte 0x96		;0B2h    1     Fixed value      (must be 96h, required!)
	.byte 0			;0B3h    1     Main unit code   (00h for current GBA models)
	.byte 0			;0B4h    1     Device type      (usually 00h) (bit7=DACS/debug related)
	.space 7		;0B5h    7     Reserved Area    (should be zero filled)
	.byte 0			;0BCh    1     Software version (usually 00h)
	.byte 0			;0BDh    1     Complement check (header checksum, required!)
	.word 0			;0BEh    2     Reserved Area    (should be zero filled)
	.long 0			;0C0h    4     RAM Entry Point  (32bit ARM branch opcode, eg. "B ram_start")
	.byte 0			;0C4h    1     Boot mode        (init as 00h - BIOS overwrites this value!)
	.byte 0			;0C5h    1     Slave ID Number  (init as 00h - BIOS overwrites this value!)
	.space 26		;0C6h    26    Not used         (seems to be unused)
	.long 0			;0E0h    4     JOYBUS Entry Pt. (32bit ARM branch opcode, eg. "B joy_start")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; Program Start
ProgramStart:

InfLoop:
	b InfLoop
	
	
	
	
;Display Ball centered at a specific X,Y coordinate
DrawBall:
	ldrB r3,[#BallX]
	ldrB r4,[#BallY]
	mov r5,#0x06000000
	;first check to see if there is any overflow in the x,y directions
	CMP r3,#BallR
	movlt r6,#0
	subge r6,#BallR,r3
	CMP r3,#240-BallR
	movgt r7,#240
	addle r7,#240-BallR,r3
	CMP r4,#BallR
	movlt r8,#0
	subge r8,#BallR,r4
	CMP r4,#192-BallR
	movgt r9,#192
	addle r9,#192-BallR,r4
	;r6=x1,r7=x2,r8=y1,r9=y2
	;scan over each point between these corners and set the value
	
	
	
	
	
	
	