ASMNAME := main.out
BINNAME := a.bin
FILE := exercicio2.s

all: montage linkage
	echo "creating executable"

montage: $(FILE) 
	as $(FILE) -o $(ASMNAME)

linkage: montage
	gcc -ggdb -nostdlib -static $(FILE) -o $(BINNAME)

clear:
	rm *.out *.bin
