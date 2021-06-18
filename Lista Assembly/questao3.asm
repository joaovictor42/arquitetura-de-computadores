extern scanf, printf
global main

section .bss
	varA resd 1
	varB resd 1

section .data
	msgEntrada1 db "Digite o primeiro valor:", 0H
	msgEntrada2 db "Digite o segundo valor:", 0H
	msgSaida db "O maior valor eh: %d", 0AH, 0H
	formatoEntrada db "%d", 0H

section .text
main:
	push msgEntrada1
	call printf
	add esp, 4
	
	push varA
	push formatoEntrada
	call scanf
	add esp, 8
	
	push msgEntrada2
	call printf
	add esp, 4
	
	push varB
	push formatoEntrada
	call scanf
	add esp, 8
	
	mov eax, [varA]
	cmp eax, [varB]
	jl maiorEhB
	jmp saida
	
	maiorEhB:
		mov eax, [varB]
		
	saida:
	push eax
	push msgSaida
	call printf
	add esp, 8
	
	mov eax, 1
	xor ebx, ebx
	int 80h
		
		
		
