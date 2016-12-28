#!/usr/bin/python

import sys


#import struct
#memAddr = sys.argv[1]  # e.g 0xdeadbeef

#reverse = struct.pack('<I', memAddr)
#print reverse



def hex_shellcode(memaddr):
	'''Writes a given Memory Address (e.g. beefdade) in Little Endian in this format: \xde\xda\xef\xbe '''

	little_endian = ''

	while len(memaddr) > 0:
	    little_endian = '\\x%s'%memaddr[:2] + little_endian
	    memaddr = memaddr[2:]

	return little_endian


def reverse_order(memaddr):
	'''Writes a given Memory Address (e.g. beefdade) in Little Endian 
	   without any additional format characters/separators : dedaefbe '''

	little_endian = ''

	while len(memaddr) > 0:
	    little_endian = '%s'%memaddr[:2] + little_endian
	    memaddr = memaddr[2:]

	return little_endian


def custom_char(memaddr, separator):
	'''Writes a given Memory Address (e.g. beefdade) in Little Endian 
	   with an additional format characters/separators supplied by the user ( e.g. sep=/ ): /de/da/ef/be '''
	sep = separator

	little_endian = ''

	while len(memaddr) > 0:
	    little_endian = '%s%s'%(sep,memaddr[:2] + little_endian)
	    memaddr = memaddr[2:]

	return little_endian



def main():
 	
 	# First argument Must be the Memory-Address
	memaddr = sys.argv[1]
	
	# Default transformation if no option is set
	if len(sys.argv) == 2:
		result = reverse_order(memaddr)
		print result

	# When Option is set, check for action.
	elif len(sys.argv) == 3:

		# Action when custom separator is supplied
		if sys.argv[2].startswith("sep="):
			separator = sys.argv[2].strip("sep=")
			result = custom_char(memaddr,separator)
			print result

		# Action for incluing "\x" on output
		elif sys.argv[2] == 'x':
			result = hex_shellcode(memaddr)
			print result


if __name__ == '__main__':
	main()