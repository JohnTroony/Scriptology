#!/bin/bash

# Update + Upgrade System
apt update
apt upgrade

# Install required Libraries
apt-get install libssl1.0.0 libssl-dev

# Download Binary

MACHINE_TYPE=`uname -m`

if [ ${MACHINE_TYPE} == 'x86_64' ]; then

  wget http://download-new.utorrent.com/endpoint/utserver/os/linux-x64-ubuntu-13-04/track/beta/ -O utorrent.tar.gz

else

  wget http://download-new.utorrent.com/endpoint/utserver/os/linux-i386-ubuntu-13-04/track/beta/ -O utorrent.tar.gz

fi


tar -zxvf utorrent.tar.gz -C /opt/


chmod +w /opt/utorrent-server-alpha-v3_3/

ln -s /opt/utorrent-server-alpha-v3_3/utserver /usr/bin/utserver

utserver -settingspath /opt/utorrent-server-alpha-v3_3/ &

echo "Done!"
echo ""
echo " Access the WebUI : http://xx.xx.xx.xx:8080/gui/web/index.html"

