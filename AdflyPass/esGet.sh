#!/bin/bash


URL=$1/
folder=$(echo  $URL | cut -d '/' -f 4)


result=$(curl -i -s -k  -X 'GET' \
    -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0' -H 'DNT: 1' -H 'Referer: http://index-of.es/' \
    -b '_ga=GA1.2.565296.1480941814; displayCookieConsent=y' \
    $URL | grep 'height="32"></a> <a href=' | cut -d'=' -f 7 | cut -d'/' -f 1 | cut -d'"' -f 2)

mkdir $folder
cd $folder

for item in $result
do

if  [[ $item == *.* ]]

then
	echo $URL$item >> files.txt;
else
	echo $URL$item/ >> folders.txt;
fi
done

cd ..

