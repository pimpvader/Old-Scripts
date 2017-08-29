#!/bin/bash

#PROGRAMMER: Jason Rohde <jrohde@conversantmedia.com>
#DATE: Mon Jul 28 10:10:08 CDT 2014
#PURPOSE: To check varnish availability for http://iad.maestro.dotomi.com/v4/1 and http://iad.maestro.dotomi.com/v4/1 
#USAGE: ./varnish.sh iad.maestro.dotomi.com/v4/

#IAD::curl http://iad.maestro.dotomi.com/v4/ | grep -c maestro | egrep -c "[1-9]|[1-9][0-9]|[1-9][0-9][0-9]" 
#SJC::curl http://sjc.maestro.dotomi.com/v4/ | grep -c maestro | egrep -c "[1-9]|[1-9][0-9]|[1-9][0-9][0-9]" 


var=$(curl -ss http://$1 | grep -c maestro | egrep -c "[1-9]|[1-9][0-9]|[1-9][0-9][0-9]")
URL=$1
if [ $var -ne 1 ] ; then 
	echo "Message.Varnish: CRITICAL!! Varnish is not responding at $URL, Notify Software Support"
	echo "Statistic.Varnish: 1"
else
	echo "Message.Varnish: Success!! Varnish is responding at $URL"
        echo "Statistic.Varnish: 0"
fi
