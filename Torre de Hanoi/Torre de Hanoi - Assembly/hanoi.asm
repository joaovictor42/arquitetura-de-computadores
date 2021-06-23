extern scanf, printf
global main

section .bss
	discos resd 1

section .data
	msg_entrada db "Numero de discos:", 0H
	formato_entrada db "%d", 0H
	msg_entradaIvalida db "Entrada invalida, tente novamente", 0AH, 0H
	msg_saida db "[%d, %d]", 0AH, 0H
	
section .text
main:
	
	push msg_entrada
	call printf
	add esp, 4
	
	push discos
	push formato_entrada
	call scanf
	add esp, 8
	
	mov eax, [discos]
	cmp eax, 0
	jle entradaInvalida
	
	entradaValida:
	push 2; Auxiliar 
	push 3; Destino
	push 1; Origem
	push dword [discos]; Numero de discos
	
	call hanoi
	jmp saida
	
	entradaInvalida:
	push msg_entradaIvalida
	call printf
	add esp, 4
	
	saida:
	mov eax, 1
	xor ecx, ecx
	int 80h


; ordem dos parametros: discos, origem, destino, auxiliar
hanoi:
	push ebp
	mov ebp, esp
	
	cmp dword [ebp + 8], 1
	jg caso_recursivo

	;caso_base
	push dword [ebp + 16]; Destino
	push dword [ebp + 12]; Origem
	push msg_saida
	call printf
	add esp, 12
	jmp retorno
		
	;------------------------------
	
	caso_recursivo:
	push dword [ebp + 16]; Destino
	push dword [ebp + 20]; Auxiliar
	push dword [ebp + 12]; Origem
	
	mov eax, dword [ebp + 8]; Numero de discos
	sub eax, 1
	push eax; discos - 1
	
	call hanoi
	
	
	push dword [ebp + 16]; Destino
	push dword [ebp + 12]; Auxiliar
	push msg_saida
	call printf
	add esp, 12

	
	push dword [ebp + 12]; Origem
	push dword [ebp + 16]; Destino
	push dword [ebp + 20]; Auxiliar
	
	mov eax, dword [ebp + 8]; Numero de discos
	sub eax, 1
	push eax; discos - 1
	
	call hanoi
	
	;------------------------------
	
	retorno: 
	pop ebp
	ret 16
		
