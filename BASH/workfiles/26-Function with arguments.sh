#!/bin/bash

function numberItems {
i=1
for f in $@; do # $@ is all the arguments parsed into the function
    echo $i: $f
    ((i++))
done
}

numberItems $(ls)
echo

numberItems Kenya Uganda Tanzania Ethiopia
