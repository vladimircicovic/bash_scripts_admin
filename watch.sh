#!/bin/bash

( pidof pidof > /dev/null 2>&1 ) || (echo not installed pidof; sleep 5000)



if [ -z "$1" ]; then
echo usage: ./$0 checkWhatProcess "WhatActionToTake"
echo usage: ./$0 nginx "/etc/init.d/nginx restart"

fi


PID=$(pidof $1)

if [ -z "$PID" ]; then
$2
fi


