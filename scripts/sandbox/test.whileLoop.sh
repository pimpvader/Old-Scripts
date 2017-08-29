#!/bin/bash

#Read from list and echo to STDOUT
#declare -i var1
#var1=0
#declare -i var2
#var2=6
#echo $var1
#echo $var2
#if [ "$var1" -lt "$var2" ] ; then 
#	for i in `cat list`; do
#	#echo $i
#	echo $i $1ctl_$2.sh
#	echo $var1
#	var1=$var1+1
#	done
#echo $var1
#var1=($var1+1)
#fi
declare -i count
count=0
declare -i limit
limit=5
while (("$count" -lt "$limit"))  
do
       for i in `cat list`; do
       #echo $i
       echo $i $1ctl_$2.sh
#       echo $var1
       done
  #printf "${line#* //}\n"

  ((count++))
done < list

echo $count
