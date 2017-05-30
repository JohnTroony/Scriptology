#!/usr/bin/python

# John Troon
# Bruteforce / decode plaintext from a substitution cipher (Ceaser cipher) encoded string.
# It replaces/shifts a letter recursively with all the alphabet 26 letters.


import sys
from string import maketrans, lowercase, uppercase

def rotary(message,position):
	lower = maketrans(lowercase, lowercase[position:] + lowercase[:position])
	upper = maketrans(uppercase, uppercase[position:] + uppercase[:position])
	return message.translate(lower).translate(upper)


if  len(sys.argv) == 2:

	message = sys.argv[1]

	for i in range(0,26):
		print "mkrot %d = " % i + rotary(message,i)
		
		print ""

else:
    print "[-] Please an argument (string)."
    print "    Example : ./mkrot.py zsucwj"
