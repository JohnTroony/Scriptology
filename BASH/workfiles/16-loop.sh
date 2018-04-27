#!/bin/bash

echo "While i (which equals 0) is less than 10 print i on screen and increment it's value by 1"

i=0
while [ $i -le 10 ]; do
    echo i:$i
    ((i+=1))
done
