#!/bin/bash
# Version:0.1
# File Name: t.sh
# Author: xianbao.wang
# email: breakwang0929@gmail.com
# Created Time: 二 12/24 15:23:33 2019

add_prefix_zero()
{
    local num=$1
    if [ "$num" -lt 10 ]
	then
		echo "0${num}"
	else
		echo "${num}"
	fi
}

for d in `seq 4 22`
do
    d=$(add_prefix_zero $d)

    dt="201912${d}"

	for h in `seq 00 23`
	do
		h=$(add_prefix_zero $h)
		#echo $dt $h
		while [ $h -eq 20 ]
        do
            echo " $h eq 20"
            break
        done
	done
done

hour=00
while [ $hour -eq 00 ];
do
    echo $hour
done
