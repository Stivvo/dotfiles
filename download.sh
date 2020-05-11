#!/bin/bash

echo "creating useful dirs..."
mkdir ~/.cache ~/.cache/markdown/ ~/.cache/markdown/mkd ~/.cache/markdown/html ~/screen ~/.cache/screen ~/.config ~/.config/fish ~/.config/mako ~/.config/ranger ~/.vim ~/.config/zathura ~/.config/sway ~/.config/swaylock ~/.config/imv ~/.config/alacritty
pw=$(pwd)
echo ${pw}

echo "shells..."
ln -sf ${pw}/bashrc ~/.bashrc
source ~/.bashrc
ln -sf ${pw}/fish/config.fish ~/.config/fish/config.fish
echo "setting default shell to fish, reboot required"
sudo chsh -s $(whereis fish | awk '{print $2}') $(whoami)

echo "xresources..."
ln -sf ${pw}/Xresources ~/.Xresources
xrdb ~/.Xresources

echo "creating symlinks for programs configs..."
ln -sf ${pw}/pam ~/.pam_environment  # pam environment, enable wayland on firefox
ln -sf ${pw}/mako ~/.config/mako/config
ln -sf ${pw}/zathurarc ~/.config/zathura/zathurarc
ln -sf ${pw}/imv ~/.config/imv/config
ln -sf ${pw}/alacritty.yml ~/.config/alacritty/alacritty.yml

echo "ranger..."
ln -sf ${pw}/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf ${pw}/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sf ${pw}/ranger/scope.sh ~/.config/ranger/scope.sh

echo "vim..."
ln -sf ${pw}/vim/vimrc ~/.vim/vimrc
ln -s ${pw}/vim/plugin ~/.vim/
ln -s ${pw}/vim/ftplugin ~/.vim/
ln -s ${pw}/vim/other ~/.vim/
vim -c "PlugInstall|q|q"

echo "sway..."
ln -sf ${pw}/sway ~/.config/sway/config
ln -sf ${pw}/swaylock ~/.config/swaylock/config
ln -s ${pw}/waybar ~/.config/

echo "pacman config..."
sudo chown root ${pw}/pacman/mirrorlist
sudo chown root ${pw}/pacman/makepkg.conf
sudo chown root ${pw}/pacman/pacman.conf
sudo ln -sf ${pw}/pacman/mirrorlist /etc/pacman.d/mirrorlist
sudo ln -sf ${pw}/pacman/makepkg.conf /etc/makepkg.conf
sudo ln -sf ${pw}/pacman/pacman.conf /etc/pacman.conf
sudo ln -sf ${pw}/pacman/mirrorlist-rankmirrors.conf /etc/pacman.d/mirrorlist-rankmirrors.conf

echo "git config..."
git config --global user.name Stivvo
git config --global user.email stivvo01@gmail.com
git config --global core.editor vim
git config --global credential.helper 'cache --timeout=14400'

echo "volume and brightness notifications files..."
echo 100 > /tmp/audio-notification
echo 100 > /tmp/brightness-notification

if [ ! -d /usr/lib/node_modules/instant-markdown-d ]
then
    echo "instant markdown..."
    sudo npm -g install instant-markdown-d
fi

if [ ! -d /usr/lib/node_modules/yarn/ ]
then
    echo "yarn..."
    sudo npm i -g yarn
fi

if [ ! -d ~/.config/omf ] || [ ! -d ~/.local/share/omf ]
then
    echo "oh my fish..."
    curl -L https://get.oh-my.fish > ~/install.fish \
    fish ~/install.fish --path=~/.local/share/omf --config=~/.config/omf \
    fish --command="omf install l"
fi
