#!/bin/bash

grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') $(~/prog/dotfiles/script/shot/date.sh)

