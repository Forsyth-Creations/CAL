#!/bin/bash

#All pins used are based on the WiringPi configuration. 
#Please go online to determine corresponding 
#hardware pins to software 

pinsUsed=(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25) 

for item in ${pinsUsed[*]} 
do
        gpio mode $item out 
        gpio write $item 0 
        sleep 4 #Delay 
        printf "   %s\n" $item #Lists items
        gpio write $item 1
        sleep 1
done
exit
