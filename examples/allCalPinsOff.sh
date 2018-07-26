#!/bin/bash

pinsUsed=(4 1 16 15)


#for i in `seq 0 25`;
#do
 # gpio mode $i out
#done

#for i in `seq 0 25`;
#do
  #echo $i
  #gpio write $i 1
 # sleep 1
#done


echo "Pins Used"
for item in ${pinsUsed[*]}
do
        gpio mode $item out
        gpio write $item 1
        sleep 0.1
	printf "   %s\n" $item
done
