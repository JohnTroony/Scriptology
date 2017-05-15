#!/bin/bash

apt -y -qq install git gcc tor

git clone -q -b master https://github.com/rofl0r/proxychains-ng.git /opt/proxychains-ng-git/

pushd /opt/proxychains-ng-git/ >/dev/null
git pull -q
make -s clean
./configure --prefix=/usr --sysconfdir=/etc >/dev/null
make -s 2>/dev/null && make -s install   
popd >/dev/null

#--- Add to path 
mkdir -p /usr/local/bin/
ln -sf /usr/bin/proxychains4 /usr/local/bin/proxychains-ng


### Done
echo -e "Starting Tor!\n"
echo -e "You can use another terminal\n"
echo -e "e.g. proxychains firefox\n"

