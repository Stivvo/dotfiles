#!/bin/bash

echo "creating useful dirs..."
mkdir ~/.cache ~/.cache/markdown/ ~/.cache/markdown/mkd ~/.cache/markdown/html ~/screen ~/.cache/screen ~/.config ~/.config/fish ~/.config/mako ~/.config/ranger ~/.config/nvim ~/.config/zathura ~/.config/sway ~/.config/swaylock ~/.config/imv ~/.config/alacritty ~/.cache/shot

echo "shells..."
ln -sf ${PWD}/bashrc ~/.bashrc
source ~/.bashrc
ln -sf ${PWD}/fish/config.fish ~/.config/fish/config.fish
ln -sf ${PWD}/fish/common.fish ~/.config/fish/common.fish
echo "setting default shell to fish, reboot required"
sudo chsh -s $(whereis fish | awk '{print $2}') $(whoami)

echo "xresources..."
ln -sf ${PWD}/Xresources ~/.Xresources
xrdb ~/.Xresources

echo "creating symlinks for programs configs..."
ln -sf ${PWD}/pam ~/.pam_environment  # pam environment, enable wayland on firefox
ln -sf ${PWD}/mako ~/.config/mako/config
ln -sf ${PWD}/zathurarc ~/.config/zathura/zathurarc
ln -sf ${PWD}/imv ~/.config/imv/config
ln -sf ${PWD}/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ${PWD}/glrnvim.yml ~/.config/glrnvim.yml

echo "ranger..."
ln -sf ${PWD}/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf ${PWD}/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sf ${PWD}/ranger/scope.sh ~/.config/ranger/scope.sh

echo "nvim..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -sf ${PWD}/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ${PWD}/nvim/plug.vim ~/.config/nvim/plug.vim
ln -s ${PWD}/nvim/plugin ~/.config/nvim/
ln -s ${PWD}/nvim/ftplugin ~/.config/nvim/
ln -s ${PWD}/nvim/other ~/.config/nvim/
nvim -c "PlugInstall|q|q"

echo "sway..."
ln -sf ${PWD}/sway ~/.config/sway/config
ln -sf ${PWD}/swaylock ~/.config/swaylock/config
ln -s ${PWD}/waybar ~/.config/

echo "pacman config..."
sudo chown root ${PWD}/pacman/mirrorlist
sudo chown root ${PWD}/pacman/makepkg.conf
sudo chown root ${PWD}/pacman/pacman.conf
sudo ln -sf ${PWD}/pacman/mirrorlist /etc/pacman.d/mirrorlist
sudo ln -sf ${PWD}/pacman/makepkg.conf /etc/makepkg.conf
sudo ln -sf ${PWD}/pacman/pacman.conf /etc/pacman.conf
sudo ln -sf ${PWD}/pacman/mirrorlist-rankmirrors.conf /etc/pacman.d/mirrorlist-rankmirrors.conf

echo "symlink to scripts..."
sudo ln -sf ${PWD}/script/*.sh /usr/bin/
sudo ln -sf ${PWD}/script/*/*.sh /usr/bin/

echo "git config..."
git config --global user.name Stivvo
git config --global user.email stivvo01@gmail.com
git config --global core.editor nvim
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
    sudo npm i -g yarn --global
fi

if [ ! -d /usr/lib/node_modules/standard/ ]
then
    echo "standard js.."
    sudo npm install standard --global
fi

if [ ! -d ~/.config/omf ] || [ ! -d ~/.local/share/omf ]
then
    echo "oh my fish..."
    curl -L https://get.oh-my.fish > ~/install.fish
    fish ~/install.fish --path=~/.local/share/omf --config=~/.config/omf \
    fish --command="omf install l"
fi
