#!/bin/bash

echo "Using for-loop & range {start...end} Example, generate IP addresses"

for i in {1..254}
do
    echo 192.169.8.$i
done
