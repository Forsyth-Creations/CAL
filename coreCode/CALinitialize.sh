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

#----------Getting Rid of Spaces------------------
cd /home/pi/CAL/Music
echo " "
echo "Getting rid of spaces"
echo -ne '#############              (50%)\r'
find . -depth -name '* *' \
| while IFS= read -r f ; do mv -i "$f" "$(dirname "$f")/$(basename "$f"|tr ' ' _)" ; done
cd
#----------Mount USB Device (If Needed) -----------
#echo "Mounting USB...
#sudo mount /dev/sda1 usbDevice
#echo " "
#--------Make Playlist from Songs------------------
echo "Making playlist from GitHub songs"
echo -ne '#############              (75%)\r'
cd /home/pi/lightshowpi/tools
echo /home/pi/CAL/Music | python /home/pi/lightshowpi/tools/playlist_generator.py &> /dev/null &
echo "Playlist was created"
#--------Kill All Blynk Scripts--------------------
sudo killall blynk
sleep 2
#echo "Running Blynk"
#------------Activate Blynk-----------------------
if [ $blynkActivationState = "true" ] || [ $blynkActivationState = "True" ]
then
	echo "Running Blynk for this unit. Please change Auth code if CAL installed on new unit"
	cd /home/pi/blynk-library/linux/ && sudo ./blynk --token=$authCode &> /dev/null &
fi
echo "You're all ready to go!"
exit

