#!/bin/bash

input=$1

if [ -z "$input"]; then
 echo usage: $0 \"this is test\"
 exit
fi 

output=$( echo $input | tr " " + )

wget -q -U Mozilla -O output.mp3 "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=$output" ; mpg123 output.mp3

rm output.mp3
