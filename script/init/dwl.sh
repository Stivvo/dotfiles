#!/bin/dash

mako &
corectrl &
waybar &
monitor.sh r
background.sh &

redshift -l 45.47:9.19 -t 6500:4500 -m wayland &
udiskie --appindicator --tray --automount --notify --file-manager "alacritty --title 'FFF disk' -e fff " &
/usr/bin/pikaur -Syuw --noconfirm &&
    /usr/bin/notify-send.sh -r 10000 "Updated pacman packages" ||
    /usr/bin/notify-send.sh -r 10000 "ERROR updating packages" &

kdeconnect-indicator &
normal.mice.sh
