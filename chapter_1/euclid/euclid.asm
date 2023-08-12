section .text
    global _start

_start:
    ; Input numbers
    mov rax, 56   ; First number
    mov rbx, 48   ; Second number

    ; Euclid's Algorithm
euclid:
    cmp rbx, 0    ; Compare rbx with 0
    je done       ; If rbx == 0, jump to done
    xor rdx, rdx  ; Clear rdx
    div rbx       ; Divide rax by rbx, quotient in rax, remainder in rdx
    mov rax, rbx  ; Move rbx into rax
    mov rbx, rdx  ; Move remainder into rbx
    jmp euclid    ; Repeat

done:
    ; rax now contains the GCD
    ; TODO: Add code to print or otherwise use the result

    ; Exit
    mov rax, 0x2000001 ; Exit system call number
    xor rdi, rdi       ; Exit code 0
    syscall            ; Call kernel
