#!/bin/bash

CURRENTBG=/dev/shm/background
[ -z "$(cat $CURRENTBG)" ] && echo "0" > $CURRENTBG
ID="$(cat $CURRENTBG)"
let "ID = $ID + 1"
echo $ID > $CURRENTBG

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
    [ "$ID" != "$(cat $CURRENTBG)" ] && CONTINUE="false"
done
