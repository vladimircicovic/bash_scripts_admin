#!/bin/bash
( wget --version > /dev/null 2>&1 ) ||  ( echo no wget installed ) && exit
( mpg123 --version > /dev/null 2>&1 ) ||  ( echo no mpg123 installed ) && exit

input=$1

if [ -z "$input"]; then
 echo usage: $0 \"this is test\"
 exit
fi 

output=$( echo $input | tr " " + )

wget -q -U Mozilla -O output.mp3 "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=$output" ; mpg123 output.mp3

rm output.mp3
