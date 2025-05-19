.intel_syntax noprefix

.equ EXIT,60
.equ SUCCESS,69

.section .data
	# em uma matrix temos n*m elementos, então
	# eu não preciso me preocupar em deixar como seria em c/c++
	# eu só preciso multiplicar n por m que eu tenho o total de elementos spra usar
	
	# que N = M = 3 (porque somente soma-se com matrizes quadradas)
	# então n * m = 9
	# temos duas matrizes de 9 items cada

	# essa matriz ficou diferente da contra parte em cpp pois
	# ASM não aceita número negativo
	matrix_a: .int 5,7,1,6,0,3,4,3,0
	matrix_b: .int 0,3,5,2,0,0,1,5,3 

	len: .int 9

	# na minha maquina: int = 4
	# e temos 3 colunas, então:
	# (3 * 4) * 3
	result: .int 36

	# Debug
    msg_iter: .string "Iteracao: "
    msg_vec1: .string "Matrix A: "
    msg_vec2: .string "Matrix B: "
    msg_sum:  .string "Soma: "

    NL:       .string "\n"
    SPACE:    .string " "
    
	# Buffer para conversão numérica
    num_buffer: .space 16

.section .text                     # Define que o código seguinte vai para a seção de código executável
.global _start                     # Torna o símbolo _start visível ao linker

_return:
	mov rax,EXIT
	mov rdi,SUCCESS
	syscall

# Função auxiliar para obter o comprimento de uma string terminada em NULL
strlen:
    # Entrada: rdi = endereço da string
    # Saída: rax = tamanho da string
    mov rax, 0          # Inicializa contador
    .strlen_loop:
    cmp BYTE PTR [rdi + rax], 0
    je .strlen_done
    inc rax
    jmp .strlen_loop
    .strlen_done:
    ret

# Função para imprimir string terminada em NULL
_print_cstring:
    # Entrada: rdi = endereço da string
    push rdi            # Salva o endereço da string
    call strlen
    pop rsi             # Recupera o endereço para rsi (buffer)
    mov rdx, rax        # Tamanho da string
    mov rax, 1          # sys_write
    mov rdi, 1          # stdout
    syscall
    ret



# Função para converter int para string
int_to_string:
    # Entrada: eax contém o número
    # Saída: rdi = ponteiro para string
    mov rdi, OFFSET num_buffer
    add rdi, 15         # Começa do final do buffer
    mov BYTE PTR [rdi], 0  # Null terminator
    
    mov r8d, 10         # Base decimal
    test eax, eax       # Verifica se é zero
    jnz .convert_loop
    dec rdi
    mov BYTE PTR [rdi], '0'
    ret

    .convert_loop:
    test eax, eax
    jz .convert_done
    xor edx, edx        # Limpa EDX para divisão
    div r8d             # Divide EDX:EAX por 10
    add dl, '0'         # Converte resto para ASCII
    dec rdi
    mov BYTE PTR [rdi], dl  # Armazena dígito
    jmp .convert_loop

    .convert_done:
    ret                 # Retorna em RDI

_start:
    xor r12d, r12d      # Contador de loop (i = 0)

    # Imprime número da iteração
    mov rdi, OFFSET msg_iter
    call _print_cstring

loop:
    mov eax, r12d       # i para conversão
    call int_to_string  # Converte para string em rdi
    call _print_cstring
    
    # Imprime nova linha
    mov rdi, OFFSET NL
    call _print_cstring
    
    # Imprime vec1[i]
    mov rdi, OFFSET msg_vec1
    call _print_cstring
    
    mov eax, [matrix_a + r12*4]  # Acesso indexado
    call int_to_string
    call _print_cstring
    
    # Imprime espaço
    mov rdi, OFFSET SPACE
    call _print_cstring
    
    # Imprime vec2[i]
    mov rdi, OFFSET msg_vec2
    call _print_cstring
    
    mov eax, [matrix_b + r12*4]
    call int_to_string
    call _print_cstring
    
    # Imprime espaço
    mov rdi, OFFSET SPACE
    call _print_cstring
    
    # Calcula soma
    mov eax, [matrix_a + r12*4]
    add eax, [matrix_b + r12*4]
    mov [result + r12*4], eax  # Armazena resultado
    
    # Imprime soma
    mov rdi, OFFSET msg_sum
    call _print_cstring
    
    mov eax, [result + r12*4]
    call int_to_string
    call _print_cstring
    
    # Imprime nova linha
    mov rdi, OFFSET NL
    call _print_cstring
    
    # Incrementa contador
    inc r12d
    cmp r12d, [len]
    jl loop             # Continua se i < len
    
	call _return
