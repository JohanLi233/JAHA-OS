[org 0x1314]

  dw 0x55aa

  mov si, loading
  call print

detect_memory:
  xor ebx, ebx

  mov ax, 0
  mov es ,ax
  mov edi, ards_buffer

  mov edx, 0x534d4150

.next:
  mov eax, 0xe820
  mov ecx, 20
  int 0x15

  jc error
  add di, cx
  inc word [ards_count]

  cmp ebx, 0
  jnz .next

  mov si, detecting
  call print

  mov cx, [ards_count]
  mov si, 0
.show:
  mov eax, [si + ards_buffer]
  mov ebx, [si + ards_buffer + 8]
  mov edx, [si + ards_buffer + 16]
  add si, 20
  loop .show





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
  db "Loading JAHA-OS", 10, 13, 0

detecting:
  db "Detecting Memory Success", 10, 13, 0

error:
  mov si, .msg
  call print
  hlt
  jmp $
  .msg db "Loading Error", 10, 13, 0

ards_count:
  dw 0
ards_buffer:

