#!/bin/fish

exec setsid dash -c (cat $XDG_CACHE_HOME/pathCache | fzf) &>/dev/null &
