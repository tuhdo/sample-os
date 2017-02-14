;*********************************************
;	Boot1.asm
;		- A Simple Bootloader
;
;	Operating Systems Development Tutorial
;*********************************************
bits 16

start: jmp boot

%define num_of_sectors al
%define track_num ch
%define sector_num cl
%define head_num dh
%define drive_num dl

%define LOAD_ADDRESS 1000h
%define LOAD_SEGMENT 100h

msg	db	"Welcome to My Operating System!", 0ah, 0dh, 0h		; the string to print
_CurX db 0
_CurY db 0

boot:
  cli                                             ; no interrupts
	cld                                             ; all that we need to init
 ; we will fill more code here later
  ;; xor ax, ax
  ;; mov ds, ax
  ;; mov es, ax

  ;; call ClrScr

  mov si, msg
	call Print

	mov		ah, 0					; reset floppy disk function
	mov		dl, 0					; drive 0 is floppy drive
	int		0x13					; call BIOS
	jc		boot					; If Carry Flag (CF) is set, there was an error. Try resetting again

	;; we are going to read sector to into address 0x50:0
	;; do not read the sector into somewhere that exceeds beyond the address
	;; 0x10000, since we are in 16 bit mode, the data beyond won't be
	;; accessible and is wrapped around when we try to address them i.e.
	;; if we try to access 0x10047, it becomes 0x47.
	mov		ax, LOAD_SEGMENT
	mov		es, ax
	xor		bx, bx

	mov	num_of_sectors, 17					; read 17 sector
	mov	track_num, 0					; we are reading the 2nd sector past us, so its still on track 0
	mov	sector_num, 2					; sector to read (The 2nth sector)
	mov	head_num, 0					; head number
	mov	drive_num, 0					; drive number. Remember Drive 0 is floppy drive.
	mov	ah, 0x02			; read floppy sector function
	int	0x13					; call BIOS - Read the sector

	mov	ax, LOAD_SEGMENT
	mov	es, ax
  mov bx, 512*17 

	mov	num_of_sectors, 18					; read 18 sector
	mov	track_num, 0					; we are reading the 19th sector past us, so its on track 1
	mov	sector_num, 1				; sector to read (The 19th sector, which is first sector on track 1)
	mov	head_num, 1					; head number
	mov	drive_num, 0					; drive number. Remember Drive 0 is floppy drive.
	mov	ah, 0x02			; read floppy sector function
	int	0x13					; call BIOS - Read the sector

	;; Install GDT
	call InstallGDT

	mov	ax, 0x10		; set data segments to data selector (0x10)
	mov	ds, ax
	;; mov	ss, ax
	mov	es, ax

	mov	eax, cr0		; set bit 0 in cr0 -- enter pmode
	or	eax, 1
	mov	cr0, eax

	mov	esp, 0xf000		; stack begins from 10000h

	xor edx, edx
	xor eax, eax
	mov es, eax
	mov edx, [es:LOAD_ADDRESS + 0x18]

	jmp 	edx

  cli					; Clear all Interrupts
  hlt					; halt the system

MovCur:
	mov bh, 0
	mov ah, 2
	int 10h

  mov [_CurX], dl
	mov [_CurY], dh
	ret

;**************************************************;
;	ClrScr ()
;		- Clears screen
;**************************************************;
ClrScr:
	mov dl, 0
	mov dh, 0
	call MovCur
	mov al, ' '
	mov bl, 0
	mov cx, 80*25
	call PutChar
  mov dl, 0
	mov dh, 0
	call MovCur
	ret

;***************************************;
;	Prints a string
;	DS:SI: 0 terminated string
;***************************************;
Print:
.loop:
	lodsb					; load next byte from string from SI to AL
	or			al, al		; Does AL=0?
	jz			.done	; Yep, null terminator found-bail out
	mov cx, 1
  call PutChar
	jmp .loop		; Repeat until null terminator found
.done:
	ret					; we are done, so return


;**************************************************;
;	PutChar ()
;		- Prints a character to screen
;	AL = Character to print
;	BL = text color
;	CX = number of times character is display
;**************************************************;
PutChar:
	mov bh, 0
	mov ah, 0ah
	int 10h

	add [_CurX], cx
	mov dl, [_CurX]
	mov dh, [_CurY]
	call MovCur

	ret

; esi: pointer to source memory address
; edi: pointer to destination memory address to copy to
; edx: length
MemCopy:
.loop:
	cmp edx, 0
	je .done
	mov al, [esi]
  mov [edi], al
  inc edi
	inc esi
	sub edx, 1
	jmp .loop
.done:
	ret


InstallGDT:
	cli				; clear interrupts
	pusha				; save registers
	lgdt	[toc]			; load GDT into GDTR
	sti				; enable interrupts
	popa				; restore registers
	ret				; All done!

	;*******************************************
	; Global Descriptor Table (GDT)
	;*******************************************

gdt_data:
	dd 0				; null descriptor
	dd 0

	; gdt code:				; code descriptor
	dw 0FFFFh				; limit low
	dw 0x00				; base low
	db 0x00					; base middle
	db 10011010b			; access
	db 11001111b			; granularity
	db 0x00				; base high

	; gdt data:				; data descriptor
	dw 0FFFFh				; limit low (Same as code)
	dw 0x0000				; base low
	db 0x00				; base middle
	db 10010010b			; access
	db 11001111b			; granularity
	db 0				; base high
end_of_gdt:

toc:
	; according to lgdt description, the instruction accepts a 6-bytes
	; operand, with the lowest 2 bytes size of GDT, and the remaining
	; 4 bytes the base address of GDT
	dw end_of_gdt - gdt_data - 1	; limit (Size of GDT)
	dd gdt_data				; base of GDT

times 510 - ($-$$) db 0				; We have to be 512 bytes. Clear the rest of the bytes with 0

dw 0xAA55					; Boot Signiture
