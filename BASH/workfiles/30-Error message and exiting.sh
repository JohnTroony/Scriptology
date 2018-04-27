#!/bin/bash

if [ $# -lt 3 ]; then
cat <<EOM
 This command requires three arguments:
 username, userid, and fav number.
EOM

else

    # the progrma goes here
    echo "Username: $1"
    echo "userid: $2"
    echo "fav number: $3"
fi

echo
