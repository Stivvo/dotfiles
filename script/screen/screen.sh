#!/bin/bash

CAT=$(/usr/bin/cat "/tmp/status.txt")

if [ $1 == "r" ]
then
    VAR=$CAT
elif [ $1 == "s" ]
then
    VAR=$[CAT+1]
else
    VAR=$1
fi

if [ $VAR -gt 3 ]
then
    VAR=1
fi

case "$VAR" in
    "1") # monitor
    swaymsg "output DP-2 pos 0 0 enable"
    swaymsg "output HDMI-A-1 disable"
        ;;
    "2") # tv
    swaymsg "output HDMI-A-1 pos 0 0 enable"
    swaymsg "output DP-2 disable"
        ;;
    "3") # double
    swaymsg "output DP-2 pos 1920 0 enable"
    swaymsg "output HDMI-A-1 pos 0 0 enable"
        ;;
esac

echo "$VAR" > "/tmp/status.txt"

