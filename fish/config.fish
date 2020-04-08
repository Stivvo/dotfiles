fish_vi_key_bindings

set -U _JAVA_AWT_WM_NONREPARENTING 1
set -U RANGER_LOAD_DEFAULT_RC FALSE
set fish_greeting
set -U JAVA_HOME /usr/lib/jvm/java-11-openjdk
set -U CATALINA_HOME /home/stefano/tomcat

export EDITOR=vim
export BROWSER=firefox-developer-edition

alias l='lsd -h'
alias ll='lsd -hl'
alias la='lsd -ha'
alias lla='lsd -hla'
alias tree='lsd -h --tree'

alias v='vim'
alias y='pacaur --color=always'
alias yy='update.sh ~/prog/dotfiles/script/pacman/ignore.txt'
alias diff='diff --color'
alias less='less -R'

alias grep="grep --color"
alias fgrep="fgrep --color"
alias egrep="egrep --color"

alias clone='git clone'
alias pull='git pull'
alias commit='git commit'
alias commim='git commit -m'
alias push='git push'
alias pusf='git push -f'
alias merge='git merge'
alias add='git add'
alias adda='git add -A'
alias branch='git branch'
alias branca='git branch --all'
alias checkout='git checkout'
alias remote='git remote'
alias remotv='git remote -v'
alias rebase='git rebase'
alias rebasi='git rebase -i'
alias gsiwth='git switch'
alias glog='git log --color=always'
alias glogl='git log --pretty=oneline --color=always'
alias gshortl='git shortlog'
alias gshow='git show'
alias gtag='git tag'
alias gswitch='git switch'
alias ginit='git init'
alias gfetch='git fetch'
alias gdiff='git diff --color'
alias ggrep='git grep --color'
alias gstatus='git status'
alias greset='git reset'
alias grestore='git restore'

alias xamt='sudo xampp start'
alias xamr='sudo xampp start'
alias xamp='sudo xampp stop'

alias tbt="gnome-terminal -q --tab -- fish -c 'cd '(pwd)'; fish'"
alias nwt="gnome-terminal -q -- fish -c 'cd '(pwd)'; fish'"
