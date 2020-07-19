if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

source $HOME/.config/fish/common.fish

f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME}/fff/.fff_d")"
}

[[ $- != *i* ]] && return
