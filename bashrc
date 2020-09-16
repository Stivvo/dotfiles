source $HOME/.config/fish/common.fish

f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME}/fff/.fff_d")"
}

[[ $- != *i* ]] && return
