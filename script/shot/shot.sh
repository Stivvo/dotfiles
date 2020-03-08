#!/bin/bash

NAME=~/screen/scrn_$(date +'%Y-%m-%d_%H-%M-%S').png
case "$1" in
    "all")
        grim $NAME
        ;;
    "area")
        grim -g "$(slurp)" $NAME
        ;;
    "focused")
        grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') $NAME
        ;;
esac


