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
