#!/bin/bash

[ -f /dev/shm/volume.sh.lock ] && exit
echo > /dev/shm/volume.sh.lock

case $1 in
    "audiomute")
        amixer set Master toggle
        ;;
    "micmute")
        amixer set Capture toggle
        MICMUTE=1
        ;;
    "up")
        amixer set Master "${2}%+"
        ;;
    "down")
        amixer set Master "${2}%-"
        ;;
esac

# Script to create pop-up notification when volume changes.

# Create a delay so the change in volume can be registered:
sleep 0.05

# Get the volume and check if muted or not (ISMUTE):
VOLUME=$(amixer get Master | grep -E -o "[0-9]+\%")
VOLUME=${VOLUME%\%}
STATE=$(amixer get Master | grep -E -o "\[(on|off)\]")
STATE=${STATE%\]}
STATE=${STATE#\[}
ICONPATH="$HOME/.local/dotfiles/notify/"

# Have a different symbol for varying volume levels:
if [ $MICMUTE ]
then
    amixer get Capture | grep "[on]" -q -F && ICON="${ICONPATH}vol-high.png" || ICON="${ICONPATH}vol-mute.png"
    notify-send.sh "Microphone" \
        -t 2000 \
        -i ${ICON} \
        -h int:value:100 \
        --replace-file=/tmp/audio-notification \
        -h string:synchronous:volume-change

elif [ "$STATE" == "on" ]
then
    if [ "${VOLUME}" == "0" ]; then
        ICON="${ICONPATH}vol-mute.png"
    elif [ "${VOLUME}" -lt "33" ] && [ $VOLUME -gt "0" ]; then
        ICON="${ICONPATH}vol-low.png"
    elif [ "${VOLUME}" -lt "90" ] && [ $VOLUME -ge "33" ]; then
        ICON="${ICONPATH}vol-med.png"
    else
        ICON="${ICONPATH}vol-high.png"
    fi

    notify-send.sh "Volume: $VOLUME%" \
        -t 2000 \
        -i ${ICON} \
        -h int:value:${VOLUME} \
        --replace-file=/tmp/audio-notification \
        -h string:synchronous:volume-change
else
    # If volume is muted, display the mute sybol:
    notify-send.sh "Muted (volume: $VOLUME%)" \
        --replace-file=/tmp/audio-notification \
        -t 2000 \
        -i "${ICONPATH}vol-mute.png" \
        -h int:value:${VOLUME} \
        -u critical \
        -h string:synchronous:volume-change
fi

rm /dev/shm/volume.sh.lock
