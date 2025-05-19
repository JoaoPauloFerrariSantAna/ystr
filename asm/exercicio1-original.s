.intel_syntax noprefix

.equ STDOUT,1
.equ EXIT,60
.equ SUCCESS,69

# eu tenho que ter uma string qualquer
# eu tenho que ter uma outra string com tudo que eu to procurando
# eu que loopar dentro dessa primeira string
# eu tenho que fazer um switch case enorme
# eu tenho que aumentar tipo três contangens
# mas eu vou ter que tentar aumentar uma única contagem
# mostrar na tela

.section .data
	string: .asciz "ASSEMBLY"

	NL: .ascii "\n"

	num_buffer: .space 16

.section .text
.global _start

# Função para obter o comprimento de uma string terminada em NULL (strlen)
# Entrada: rdi = endereço da string
# Saída: rax = tamanho da string
_strlen:
    xor rax, rax      # Inicializa contador de comprimento
.strlen_loop:
    cmp BYTE PTR [rdi + rax], 0 # Compara o byte atual com NULL
    je .strlen_done             # Se for NULL, fim da string
    inc rax                     # Incrementa o comprimento
    jmp .strlen_loop            # Próximo caractere
.strlen_done:
    ret 

_return:
	mov rax,EXIT
	mov rdi,SUCCESS
	syscall

# Função para imprimir string terminada em NULL (print_cstring)
# Entrada: rdi = endereço da string
# Efeito colateral: modifica rax, rsi, rdx
_print_cstring:
    push rdi          # Salva o endereço da string (rdi)
    call _strlen       # Chama strlen, rax = tamanho da string
    pop rsi           # Restaura o endereço da string para rsi (argumento 2 para sys_write)
    mov rdx, rax      # rdx = tamanho da string (argumento 3 para sys_write)
    mov rax, 1        # syscall sys_write
    mov rdi, 1        # stdout (file descriptor 1)
    syscall           # Chama o kernel (rax é modificado com o resultado da syscall)
    ret

# Função para converter int (em EAX) para string (ponteiro em RDI)
# Efeito colateral: modifica rdi, r8d, edx (e eax como parte da divisão)
_int_to_string:
    mov rdi, OFFSET num_buffer # rdi aponta para o início do buffer
    add rdi, 15           # Move rdi para o final do buffer (para preencher de trás para frente)
    mov BYTE PTR [rdi], 0 # Coloca o terminador NULL no final

    mov r8d, 10           # Divisor para conversão decimal

    test eax, eax         # Verifica se eax é 0
    jnz .convert_loop_entry # Se não for zero, inicia o loop de conversão
    dec rdi               # Se for zero, move rdi para trás uma posição
    mov BYTE PTR [rdi], '0' # Coloca '0' no buffer
    ret                   # Retorna, rdi aponta para "0"
.convert_loop_entry:
.convert_loop:
    test eax, eax         # Verifica se o quociente (eax) é zero
    jz .convert_done      # Se for zero, a conversão terminou
    xor edx, edx          # Limpa edx para a divisão (rdx:rax / r8d)
    div r8d               # Divide eax por r8d (10). Quociente em eax, resto em edx.
    add dl, '0'           # Converte o resto (dígito) para caractere ASCII
    dec rdi               # Move o ponteiro do buffer para a esquerda
    mov BYTE PTR [rdi], dl # Armazena o dígito no buffer
    jmp .convert_loop     # Repete com o novo quociente em eax
.convert_done:
    ret                   # rdi aponta para o início da string numérica

_start:
	# https://stackoverflow.com/questions/44534685/how-to-index-through-a-string-in-assembly
	xor rcx, rcx
	mov rsi, OFFSET string	# RSI -> string

.loop_start:
	cmp BYTE PTR [rsi+rcx],0
	je .loop_start_done
	inc rcx
	jmp .loop_start

.loop_start_done:
	mov r8, rcx

	# a partir daqui não posso usar mais _print_cstring

    mov rax, 1              # syscall: sys_write
    mov rdi, 1              # stdout
    # rsi ainda aponta para offset str (deixado pelo cálculo do tamanho)
    mov rdx, r8             # Usar o comprimento salvo em r8
    syscall

    # Imprimir nova linha
    mov rax, 1              # syscall: sys_write
    mov rdi, 1              # stdout
    mov rsi, OFFSET NL      # RSI é modificado aqui para apontar para nl
    mov rdx, 1
    syscall

    # Imprimir nova linha
    mov rax, 1              # syscall: sys_write
    mov rdi, 1              # stdout
    mov rsi, OFFSET NL      # RSI é modificado aqui para apontar para nl
    mov rdx, 1
    syscall

	mov r9, 0
.loop_check_for_pattern:
	cmp r9,r8
	jge .loop_done

	mov r10, r8
	dec r10
	sub r10,r9

	mov al, BYTE PTR [rsi+r9]

	cmp al,65 # ascii para "A"
	je .test

	cmp al,83 ## ascii para
	je .loop_increment_pattern_count

	inc r9

.loop_increment_pattern_count:
	# eu não sei como continuar a partir daqui
	# eu sei que está guardado em %al,
	# mas eu nem sei como verificar: com GDB, eu consegui 
	# printrar um número qualquer, mas eu não sei o que representa

.loop_done:
	call _return
