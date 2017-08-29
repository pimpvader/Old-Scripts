#!/bin/bash
#PROGRAMMER: Jason Rohde
#DATE:Tue Oct 14 13:32:16 CDT 2014
#PURPOSE: Check URL availability and confirm that content is being served
#USAGE:/home/nocmon/swbin/optin_optout_curl.sh <URL TO CHECK>
#set -x
TARGET=$1 #URL to check
RESPONSE1=$(curl -Is $TARGET | grep HTTP | awk '{print $2}') #Return code from HTTP Header
RESPONSE2=$(curl -s $TARGET | wc -l)
if [[ $RESPONSE1 -eq 200 ]] ; then
	echo "Statistic.1: $RESPONSE1"
	echo "Message.1: $TARGET is up and available"
else
	echo "Statistic.: $RESPONSE1"
        echo "Message.: $TARGET is returning $RESPONSE1, contact Software Support oncall, http://10.110.101.247/index.html#oncall/"
fi
if [[ $RESPONSE2 -ge 20 ]]; then
        echo "Statistic.2: $RESPONSE2"
        echo "Message.2: $TARGET is up and serving content"
else
        echo "Statistic.2: $RESPONSE2"
        echo "Message.2: $TARGET is serving blankpages, contact Software Support oncall, http://10.110.101.247/index.html#oncall/"
fi

