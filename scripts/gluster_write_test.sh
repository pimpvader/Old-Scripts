#!/bin/bash
#Author:Jason Rohde
#Date:6 March 2014
#Purpose: to check that gluster mount is writeable


PATH=/bin:/sbin:/usr/bin:/usr/sbin

mount=($(mount | grep glusterfs | awk '{print $3}'))
me

for i in "${mount[@]}"
do
	while [ 1 ]
	do
		testFile=$RANDOM
		if [ ! -f $i/$testFile ]; then
			break
		fi
	done

	touch $i/$testFile.txt
	if [ -f  $i/$testFile.txt ]; then
		echo "Message.Status: Writing to $i test file:$testFile.txt was successful" 1>&2
		echo "Statistic.Status: 0"
	else
		echo "Message.Status: Could not write to $i, please contact Application support" 1>&2
		echo "Statistic.Status: 2"
	fi

	rm $i/$testFile.txt
done
