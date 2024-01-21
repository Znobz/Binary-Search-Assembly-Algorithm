.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

;Binary Search Alg
.data
	array BYTE 01h, 09h, 0Ah, 0Fh, 12h, 15h, 1Ah, 20h ; Array
	key BYTE 13h
	h BYTE ?
	l BYTE 0
	mid BYTE ?
	index BYTE ?
.code
main PROC
	mov h, LENGTHOF array - 1
	top:
		mov al, h
		cmp al, l
		jl L1
		add al, l
		shr al, 1
		mov mid, al
		movsx edi, mid
		mov al, array[edi]
		cmp al, key
		jg L2
		jl L3
		jmp L4
	L4:
		mov al, mid
		mov index, al
		jmp endloop
	L3:
		mov al, mid
		inc al
		mov l, al
		jmp top
	L2:
		mov al, mid
		dec al
		mov h, al
		jmp top
	L1:
		mov index, 0FFh
		jmp endloop
	endloop:
		movsx eax, index

main ENDP
END main