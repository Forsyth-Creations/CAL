#!/bin/bash

pinsUsed=(0 11 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26) #Pins Used for the relay board, based on wiringPi specs

for item in ${pinsUsed[*]} #For Every item in the pinsUsed list
do
    gpio mode $item out #Set gpio pinMode to OUT
    gpio write $item 0 #Turns lights on
	printf "   %s\n" $item #Lists item actived
	sleep 2 #Delay
	gpio write $item 1 #Turns lights off
	sleep 1
done

exit