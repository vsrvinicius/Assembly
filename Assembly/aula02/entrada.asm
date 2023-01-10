; comentário em Assembly
; Assembly não é case sensitive
; 1 - Compilar:
; nasm -f win32 <nome do programa>.asm -o <nome>.obj > Windows
; nasm -f elf64 <nome do programa>.asm > Linux
; 2 - Linkeditar > Ligar o programa as bibliotecas que ele precisa, gerar um executável.
; ld -s -o <nome>.o >> Linux
; golink.exe /console /entry _main code.obj user32.dll >> windows é diferente, tem que vincular a dll, usamos de exemplo a user32.dll

segment .data ; parte de uma seção, só para termos constantes, ou seja não mudam.
    lf          equ 0xA     ; Line feed uma variável, quebra de linha. >> O 0xA é o valor de msg no programa hello.asm, primeira aula.
    null equ 0x0            ; Final da linha, diz que acabou a instrução.
    sys_call    equ 0x80    ; Envia informação ao SO
; Os valores acima será enviados para EAX o nome sys poderia ser qualquer coisa.
    sys_exit    equ 0x1     ; Código de chamada para finalizar o programa >> O 0x0 é o valor de eax no programa hello.asm, primeira aula.
    sys_read    equ 0x3     ; Operação de leitura no programa hello.asm
    sys_write   equ 0x4     ; Operação de escrita no programa hello.asm
; EBX
    ret_exit    equ 0x0     ; Operação realizada com sucesso >> O 0x0 é o valor de ebx no programa hello.asm, primeira aula.
    std_in      equ 0x0     ; Entrada padrão
    std_out     equ 0x1     ; Saída padrão

section .data               ; seção obrigatória
    msg db "Entre com seu nome:", lf, null ; agora posso usar a varíavel para pular linha e finalizar a instrução.
    tam equ $- msg

section .bss ; aqui colocamos variáveis que mudam, mutáveis e na data imutáveis.
    nome resb 1 ; armazena valor de byte em byte

section .text


global _start

_start:

    mov eax, sys_write
    mov ebx, std_out
    mov ecx, msg
    mov edx, tam
    int sys_call

    mov eax, sys_read
    mov ebx, std_in
    mov ecx, nome
    mov edx, 0xA ; 10 caracteres que pegaremos, se colocar mais não pegará.
    int sys_call

; finalizando o programa.
    mov eax, sys_exit
    mov ebx, ret_exit
    int sys_call

; por causa do arquivo makefile podemos fazer todo processo de compilação usando apenas o comando make no terminal.