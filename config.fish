alias l='lsd -h'
alias ll='lsd -hl'
alias la='lsd -ha'
alias lla='lsd -hla'
alias tree='lsd -h --tree'

alias clone='git clone'
alias pull='git pull'
alias commit='git commit'
alias push='git push'
alias merge='git merge'
alias add='git add'
alias branch='git branch'
alias checkout='git checkout'
alias gsiwth='git switch'
alias glog='git log --color=always'
alias glogone='git log --pretty=oneline --color=always'
alias gtag='git tag'
alias gswitch='git switch'
alias ginit='git init'
alias gfetch='git fetch'
alias gdiff='git diff'
alias ggrep='git grep'
alias gstatus='git status'
alias greset='git reset'
alias gremote='git remote'

alias xamppt='sudo xampp start'
alias xamppp='sudo xampp stop'

alias y='trizen'

alias v='vim'
export EDITOR=vim

fish_vi_key_bindings

set -U fish_user_paths $fish_user_paths /opt/lampp

export _JAVA_AWT_WM_NONREPARENTING=1
export RANGER_LOAD_DEFAULT_RC=FALSE
set fish_greeting

alias tbt="gnome-terminal -q --tab -- fish -c 'cd '(pwd)'; fish'"
alias nwt="gnome-terminal -q -- fish -c 'cd '(pwd)'; fish'"
