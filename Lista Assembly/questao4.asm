extern scanf, printf
global main

section .bss
	valor resd 1

section .data
	msgEntrada db "Digite um numero:", 0H
	formatoEntrada db "%d", 0H
	msgSaidaPar db "O valor eh par", 0AH, 0H
	msgSaidaImpar db "O valor eh impar", 0AH, 0H

section .text
main:
	push msgEntrada
	call printf
	add esp, 4
	
	push valor
	push formatoEntrada
	call scanf
	add esp, 8
	
	xor edx, edx
	mov eax, [valor]
	mov ecx, 2
	
	idiv ecx
		
	cmp edx, 0
	je ehPar
	
	ehImpar:
		push msgSaidaImpar
		
	saida:
	call printf
	add esp, 4
	
	mov eax, 1
	xor ebx, ebx
	int 80h
	
	ehPar:
		push msgSaidaPar
		jmp saida
		
		
		
