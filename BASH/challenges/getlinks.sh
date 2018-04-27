#!/bin/bash


function work(){
cat index.html | grep -r "href=" | cut -d '"' -f 2 | grep -i  "http://" | sort -u > result.txt
cat result.txt
}


if [ $# -ne 1 ]; then
        echo -e  "Usage:\n $0 url-link"
	exit 1
fi


if [ -f "index.html" ]; then
   	mv index.html index.html.bk
else
	link="$1"
	wget $link

    work
fi

