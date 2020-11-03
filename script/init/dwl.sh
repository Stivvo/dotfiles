#!/bin/dash

mako &
corectrl &
waybar &
monitor.sh r
background.sh &

redshift -l 45.47:9.19 -t 6500:4500 -m wayland &
udiskie --appindicator --tray --automount --notify --file-manager "alacritty --title 'FFF disk' -e fff " &

kdeconnect-indicator &
normal.mice.sh
pikaur -Syuw --noconfirm &&
    notify-send.sh -r 10000 "Updated pacman packages" ||
    notify-send.sh -r 10000 "ERROR updating packages"
