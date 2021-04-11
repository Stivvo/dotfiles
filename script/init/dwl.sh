#!/bin/dash

wlr-randr | fgrep eDP-1 && yambar || yambar -c $XDG_CONFIG_HOME/yambar/config2.yml &

mako &
personal.sh
