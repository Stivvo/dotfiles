#!/bin/bash

[ -z "$(cat /dev/shm/background)" ] && echo "0" > /dev/shm/background
ID="$(cat /dev/shm/background)"
let "ID = $ID + 1"
echo $ID > /dev/shm/background
background.sh
