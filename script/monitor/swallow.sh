#!/bin/bash

swaymsg move scratchpad
"$@"
swaymsg scratchpad show
swaymsg floating toggle
