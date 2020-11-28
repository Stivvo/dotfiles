#!/bin/dash

corectrl &
waybar &
redshift.sh
monitor.sh r
background.sh &
udiskie --appindicator --tray --automount --notify --file-manager "alacritty --title 'FFF disk' -e fff " &
kdeconnect-indicator &
sshfs media@olidata.stivvo01.com:/home/media/video ${XDG_VIDEOS_DIR}/remote/
sshfs media@olidata.stivvo01.com:/home/media/segate/Documenti ${XDG_DOCUMENTS_DIR}/segateDocumenti/
sshfs media@olidata.stivvo01.com:/home/media/segate/Immagini ${XDG_PICTURES_DIR}/segateImmagini/
sshfs media@olidata.stivvo01.com:/home/media/segate/Musica ${XDG_MUSIC_DIR}/segateMusica/
sshfs media@olidata.stivvo01.com:/home/media/segate/Video ${XDG_VIDEOS_DIR}/segateVideo/
normal.mice.sh
sudo undervolt --gpu -75 --core -100 --cache -100 --uncore -100 --analogio -100
pikaur -Syuw --noconfirm &&
    notify-send.sh -r 10000 "Updated pacman packages" ||
    notify-send.sh -r 10000 "ERROR updating packages"
