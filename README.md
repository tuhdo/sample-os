# Sample Operating System
A sample OS as demonstrated in the book Operating System: From 0 to 1

This is the initial OS version I wrote for demonstration of the book "Operating System: From 0 to 1". Not the most stellar C code, but you can refer to it for checking the correctness of your code. That's also the reason why I want you to write your own code using guidelines from the book, and it is also one important goal of the book.

The code covers 10 chapters of the "System Programming Guide" (Intel Manual Volume 3), along with a simple keyboard and video driver for input and output. However, at the moment, only the following features are implmeneted:

- Protected mode.
- Creating and managing processes with TSS (Task State Structure).
- Interrupts
- LAPIC.

Paging and I/O are not yet implemented. I will try to implement it as the book progresses.
