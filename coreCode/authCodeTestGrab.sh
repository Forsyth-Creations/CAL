cd /home/pi/CAL/config
authCode=$(sed -n '4p' < overrides.cfg)
#authCode=$(sed '4p' /home/pi/CAL/config/overrides.cfg| xargs | sed 's/ /,/g')
echo ${authCode:9}
