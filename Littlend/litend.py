#!/usr/bin/python

import sys


# import struct
# memAddr = sys.argv[1]  # e.g 0xdeadbeef

# reverse = struct.pack('<I', memAddr)
# print reverse

class endian():

    def __init__(self, memaddr, separator="\\x"):
        self.memaddr = memaddr
        self.separator = separator

    def hex_shellcode(self):
        '''Writes a given memory_addr   Address (e.g. beefdade)
        in Little Endian in this format: \xde\xda\xef\xbe '''

        memory_addr = self.memaddr
        little_endian = ''

        while len(memory_addr) > 0:
            little_endian = '\\x%s' % memory_addr[:2] + little_endian
            memory_addr = memory_addr[2:]

        return little_endian

    def reverse_order(self):
        '''Writes a given memory address
         (e.g. beefdade) in Little Endian'''

        memory_addr = self.memaddr
        little_endian = ''

        while len(memory_addr) > 0:
            little_endian = '%s' % memory_addr[:2] + little_endian
            memory_addr = memory_addr[2:]

        return little_endian

    def custom_char(self):
        '''Writes a given memory_address
         (e.g. beefdade) in Little Endian '''
        sep = self.separator
        memory_addr = self.memaddr

        little_endian = ''

        while len(memory_addr) > 0:
            little_endian = '%s%s' % (sep, memory_addr[:2] + little_endian)
            memory_addr = memory_addr[2:]

        return little_endian


def main():

    # First argument Must be the memory_addr  -Address
    memaddr = sys.argv[1]

    # Default transformation if no option is set
    if len(sys.argv) == 2:

        result = endian(memaddr)
        output = result.reverse_order()

        print(output)

    # When Option is set, check for action.
    elif len(sys.argv) == 3:

        # Action when custom separator is supplied
        if sys.argv[2].startswith("sep="):
            separator = sys.argv[2].strip("sep=")

            result = endian(memaddr, separator)
            output = result.custom_char()

            print(output)

        # Action for incluing "\x" on output
        elif sys.argv[2] == 'x':
            result = endian(memaddr)
            output = result.hex_shellcode()
            print(output)


if __name__ == '__main__':
    main()
