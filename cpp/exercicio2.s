	.file	"exercicio2.cpp"
# GNU C++14 (GCC) version 14.2.1 20250207 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 14.2.1 20250207, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPFR header version 4.2.1 differs from library version 4.2.2.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -std=c++14
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.text
	.globl	main
	.type	main, @function
main:
.LFB1656:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	#,
# exercicio2.cpp:8: int main() {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp101
	movq	%rax, -8(%rbp)	# tmp101, D.45619
	xorl	%eax, %eax	# tmp101
# exercicio2.cpp:9: 	int matrixA[COLUMNS][ROWS] = {
	movl	$5, -96(%rbp)	#, matrixA[0][0]
	movl	$7, -92(%rbp)	#, matrixA[0][1]
	movl	$-1, -88(%rbp)	#, matrixA[0][2]
	movl	$6, -84(%rbp)	#, matrixA[1][0]
	movl	$0, -80(%rbp)	#, matrixA[1][1]
	movl	$-3, -76(%rbp)	#, matrixA[1][2]
	movl	$-4, -72(%rbp)	#, matrixA[2][0]
	movl	$3, -68(%rbp)	#, matrixA[2][1]
	movl	$0, -64(%rbp)	#, matrixA[2][2]
# exercicio2.cpp:15: 	int matrixB[COLUMNS][ROWS] = {
	movl	$0, -48(%rbp)	#, MEM[(int[3][3] *)_29][0][0]
	movl	$3, -44(%rbp)	#, MEM[(int[3][3] *)_29][0][1]
	movl	$-5, -40(%rbp)	#, MEM[(int[3][3] *)_29][0][2]
	movl	$2, -36(%rbp)	#, MEM[(int[3][3] *)_29][1][0]
	movl	$0, -32(%rbp)	#, MEM[(int[3][3] *)_29][1][1]
	movl	$0, -28(%rbp)	#, MEM[(int[3][3] *)_29][1][2]
	movl	$-1, -24(%rbp)	#, MEM[(int[3][3] *)_29][2][0]
	movl	$-5, -20(%rbp)	#, MEM[(int[3][3] *)_29][2][1]
	movl	$3, -16(%rbp)	#, MEM[(int[3][3] *)_29][2][2]
# exercicio2.cpp:21: 	std::cout << sizeof(matrixA) << '\n';
	movl	$36, %esi	#,
	leaq	_ZSt4cout(%rip), %rax	#, tmp102
	movq	%rax, %rdi	# tmp102,
	call	_ZNSolsEm@PLT	#
# exercicio2.cpp:21: 	std::cout << sizeof(matrixA) << '\n';
	movl	$10, %esi	#,
	movq	%rax, %rdi	# _1,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT	#
# exercicio2.cpp:38: 	return 0;
	movl	$0, %eax	#, _25
# exercicio2.cpp:39: }
	movq	-8(%rbp), %rdx	# D.45619, tmp104
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp104
	je	.L3	#,
	call	__stack_chk_fail@PLT	#
.L3:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1656:
	.size	main, .-main
	.section	.rodata
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
