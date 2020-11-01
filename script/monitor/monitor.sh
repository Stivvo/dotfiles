#!/bin/bash

FILE="${XDG_CACHE_HOME}/monitor/status.txt"
VAR=$(cat $FILE)

END=0
COUNT=0

while [ $END = 0 ]
do
    [ "$1" == "r" ] || ((VAR++))
    [ $VAR -gt 4 ] && VAR=1

    case "$VAR" in
        "1") # monitor
            wlr-randr | fgrep DP-2 && {
                wlr-randr --output DP-2 --pos 0,0 --on
                wlr-randr --output HDMI-A-1 --off
                wlr-randr --output HDMI-A-2 --off

                notify-send.sh "monitor"
                END=1
            }
            ;;
        "2") # tv
            wlr-randr | fgrep HDMI-A-1 && {
                wlr-randr --output HDMI-A-1 --pos 0,0 --on
                wlr-randr --output DP-2 --off
                wlr-randr --output HDMI-A-2 --off

                notify-send.sh "tv"
                END=1
            }
            ;;
        "3") # double
            wlr-randr | fgrep HDMI-A-1 &&
            wlr-randr | fgrep DP-2  && {
                wlr-randr --output HDMI-A-1 --pos 0,0 --on
                notify-send.sh "double"

                wlr-randr --output DP-2 --pos 1920,0 --on
                notify-send.sh "double"

                wlr-randr --output HDMI-A-2 --off
                END=1
            }
            ;;
        "4") # cinema
            wlr-randr | fgrep HDMI-A-2 && {
                wlr-randr --output HDMI-A-2 --pos 0,0 --on
                wlr-randr --output HDMI-A-1 --off
                wlr-randr --output DP-2 --off

                notify-send.sh "cinema"
                END=1
            }
    esac
    ((COUNT++))
done

echo "$VAR" > $FILE
