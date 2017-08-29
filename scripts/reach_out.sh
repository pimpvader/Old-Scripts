#!/bin/bash
#ssh to a set of servers and execute a script.

# usage::: ./reach_out site cage app start end command 
#dt$site$cage$app$ip.int

site=$1
cage=$2
app=$3
first=$4
last=$5
pass=$6

for i in `seq -w $first $last`

do
	sshpass -f /home/jason/scripts/.rpw	ssh -n root@"dt"$site$cage$app$i"p.int" "$pass"

done
