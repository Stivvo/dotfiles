#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#paths
export PS1="\[\033[38;5;214m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\][\[$(tput sgr0)\]\[\033[38;5;38m\]\@\[$(tput sgr0)\]\[\033[38;5;15m\]]\w\[$(tput sgr0)\]\[\033[38;5;214m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export PATH=/home/stefano/bin/:$PATH
export HISTCONTROL=ignoredups

#settings
set -o vi
shopt -s autocd
set -o noclobber
bind -m vi-insert "\C-l":clear-screen
shopt -s checkwinsize

#system aliases
alias l='lsd'
alias v='vim'
alias p='clip'
alias df='df -h'
alias du='du -h'
alias cp='cp -i'
alias free='free -m'

#git aliases
alias commit='git commit'
alias add='git add'
alias push='git push'
alias pull='git pull'
alias checkout='git checkout'
alias branch='git branch'
alias log='git log'
alias merge='git merge'

#other aliases
alias cln='~/Dropbox/script/./pulisci.sh'
alias scla='~/Dropbox/SCUOLA/'
alias wterm='gnome-terminal --window | '
alias tterm='gnome-terminal --tab | '
alias power='sudo ~/Dropbox/script/./power.sh'
alias win='sudo efibootmgr -n4 && sudo reboot'
alias rcupload='~/Dropbox/script/up/./upload.sh'
alias rcdownload='~/Dropbox/script/up/./download.sh'
