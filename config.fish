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

alias xamppt='sudo xampp start'
alias xamppp='sudo xampp stop'

alias y='trizen'

alias v='vim'
export EDITOR=vim

fish_vi_key_bindings

set -U fish_user_paths $fish_user_paths /opt/lampp /home/stefano/.cargo/bin

export _JAVA_AWT_WM_NONREPARENTING=1
export RANGER_LOAD_DEFAULT_RC=FALSE
