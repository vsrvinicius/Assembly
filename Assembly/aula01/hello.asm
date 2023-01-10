; comentário em Assembly
; Assembly não é case sensitive
; 1 - Compilar:
; nasm -f win32 <nome do programa>.asm -o <nome>.obj > Windows
; nasm -f elf64 <nome do programa>.asm > Linux
; 2 - Linkeditar > Ligar o programa as bibliotecas que ele precisa, gerar um executável.
; ld -s -o <nome>.o >> Linux
; golink.exe /console /entry _main code.obj user32.dll >> windows é diferente, tem que vincular a dll, usamos de exemplo a user32.dll

section .data ; seção obrigatória
    msg db 'Hello Word!', 0xA, 0x0; endereçando um valor para a memória a frase e 0xA (10) que corresponde a quebra de linha. Sempre que colocar mensagem, coloque o tam. 0x0 diz que acabou a instrução para o programa.
    tam equ $- msg ; $- msg conta e volta a quantidade de caracteres que será usada na instrução acima
    msgc db 'Hello Word2!', 0xA
    tam equ $- msgc ; $- msg conta e volta a quantidade de caracteres que será usada na instrução acima 

section .text

global _start

_start:
    mov eax, 0x4
    mov ebx, 0x1 ; movimento eax movimenta ebx 0x1 saída padrão, se fosse arquivo colocaria o arquivo.
    mov ecx, msg ; estou recebendo a mensagem
    mov edx, tam
    int 0x80 ; SO faz o que está acima.

saida: ; não precisa disso, mas se colcoar não tem problema.
    mov eax, 0x1 ; SO estou terminando o programa.  0x1 é 1 em decimal. Poderia colocar em decimal, pois 1 é 1, mas depois disso poderia gerar problemas.
    mov ebx, 0x0 ; SO o valor de retorno é 0. Só serve para o SO.
    int 0x80 ; Pega as informações acima e processa.



