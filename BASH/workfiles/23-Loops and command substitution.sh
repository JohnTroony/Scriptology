#!/bin/bash

# Sample Cellphone number generation

echo "Generate Safaricom Phone numbers"

for i in {19..29}
do
    echo "07$i`shuf -i 100000-900000 -n 1`"
done
