if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

source $HOME/.config/fish/common.fish

PATH=/opt/lampp:/home/stefano/prog/dotfiles/script/pacman:/home/stefano/eclipse/jee-2020-03/eclipse:$PATH

[[ $- != *i* ]] && return
