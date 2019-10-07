#!/bin/bash

#echo -e "---\noutput: pdf_document\n---\n" > temp
cat $1 > ~/temp
echo "require(rmarkdown); render('~/temp')" | R --vanilla
firefox ~/temp.html
#firefox --new-window temp.html
rm ~/temp*
