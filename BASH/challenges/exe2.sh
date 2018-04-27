#!/bin/bash


kv=$(uname -r)
dsize=$(df | grep "/dev/sda2" | cut -d " " -f 7)
dsizeGB=$(($dsize/1000000))
memsize=$(cat /proc/meminfo | grep MemTotal | cut -d " " -f 9)
memsizeGB=$(($memsize/1000000))

red=$(tput setaf 1)
blue=$(tput setaf 4)
none=$(tput sgr0)

printf "$red Hostname :$none $blue\t%s$none\n$red MachineType :$none $blue\t%s$none\n$red Kernel-Version :$none $blue%s$none\n$red DiskSize :$none $blue\t%s GB$none\n$red Mem Size :$none $blue\t%s GB$none\n" $HOSTNAME $MACHTYPE $kv $dsizeGB $memsizeGB

