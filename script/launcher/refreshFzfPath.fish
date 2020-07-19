#!/bin/fish

stest -flx $PATH | sort -u > "$XDG_CACHE_HOME/pathCache"
