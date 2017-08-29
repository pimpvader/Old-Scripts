#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin

DIRPATH=$1 #file path to check
declare -i MAXSIZE #Set MAXSIZE to integer
MAXSIZE=$2 #MAXSIZE is the second command line argument. Enter the size in GB (e.g. 250 for 250GB or 256000MB)
MAXSIZE=$((MAXSIZE * 1024)) #convert GB to MB

#USAGE filesize.sh /path/to/directory maxsize_in_G

declare -i diskUsage #Set diskUsage to Integer

diskUsage=$(du -k ${DIRPATH} --max-depth=0 | awk '{print $1}') #Pull size only from du output

if [[ $diskUsage -ge $MAXSIZE ]]; then
	echo "Statistic.status: 1"
	echo "Message.Usage: ${HOSTNAME} ${DIRPATH} is greater than $2GB used"
else 
	echo "Statistic.Status: 0"
	echo "Message.Usage: ${HOSTNAME} ${DIRPATH} is less than $2GB used"
fi
