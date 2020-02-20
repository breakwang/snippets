#!/bin/bash
# Version:0.1
# File Name: t.sh
# Author: xianbao.wang
# email: breakwang0929@gmail.com
# Created Time: 二 12/24 16:28:39 2019

source ./add_prefix_zero.sh

for d in `seq 4 12`
do
    d=$(add_prefix_zero $d)

    dt="201912${d}"

    for h in `seq 0 13`
    do
        h=$(add_prefix_zero $h)
        echo $dt $h
    done
done
