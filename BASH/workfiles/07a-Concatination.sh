#!/bin/bash

a="hello"
b="world"
c=$a$b
echo "Combined words : $c"

# how long is a string?
echo "How long is '$a'?  ${#a}"

# getting a substring (starting with index 0)
d=${c:3}
echo "Substring of $c from 3 : $d"
