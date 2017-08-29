#!/bin/bash
#Used to iterate through a list of hosts and runthe cnvr-patch script, call expect script to do this without user intervention
#USAGE:: ./remPatch.sh {preview | query | update} <LISTFILE>
#REQUIRES: /tmp/hostlist
#NEEDS: Check for /tmp/hostlist error if not there

#set -x
ACTION=$1
TARGET=$2

if [ -z "$ACTION" ] && || [ -z "$TARGET" ]
then
     echo "USAGE: ./remPatch.sh {preview | query | update} </path/to/LISTFILE>"


for i in $(cat /tmp/hostlist.txt)
do
	echo $i
	`/home/jason/scripts/sandbox/expect/key_refresh.exp $i`
done

