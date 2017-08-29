#!/bin/bash
set -x

LOGFILE="/tmp/mysql_running.log"

date > $LOGFILE
echo "" >>$LOGFILE

MAIL_LIST='sphifer@dotomi.com'
FAILED_SUBJECT="Alert :: MYSQL server is down on `hostname -s`!!"
rc=0

#Get the status of server.
srv_status_out=$(mysqladmin -u mysql ping)
srv_status=$(echo "$srv_status_out" |grep "alive"|awk '{print $3}')

#If it doesn't exist or server is down then issue critical alert return status of 1.
if [ $srv_status != "alive" ] 2>/dev/null ;
then
                echo "Message.Server_Status: CRITICAL ALERT! Can't detect server status!"  >>$LOGFILE
                echo "Statistic.Server_Status: 1"  >>$LOGFILE
                echo "Attempting to start the server" >>$LOGFILE
                /etc/init.d/mysql.server start
                srv_status_out=$(mysqladmin -u mysql ping)
                srv_status=$(echo "$srv_status_out" |grep "alive"|awk '{print $3}')
                if [ $srv_status != "alive" ] 2>/dev/null ;
                then
                        rc=1
                elif [ $srv_status == "alive" ]; then
                        echo "The server was successfully started!!" >>$LOGFILE
                fi


elif [ $srv_status == "alive" ]; then

                echo "Message.Server_Status: SUCCESS! MYSQL server $1 is $srv_status on `hostname -s`!"  >>$LOGFILE
                echo "Statistic.Server_Status: 0"  >>$LOGFILE
                rc=0
fi


#Send email to mailing list if server is down.
if [ "$rc" -eq 1 ]; then
        cat $LOGFILE | mail -s "$FAILED_SUBJECT" "$MAIL_LIST"
fi