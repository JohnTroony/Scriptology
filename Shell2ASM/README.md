# Shell2ASM

Disassemble and Get Assembly Instructions from a Shellcode. 


### Usage :

`./shell2asm.sh "\x31\xC9\x51\x68\x63\x61\x6C\x63\x54\xB8\xC7\x93\xC2\x77\xFF\xD0"`

Output:

```bash

Shell Disassembled
=====================================
00000000  31C9              xor ecx,ecx
00000002  51                push ecx
00000003  6863616C63        push dword 0x636c6163
00000008  54                push esp
00000009  B8C793C277        mov eax,0x77c293c7
0000000E  FFD0              call eax
00000010  0A                db 0x0a

Assembly Instructions
=====================================
xor ecx,ecx
push ecx
push dword 0x636c6163
push esp
mov eax,0x77c293c7
call eax
db 0x0a

```


## NB: This script (in some cases) doesn't give you all EXACT assembly instrunctions. It uses `ndisasm`.
