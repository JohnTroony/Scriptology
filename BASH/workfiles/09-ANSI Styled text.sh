#!/bin/bash

#echo -e "\033[5;31;40mError: \033[0m\033[31;40mMessage to display.\033[0m"

# Declare the Variables for coloring
flashred="\033[5;31;40m"
red="\033[31;40m"
none="\033[0m"

echo -e "$flashred Error:  $none $red Message to display. $none"
