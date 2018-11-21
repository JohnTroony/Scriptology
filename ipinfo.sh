#!/bin/bash

# Bash script to check IP Information powered by https://ipinfo.io
# Register and get your API Token from https://ipinfo.io

# Usage `./ipinfo` ------> this will print your public IP address
# Usage `./ipinfo 8.8.8.8` -------> this will collect the IP information for IPv4 address 8.8.8.8
# Usage `./ipinfo 2a00:1450:401a:805::200e -------> this will collect the IP information for IPv6 address 2a00:1450:401a:805::200e

query_ip=$1
TOKEN='get-yours'


helper(){
	echo -e "Wrong arguments supplied!\n"
    echo "Usage: ipinfo ------> This will print your public IP address"
    echo "Usage: ipinfo 8.8.8.8 -------> IP information for IPv4 address 8.8.8.8"
    echo "Usage: ipinfo 2a00:1450:401a:805::200e -------> IP information for IPv6 address 2a00:1450:401a:805::200e"
}


ipv4check(){
	if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		return 0
	else
		return 1

	fi
	}

ipv6check(){
	if [[ $1 =~ ^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$ ]]; then
 		return 0
	else
		return 1

	fi
	}



## Query for IP Information

if [ $# = 0 ]; then

    curl https://ipinfo.io?token=$TOKEN
    exit
 
 elif ipv4check $query_ip || ipv6check $query_ip; then
 	curl ipinfo.io/$query_ip?token=$TOKEN
 
 else

 	helper
    
fi
