#!/bin/dash

EXT=".menu.sh"
CMD=$(cat $XDG_CACHE_HOME/pathCache | fzf)
STRIP=${CMD%%$EXT}
[ "$CMD" != "$STRIP" ] && CMD="alacritty --class fzfLauncher.sh -t $CMD -e $CMD"
exec setsid $CMD
