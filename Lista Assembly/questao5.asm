extern scanf, printf
global main

section .data
	msg db "%d", 0AH, 0H
	
section .text
main:
	
	mov ecx, 1000; Inicio
	
	repetir:
	xor edx, edx; Dividendo
	mov eax, ecx; Dividendo
	mov ebx, 11; Divisor
	div ebx
	
	cmp edx, 5
	je imprimir
	
	avalicao:
	inc ecx	
	cmp ecx, 2000
	jl repetir
	
	fim:
	mov eax, 1
	xor ecx, ecx
	int 80h
	
	imprimir:
	push ecx
	push ecx
	push msg
	call printf
	add esp, 8
	
	pop ecx
	jmp avalicao
		
