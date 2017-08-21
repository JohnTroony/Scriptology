#!/usr/bin/python

import optparse
import sys


def xorobfuscator(plaintext, keyid):
    '''XOR Operation on a plaintext using keyid'''

    encoded = ""

    for i in range(0, len(plaintext), len(keyid)):
        start = i
        end = i + len(keyid)

        for x, y in zip(plaintext[start:end], keyid):
            encoded += chr(ord(x) ^ ord(y))

    return encoded


def xorDeobfuscator(obfuscated, keyid):
    '''Reverse XOR Operation on an obufscated string using keyid'''

    decoded = ""

    for i in range(0, len(obfuscated), len(keyid)):
        start = i
        end = i + len(keyid)

        for x, y in zip(obfuscated[start:end], keyid):
            decoded += chr(ord(x) ^ ord(y))

    return decoded


def main():

    parser = optparse.OptionParser(
        'xorry.py -m < mode de/ob> -s <string> -k <key> ')

    parser.add_option('-m', dest='mode',
                      type='string', help='Mode of Operation')

    parser.add_option('-s', dest='plaintext', type='string',
                      help='String for manipulation')

    parser.add_option('-k', dest='keyid', type='string',
                      help='Key for XOR Operation')

    (options, args) = parser.parse_args()

    mode = options.mode
    plaintext = options.plaintext
    keyid = options.keyid

    if (mode is None) | (plaintext is None) | (keyid is None):
        print(parser.usage)
        sys.exit(0)

    elif (mode == "de"):
        hiddenBin = plaintext.decode("hex")
        keyBin = keyid.decode("hex")

        decoded = xorDeobfuscator(hiddenBin, keyBin).encode("hex")

        print("Deobfuscated String : %s" % decoded)
        print("Key Used : %s " % keyBin.encode("hex"))

    elif (mode == "ob"):

        ObufString = xorobfuscator(plaintext, keyid).encode("hex")
        print("Obfuscated String : %s " % ObufString)
        print("Key Used : %s " % keyid.encode("hex"))


if __name__ == '__main__':
    main()
