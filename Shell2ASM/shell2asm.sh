#!/bin/bash

Shellcode=$1

function usage (){
	echo -e "Usage :"
	echo  'shell2asm.sh "\x31\xC9\x51\x68\x63\x61\x6C\x63\x54\xB8\xC7\x93\xC2\x77\xFF\xD0"'
}


if [ -z "$Shellcode" ]

then
	echo -e "No shellcode Supplied!\n"
	usage
else
	echo -e $Shellcode > /tmp/shellcode
	echo "Shell Disassembled"
	echo "====================================="
	ndisasm -b 32 /tmp/shellcode > /tmp/shellcode.asm
	cat /tmp/shellcode.asm


	echo -e  "\nAssembly Instructions"
        echo "====================================="
	sed -i 's/\(.\{28\}\)//' /tmp/shellcode.asm
	cat /tmp/shellcode.asm
	rm /tmp/shellcode*
fi
