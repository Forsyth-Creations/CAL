#!/bin/bash

pinsUsed=(0 1 2 3 4 5 6 21) # Pins Used for the relay board, based on wiringPi specs

for item in ${pinsUsed[*]} # For Every item in the pinsUsed list
do
        gpio mode $item out # Set gpio pinMode to OUT
        gpio write $item 1 # Write high to the designated pin
        #sleep 0.1 #Delay 
		#printf "   %s\n" $item # Lists item actived
done

exit
