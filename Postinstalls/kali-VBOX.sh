#!/bin/bash

## Remove VirtualBox if installed
apt-get remove virtualbox -y &&
apt-get autoremove -y &&

## Update Repos
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

# Update and Install Linux-headers
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install -y linux-headers-$(uname -r) 

## Get and Install Virtualbox
cd ~
mkdir virtualBox
cd virtualBox

apt-get install libssl1.1 libvpx4 libsdl-ttf2* libpng16* -y

#Uncomment to get additionals.....
#wget http://download.virtualbox.org/virtualbox/5.1.14/Oracle_VM_VirtualBox_Extension_Pack-5.1.14-112924.vbox-extpack
#wget http://download.virtualbox.org/virtualbox/5.1.4/VBoxGuestAdditions_5.1.4.iso

su -c 'wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -'
su -c 'wget -q http://download.virtualbox.org/virtu..._vbox_2016.asc -O- | sudo apt-key add -'
apt-get install virtualbox virtualbox-ext-pack virtualbox-dkms

echo "Done! Test it :)"