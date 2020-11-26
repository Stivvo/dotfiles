#!/bin/dash

killall mako
killall redshift
mako &
redshift -l 45.47:9.19 -t 6500:4500 -m wayland &
