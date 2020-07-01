export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export CATALINA_HOME=/home/stefano/tomcat
export ECLIPSE_HOME=/home/stefano/eclipse/jee-2020-03/eclipse

export EDITOR=nvim
export BROWSER=firefox-developer-edition
export RANGER_LOAD_DEFAULT_RC=FALSE
export MOZ_ENABLE_WAYLAND=1

export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

alias l='lsd -h'
alias ll='lsd -hl'
alias la='lsd -ha'
alias lla='lsd -hla'
alias tree='lsd -h --tree'

alias v='nvim'
alias g='glrnvim'
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

export FFF_FAV1=/home/stefano/prog
export FFF_FAV2=/home/stefano/wallpapers
export FFF_FAV3=/home/stefano/screen
export FFF_FAV4=/home/stefano/Download
export FFF_FAV5=/home/stefano/prog/dotfiles
export FFF_FAV6=/home/stefano/prog/wayPreview
export FFF_FAV7=/home/stefano/prog/GitNoob2Pro
export FFF_FAV8=/home/stefano/.local/scripts
export FFF_FAV9=/opt/lampp/htdocs/stuff

export FFF_FILE_FORMAT="%f"
export FFF_MARK_FORMAT="> %f*"
export FFF_OPENER="xdg-open"
export FFF_CD_ON_EXIT=1

export FFF_COL1=2 # directory
export FFF_COL2=5 # status background
export FFF_COL3=5 # selection
export FFF_COL4=6 # cursor
export FFF_COL5=0 # foerground
export FFF_LS_COLORS=0
