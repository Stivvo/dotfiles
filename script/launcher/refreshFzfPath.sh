#!/bin/bash

IFS=':'
LIST=""
echo "" > $XDG_CACHE_HOME/pathCache

for i in $PATH
do
	find "$i" -maxdepth 1 -executable -exec basename {} \; >> $XDG_CACHE_HOME/pathCache
done
sort -u $XDG_CACHE_HOME/pathCache
