#!/bin/bash

light "-$1" $2

BRIGHTNESS=$(light -G);
PCT=$(echo $BRIGHTNESS | awk '{printf "%4.0f\n",($1)}' | tr -d '[:space:]')

# Round the brightness percentage:
LC_ALL=C

# Send the notification with the icon:
notify-send.sh "Brightness ${PCT}%" \
    --replace-file=/tmp/brightness-notification \
    -t 2000 \
    --icon /home/stefano/prog/dotfiles/script/notify/brightness-icon.png \
    -h int:value:${PCT} \
    -u critical \
    -h string:synchronous:brightness-change
