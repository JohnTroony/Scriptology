#!/bin/bash

read -p "What year? [nnnn] " a

while [[ ! $a =~ ^[0-9]{4}$ ]]; do
    read -p "Please enter year in the format [nnnn] eg 2001: " a
    done
echo "Year entered: $a"
