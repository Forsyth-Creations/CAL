#!/bin/bash

#Starting Code for the CAL line of products
#To run at startup. Just ./myStartingScript in your .bashrc file

#authCode=$(sed '' /home/pi/CAL/config/authCode.txt| xargs | sed 's/ /,/g')
#echo $authCode

cd /home/pi/CAL/config
authCode=$(sed -n '4p' < overrides.cfg)
#authCode=$(sed '4p' /home/pi/CAL/config/overrides.cfg| xargs | sed 's/ /,/g')
#echo ${authCode:9}
authCode=${authCode:9}

blynkActivationState=$(sed -n '2p' < overrides.cfg)
lightshowActivationState=$(sed -n '3p' < overrides.cfg)
blynkActivationState=${blynkActivationState:8}
lightshowActivationState=${lightshowActivationState:12}
echo $blynkActivationState
echo $lightshowActivationState

#Pull Latest code from github to run

cd /home/pi/CAL/
git fetch --all
git reset --hard origin/master
cd Music/	
git pull 

#begin main script

clear
cd
echo " "
echo 'To whomever may have accessed my lightshow system.'
echo "Welcome! If you're a hacker, you're not welcome"
echo "If you're a friend helping me re-work a failed"
echo "code, I'm happy to have you. In whichever case,"
echo "have a nice day, and happy coding! "
echo " "
echo "     _______   ___   ___               "
echo "    /  ____/  / _ \  \  \              "
echo "   /  /      / /_\ \  \  \             "
echo "  /  /___   /  / \  \  \  \___         "
echo " /______/  /__/   \__\  \_____\   V.3  "
echo " "
echo "COMPUTER AUTOMATED LIGHTING"
echo " "
#echo "Checking GitHub for Updates..."
cd 
echo " "

#sleep 3

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
echo /home/pi/CAL/Music | python /home/pi/lightshowpi/tools/playlist_generator.py
echo " "
echo "Playlist was created"
echo " "

#sleep 1

sudo killall blynk
sleep 2
echo "Running Blynk for this unit. Please change Auth code if CAL installed on new unit"
#echo "Running Blynk"

if [ $blynkActivationState = "true" ] || [ $blynkActivationState = "True" ]
then
cd /home/pi/blynk-library/linux/ && ./blynk --token=$authCode &
echo "Running Blynk"
fi
#sleep 8

#Getting Example Scripts Ready
echo "Getting Example Scripts Ready"

examplePath='/home/pi/CAL/examples/'

cd /home/pi/CAL/examples/CAL

chmod +x allOn.sh
chmod +x allOff.sh

cd /home/pi/CAL/examples/CAL_JUNIOR

chmod +x allOn.sh
chmod +x allOff.sh
chmod +x cycleThroughOutlets.sh

cd /home/pi/CAL/examples/CAL_MINI

chmod +x allOn.sh
chmod +x allOff.sh

cd /home/pi/CAL/lightshowCommands

chmod +x beginShow.sh
chmod +x stopShow.sh


cd 

cd /home/pi/CAL/Debugging/
chmod +x cycleAll.sh


echo "All startup procedures have been run, and you're ready to go! Type anything to exit"

cd
exit

