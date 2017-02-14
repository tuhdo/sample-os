BUILD_DIR=../build
KERNEL=$(BUILD_DIR)/kern/kernel

CFLAGS=-Wall -Wno-format
CFLAGS+=-fno-stack-protector -fno-omit-frame-pointer -fno-asynchronous-unwind-tables
CFLAGS+=-fno-builtin -masm=intel -m32 -nostdlib -gdwarf-2 -ggdb3 -save-temps

KERN_SRCS :=  gdt.c io.c irq.c task.c  lapic.c task1.c kernel.c
KERN_OBJS := $(patsubst %.c, $(BUILD_DIR)/kern/%.o, $(KERN_SRCS))

all: $(KERNEL)
	@echo $(KERN_SRCS)
	@echo $(KERN_OBJS)

$(BUILD_DIR)/kern/%.o: %.c
	gcc $(CFLAGS) -m32 -c  $< -o $@

$(KERNEL): $(KERN_OBJS)
	ld --trace -m elf_i386 -Tkernel.lds $(KERN_OBJS) -o $@
	# objcopy --only-keep-debug $(KERNEL) $(KERNEL).dbg
	# objcopy --strip-debug $(KERNEL)
	# objcopy --add-gnu-debuglink=$(KERNEL).dbg $(KERNEL)
