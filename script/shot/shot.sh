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

select="$(echo -e "default\nlast\nchoose" | dmenu -i -p "${scrnName} folder")"

case "$select" in
    "default")
        scrnPath="/home/stefano/screen/${scrnName}"
        ;;
    "last")
        scrnPath=$(cat $XDG_CACHE_HOME/fff/.fff_d)/${scrnName}
        ;;
    "choose")
        alacritty -e fish -c f
        scrnPath=$(cat $XDG_CACHE_HOME/fff/.fff_d)/${scrnName}
        ;;
    *)
        rm $tmpPath
        ;;
esac

if [ -z "${select}" ]
then
    notify-send.sh "DELETED\n$scrnName"
else
    mv $tmpPath $scrnPath
    notify-send.sh $scrnPath -i $scrnPath --default-action="urxvt -e ranger --selectfile=${scrnPath}"
    #selectfile is a legacy option
fi

