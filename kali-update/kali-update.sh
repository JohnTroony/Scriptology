#!/bin/bash
# John Troon 
#This is a basic bash script to update source list and install kernel-headers in Kali

#Variables 
file="sources.list"
cdir="/etc/apt/"

#Error Color
flashred=$(tput setab 0; tput setaf 1; tput blink)
red=$(tput setab 0; tput setaf 1)
none=$(tput sgr0)
greentext="\033[32m"
normal="\033[0m"

#start
echo -e "starting... checking.. \n"


#Check if user is root
if [ $UID -ne 0 ]; then
	echo -e $flashred"ERROR: "$none$red"Non root user! Please run script as root."$none
	
#change dir to /etc/apt and backup sources.list	
else
	
	echo -e "\033[31;43m>> Changing working directoty to $cdir\033[0m"
	cd /etc/apt/
	echo -e "\033[34;43m>> Backing up current sources.list as sources.list.bk\033[0m"
	cp sources.list sources.list.bk
	echo ""
	
	# Update the sources.list
	echo -e $greentext"===== Updating source ====="$normal
	cat <<- EOF > $file
		#Default repos
		deb http://http.kali.org/kali kali main non-free contrib
		deb http://security.kali.org/kali-security kali/updates main contrib non-free

		#Source repos
		deb-src http://http.kali.org/kali kali main non-free contrib
		deb-src http://security.kali.org/kali-security kali/updates main contrib non-free

		#Bleeding Edge repos
		deb http://repo.kali.org/kali kali-bleeding-edge main
		deb-src http://repo.kali.org/kali kali-bleeding-edge main
		EOF
	
		
	echo ""
	
	# Update/refresh Sources, Install Linux headers and VirtualBox
	echo -e $greentext"Keep Calm... \n updating System Sources, Kernel headers and installing Virtual Box "$normal
	
	apt-get update && apt-get install -y linux-headers-$(uname -r) && apt-get install -y virtualbox
	
	echo -e "\033[30;41mdone here...\n \033[0m"
	
	virtualbox 2> /dev/null
	
fi
