extern printf
global main

section .data
	msg db "O valor de A eh: %d", 0AH, 0H
	varA dd 0
	varB dd 30
	varC dd 50
	
section .text
main:
	mov eax, [varB]
	add eax, [varC]
	add eax, 100
	mov [varA], eax
	push DWORD[varA]
	push msg
	call printf
	add esp, 8
	mov eax, 1
	xor ecx, ecx
	int 80h
		
