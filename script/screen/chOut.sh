#!/bin/bash

if [ $# -lt 1 ]; then
  echo Usage: $0 WORKSPACE
  exit 1
fi

WORKSPACE=$1

FOCUSED_OUTPUT=$(swaymsg -t get_outputs --raw | jq '. | map(select(.focused == true)) | .[0].name' -r)
swaymsg "[workspace=${WORKSPACE}]" move workspace to output "${FOCUSED_OUTPUT}"
swaymsg workspace $WORKSPACE
