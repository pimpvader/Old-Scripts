#!/bin/bash
echo "who ran this script"
whoami
echo "running uptime"
uptime
sleep 3
echo "Here is the hostname"
hostname

echo "switching to the test1 user"
sudo su - test1 <<astest1user
whoami
echo "I am the coolest"
exit
astest1user
echo "I am me again"
whoami

