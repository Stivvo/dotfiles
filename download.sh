#!/bin/bash

mkdir $HOME/.local/script
echo "symlink scripts to ~/.local/script..."
for dir in ${PWD}/script/*/
do
	for file in $dir*.*sh
	do
		echo $file
		ln -sf $file $HOME/.local/script/
	done
done
ln -sf ${PWD}/script/notify ~/.local/script/

echo "Reading environment variables..."
source $HOME/.local/script/variables.sh

echo "creating useful dirs..."
mkdir $XDG_CACHE_HOME $XDG_CACHE_HOME/markdown/ $XDG_CACHE_HOME/monitor $XDG_CONFIG_HOME $XDG_CONFIG_HOME/fish $XDG_CONFIG_HOME/mako $XDG_CONFIG_HOME/ranger $XDG_CONFIG_HOME/nvim $XDG_CONFIG_HOME/zathura $XDG_CONFIG_HOME/nyaovim $XDG_CONFIG_HOME/sway $XDG_CONFIG_HOME/swaylock $XDG_CONFIG_HOME/imv $XDG_CONFIG_HOME/alacritty $XDG_CACHE_HOME/shot

echo "shells..."
ln -sf ${PWD}/bashrc $HOME/.bashrc
ln -sf ${PWD}/fish/config.fish $XDG_CONFIG_HOME/fish/config.fish
ln -sf ${PWD}/fish/common.fish $XDG_CONFIG_HOME/fish/common.fish
echo "set default shell to fish, reboot required"
sudo chsh -s $(whereis fish | awk '{print $2}') $USER

echo "creating symlinks for programs configs..."
ln -sf ${PWD}/mako $XDG_CONFIG_HOME/mako/config
ln -sf ${PWD}/zathurarc $XDG_CONFIG_HOME/zathura/zathurarc
ln -sf ${PWD}/imv $XDG_CONFIG_HOME/imv/config
ln -sf ${PWD}/alacritty.yml $XDG_CONFIG_HOME/alacritty/alacritty.yml

echo "nvim..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -sf ${PWD}/nvim/init.vim $XDG_CONFIG_HOME/nvim/init.vim
ln -sf ${PWD}/nvim/plugin $XDG_CONFIG_HOME/nvim/
ln -sf ${PWD}/nvim/ftplugin $XDG_CONFIG_HOME/nvim/
ln -sf ${PWD}/nvim/other $XDG_CONFIG_HOME/nvim/
nvim -c "PlugInstall|q|q"

echo "sway..."
ln -sf ${PWD}/sway $XDG_CONFIG_HOME/sway/config
ln -sf ${PWD}/swaylock $XDG_CONFIG_HOME/swaylock/config
ln -sf ${PWD}/waybar $XDG_CONFIG_HOME/

echo "pacman config..."
sudo cp ${PWD}/pacman/mirrorlist /etc/pacman.d/mirrorlist
sudo cp ${PWD}/pacman/makepkg.conf /etc/makepkg.conf
sudo cp ${PWD}/pacman/pacman.conf /etc/pacman.conf
sudo cp ${PWD}/pacman/mirrorlist-rankmirrors.conf /etc/pacman.d/mirrorlist-rankmirrors.conf

echo "git config..."
git config --global user.name Stivvo
git config --global user.email stivvo01@gmail.com
git config --global core.editor "nvim"
git config --global credential.helper 'cache --timeout=14400'
git config --global pull.rebase false
git config --global core.excludesFile '~/.gitignore'
ln -sf ${PWD}/gitignore ~/.gitignore

echo "volume and brightness notifications files..."
echo 100 > /tmp/audio-notification
echo 100 > /tmp/brightness-notification

if [ ! -d $XDG_CONFIG_HOME/omf ] || [ ! -d $XDG_DATA_HOME/omf ]
then
    echo "oh my fish..."
    curl -L https://get.oh-my.fish > $HOME/install.fish
    fish -c $HOME/install.fish --path=$XDG_DATA_HOME/omf --config=$XDGu_/omf \
    fish --command="omf install l"
fi

echo "corectrl configuration..."
sudo cp polkit /etc/polkit-1/rules.d/90-corectrl.rules

echo "setting the yaru GTK theme..."
$HOME/.local/script/theme.sh
