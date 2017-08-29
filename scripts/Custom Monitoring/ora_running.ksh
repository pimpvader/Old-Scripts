#!/bin/ksh
########################################################################
#
#    Name:     /home/oracle/scripts/ora_running.ksh
#
#    Function: check where oracle database is up and running

#    Modification History
#
#         Who                       What                 When
########################################################################
set -x
if [[ ! -z $1 ]]; then
    ORACLE_SID=$1
else
    ORACLE_SID=`grep : /etc/oratab|grep -v \#|head -1|awk -F: '{print $1}'`
fi

ORACLE_HOME=`grep ^${ORACLE_SID}: /etc/oratab|grep -v \#|awk -F: '{print $2}'`
export PATH=$PATH:$HOME/bin:$ORACLE_HOME/bin
ORA_DIST_LIST="pgalerts@database-services.com, oradbas@dotomi.com"
#ORA_DIST_LIST="pgalerts@database-services.com"
export ORA_DIST_LIST PATH ORACLE_SID ORACLE_HOME

LOGDIR=/home/oracle/scripts/output/
LOGFILE=$LOGDIR/${ORACLE_SID?}"_running.log"

sqlplus -s /nolog << EOF >/dev/null 2>&1
whenever sqlerror exit sql.sqlcode
conn / as sysdba
set feed off pause off pages 0 head off veri off
set term off time off
spool $LOGFILE
select NAME from v\$database;
spool off
exit;
EOF


if [ "$?" != 0 ]; then
    DB_UP='DOWN'
    echo "DATABASE DOWN: CRITICAL" >> $LOGFILE
    echo " "| mailx -s "`hostname`: DATABASE DOWN: CRITICAL " ${ORA_DIST_LIST?}
fi
