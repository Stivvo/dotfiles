#!/bin/bash

tmpfile="/tmp/zero.txt"
state="$(cat $tmpfile)"

#echo $state

if [ "$state" == "OFF" ]
then
    swaymsg smart_gaps off
    swaymsg smart_borders off
    echo "OFF" > /tmp/smartGapsBorders.txt
    swaymsg border pixel 3
    swaymsg gaps inner current set 10
    swaymsg gaps outer current set 0
    state="ON"
else
    swaymsg border none
    swaymsg gaps inner current set 0
    swaymsg gaps outer current set 0
    state="OFF"
fi

echo $state > $tmpfile
notify-send.sh "borders and gaps\n${state}" \
    -t 2000 \
    --replace-file=/tmp/gapsBorder-notification
