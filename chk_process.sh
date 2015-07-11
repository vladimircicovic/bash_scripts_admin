#!/bin/bash
#Best would be usage trough crontab with 1 min check - if you need check for ex each 2 sec - send secret email vladimirc1981 A gmail d0t com
#This script is monitoring process if goes off - it start again

(pidof pidof > /dev/null 2&>1)||(echo no pidof tool ; sleep 5000)


PID=$(pidof $1)

if [ -z "$1" ];then

 echo "Usage: $0 vsftpd"
 exit
fi


if [ -z "$PID" ];then
/etc/init.d/$1 stop 
/etc/init.d/$1 start
fi
