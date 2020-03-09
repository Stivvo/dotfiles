#!/bin/bash

scrnName="scrn_$(date +'%Y-%m-%d_%H-%M-%S').png"
tmpPath="/tmp/${scrnName}"

case "$1" in
    "all")
        grim $tmpPath
        ;;
    "area")
        grim -g "$(slurp)" $tmpPath
        ;;
    "focused")
        grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') $tmpPath
        ;;
esac

select="$(echo -e "default\nchoose\ndelete" | dmenu -i -p "${scrnName} folder")"

case "$select" in
    "default")
        scrnPath="/home/stefano/screen/${scrnName}"
        ;;
    "choose")
        urxvt -e ranger --show-only-dirs --choosedir=/tmp/scrnDir.txt
        scrnPath="$(cat /tmp/scrnDir.txt)/${scrnName}"
        ;;
    "delete")
        rm $tmpPath
        ;;
esac

if [ "${select}" != "delete" ]
then
    mv $tmpPath $scrnPath
    notify-send.sh $scrnPath -i $scrnPath --default-action="urxvt -e ranger --selectfile=${scrnPath}"
    #selectfile is a legacy option
fi

