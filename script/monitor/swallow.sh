#!/bin/dash

swaymsg move scratchpad
"$@"
swaymsg scratchpad show
swaymsg floating toggle
