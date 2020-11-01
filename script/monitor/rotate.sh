#!/bin/bash

FILE="${XDG_CACHE_HOME}/monitor/rotation.txt"
ROTATE=$(cat $FILE)

((ROTATE++))
[ $ROTATE -gt 2 ] && ROTATE=1

if [ $ROTATE = 1 ]
then
    ACTION="normal"
else
    ACTION=90
fi

echo "$ROTATE" > $FILE
MONITOR=$(cat "${XDG_CACHE_HOME}/monitor/status.txt")

case $MONITOR in
    "1")
        wlr-randr | fgrep HDMI-A-1 && {
            wlr-randr --output HDMI-A-1 --on --pos 0,0
            wlr-randr --output DP-2 --pos 1920,0
            wlr-randr --output DP-2 --transform $ACTION --pos 1920,0
            wlr-randr --output HDMI-A-1 --off
        } || {
            wlr-randr --output DP-2 --transform $ACTION --pos 0,0
        }
        ;;
    "3")
        wlr-randr --output DP-2 --transform $ACTION --pos 1920,0
        ;;
esac
