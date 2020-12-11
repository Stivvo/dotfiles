#!/bin/dash

VAR=$(cat "${XDG_CACHE_HOME}/monitor/status.txt")
[ $VAR = 1 ] && monitor.sh 3
sleep 1s
systemctl suspend
