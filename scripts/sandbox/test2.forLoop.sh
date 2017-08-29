declare -i counter
counter=1

for i in `cat $4`; do
    echo $i $1ctl_$2.sh
    (( counter++ ))
#    sleep 120
#    echo $i $1ctl_$3.sh
    if [ $counter -eq 6 ]
        then
	echo "resting for 10 seconds"
	sleep 10
        counter=1
   fi
done
