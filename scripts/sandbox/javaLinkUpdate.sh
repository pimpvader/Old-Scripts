#!/bin/bash
#Reach out to server, shutdown the app, remove symlink and recreate

APP=$1

#switch to dotomi user and shutdown apps
if ($APP == dma_; then

su - dotomi <<SHUT_DOWN_APPS

dmactl stop
sleep 3
dmactl stopf
sleep 3
dmactl status
sleep 3
appenderctl stop
sleep 3
appenderctl status
sleep 3
cpsctl stop
sleep 3
cpsctl stopf
sleep 3
cpsctl status
exit
SHUT_DOWN_APPS

sleep 10
rm /opt/jave/jdk1.7
ln -s /usr/java/jdk-1.7.0_4* /opt/java/jdk1.7 

su - dotomi <<STARTUP_APPS

appenderctl start
sleep 3
appenderctl status
sleep 3
cpsctl start
sleep 3
cpsctl status
sleep 3
dmactl start
sleep 30
dmactl status
sleep 3
exit
STARTUP_APPS

else
if ($APP == dcs) ; then
su - dotomi <<SHUT_DOWN_APPS

dcsctl stop
sleep 3
dcsctl stopf
sleep 3
dcsctl status
sleep 3
appenderctl stop
sleep 3
appenderctl status
sleep 3
cpsctl stop
sleep 3
cpsctl stopf
sleep 3
cpsctl status
exit
SHUT_DOWN_APPS

sleep 10
rm /opt/jave/jdk1.7
ln -s /usr/java/jdk-1.7.0_4* /opt/java/jdk1.7

su - dotomi <<STARTUP_APPS

appenderctl start
sleep 3
appenderctl status
sleep 3
cpsctl start
sleep 3
cpsctl status
sleep 3
dcsctl start
sleep 30
dcsctl status
sleep 3
exit
STARTUP_APPS


else

#delete oldsym link /opt/java/jdk1.7 create new ln 
#ln -s /usr/java/jdk-1.7.0_4* /opt/java/jdk1.7 
#switch to dotomi user and start apps
su - dotomi <<STARTUP_APPS

appenderctl start
sleep 3
appenderctl status
sleep 3
cpsctl start
sleep 3
cpsctl status
sleep 3
dmactl start
sleep 30
dmactl status
sleep 3
exit
STARTUP_APPS
# exit

