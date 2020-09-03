#!/bin/dash

exec setsid $(cat $XDG_CACHE_HOME/pathCache | fzf)
