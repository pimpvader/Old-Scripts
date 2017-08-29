#!/bin/bash
#Written for rolling reboots to apply a bios power settting change and change CPU polling cycle. after reboot run dma_startup.sh
#to restart dma and the flume agent

#Apply power c state change

#/home2/itadmin/pwrchangeold.sh
#switch to dotomi user and shutdown apps
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
appenderctl stopf
exit
SHUT_DOWN_APPS
#reboot the server and exit
#shutdown -r now \& ; exit

nohup bash -c "/root/bin/fwupdate.sh reboot 2>&1 > /root/fwupdate.$(date +%Y%m%d).log < /dev/null &"

