#!/bin/bash

rm ~/temp*
#echo -e "---\noutput: pdf_document\n---\n" > temp
cat $1 > ~/temp
echo "require(rmarkdown); render('~/temp')" | R --vanilla
gnome-terminal -- firefox ~/temp.html
#firefox --new-window temp.html
