#!/bin/bash

PATH="prog/dotfiles/script/screen/"
CAT=$(/usr/bin/cat "${PATH}status.txt")

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
    /usr/bin/xrandr --output DisplayPort-0 --off --output DisplayPort-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output HDMI-A-1 --off --output DVI-D-0 --off
    /usr/bin/notify-send "monitor"
        ;;
    "2") # tv
    /usr/bin/xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-1 --off --output DVI-D-0 --off
    /usr/bin/notify-send "TV"
        ;;
    "3") # double
    /usr/bin/xrandr --output DisplayPort-0 --off --output DisplayPort-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-1 --off --output DVI-D-0 --off
    /usr/bin/notify-send "double"
        ;;
esac

echo "$VAR" > "${PATH}status.txt"

