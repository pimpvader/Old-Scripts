#!/usr/bin/python

#AUTHOR: Jason Rohde
#PURPOSE: Check for hosts responsibiliies in a mapr cluster (Need to have at least 1 Jobtracker, 5 cldb, tasktracker should equal # of nodes in the cluster, 3 hbmaster,)
#DATE:
#Run As User: nocmon, with rights to run maprcli node list - columns hostname, svc
#

import subprocess
import re

f = subprocess.Popen("cat /home/jrohde/scripts/sandbox/hdp_test_file.txt", stdout=subprocess.PIPE, shell=TRUE)
(out, err)  = f.communicate()
print out


