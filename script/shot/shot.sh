#!/bin/bash

scrnName="scrn_$(date +'%Y-%m-%d_%H-%M-%S').png"
tmpPath="$XDG_CACHE_HOME/shot/${scrnName}"

case "$1" in
    "all")
        grim $tmpPath
        ;;
    "area")
        grim -g "$(slurp)" $tmpPath
        ;;
    "focused")
        grim -o $2 $tmpPath
        ;;
    *)
        echo "available commands: \"all\" \"area\" \"focused\""
        exit
        ;;
esac

select="$(echo -e "default\nlast\nchoose" | bemenu -i "${scrnName} folder")"

case "$select" in
    "default")
        scrnPath="${HOME}/screen/${scrnName}"
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
    notify-send.sh $scrnPath -i $scrnPath --default-action="alacritty -e fff '${scrnPath}'"
fi

