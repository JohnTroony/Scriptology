#!/bin/bash

echo "What is your name?"
read name

echo "What is your password?"
read -s pass

read -p "What is your favorite animal? " animal

echo name: $name, pass: $pass, animal: $animal
