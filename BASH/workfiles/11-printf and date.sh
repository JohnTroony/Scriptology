#!/bin/bash

# Define some variables
today=$(date +"%d-%m-%Y")
time=$(date +"%H:%M:%S")



# Use Printf to formart the output (\t = tab, \n = new-line) `man printf` for more info
printf -v d "Current User:\t%s\nDate:\t\t%s @ %s\n"  $USER $today $time 

echo "$d"
