#!/bin/bash

echo "Input some sentence:"

read input

echo Crypted/De-crypted:
echo $input | tr abcdefghijklmnopqrstuvwxyz qwertyuiopasdfghjklzxcvbnm 

echo To get decrypted use same crypted output for input of this script 
