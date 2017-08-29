#!/bin/bash
set -x
LOG_BASE=/opt/db/logs
LOG_FILE=/opt/db/logs/pgrunning_`hostname -s`_`date +%F`.log
find $LOG_BASE/pgrunning_* -mtime +7 -exec rm {} \;
rm -rf $LOG_FILE

cat /etc/pg_clusters | while read LINE; do
    case $LINE in
    \#*) ;;
    *)
        PGHOME=`echo $LINE | awk -F: '{print $1}'`
        PGDATA=`echo $LINE | awk -F: '{print $2}'`
        PGPORT=5432
        PGUSER=postgres
        if [ x"$PGHOME" == x ]; then
            continue;
        fi
        export LD_LIBRARY_PATH=$PGHOME/lib:$LD_LIBRARY_PATH
        export PATH=$PGHOME:$PGHOME/bin:$PATH
        pg_ctl status -D $PGDATA >>  $LOG_FILE 2>&1
        RC=$?
        if [ $RC -ne 0 ]; then
            echo "Not running"
            cat $LOG_FILE | mail -s "Alert:: PostgreSQL not running on `hostname -s`" pgdbas@dotomi.com
        fi
    esac
done
