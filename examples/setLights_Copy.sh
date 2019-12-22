#!/bin/bash

cd /home/pi/CAL/config
pinsUsed=$(sed -n '14p' < overrides.cfg)
pinsUsed=${pinsUsed:9}

pinsState=$(sed -n '10p' < overrides.cfg)
pinsState=${pinsState:15}

lightShowState=$(sed -n '3p' < overrides.cfg)
lightShowState=${lightShowState:13}

SYNCHRONIZED_LIGHTS_HOME=/home/pi/lightshowpi

printf "Pins used are %s\n" $pinsUsed
printf "Lightshowpi, based on config, is: %s\n" $lightShowState

for arg in "$@"
do
    if [ "$arg" == 'on' ] || [ "$arg" == 'ON' ]
    then
        printf "Lights Turned On\n"
        echo "im here"
        #if the lightshow preference is true, activate and exit code
        if [$lightShowState == 'true'] || [$lightShowState == 'True']
        then
            #turn the light show on if its supposed to be active
            printf "Starting LIGHTSHOWPI"
            cd $SYNCHRONIZED_LIGHTS_HOME/bin/ && ./start_music_and_lights
            exit 0
        fi
    else
	    printf "Lights Turned Off\n"
        if [$lightShowState == 'true'] || [$lightShowState == 'True']
        then
            #turn the light show off if its supposed to be active
            printf "Stopping LIGHTSHOWPI"
            cd $SYNCHRONIZED_LIGHTS_HOME/bin/ && ./stop_music_and_lights
        fi

        #still turn all the lights off after the show (just to be safe)
        if [ $pinsState == 1 ]
        then
            pinsState=0
        else
	        pinsState=1
        fi
    fi
done

printf "State is set to: %s\n" $pinsState 

for item in ${pinsUsed[*]} #For Every item in the pinsUsed list
do
        gpio mode $item out #Set gpio pinMode to OUT
        gpio write $item $pinsState #Turn the designated pin on
        sleep 0.2 #Delay (If you want that)
	    printf "   %s\n" $item #(Lists item actived)
done

exit 0
