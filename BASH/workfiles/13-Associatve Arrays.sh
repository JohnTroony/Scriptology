#!/bin/bash

declare -A myarray

myarray[Distro]=Debian
myarray["Version Number"]="Ver 2.2"

echo ${myarray["Distro"]} is ${myarray["Version Number"]}
