#!/bin/sh

MaxValue=255 # highest valid IP octet value

echo -n "Enter IP address: "; read ip
echo -n "How many IP addresses do you need: "; read count

baseaddr="$(echo $ip | cut -d. -f1-3)"
lsv="$(echo $ip | cut -d. -f4)"

while [ $count -gt 0 ] 
do
if [ $lsv -eq $MaxValue ] ; then
# here you'll need to increment the third level IP value, 
# but that might cascade into the second, or the first.
# consider the case of 17.255.255.255 + 1
echo "edge case needs to be written"
fi
echo "-A INPUT -s "$baseaddr.$lsv" -p tcp -m state --state NEW,RELATED -m tcp --dport 21 -j ACCEPT" >>IPtab.txt
lsv=$(( $lsv + 1 ))
count=$(( $count - 1 ))
done

exit 0
