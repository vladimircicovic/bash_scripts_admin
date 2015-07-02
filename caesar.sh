#!/bin/bash

echo "Input some sentence:"

read input

echo crypted:
echo $input | tr abcdefghijklmnopqrstuvwxyz qwertyuiopasdfghjklzxcvbnm 
