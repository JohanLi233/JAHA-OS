[org 0x1314]

  dw 0x55aa

  mov si, loading
  call print

  jmp $


print:
  mov ah, 0x0e
.next:
  mov al, [si]
  cmp al, 0
  jz .end
  int 0x10
  inc si
  jmp .next
.end:
  ret

loading:
  db "loading JAHA-OS", 10, 13, 0
