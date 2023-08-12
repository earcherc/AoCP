; Define _main symbol 
global _main

_main:
    ; Call the start function
    call start
    
    ; Exit with return code
    mov rax, 0x02000001
    mov rdi, 0
    syscall

; Existing start function
start:
  mov rax, 0x02000004 
  mov rdi, 1
  mov rsi, message
  mov rdx, 13
  syscall

  mov rax, 0x02000001
  xor rdi, rdi
  syscall
  
section .data

message: db "Hello, World", 10