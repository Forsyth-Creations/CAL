#!/bin/bash
pinsUsed=(0 1 2 3 4 5 6 21) 
for item in ${pinsUsed[*]} 
do
        gpio mode $item out 
        gpio write $item 0 
        #sleep 0.1 Delay 
		#printf "   %s\n" $item Lists item actived
done
exit
