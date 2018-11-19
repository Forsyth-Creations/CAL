#content = `sed -n "$2 p" authCode.txt`
#content=$(sed -n "$2 p" authCode.txt)
#echo $content

#cat authCode.txt

value=$(<settings.txt)
echo "$value"

sleep 4