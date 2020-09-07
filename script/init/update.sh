#!/bin/dash

/usr/bin/pikaur -Syuw --noconfirm &&
    /usr/bin/notify-send.sh -r 10000 "Updated pacman packages" ||
    /usr/bin/notify-send.sh -r 10000 "ERROR updating packages"
