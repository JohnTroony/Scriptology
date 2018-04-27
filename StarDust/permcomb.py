#!/usr/bin/python

import itertools
import sys


def combination(elements, items):

    for combination in itertools.product(xrange(elements), repeat=items):
        print(''.join(map(str, combination)))


if len(sys.argv) == 3:

    allSet = int(sys.argv[1])
    setItems = int(sys.argv[2])

    if allSet >= setItems:
        combination(allSet, setItems)

    else:
        print("[-] Set Items Should be greater than the Elements.")
        print("    Example : permcomb.py 10 4")
else:
    print("[-] Please Supply Two Arguments.")
    print("    Example : percomb.py 10 5")
