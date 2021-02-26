alias l='lsd -h'
alias ll='lsd -hl'
alias la='lsd -ha'
alias lla='lsd -hla'
alias tree='lsd -h --tree'

alias v='nvim'
alias vv='nvim --noplugin'
alias t='floaterm'
alias diff='diff --color'
alias less="less -R"

alias p='doas pacman'
alias q='xbps-query -Rs'
alias i='doas xbps-install -S'
alias u='doas xbps-install -Su'

alias fgrep="fgrep --color"
alias egrep="egrep --color"
alias fgrepi="fgrep --color -r -i"
alias egrepi="egrep --color -r -i"

alias clone='git clone --recursive'
alias pul='git pull'
alias com='git commit'
alias push='git push'
alias ad='git add'
alias bra='git branch --all'
alias remv='git remote -v'
alias gs='git switch'
alias glog='git log --color=always'
alias glol='git log --pretty=oneline --color=always'
alias gdiff='git diff --color'
alias gt='git status'

alias vars='~/.local/script/variables.sh 1 fish'
