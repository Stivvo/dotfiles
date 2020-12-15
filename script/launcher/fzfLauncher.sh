#!/bin/dash

EXT=".menu.sh"
CMD=$(cat $XDG_CACHE_HOME/pathCache | fzf)
STRIP=${CMD%%$EXT}
[ $CMD = $STRIP ] && setsid launch.sh $CMD || $CMD
