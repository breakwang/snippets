#!/bin/bash

_start="20190131 00"
_end="20190211 12"

while [ "$_start" != "$_end" ]
do
    _start=`date -d "-1 hours ago ${_start}" +"%Y%m%d %H"`
    dt=`date -d "${_start}" +"%Y%m%d%H"`
    echo $dt
done
