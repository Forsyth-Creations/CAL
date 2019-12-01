#!/bin/bash

cd /home/pi/CAL/config
pinsUsed=$(sed -n '14p' < overrides.cfg)
pinsUsed=${pinsUsed:9}

pinsState=$(sed -n '10p' < overrides.cfg)
pinsState=${pinsState:15}

#helps determine if I need to turn the lights
#on or off

for arg in "$@"
do
    if [ "$arg" == "on" ] || [ "$arg" == "ON" ]
    then
        echo "Lights Turned On\n"
    else
	printf "Lights Turned Off\n"
       if [ pinsState == 1 ]
       then
           pinsState= 0
       else
	        pinsState= 1
        fi
    fi
done

printf $pinsState "\n"

#pinsUsed=(4 1 16 15) #Pins Used for the relay board, based on wiringPi specs

for item in ${pinsUsed[*]} #For Every item in the pinsUsed list
do
        gpio mode $item out #Set gpio pinMode to OUT
        gpio write $item pinsState #Turn the designated pin on
        sleep 0.5 #Delay (If you want that)
	printf "   %s\n" $item #(Lists item actived)
done

exit
