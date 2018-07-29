#Test Test

#authCode=$(`sed 's/[^0-9]//g' /home/pi/authCode.txt` | sed 's/ /,/g'``)
authCode=$(sed '' /home/pi/authCode.txt| xargs | sed 's/ /,/g')
echo $authCode

