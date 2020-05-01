#!/bin/bash

PA="/home/stefano/wallpapers/selected/"
P="/home/stefano/prog/dotfiles/script/background/"
LIST="/tmp/listBg.txt"

while true
do
    ls $PA > $LIST
    L=$(wc -l $LIST | awk '{print $1}')
    R=$[RANDOM % L]
    let R++
    IMG="$(sed -n "${R}p" $LIST)" 
    echo "$R $IMG" > /tmp/currentBg.txt
    swaymsg output "*" bg "${PA}${IMG}" fill
    sleep 30m
done
