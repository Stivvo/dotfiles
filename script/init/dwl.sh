#!/bin/dash

mako &
corectrl &
waybar &
monitor.sh r
background.sh &
redshift -l 45.47:9.19 -t 6500:4500 -m wayland &
udiskie.sh &
update.sh &
kdeconnect-indicator &
normal.mice.sh
