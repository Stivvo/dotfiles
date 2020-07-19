#!/bin/bash

echo "creating useful dirs..."
mkdir ~/.cache ~/.cache/markdown/ ~/screen ~/.cache/screen ~/.config ~/.config/fish ~/.config/mako ~/.config/ranger ~/.config/nvim ~/.config/zathura ~/.config/nyaovim ~/.config/sway ~/.config/swaylock ~/.config/imv ~/.config/alacritty ~/.cache/shot

echo "shells..."
ln -sf ${PWD}/bashrc ~/.bashrc
source ~/.bashrc
ln -sf ${PWD}/fish/config.fish ~/.config/fish/config.fish
ln -sf ${PWD}/fish/common.fish ~/.config/fish/common.fish
echo "setting default shell to fish, reboot required"
sudo chsh -s $(whereis fish | awk '{print $2}') $(whoami)

echo "creating symlinks for programs configs..."
ln -sf ${PWD}/pam ~/.pam_environment  # pam environment, enable wayland on firefox
ln -sf ${PWD}/mako ~/.config/mako/config
ln -sf ${PWD}/zathurarc ~/.config/zathura/zathurarc
ln -sf ${PWD}/imv ~/.config/imv/config
ln -sf ${PWD}/alacritty.yml ~/.config/alacritty/alacritty.yml

echo "nvim..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -sf ${PWD}/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ${PWD}/nvim/vim-plug.vim ~/.config/nvim/vim-plug.vim
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

echo "chmod and symlink scripts to /usr/bin ..."
chmod +x ${PWD}/script/*.sh
chmod +x ${PWD}/script/*.fish
chmod +x ${PWD}/script/*/*.sh
chmod +x ${PWD}/script/*/*.fish
sudo ln -sf ${PWD}/script/*.sh /usr/bin/
sudo ln -sf ${PWD}/script/*.fish /usr/bin/
sudo ln -sf ${PWD}/script/*/*.sh /usr/bin/
sudo ln -sf ${PWD}/script/*/*.fish /usr/bin/

echo "git config..."
git config --global user.name Stivvo
git config --global user.email stivvo01@gmail.com
git config --global core.editor nvim
git config --global credential.helper 'cache --timeout=14400'
git config --global pull.rebase false

echo "volume and brightness notifications files..."
echo 100 > /tmp/audio-notification
echo 100 > /tmp/brightness-notification

if [ ! -d ~/.config/omf ] || [ ! -d ~/.local/share/omf ]
then
    echo "oh my fish..."
    curl -L https://get.oh-my.fish > ~/install.fish
    fish ~/install.fish --path=~/.local/share/omf --config=~/.config/omf \
    fish --command="omf install l"
fi

fish -c "set -U fish_user_paths $HOME/.local/scripts/ $fish_user_paths $HOME/.local/websites/"
