#!/bin/bash

PATH=/bin:/sbin

mount=($(mount | grep glusterfs | awk '{print $3}'))
testFile=$RANDOM

for i in "${mount[@]}"
do
	if test -e $i/$testFile; then
		testFile=$random
	else
		touch $i/$testFile.txt
	        if test -e  $i/$testFile.txt; then
	                echo "Message.Status: Writing to $i test file:$testFile.txt was successful" 1>&2
	                echo "Statistic.Status: 0"
	        else
	                echo "Message.Status: Could not write to $i, please contact Application support" 1>&2
	                echo "Statistic.Status: 2"
	        fi
	fi
rm $i/$testFile.txt
done

