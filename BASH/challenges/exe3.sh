#!/bin/bash

Dir=$1 # First argument should be a directory
Savetxt=$2 # Seconf argument should be a txt filename

DC=$(ls -a $Dir | wc -l) #List all content in Directory and pipe to wc -l for counting
realDC=$(($DC - 2)) #Minus 2 because of . and ..

echo -e "Directory = $Dir\nTotal Files = $realDC" > $Savetxt

cat $Savetxt
