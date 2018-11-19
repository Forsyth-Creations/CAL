#content = `sed -n "$2 p" authCode.txt`
#content=$(sed -n "$2 p" authCode.txt)
#echo $content

#cat authCode.txt

content = sed -n '2 p' < authCode.txt

#sed -n '1,2p;3q' authCode.txt

echo content

sleep 4