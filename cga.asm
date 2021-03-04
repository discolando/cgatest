.8086
.model compact

.code

public    _copyBuffer2Video
_copyBuffer2Video proc near
ARG buffer: dword
  push  bp
  mov   bp,sp
  push  ds
  lds   si,[buffer]
  mov   ax,0b800h
  mov   es,ax
  xor   di,di
  mov   cx,2000h
  rep movsw
  pop   ds
  pop   bp
  ret
_copyBuffer2Video endp

public _setGraphicsMode
_setGraphicsMode   proc
   mov ah, 0
   mov al, 04h
   int 10h
   ret
_setGraphicsMode endp

public _setTextMode
__setTextMode proc
   mov ah, 0
   mov al, 03h
   int 10h
   ret
__setTextMode endp

END
