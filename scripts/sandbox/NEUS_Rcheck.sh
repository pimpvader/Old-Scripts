#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin

#MONITOR-480: Check to see if acq_continous_R is running, if not alert Neus Herranz



RUNNING=$(ps -eaf | grep acq_continuous_ | grep -v grep > /dev/null && echo 1)


if [[ $RUNNING -ne 1 ]]; then
	echo "Message.status: ${HOSTNAME}::acq_continuous_R is not running"
	echo "Statistic.status: 1"
else 
	echo "Message.status: ${HOSTNAME}::acq_continuous_R is running"
	echo "Statistic.Status: 0"
fi

