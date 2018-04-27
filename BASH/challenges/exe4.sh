#!/bin/bash

ip=$1
save=$2

if [ $# -lt 2 ]; then
	echo -e  "Usage:\n $0 127.0.0 savefile"
	else


	for i in {1..254}
	do
	    #echo "Pinging $1.$i "
	    ping -c 1 $1.$i | grep ttl >> $save &
	done

	cat ips.txt | cut -d " " -f 4 | tr -d ":" > $save.tmp

	echo  "==================================================="
	echo  "                  Alive hosts:                      "
	cat $save.tmp
fi
