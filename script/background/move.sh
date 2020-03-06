#!/bin/bash

#cat "/home/stefano/prog/dotfiles/script/background/list"

while read line
do
    echo $line
    cp "/home/stefano/wallpapers/${line}" ~/wallpapers/selected/
done < "/home/stefano/prog/dotfiles/script/background/list"
