echo -n "Please enter your Blynk Auth Code "
read userInput
if [[ -n "$userInput" ]]
then
    in=$userInput
fi
echo "Thank you. Changing scripts now to match your Auth code"
echo Your Auth Code is $in

cd /home/pi
truncate -s 0 authCode.txt
echo $in  > authCode.txt
