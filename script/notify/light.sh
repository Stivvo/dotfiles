#!/bin/bash

LIGHTFILE=$XDG_CACHE_HOME/light.var.txt
BRIGHTNESS=$(cat $LIGHTFILE)

if [ "$1" == "u" ]
then
    let BRIGHTNESS+=5
elif [ "$1" == "d" ]
then
    let BRIGHTNESS-=5
fi

if [ $BRIGHTNESS -ge "100" ]
then
    BRIGHTNESS="100"
elif [ $BRIGHTNESS -le "0" ]
then
    BRIGHTNESS="0"
fi

echo $BRIGHTNESS > $LIGHTFILE
sudo light -S $BRIGHTNESS

notify-send.sh  "Brightness ${BRIGHTNESS}%"  \
    -t 2000 \
    -i $HOME/.local/dotfiles/notify/brightness-icon.png \
    -h int:value:${BRIGHTNESS} \
    --replace-file=/tmp/brightness-notification \
    -h string:synchronous:brightness-change \
