#!/bin/bash

LRU=$1
base=$(echo $1 | cut -d '/' -f 5 )

echo $LRU

curl -i -s -k  -X 'GET' \
    -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0' -H 'DNT: 1' -H 'Referer: http://adf.ly/4788594/_eaHR0cDovL2luZGV4LW9mLmVzL0J1ZmZlci1PdmVyZmxvd3MvQWR2YW5jZWQlMjBidWZmZXIlMjBvdmVyZmxvdyUyMGV4cGxvaXRzLnR4dA==' \
    -b '_ga=GA1.2.565296.1480941814; displayCookieConsent=y; 240planBAK=R2339303237; 240plan=R130344047' \
    $LRU  -o $base

echo -e "Done!\n"
