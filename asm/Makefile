FILENAME := exercicio1
ASSEMBLY:= $(FILENAME).s
MONTAGE := $(FILENAME).out
BINARY := $(FILENAME).bin

all: montage linkage
	echo "creating executable"

montage: $(FILE) 
	as $(ASSEMBLY) -o $(MONTAGE)

linkage: montage
	gcc -ggdb -nostdlib -static $(ASSEMBLY) -o $(BINARY)

clear:
	rm *.out *.bin
