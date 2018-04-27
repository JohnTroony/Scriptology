#!/bin/bash

Linux_distro="Debian RedHat Kali Ubuntu RedHat"

echo "Our string is '$Linux_distro'"
echo

echo "To  replace the first instance of RedHat with Suse."
echo ${Linux_distro/RedHat/Suse}
echo

echo "To replace all instance of RedHat with Suse"
echo ${Linux_distro//RedHat/Suse}
echo


echo "To  replace RedHat only if it's at the beginning of a string."
echo ${Linux_distro#RedHat/Suse} 
echo

echo "To replace  RedHat only if it's at the end of a string."
echo ${Linux_distro%RedHat/Suse}

