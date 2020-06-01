#!/bin/bash

FILE1="/home/stefano/.cache/screen/status.txt"
FILE2="/home/stefano/.cache/screen/rotation.txt"

VAR=$(cat $FILE1)
VAR2=$(cat $FILE2)

if [ $1 == "s" ]
then
    VAR=$[VAR+1]
elif [ $1 == "t" ]
then
    VAR2=$[VAR2+1]
fi

if [ $VAR -gt 3 ]
then
    VAR=1
fi

if [ $VAR2 -gt 2 ]
then
    VAR2=1
fi

case "$VAR" in
    "1") # monitor
        swaymsg "output DP-2 pos 0 0 enable"
        swaymsg "output HDMI-A-1 disable"
        notify-send.sh "monitor"
        ;;
    "2") # tv
        swaymsg "output HDMI-A-1 pos 0 0 enable"
        swaymsg "output DP-2 disable"
        notify-send.sh "tv"
        ;;
    "3") # double
        swaymsg "output DP-2 pos 1920 0 enable"
        swaymsg "output HDMI-A-1 pos 0 0 enable"
        notify-send.sh "double"
        ;;
esac

if [ "$VAR2" == "1" ]
then
    swaymsg output DP-2 transform "0"
else
    swaymsg output DP-2 transform "270"
fi

echo "$VAR" > $FILE1
echo "$VAR2" > $FILE2