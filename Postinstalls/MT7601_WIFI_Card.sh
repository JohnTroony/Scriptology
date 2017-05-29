#!/bin/bash

cd /opt 
git clone https://github.com/wrfly/mt7601.git
cd mt7601/src
make
mkdir -p /etc/Wireless/RT2870STA/
cp RT2870STA.dat /etc/Wireless/RT2870STA/
insmod os/linux/mt7601Usta.ko
make install

echo "Done! Test... iwconfig"