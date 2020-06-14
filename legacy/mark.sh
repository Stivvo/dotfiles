#!/bin/bash

P="/home/stefano/.cache/markdown/mkd/"
F="$(cat $1 | head -n 1)"
F=${F#"# "}
F="${P}${F}"
F=$(echo "${F}.mkd" | sed "s/ //g")

echo $F
touch $F
cat $1 > $F

echo "require(rmarkdown); render('${F}')" | R --vanilla &> /dev/null
F="${F%.mkd}.html"
FF=$(echo $F | sed "s/mkd/html/g")
mv $F $FF

sudo ydotool key enter &> /dev/null
sudo ydotool key super+l &> /dev/null
sudo ydotool key r &> /dev/null
sudo ydotool key super+h &> /dev/null

if [ "$2" == "f" ]
then
    alacritty -e firefox-developer-edition --new-window $FF &> /dev/null
fi
