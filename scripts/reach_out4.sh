#!/bin/bash
#ssh to a set of servers and execute a command 
set -x

pass=$1

for i in $(cat /tmp/hostlist.txt) 

do
	sshpass -f /home/jason/scripts/.rpw	ssh -n 'root@'$i "$pass"
#echo $i
done
