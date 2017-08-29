#!/bin/bash
#Used to refresh knownhosts after boxes are re-kicked, call expect script to do this without user intervention
#USAGE:: ./updateKeys.sh
#REQUIRES: /tmp/hostlist
#NEEDS: Check for /tmp/hostlist error if not there

#set -x
for i in $(cat /tmp/hostlist.txt)
do
	echo $i
	`/home/jason/scripts/sandbox/expect/key_refresh.exp $i`
done

