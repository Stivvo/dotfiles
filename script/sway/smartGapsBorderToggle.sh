#!/bin/bash

tmpfile="/tmp/smartGapsBorders.txt"
state="$(cat $tmpfile)"

#echo $state

if [ "$state" == "OFF" ]
then
    swaymsg smart_gaps on
    swaymsg smart_borders on
    state="ON"
else
    swaymsg smart_gaps off
    swaymsg smart_borders off
    state="OFF"
fi

echo $state > $tmpfile
notify-send.sh "smart\n${state}" \
    -t 2000 \
    --replace-file=/tmp/smartGapsBorder-notification
