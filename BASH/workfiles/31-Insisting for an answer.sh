#!/bin/bash

echo "Try to press enter instead of answering..."

read -p "Favorite Food? " ans
while [[ -z "$ans" ]]; do
    read -p "I need an answer! " ans
done

echo "$ans is Your Fav food."
echo
