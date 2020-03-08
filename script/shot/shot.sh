#!/bin/bash

scrnName="scrn_$(date +'%Y-%m-%d_%H-%M-%S').png"
select="$(echo -e "default\nchoose" | dmenu -i -p "${scrnName} folder")"

if [ $select == "default" ]
then
    scrnPath="/home/stefano/screen/${scrnName}"
else
    urxvt -e ranger --show-only-dirs --choosedir=/tmp/scrnDir.txt
    scrnPath="$(cat /tmp/scrnDir.txt)/${scrnName}"
fi

case "$1" in
    "all")
        grim $scrnPath
        ;;
    "area")
        grim -g "$(slurp)" $scrnPath
        ;;
    "focused")
        grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') $scrnPath
        ;;
esac

notify-send.sh $scrnPath -i $scrnPath --default-action="urxvt -e ranger --selectfile=${scrnPath}"
#selectfile is a legacy option
