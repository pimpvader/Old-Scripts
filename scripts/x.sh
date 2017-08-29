#!/bin/bash
set -x
for i in $(cat /tmp/hostlist.txt)
do
	ssh-keygen -f "/home/jason/.ssh/known_hosts" -R $i".int"
#	echo $i".int"
done
