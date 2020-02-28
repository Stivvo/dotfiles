#!/bin/bash

CLR="$(grim -g "$(slurp -p)" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n 1)"
SLCT="$(echo -e "hex\nsrgb" | dmenu -i -p "color rformat")"

if [ $SLCT == "hex" ]
then
    CLR="$(echo $CLR | awk '{print $3}')"
elif [ $SLCT == "srgb" ]
then
    CLR="$(echo $CLR | awk '{print $2}')"
fi

notify-send.sh $CLR
echo $CLR | wl-copy

