if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export RANGER_LOAD_DEFAULT_RC=FALSE
export GDK_BACKEND=wayland

[[ $- != *i* ]] && return
