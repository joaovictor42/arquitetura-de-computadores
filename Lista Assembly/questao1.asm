extern printf
global main

section .data
	msg db "O valor de A eh: %d", 0AH, 0H

section .text
main:
	xor eax, eax
	mov ecx, 1
	repeticao:
		add eax, ecx
	inc ecx	
	cmp ecx, 100
	jle repeticao
	push eax
	push msg
	call printf
	add esp, 8
	mov eax, 1
	xor ecx, ecx
	int 80h
		
