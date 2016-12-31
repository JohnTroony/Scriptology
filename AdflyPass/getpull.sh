#!/bin/bash

cd $1
while read p; do
#echo $p
../pull.sh $p
done < $2
