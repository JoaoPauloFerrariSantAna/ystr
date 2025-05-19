# Tarefa de Arquitetura e Organizacao de Computadores 03B-2025/1

_Projeto efetuado como atividade avaliativa para a faculdade Unimar._
_Ministrante: Prof. Dr. Luiz Carlos Marques Junior._
_Aluno: João Paulo Ferrari Sant'Ana._
_Registro do Aluno (RA): 2007857._

## Sobre Montagem:

Na pasta asm/ está o primeiro e segundo exercício, contudo,
há uma cópia chamada "exercicio1-original.s" do qual se refere a minha
tentativa de escrever ASM sem ser gerado pelo compilador; já o arquivo "asm/exercicio1-funcional.s"
foi gerado pelo comando `g++ -S cpp/exercicio1.cpp -o asm/exercicio1-funcional.s`

O segundo exercício foi só eu parar e analizar o que o senhor, professor,
deixou para nós e implementei, utilizando a base deixada.

_Como compilar_

Basta compilar com o comando do qual o Sr. mostrou em aula:

`$ g++ -Iscpp -pie asm/exercicio1-funcional.s -o ./exercicio1-binario`

## Sobre C++:

_Não foi tão complicado assim_

Eu acho que ter documentação em um local (cplusplus.com) ajuda
diferente de ASM que eu não achei muita coisa.

_Como compilar_

Para compilar, basta rodar:

`$ g++ -Wall -Wextra -Wpedantic -Werror -std=c++17 cpp/exercicio1.cpp -o ./exercicio1.bin`
`$ g++ -Wall -Wextra -Wpedantic -Werror -std=c++17 cpp/exercicio2.cpp -o ./exercicio2.bin`
