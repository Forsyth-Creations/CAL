
#build script for the CAL libraries (Blynk and LightShowPi)
echo "Are you sure you'd like to install CAL, which "
echo  "will also install Blynk, LightShowPi, and WiringPi"
echo -n "repositories? (y/n)"
read answer

if echo "$answer" | grep -iq "^y" ;then
    echo "Good choice! The install will being shortly"
    sleep 3
	sudo apt-get update && sudo apt-get upgrade
	cd ~
	
	#BLYNK Install
	echo "Installing Blynk"
	echo -ne '                          (00%)\r'
	git clone https://github.com/blynkkk/blynk-library.git
	git checkout dab48f7c89f3eb7d8a6c09a0b4137813644b6817
	sleep 1
	echo -ne '#############              (50%)\r'
	cd blynk-library/linux
	make clean all target=raspberry
	echo "type this to run blynk: sudo ./blynk --token=YourAuthToken"
	sleep 3
	echo -ne '#######################   (100%)\r'
	echo -ne '\n'
	echo "Blynk Installed"
	sleep 1
	
	#Lightshowpi Installing
	cd ~
	echo "Installing LightshowPi"
	# Install git (if you don't already have it)
	sudo apt-get install git-core
	# Clone the repository to /home/pi/lightshowpi
	cd ~
	git clone https://togiles@bitbucket.org/togiles/lightshowpi.git
	# Grab the stable branch
	cd lightshowpi
	git fetch && git checkout stable
	
	#echo "Installing WiringPi"
else
    echo "Okay, maybe next time"
	#sleep 1
fi
