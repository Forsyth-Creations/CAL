#!/bin/bash

#Creates a script that will copy your CAL preferences into the Blynk lightshow settings

#pinsActiveHigh - line 91 in defaults.cfg with: active_low_mode = no

#pinsUsed - line 153 in defaults.cfg with: gpio_pins = 0,1,2,3,4,5,6,7

#lightshowpi config - line 687 in defaults.cfg with: 
#options off, server, client, serverjson
#networking = off

#use sed

# --- Testing to see if the settings override file exists ---
FILE=/home/pi/CAL/config/overrides.cfg
if test -f "$FILE"; 
then
    printf "The Overrides File Exists \n"
else
    printf "No Such File Exists. Using Settings.txt \n"
    FILE=/home/pi/CAL/config/settings.txt
fi
#-----------------------------------------------------------

#------------- Grabbing existing settings ------------------
active_low_mode=$(sed -n '10p' < $FILE)
active_low_mode=${active_low_mode:15}
gpio_pins=$(sed -n '14p' < $FILE)
gpio_pins=${gpio_pins:9}
networking=$(sed -n '15p' < $FILE)
networking=${networking:11}
#----------------------------------------------------------

if [ "$active_low_mode" == "0" ]
then
    active_low_mode = "no"
else
    active_low_mode = "yes"
fi

#Convert sapces to commas
#sed -e 's/\s\+/,/g' $gpio_pins > $gpio_pins

gpio_pins=`echo $gpio_pins | sed 's/ /,/g'`

printf "%s \n" $gpio_pins
