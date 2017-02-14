BUILD_DIR=../../build
INCLUDE=../
SRC=../gdt.c ../task.c ../irq.c
CFLAGS=-

all: runtest

runtest: test.c
	gcc -I$(INCLUDE) -o test $(SRC) $<
	./test -v || true
