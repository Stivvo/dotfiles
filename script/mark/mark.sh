#!/bin/bash

LOCKFILE="/dev/shm/compileLock"

if [ ! -f $LOCKFILE ]
then
    echo > $LOCKFILE
    ERRFILE="/tmp/marksh.txt"
    INFILE=$(echo $1 | egrep -o "[a-zA-Z]*\.md")
    OUT="$HOME/.cache/markdown/${INFILE%md}pdf"

    pandoc -s -t markdown $1 -t pdf -o $OUT --pdf-engine=pdflatex --metadata-file=$HOME/vimwiki/metadata.yml 2> $ERRFILE

    # [ "$2" == "f" ] && $BROWSER --new-window $OUT
    [ "$2" == "f" ] && zathura $OUT &

    [ -s $ERRFILE ] || rm $ERRFILE

    rm $LOCKFILE
fi
