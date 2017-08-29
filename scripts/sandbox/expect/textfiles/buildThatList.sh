#!bin/bash
#set -x

INFILE=$1

#for i in $(cat $INFILE)
#	do
read INFILE $INFILE
	  case $INFILE in
	       flm|hdp|ops|mem|rtb|nsy|dma|dcs)
	       echo $INFILE 
	       ;;
	  esac 
#	grep 'flm\|hdp\|ops\|mem\|rtb\|nsy\|dma\|dcs' echo $i 
#	sleep 1
#done
