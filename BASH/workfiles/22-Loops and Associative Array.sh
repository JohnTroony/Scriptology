#!/bin/bash

declare -A arr
arr["name"]="John Troon"
arr["twitter"]="@johntroony"


for i in "${!arr[@]}"
do
    echo "$i: ${arr[$i]}"
done
