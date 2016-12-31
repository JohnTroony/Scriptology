#!/bin/bash

## File with the shellcode only!
shellcodeFile=$1

for i in $(cat $shellcodeFile); do echo -en $i; done > shellcode.bin

echo -e "Done!"
