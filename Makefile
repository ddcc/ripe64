#GCC=gcc
#CLG=clang
# Disable stack protection, make the stack executable and add debug info
GCC_CFLAGS+=-fno-stack-protector -g
CLG_CFLAGS+=-fno-stack-protector -g
GCC_LDFLAGS+=-Wl,-z,execstack -g
CLG_LDFLAGS+=-Wl,-z,execstack -g

all: build/gcc_attack_gen build/clang_attack_gen

build/gcc_attack_gen: ./source/attack_gen.c
	${GCC} ${GCC_CFLAGS} ./source/attack_gen.c -c -o ./build/gcc_attack_gen.o
	${GCC} ${GCC_LDFLAGS} ./build/gcc_attack_gen.o -o ./build/gcc_attack_gen

build/clang_attack_gen: ./source/attack_gen.c
	${CLG} ${CLG_CFLAGS} ./source/attack_gen.c -c -o ./build/clang_attack_gen.o
	${CLG} ${CLG_LDFLAGS} ./build/clang_attack_gen.o -o ./build/clang_attack_gen

clean:
	rm -f fscanf_temp_file ./build/*
