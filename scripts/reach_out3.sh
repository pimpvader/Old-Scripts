#1/bin/bash

FILE=$1
RUN=$2
while read $FILE; do

sshpass -f /home/jason/scripts/.rpw ssh -n root@$FILE $RUN
done
