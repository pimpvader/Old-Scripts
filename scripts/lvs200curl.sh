#!/bin/bash
#Programmer: Jason Rohde
#DATE:Wed Sep 24 12:18:06 CDT 2014
#PURPOSE: Check URL availability
#USAGE:/home/nocmon/swbin/cap_curl.sh <URL TO CHECK>
#set -x
TARGET=$HOSTNAME
echo $TARGET
RESPONSE=$(curl -Iks $TARGET":80" | grep HTTP | awk '{print $2}') #Return code from HTTP Header
if [[ $RESPONSE -eq 200 ]] ; then
        echo "Status.Message: $TARGET is up and available"
        echo "Status.Statistic: $RESPONSE"
else
        echo "Status.Message: $TARGET is returning $RESPONSE, please investigate"
        echo "Status.Statistic: $RESPONSE"
fi
