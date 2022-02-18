[bits 32]

  section .text

  global inb
inb:
  push ebp
  mov ebp, esp                  ;保存帧

  xor eax, eax
  mov edx, [ebp + 8]            ;port
  in al, dx                     ;将端口号dx的8bit输入到ax

  jmp $+2
  jmp $+2

  leave
  ret

  global outb
outb:
  push ebp
  mov ebp, esp                  ;保存帧

  mov edx, [ebp + 8]            ;port
  mov eax, [ebp + 12]           ;value
  out dx, al                    ;将al中的8bit输出到端口号dx

  jmp $+2
  jmp $+2

  leave
  ret

  global inw
inw:
  push ebp
  mov ebp, esp                  ;保存帧

  xor eax, eax
  mov edx, [ebp + 8]            ;port
  in ax, dx                     ;将端口号dx的16bit输入到ax

  jmp $+2
  jmp $+2

  leave
  ret

  global outw
outw:
  push ebp
  mov ebp, esp                  ;保存帧

  mov edx, [ebp + 8]            ;port
  mov eax, [ebp + 12]           ;value
  out dx, ax                    ;将al中的16bit输出到端口号dx

  jmp $+2
  jmp $+2

  leave
  ret

