#!/bin/bash

cd /home/pi/CAL/config
authCode=$(sed -n '4p' < overrides.cfg)
authCode=${authCode:9}
blynkActivationState=$(sed -n '2p' < overrides.cfg)
lightshowActivationState=$(sed -n '3p' < overrides.cfg)
blynkActivationState=${blynkActivationState:9}
lightshowActivationState=${lightshowActivationState:13}

#Pull Latest code from github to run

#cd /home/pi/CAL/
#git fetch --all
#git reset --hard origin/master
#cd Music/	
#git pull 

cd
echo " "
echo "     _______   ___   ___               "
echo "    /  ____/  / _ \  \  \              "
echo "   /  /      / /_\ \  \  \             "
echo "  /  /___   /  / \  \  \  \___         "
echo " /______/  /__/   \__\  \_____\   V.4  "
echo " "
echo " "


#Getting Rid of Spaces
cd /home/pi/CAL/Music
echo " "
echo "Getting rid of spaces"
#sleep 1
find . -depth -name '* *' \
| while IFS= read -r f ; do mv -i "$f" "$(dirname "$f")/$(basename "$f"|tr ' ' _)" ; done
#sleep 1

cd
echo " "
#sleep 2
#echo "Mounting USB..."
#sudo mount /dev/sda1 usbDevice
#echo " "

#sleep 1
echo "Making playlist from GitHub songs"
cd /home/pi/lightshowpi/tools
echo /home/pi/CAL/Music | python /home/pi/lightshowpi/tools/playlist_generator.py &> /dev/null &
echo " "
echo "Playlist was created"
echo " "

#sleep 1

sudo killall blynk
sleep 2
#echo "Running Blynk"

if [ $blynkActivationState = "true" ] || [ $blynkActivationState = "True" ]
then
	echo "Running Blynk for this unit. Please change Auth code if CAL installed on new unit"
	cd /home/pi/blynk-library/linux/ && sudo ./blynk --token=$authCode &> /dev/null &
fi
#sleep 8

#Getting Example Scripts Ready
#echo "Getting Example Scripts Ready"

examplePath='/home/pi/CAL/examples/'
: '
cd /home/pi/CAL/examples/CAL

#chmod +x allOn.sh
#chmod +x allOff.sh

cd /home/pi/CAL/examples/CAL_JUNIOR

#chmod +x allOn.sh
#chmod +x allOff.sh
#chmod +x cycleThroughOutlets.sh

cd /home/pi/CAL/examples/CAL_MINI

#chmod +x allOn.sh
#chmod +x allOff.sh

cd /home/pi/CAL/lightshowCommands

#chmod +x beginShow.sh
#chmod +x stopShow.sh


cd 

cd /home/pi/CAL/Debugging/
#chmod +x cycleAll.sh

echo " "
echo "All startup procedures have been run, and youre ready to go! Type anything to exit"

cd
' 

exit

