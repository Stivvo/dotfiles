#!/bin/sh

doas cp /etc/hosts.new /etc/hosts
$HOME/.local/script/variables.sh 1 /usr/local/bin/dwl -s $HOME/.local/script/dwl.sh
doas cp /etc/hosts.base /etc/hosts
