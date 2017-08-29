#/usr/bin/python

# Programmer: Jason Rohde <jrohde@conversantmedia.com>
# Date: Thu May 15 10:14:09 CDT 2014
# Purpose: To check all components in mapr cluster are up and active
# need to ensure that there is an active 'jobtracker', 'hbmaster', 
import os
import sys

file = open('/home/jrohde/scripts/sandbox/hdp_test_file.txt', 'r')
#print "Name of in file: " file.name

#print file.read()
for i in range(41):
    # print str(i)+ ':' +file.readline(),
     if 'hbmaster' in file.readline(),
     print str(i)+ ':' +file.readline(), 
file.close()




#PATH=/bin:/sbin:/usr/bin:/usr/sbin

#file=$1 #create this file to read maprcli node list -columns hostname,svc output from.

#Create file
#echo $file > mapRRead.txt

#Read each line of the file and look for Job tracker, hbmaster, cldb.
#count the instances of each 

#while read -r line
#do
#	grep 'hbmaster'
#	   if
# 	      echo "hbmaster is host"
#	   else
#	      echo "No master found"
#	   fi
#done <hdp_test_file.txt
