#!/bin/bash

# if [expressions] # You can put "then" on a different line
# then
#    echo "true"
# elif
#    echo "false"
# else
#    echo "more"
# fi   



a=1
b=2
c=3
d="John"
e="Troon"

if [ $a -gt $b ]
then
	echo "Seems like $a is greater than $b"
elif [ $a -eq $b ]
then
	echo "$a equals $b"
else
	echo "Result, $b is greater than $a"
fi
