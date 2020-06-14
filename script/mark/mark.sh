#!/bin/bash

INFILE=$(echo $1 | egrep -o "[a-zA-Z]*\.md")
OUT="$HOME/.cache/markdown/${INFILE%md}html"

pandoc $1 -o $OUT

$BROWSER --new-window $OUT

