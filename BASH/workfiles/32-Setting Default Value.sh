#!/bin/bash

echo "If you just press enter, Kenya is set as default, but any other input can be used too.."

read -p "Favorite Country? [Kenya] " a

while [[ -z "$a" ]]; do
    a="Kenya"
done

echo "$a is set as your fav country."
echo
