# CAL 
"CAL" stands for Computer Automated Lighting (Using Blynk and LightshowPi). The hope is to allow people of varying ages to get into Christmas lightshows, as well as home automation. 

## Parts of the CAL repo:
	Blynk
	Lightshowpi


# Thing to Consider

## Add to end of .bashrc

cd /home/pi/CAL/coreCode/ && sudo bash ./CALinitialize.sh &

## Add to Crontab: Simple On and Off

First, type the following:

crontab -e

The second option is often the easiest to work with. Below is the code required to copy/paste. Remember to change the directory/file name to properly address your hardware version:

0 18 * * * cd /home/pi/CAL/examples/CAL_JUNIOR/ && ./allOn.sh && cd >/dev/null 2>&1

0 23 * * * cd /home/pi/CAL/examples/CAL_JUNIOR/ && ./allOff.sh && cd >/dev/null 2>&1

## Add to Crontab: Starting the lightshowpi

First, type the following:

crontab -e

The second option is often the easiest to work with. Below is the code required to copy/paste. Remember to change the directory/file name to properly address your hardware version:

10 17 * * * $SYNCHRONIZED_LIGHTS_HOME/bin/start_music_and_lights >> $SYNCHRONIZED_LIGHTS_HOME/logs/music_and_lights.play 2>&1 &

00 23 * * * $SYNCHRONIZED_LIGHTS_HOME/bin/stop_music_and_lights >> $SYNCHRONIZED_LIGHTS_HOME/logs/music_and_lights.stop 2>&1 &

## Add A Reboot to properly update CAL 

10 23 * * * sudo reboot >/dev/null 2>&1

## Alternate Configuration

0 17 * * * cd /home/pi/CAL/lightshowCommands/ && ./beginShow >/dev/null 2>&1

0 18 * * * cd /home/pi/CAL/lightshowCommands/ && ./stopShow && cd /home/pi/CAL/examples/CAL/ && ./allOn.sh >/dev/null 2>&1
02 18 * * * cd /home/pi/CAL/lightshowCommands/ && ./beginShow >/dev/null 2>&1

0 19 * * * cd /home/pi/CAL/lightshowCommands/ && ./stopShow && cd /home/pi/CAL/examples/CAL/ && ./allOn.sh >/dev/null 2>&1
02 19 * * * cd /home/pi/CAL/lightshowCommands/ && ./beginShow >/dev/null 2>&1

0 20 * * * cd /home/pi/CAL/lightshowCommands/ && ./stopShow && cd /home/pi/CAL/examples/CAL/ && ./allOn.sh >/dev/null 2>&1
02 20 * * * cd /home/pi/CAL/lightshowCommands/ && ./beginShow >/dev/null 2>&1

0 21 * * * cd /home/pi/CAL/lightshowCommands/ && ./stopShow && cd /home/pi/CAL/examples/CAL/ && ./allOn.sh >/dev/null 2>&1
02 21 * * * cd /home/pi/CAL/lightshowCommands/ && ./beginShow >/dev/null 2>&1

0 22 * * * cd /home/pi/CAL/lightshowCommands/ && ./stopShow && cd /home/pi/CAL/examples/CAL/ && ./allOn.sh >/dev/null 2>&1
02 22 * * * cd /home/pi/CAL/lightshowCommands/ && ./beginShow >/dev/null 2>&1

0 23 * * * cd /home/pi/CAL/lightshowCommands/ && ./stopShow && cd /home/pi/CAL/examples/CAL/ && ./allOff.sh >/dev/null 2>&1

10 23 * * * sudo reboot >/dev/null 2>&1





