#!/bin/dash

END=0
FILE="${XDG_CACHE_HOME}/monitor/status.txt"

case $1 in
    [0-9])
        VAR=$1
        ;;
    *)
        if [ -f $FILE ]
        then
            VAR=$(cat $FILE)
        else
            VAR=0
        fi

        [ -z "$1" ] && VAR=$((VAR+1))
        ;;
esac

while [ $END = 0 ]
do
    echo $VAR
    [ $VAR -gt 4 ] && VAR=1

    case "$VAR" in
        "1") # monitor
             wlr-randr | fgrep DP-1 || wlr-randr | fgrep eDP-1 && {
                wlr-randr --output DP-1 --pos 0,0 --on
                wlr-randr --output eDP-1 --on
                wlr-randr --output HDMI-A-1 --off
                wlr-randr --output HDMI-A-2 --off

                notify-send.sh "monitor"
                END=1
            }
            ;;
        "2") # tv
            wlr-randr | fgrep HDMI-A-1 && {
                wlr-randr --output HDMI-A-1 --pos 0,0 --on
                wlr-randr --output DP-1 --off
                wlr-randr --output HDMI-A-2 --off

                notify-send.sh "tv"
                END=1
            }
            ;;
        "3") # double
            wlr-randr | fgrep HDMI-A-1 &&
            wlr-randr | fgrep DP-1  && {
                wlr-randr --output DP-1 --pos 0,0 --on
                notify-send.sh "double"

                wlr-randr --output HDMI-A-1 --pos 1920,0 --on
                notify-send.sh "double"

                wlr-randr --output HDMI-A-2 --off
                END=1
            }
            ;;
        "4") # cinema
            wlr-randr | fgrep HDMI-A-2 && {
                wlr-randr --output HDMI-A-2 --pos 0,0 --on
                wlr-randr --output HDMI-A-1 --off
                wlr-randr --output DP-1 --off
                wlr-randr --output eDP-1 --off

                notify-send.sh "cinema"
                END=1
            }
            ;;
    esac
    VAR=$((VAR+1))
done
echo "$VAR" > $FILE
