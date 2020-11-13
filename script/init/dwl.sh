#!/bin/dash

mako &
corectrl &
waybar &
monitor.sh r
background.sh &
udiskie --appindicator --tray --automount --notify --file-manager "alacritty --title 'FFF disk' -e fff " &
kdeconnect-indicator &
redshift.sh &
normal.mice.sh
pikaur -Syuw --noconfirm &&
    notify-send.sh -r 10000 "Updated pacman packages" ||
    notify-send.sh -r 10000 "ERROR updating packages"
