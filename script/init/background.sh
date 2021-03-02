#!/bin/dash

CURRENTBG=/dev/shm/background
[ ! -f "$CURRENTBG" ] && echo "0" > $CURRENTBG
IFS= read ID <$CURRENTBG
ID=$(( $ID+1 ))
echo $ID > $CURRENTBG
ID1=$ID
L=78

while [  "$ID1" = "$ID" ]
do
	R=$(( $(date +%s)%L ))
    IMG="$(sed -n "${R}p" $XDG_PICTURES_DIR/wallpapers/list)"
    pkill swaybg
    swaybg -i "${PA}${IMG}" -m fill &
    sleep 30m
	read ID <$CURRENTBG
done
