fish_vi_key_bindings

set -U _JAVA_AWT_WM_NONREPARENTING 1
set -U JAVA_HOME /usr/lib/jvm/java-11-openjdk
set -U CATALINA_HOME /home/stefano/tomcat
set -U ECLIPSE_HOME /home/stefano/eclipse/jee-2020-03/eclipse

export EDITOR=vim
export BROWSER=firefox-developer-edition
set -U RANGER_LOAD_DEFAULT_RC FALSE
export MOZ_ENABLE_WAYLAND=1
set fish_greeting

# xdg variables
export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

alias l='lsd -h'
alias ll='lsd -hl'
alias la='lsd -ha'
alias lla='lsd -hla'
alias tree='lsd -h --tree'

alias v='vim'
alias t='floaterm'
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

# fff configuration

function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end

export FFF_FAV1=/home/stefano/prog
export FFF_FAV2=/home/stefano/scuola
export FFF_FAV3=/opt/lampp/htdocs/stuff
export FFF_FAV4=/home/stefano/prog/dotfiles
export FFF_FAV5=/home/stefano/scuola/std
export FFF_FAV6=/home/stefano/scuola/info
export FFF_FAV7=/home/stefano/scuola/spec
export FFF_FAV8=/opt/lampp/htdocs/stuff/ArchivioIBC
export FFF_FAV9=/home/stefano/tomcat/webapps

export FFF_FILE_FORMAT="%f"
export FFF_MARK_FORMAT="> %f*"

export FFF_COL2=5
export FFF_COL3=5
export FFF_LS_COLORS=1
