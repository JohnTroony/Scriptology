#!/usr/bin/python

# Troony 
# CTF handy

import string
import random
import time

def rand_passwd(size=8, chars=string.ascii_uppercase + string.digits + string.ascii_lowercase):
   return ''.join(random.choice(chars) for _ in range(size))

while True:
    #Print the random password of size 10
    # It can be of diffrent size ofcos
    print rand_passwd(10)

