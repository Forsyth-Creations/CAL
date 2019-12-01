#!/bin/bash

cd /home/pi/CAL/config
pinsUsed=$(sed -n '14p' < overrides.cfg)
pinsUsed=${pinsUsed:9}

pinsHigh=$(sed -n '14p' < overrides.cfg)
pinsHigh=${pinsHigh:15}

#pinsUsed=(4 1 16 15) #Pins Used for the relay board, based on wiringPi specs

for item in ${pinsUsed[*]} #For Every item in the pinsUsed list
do
        gpio mode $item out #Set gpio pinMode to OUT
        gpio write $item pinsHigh #Turn the designated pin on
        sleep 0.5 #Delay (If you want that)
	printf "   %s\n" $item #(Lists item actived)
done

exit
