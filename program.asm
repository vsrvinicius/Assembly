extern system
global _main

section .text

_main:
	push 0x00657865 ; 00exe 00 para encerrar o envio.
	push 0x2e646d63 ; isso é cmd em hexadecimal ao contrário, pois o registrador recebe invertido os valores, dessa forma ele corrigirá.
	push esp ; apontando para o topo da estaque
	pop eax
	push eax
	mov eax, 0x76453dc0 ; endereço de memória com a função system.
	call ebx