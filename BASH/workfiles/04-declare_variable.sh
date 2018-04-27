#!/bin/bash

declare -i number1=123 # number1 is an integer

declare -r number2=232 # number2 read-only

declare -l some_text="LoLCats" # some_text equals lolcats

declare -u Some_String="lolcats" # Some_String equals LOLCATS


echo $number1
echo $number2
echo $some_text
echo $Some_String
