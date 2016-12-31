#!/bin/bash

while read p; do
echo $p
./esGet.sh $p
done < Links.txt
