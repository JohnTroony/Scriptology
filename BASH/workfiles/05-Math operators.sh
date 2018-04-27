#!/bin/bash

a=2
b=$((a+2))
echo $b

((b++))
echo $b

((b--))
echo $b

((b+=5))
echo $b

((b*=5))
echo $b

((b/=5))
echo $b

((b-=5))
echo $b

g=$(echo 1/3 | bc -l)
echo $g

