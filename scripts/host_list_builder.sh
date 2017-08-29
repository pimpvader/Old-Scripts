#!/bin/bash
#ssh to a set of servers and execute a script or command.

# usage::: ./host_list_builder site cage app start end script
#dt$site$cage$app$ip.int

site=$1
cage=$2
app=$3
first=$4
last=$5
#action=$6

for i in `seq -w $first $last`

do
#	`sshpass -f scripts/.rpw	ssh root@"dt"$site$cage$app$i"p.int" "$action"`
echo dt"$site$cage$app$i"p.int >> /tmp/hostlist.txt
done
