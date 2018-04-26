#!/usr/bin/python

import optparse
import sys


class xorOperation():
    ''' Xor Operations for Obfuscation and deObfuscation of strings.'''

    def __init__(self, stringInput, keyId):
        self.stringInput = stringInput
        self.keyId = keyId

    def obfuscate(self):
        '''XOR Operation on a plain-text using the key id supplied.'''

        plaintext = self.stringInput
        keyid = self.keyId

        encoded = ""

        for i in range(0, len(plaintext), len(keyid)):
            start = i
            end = i + len(keyid)

            for x, y in zip(plaintext[start:end], keyid):
                encoded += chr(ord(x) ^ ord(y))

        return encoded

    def deobfuscate(self):
        '''Reverse XOR Operation on an obfuscated string
         using key id supplied.'''

        obfuscated = self.stringInput
        keyid = self.keyId

        decoded = ""

        for i in range(0, len(obfuscated), len(keyid)):
            start = i
            end = i + len(keyid)

            for x, y in zip(obfuscated[start:end], keyid):
                decoded += chr(ord(x) ^ ord(y))

        return decoded


def main():
    '''Main function to run if xorry.py is executed. Otherwise if imported,
    there is no need to run this function.'''

    parser = optparse.OptionParser(
        'xorry.py -m de/ob -s string -k key ')

    parser.add_option('-m', dest='mode',
                      type='string',
                      help='Mode of Operation (ob or de)')

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

        xorry = xorOperation(hiddenBin, keyBin)
        decoded = xorry.deobfuscate()
        deobufString = decoded.encode("hex")

        print("Deobfuscated String : %s" % deobufString.decode("hex"))
        print("Key Used : %s " % keyBin.encode("hex"))
        print("Key String : %s " % keyBin)

    elif (mode == "ob"):
        xorry = xorOperation(plaintext, keyid)
        encoded = xorry.obfuscate()
        obufString = encoded.encode("hex")

        print("Obfuscated String : %s " % obufString)
        print("Key Used : %s " % keyid.encode("hex"))


if __name__ == '__main__':
    main()
