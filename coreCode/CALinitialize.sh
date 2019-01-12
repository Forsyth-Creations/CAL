#!/bin/bash

#Starting Code for the CAL line of products
#To run at startup. Just ./myStartingScript in your .bashrc file

authCode=$(sed '' /home/pi/CAL/config/authCode.txt| xargs | sed 's/ /,/g')
echo $authCode


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
echo " /______/  /__/   \__\  \_____\   V.2  "
echo " "
echo "COMPUTER AUTOMATED LIGHTING"
echo " "
#echo "Checking GitHub for Updates..."
cd 
echo " "

sleep 3

#Getting Rid of Spaces
cd /home/pi/CAL/Music
echo " "
echo "Getting rid of spaces"
sleep 1
find . -depth -name '* *' \
| while IFS= read -r f ; do mv -i "$f" "$(dirname "$f")/$(basename "$f"|tr ' ' _)" ; done
sleep 1

cd
echo " "
#sleep 2
#echo "Mounting USB..."
#sudo mount /dev/sda1 usbDevice
#echo " "

sleep 1
echo "Making playlist from GitHub songs"
cd /home/pi/lightshowpi/tools
echo /home/pi/CAL/Music | python /home/pi/lightshowpi/tools/playlist_generator.py
echo " "
echo "Playlist was created"
echo " "

sleep 1

#sudo killall blynk
#sleep 1
#echo "Running Blynk for this unit. Please change Auth code if CAL installed on new unit"
#cd /home/pi/blynk-library/linux/ && sudo ./blynk --token=$authCode &
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

#Begin IR Library
cd /home/pi/CAL/infaredControl_Alpha/
nohup ./IR_remote_GPIO3.py &


echo "All startup procedures have been run, and you're ready to go! Type anything to exit"

cd
exit

