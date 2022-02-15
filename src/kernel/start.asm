[bits 64]

global _start
_start:
  mov byte[0xb8000], 'K'
  jmp $
