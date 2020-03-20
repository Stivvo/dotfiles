#!/bin/bash

echo "$(cat $1)"
echo $(cat $1)
pkg=($(cat $1))

trizen -Syua --ignore="${pkg[*]}"
