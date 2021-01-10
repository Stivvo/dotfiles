#!/bin/bash

echo "creating useful dirs..."
mkdir ~/.cache ~/.cache/markdown/ ~/.cache/monitor ~/.config ~/.config/fish ~/.config/mako ~/.config/ranger ~/.config/nvim ~/.config/zathura ~/.config/nyaovim ~/.config/sway ~/.config/swaylock ~/.config/imv ~/.config/alacritty ~/.cache/shot ~/.local/script

echo "shells..."
ln -sf ${PWD}/pam_environment ~/.pam_environment
ln -sf ${PWD}/bashrc ~/.bashrc
ln -sf ${PWD}/fish/config.fish ~/.config/fish/config.fish
ln -sf ${PWD}/fish/common.fish ~/.config/fish/common.fish
source ~/.bashrc
echo "setting default shell to fish, reboot required"
sudo chsh -s $(whereis fish | awk '{print $2}') $USER

echo "creating symlinks for programs configs..."
ln -sf ${PWD}/mako ~/.config/mako/config
ln -sf ${PWD}/zathurarc ~/.config/zathura/zathurarc
ln -sf ${PWD}/imv ~/.config/imv/config
ln -sf ${PWD}/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ${PWD}/xsession ~/.xsession

echo "nvim..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -sf ${PWD}/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ${PWD}/nvim/plugin ~/.config/nvim/
ln -sf ${PWD}/nvim/ftplugin ~/.config/nvim/
ln -sf ${PWD}/nvim/other ~/.config/nvim/
nvim -c "PlugInstall|q|q"

echo "sway..."
ln -sf ${PWD}/sway ~/.config/sway/config
ln -sf ${PWD}/swaylock ~/.config/swaylock/config
ln -sf ${PWD}/waybar ~/.config/

echo "pacman config..."
sudo cp ${PWD}/pacman/mirrorlist /etc/pacman.d/mirrorlist
sudo cp ${PWD}/pacman/makepkg.conf /etc/makepkg.conf
sudo cp ${PWD}/pacman/pacman.conf /etc/pacman.conf
sudo cp ${PWD}/pacman/mirrorlist-rankmirrors.conf /etc/pacman.d/mirrorlist-rankmirrors.conf

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

if [ ! -d ~/.config/omf ] || [ ! -d ~/.local/share/omf ]
then
    echo "oh my fish..."
    curl -L https://get.oh-my.fish > ~/install.fish
    fish -c ~/install.fish --path=~/.local/share/omf --config=~/.config/omf \
    fish --command="omf install l"
fi

echo "corectrl configuration"
sudo cp polkit /etc/polkit-1/rules.d/90-corectrl.rules
