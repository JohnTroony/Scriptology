#!/bin/bash

Linux_distros=()
distros=("kali" "Ubuntu" "Redhat") #no commas


#print item at position 2 in the array
echo ${b[2]} # it's zero based

#add new item at position 5
distros[5]="Suse" 

#add new array item at the end
distros+=("CentOs")

#print all array data
echo ${distros[@]} 

#print last element in array data
echo ${distros[@]: -1} 
