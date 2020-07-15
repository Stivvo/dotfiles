#!/bin/sh

swayinfo | fgrep app_id | sed -e "s/^app_id=//g" | tr -d "\n//" | wl-copy && notify-send.sh $(wl-paste)
