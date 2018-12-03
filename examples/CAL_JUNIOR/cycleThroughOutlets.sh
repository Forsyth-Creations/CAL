#!/bin/bash

pinsUsed=(4 1 16 15) #Pins Used for the relay board, based on wiringPi specs

for item in ${pinsUsed[*]} #Turn all pins off to start
do
        gpio mode $item out #Set gpio pinMode to OUT
        gpio write $item 1 #Write low to the designated pin
        #sleep 0.1 #Delay If you want that
	#printf "   %s\n" $item #Lists item actived
done

for item in ${pinsUsed[*]} #Turn them all on one after another
do
        gpio mode $item out #Set gpio pinMode to OUT
        gpio write $item 0 #Write low to the designated pin
		printf "   %s\n" $item #Lists item actived
        sleep 4 #Delay 
		gpio write $item 1 #Write low to the designated pin
done

for item in ${pinsUsed[*]} #turn all pins on
do
        gpio mode $item out #Set gpio pinMode to OUT
        gpio write $item 0 #Write low to the designated pin
        #sleep 0.1 #Delay If you want that
	#printf "   %s\n" $item #Lists item active
done

exit
