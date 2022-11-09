extern _ShellExecuteA
global _main

section .data
	tipo db "open",0
	cmd db "cmd",0
	par db "/c mkdir ola",0

section .text
_main:
	push 0
	push 0
	push par
	push cmd
	push tipo
	push 0
	call _ShellExecuteA
