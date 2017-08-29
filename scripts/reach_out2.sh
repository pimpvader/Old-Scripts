#!/bin/bash
#ssh to a set of servers and execute a command as root.

# usage::: ./reach_out site cage app start end command 
#dt$site$cage$app$ip.int
FILE=$1 #list of hosts
RUN=$2 # what I want run on list of hosts
PASS=$3
cat $FILE | while read line ; do
sshpass -f /home/jason/scripts/$PASS        ssh -n root@"$line" "$RUN"
     echo "$line" $RUN
done
