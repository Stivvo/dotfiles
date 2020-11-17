#!/bin/bash

[ -z "$(cat /dev/shm/background)" ] && echo "0" > /dev/shm/background
ID="$(cat /dev/shm/background)"
let "ID = $ID + 1"
echo $ID > /dev/shm/background

LIST="$XDG_PICTURES_DIR/wallpapers/list"
CONTINUE="true"

while [ "$CONTINUE" = "true" ]
do
    L=$(wc -l $LIST | awk '{print $1}')
    R=$[RANDOM % L]
    let R++
    IMG="$(sed -n "${R}p" $LIST)"
    # echo "$R $IMG" > /dev/shm/currentbg
    pkill swaybg
    swaybg -i "${PA}${IMG}" -m fill &
    # echo $ID
    sleep 30m
    [ "$ID" != "$(cat /dev/shm/background)" ] && CONTINUE="false"
done
