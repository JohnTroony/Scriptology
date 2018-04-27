#!/bin/bash

echo "j equals 0, until it's greater than 10, print j and increment it's value by 1"

j=0

until [ $j -gt 10 ]; do
    echo j:$j
    ((j+=1))
done
