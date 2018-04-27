#!/bin/bash

#Some Color codes
flashred=$(tput setab 0; tput setaf 1; tput blink)
red=$(tput setab 0; tput setaf 1)
none=$(tput sgr0)
greentext="\033[32m"
normal="\033[0m"

clear

if [ $UID -ne 0 ]; then
	echo -e $flashred"Non root user! Please run as root."$normal
else
	echo -e $greentext"===== Logminer (Installer/Updater) ====="$none
	echo 
	echo -e $greentext"Creating some Dir..."$none
	echo -e $greentext"#######################"$none
	echo 

	linked="/usr/bin/logminer"
	dpath="/usr/share/logminer"
	mkdir -p $dpath;

	if [ -e $dpath ]; then
		echo -e $greentext"Copying and Creating links"$none
		echo -e $greentext"#############################"$none
		echo

		cp -r * $dpath;	

		if [ -e $linked ]; then
			echo -e $flashred"logminer already exist in the /usr/bin/"$none
			echo -e $greentext"Update logminer?"$none
			read -p "Enter yes or no: " update;
		
			if [ $update == "yes" ]; then
			        echo
				echo -e $greentext" ** << updating >> **"$none
				rm -f $linked;
				cp -r * $dpath;
				ln -s $dpath/logminer $linked;
				echo 
				echo -e $greentext"logminer now updated"$none
				echo -e $greentext"##################################"$none
			else	
				echo
				echo -e $red"Exiting..... You've entred $update"$none
				echo -e $greentext"------------------------------------"$none
		        fi
		else

			ln -s   $dpath/logminer $linked;

			echo -e $greentext"logminer now installed"$none
			echo -e $greentext"#####################################"$none
			echo
		fi

	else
		echo Error while accessing /usr/share/logminer
	fi
fi
