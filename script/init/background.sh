#!/bin/bash

[ -z "$(cat /dev/shm/background)" ] && echo "0" > /dev/shm/background
ID="$(cat /dev/shm/background)"
let "ID = $ID + 1"
echo $ID > /dev/shm/background

PA="$XDG_PICTURES_DIR/wallpapers/selected/"
P="$HOME/prog/dotfiles/script/background/"
LIST="/dev/shm/listBg"

CONTINUE="true"

while [ "$CONTINUE" = "true" ]
do
    ls $PA > $LIST
    L=$(wc -l $LIST | awk '{print $1}')
    R=$[RANDOM % L]
    let R++
    IMG="$(sed -n "${R}p" $LIST)"
    echo "$R $IMG" > /tmp/currentBg.txt
    pkill swaybg
    swaybg -i "${PA}${IMG}" -m fill &
    echo $ID
    sleep 30m
    [ "$ID" != "$(cat /dev/shm/background)" ] && CONTINUE="false"
done
