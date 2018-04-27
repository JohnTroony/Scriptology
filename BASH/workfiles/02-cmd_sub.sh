#!/bin/bash

a=$(ping -c1 localhost | grep -i "bytes from" | cut -d = -f 4)
echo "Pinging LocalHost took $a"
