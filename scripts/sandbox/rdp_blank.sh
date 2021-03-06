#!/bin/bash

#rdesktop to a windows server and based on the available display ,adjust the geometry of the window

#print to STDOUT the type of display question and read answer into the variable
echo "Laptop, Dock, or TV?"; read displayType
#Ask which host to RDP to and read into a variable
echo "What are you RDP'ing too?"; read target
# convert the displayType variable to either all lowercase or all uppercase and execute the proper command
if  [ ${displayType,,} = laptop ]
	then rdesktop -u <USERNAME> -d CORP -p <PASSWORD> -g 95% $target'.corp.valueclick.com'
elif [ ${displayType^^} = TV ]
        then rdesktop -u <USERNAME> -d CORP -p <PASSWORD> -g 50% $target'.corp.valueclick.com'
elif [ ${displayType,,} = dock ]
	then rdesktop -u <USERNAME> -d CORP -p <PASSWORD> -g 50% $target'.corp.valueclick.com'

fi;
