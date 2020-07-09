#!/bin/bash

FILE="${XDG_CACHE_HOME}/screen/status.txt"
VAR=$(cat $FILE)

END=0
COUNT=0

while [ $END = 0 ]
do
    [ "$1" == "r" ] || ((VAR++))
    [ $VAR -gt 4 ] && VAR=1

    case "$VAR" in
        "1") # monitor
            swaymsg -t get_outputs | fgrep DP-1 && {
                swaymsg output DP-1 pos 0 0 enable
                swaymsg output HDMI-A-1 disable
                swaymsg output HDMI-A-2 disable

                swaymsg focus output DP-1
                notify-send.sh "monitor"
                END=1
            }
            ;;
        "2") # tv
            swaymsg -t get_outputs | fgrep HDMI-A-1 && {
                swaymsg output HDMI-A-1 pos 0 0 enable
                swaymsg output DP-1 disable

                swaymsg focus output HDMI-A-1
                notify-send.sh "tv"
                END=1
            }
            ;;
        "3") # double
            swaymsg -t get_outputs | fgrep HDMI-A-1 &&
            swaymsg -t get_outputs | fgrep DP-1 && {
                swaymsg output HDMI-A-1 pos 0 0 enable
                swaymsg focus output HDMI-A-1
                notify-send.sh "double"

                swaymsg output DP-1 pos 1920 0 enable
                swaymsg focus output DP-1
                notify-send.sh "double"

                END=1
            }
            ;;
        "4") # cinema
            swaymsg -t get_outputs | fgrep HDMI-A-2 && {
                swaymsg output HDMI-A-2 enable
                swaymsg output HDMI-A-1 disable
                swaymsg output DP-1 disable

                swaymsg focus output HDMI-A-2
                notify-send.sh "cinema"
                END=1
            }
    esac
    ((COUNT++))
done

echo "$VAR" > $FILE
