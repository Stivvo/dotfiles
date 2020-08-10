export EDITOR=nvim
export BROWSER=firefox-developer-edition
export RANGER_LOAD_DEFAULT_RC=FALSE
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland

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
alias vi='setsid $TERM -e nvim'
alias t='floaterm'
alias diff='diff --color'
alias less='less -R'

alias a='pikaur --color=always'
alias p='sudo pacman'

alias zathur='swallow.sh zathura'
alias thuna='swallow.sh thunar'
alias im='swallow.sh imv'
alias mp='swallow.sh mpv'
alias brows='swallow.sh $BROWSER'

alias grep="grep --color"
alias fgrep="fgrep --color"
alias egrep="egrep --color"

alias clone='git clone --recursive'
alias pull='git pull'
alias commit='git commit'
alias commim='git commit -m'
alias commia='git commit --amend'
alias push='git push'
alias pusf='git push -f'
alias merge='git merge'
alias add='git add'
alias adda='git add -A'
alias branch='git branch'
alias branca='git branch --all'
alias remotv='git remote -v'
alias rebasi='git rebase -i'
alias gsw='git switch'
alias glog='git log --color=always'
alias glol='git log --pretty=oneline --color=always'
alias gshow='git show'
alias gdiff='git diff --color'
alias gstatus='git status'
alias greset='git reset'
alias grestore='git restore'

alias xamt='sudo xampp start'
alias xamr='sudo xampp start'
alias xamp='sudo xampp stop'

export FFF_FAV1=$HOME/prog
export FFF_FAV2=$HOME/wallpapers
export FFF_FAV3=$HOME/screen
export FFF_FAV4=$HOME/Downloads
export FFF_FAV5=$HOME/prog/dotfiles
export FFF_FAV6=$HOME/prog/preview/wayPreview
export FFF_FAV7=$HOME/prog/converter/qTsConverter
export FFF_FAV8=$HOME/.local/path
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

export MANGOHUD_DLSYM=1
export MANGOHUD=1
