#build script for the CAL libraries (Blynk and LightShowPi)
echo "Are you sure you'd like to install CAL, which "
echo  "will also install Blynk, LightShowPi, and WiringPi"
echo -n "repositories? (y/n)"
read answer
if echo "$answer" | grep -iq "^y" ;then
    echo "Good choice! The install will being shortly"
    sleep 3
else
    echo "Okay, maybe next time"
fi
