BUILD_DIR=../build/boot
BOOTLOADER=$(BUILD_DIR)/bootloader

BOOTLOADER_OBJS_TARGET := $(BUILD_DIR)/%.o

BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, $(BOOTLOADER_OBJS_TARGET), $(BOOTLOADER_SRCS))

all: $(BUILD_DIR)/bootloader

$(BOOTLOADER_OBJS_TARGET): %.asm
	nasm -f elf -F dwarf -g $< -o $@

$(BUILD_DIR)/bootloader: $(BOOTLOADER_OBJS)
	ld -m elf_i386 -T bootloader.lds $< -o $@.bin
	objcopy -O binary $@.bin $@
