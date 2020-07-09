#!/bin/bash

FILE="${XDG_CACHE_HOME}/screen/rotation.txt"
VAR=$(cat $FILE)

((VAR++))

[ $VAR -gt 2 ] && VAR=1

if [ $VAR = 1 ]
then
    swaymsg output DP-1 transform "0"
else
    swaymsg output DP-1 transform "270"
fi

echo "$VAR" > $FILE
