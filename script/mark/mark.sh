#!/bin/bash

LOCKFILE="/dev/shm/compileLock"

if [ ! -f $LOCKFILE ]
then
    echo > $LOCKFILE
    ERRFILE="/tmp/marksh.txt"

    case $1 in
        *GitNoob2Pro.md*)
            cd $HOME/prog/GitNoob2Pro
            OUT=$HOME/prog/GitNoob2Pro/GitNoob2Pro.pdf
            ./compile.sh > $ERRFILE
        ;;

        *)
            INFILE=$(echo $1 | egrep -o "[a-zA-Z]*\.md")
            OUT="$XDG_CACHE_HOME/markdown/${INFILE%md}pdf"

            pandoc -s -t markdown $1 -t pdf -o $OUT --pdf-engine=pdflatex --metadata-file=$HOME/prog/notes/metadata.yml > $ERRFILE
            ;;
    esac

    [ $2 = "f" ] && zathura $OUT &

    [ -s $ERRFILE ] || rm $ERRFILE

    rm $LOCKFILE
fi
