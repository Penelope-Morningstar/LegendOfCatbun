;function GetVRAMAddressAtXY
GetVRAMAddressAtXY:
	push {r1-r2,lr}
	mul r2, r2, #240*2
	mul r1, r1, #2
	add r0, r1, r2
	add r0, r0, #0x06000000 ;This is the base address of VRAM
	pop {r1-r2, lr}
	bx lr
	
	
DrawBox:
	;Expect 4 inputs at r1,r2,r3,r4 => x1,x2,y1,y2
	push {r1-r7,lr}
	mov r6,r3
	mov r7,#0b1111111111111111 ;Color White
	OuterLoop:
		cmp r6,r4
		bge ExitOuterLoop
		mov r5, r1
		InnerLoop
			cmp r5,r2
			bge ExitInnerLoop
			push{r1-r6,lr}
			mov r5,r1
			mov r6,r2
			b GetVRAMAddressAtXY
			strh r7,[r0]
			pop{r1-r6,lr}
			add r5,r5,#1
		ExitInnerLoop:
			add r6,r6,#1
			b OuterLoop
	ExitOuterLoop:
		pop {r1-r6,lr}
		bx lr

LoadTo:
	;Expects 3 inputs destinationAddress, srcAddress, Length;
	push {r1-r5,lr}
	mov r5, #0
	DoLoop:
		cmp r3,r5
		be ExitLoop
		ldr r4, [r2,r5]
		str r4, [r1,r5]
		add r5, r5, #4
		b DoLoop
	ExitLoop:
	pop {r1-r5,lr}