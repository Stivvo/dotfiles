#!/bin/bash

tmpfile="/tmp/smartGapsBorders.txt"
state="$(cat $tmpfile)"

#echo $state

if [ "$state" == "off" ]
then
    swaymsg smart_gaps on
    swaymsg smart_borders on
    echo "on" > $tmpfile
else
    swaymsg smart_gaps off
    swaymsg smart_borders off
    echo "off" > $tmpfile
fi
