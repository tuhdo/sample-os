#define lidt(idt) asm("lidt "#idt)
#define lgdt(gdt) asm("lgdt "#gdt)
#define iret()                                  \
    asm("add esp, 0x4");                        \
    asm("leave");                               \
    asm("pop eax");                             \
    asm("iret")

#define set_es(var)                             \
    asm("mov edx, "#var"\n\t"                   \
        "mov es, dx" :: "r"(var))

#define set_cs(var)                             \
    asm("mov edx, "#var"\n\t"                   \
        "mov cs, dx")

#define set_ds(var)                             \
    asm("mov edx, "#var"\n\t"                   \
        "mov ds, dx")

#define set_ss(var)                             \
    asm("mov edx, "#var"\n\t"                   \
        "mov ss, dx")

#define set_gs(var)                             \
    asm("mov edx, "#var"\n\t"                   \
        "mov gs, dx")

#define write_mem_es(offset, value)             \
    asm("mov edx, "#value"\n\t"                 \
        "mov word [es:"#offset"], edx")         \

#define ltr(gdt_index)                          \
    asm("mov edx, "#gdt_index"\n\t"             \
        "ltr dx")
