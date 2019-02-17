cd home/pi/CAL/config
authCode = sed -n '4p' < overrides.cfg
echo ${authCode:10}
