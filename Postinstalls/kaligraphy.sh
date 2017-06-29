#!/bin/bash 

# Replace Main Repo with Kali's
mv /etc/apt/sources.list /etc/apt/sources.list.debian
cat <<EOF > /etc/apt/sources.list
deb http://http.kali.org/kali kali-rolling main non-free contrib
deb-src http://http.kali.org/kali kali-rolling main non-free contrib
EOF

# Kali Linux GPG keys to aptitude
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6

# Update and install base packages 
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove --purge
apt-get -y install kali-linux

# Downgrade some libraries for Kali Linux
apt-get -y --force-yes install tzdata=2015d-0+deb8u1
apt-get -y --force-yes install libc6=2.19-18
apt-get -y --force-yes install systemd=215-17+deb8u1 libsystemd0=215-17+deb8u1

# Dist-Upgrade
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade

# Disable Kali-Menu (Because it's for VPS installs, daaah)
apt-get remove --purge kali-menu && apt-get clean
rm -rf .local/share/applications
rm -rf .config/menus


# Finish
apt-get -y autoremove --purge
apt-get clean
echo "Debian now Kali!"
echo "Rebooting"

