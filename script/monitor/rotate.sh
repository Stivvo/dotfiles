#!/bin/dash

FILE="${XDG_CACHE_HOME}/monitor/rotation.txt"
if [ -f $FILE ]
then
    ROTATE=$(cat $FILE)
else
    ROTATE=0
fi

ROTATE=$((ROTATE+1))
[ $ROTATE -gt 2 ] && ROTATE=1

if [ $ROTATE = 1 ]
then
    ACTION="normal"
else
    ACTION=90
fi

MONITOR=$(cat "${XDG_CACHE_HOME}/monitor/status.txt")

case $MONITOR in
    "1")
        wlr-randr | fgrep HDMI-A-1 && {
            wlr-randr --output HDMI-A-1 --on --pos 1920,0
            wlr-randr --output DP-1 --pos 0,0
            wlr-randr --output DP-1 --transform $ACTION --pos 0,0
            wlr-randr --output HDMI-A-1 --off
        } || {
            wlr-randr --output DP-1 --transform $ACTION --pos 0,0
            wlr-randr --output eDP-1 --transform $ACTION --pos 0,0
        }
        ;;
    "3")
        wlr-randr --output DP-1 --transform $ACTION --pos 0,0
        ;;
esac

echo "$ROTATE" > $FILE
