#!/bin/dash

corectrl &
waybar &
redshift.sh &
monitor.sh r
background.sh &
udiskie --appindicator --tray --automount --notify --file-manager "alacritty --title 'FFF disk' -e fff " &
kdeconnect-indicator &
normal.mice.sh
sshfs media@olidata.stivvo01.com:/home/media/video ${XDG_VIDEOS_DIR}/remote/
pikaur -Syuw --noconfirm &&
    notify-send.sh -r 10000 "Updated pacman packages" ||
    notify-send.sh -r 10000 "ERROR updating packages"
