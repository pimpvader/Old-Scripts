#/bin/bash

#PROGRAMMER:Jason Rohde
#DATE: Tue Aug  5 15:42:30 CDT 2014
#Purpose: check last run of puppet, alert if older than 30 minutes or if 0 minute difference in the last finished run.
#alert if critical for 2 consecutive checks

declare -i lastRun
declare -i previousRun
declare -i timeDifference
declare -i timeEval

lastRun=$(tail -n 1 /var/log/puppet/puppet.log| grep Finished| cut -c 15-16)
previousRun=$(cat lastTime.txt) # |sed 's/://g'|cut -c 3-4
let timeDifference=$previousRun-$lastRun
timeEval=${timeDifference#-}

echo $lastRun > lastTime.txt

if [ $timeEval -ge 31 ] ; then
	echo "PuppetLastRun.Message: CRITICAL!!! Puppet has not been run on $HOSTNAME in over 30 minutes"
	echo "PuppetLastRun.Status: 1"
   elif [ $timeEval -eq 0 ] ; then
	     echo "PuppetLastRun.Message: CRITICAL!!! Puppet has not been run on $HOSTNAME in over 30 minutes"
             echo "PuppetLastRun.Status: 1"
else
	echo "PuppetLastRun.Message: $HOSTNAME is up to date"
	echo "PuppetLastRun.Status: 0"
fi
