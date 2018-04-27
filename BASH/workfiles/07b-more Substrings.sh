#!/bin/bash

a="hello"
b="world"
c=$a$b
echo $c

# how long is a string?
echo ${#a}

# getting a substring (starting with index 0)
echo d=${c:3}


#specific number of chars after index 0 to 3
e=${c:3:4}

#   using a negative number will start to count at the end of the string
echo ${c: -4}
echo ${c: -4:3}
