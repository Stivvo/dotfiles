#!/bin/bash

echo $(whoami)
# update dotfiles
mkdir ~/.vim/
cp vimrc ~/.vim/.
echo "vimrc..."
cp .snclirc ~/.
echo "snclirc..."
cp config.fish ~/.config/fish/.
echo "config.fish..."
cp bashrc ~/.bashrc
echo "bashrc..."

# commands
sudo chsh -s $(whereis fish | awk '{print $2}') $(whoami)
echo "setting default shell to fish, reboot required"

# git config
git config --global user.name Stivvo
git config --global user.email entattis15@itisvinci.com
git config --global core.editor vim
echo "git config..."

# scripts
sudo chmod ua+x ~/prog/dotfiles/script/mark/sh
sudo chmod ua+x ~/prog/dotfiles/script/screen/sh
sudo chmod ua+x ~/prog/dotfiles/script/update.sh
sudo chmod ua+x ~/prog/dotfiles/script/background/sh
sudo chmod ua+x ~/prog/dotfiles/script/shot/all.sh
sudo chmod ua+x ~/prog/dotfiles/script/shot/focused.sh
sudo chmod ua+x ~/prog/dotfiles/script/shot/area.sh
sudo chmod ua+x ~/prog/dotfiles/script/bar/sh
sudo chmod ua+x ~/prog/dotfiles/script/bar/loop.sh
sudo chmod ua+x ~/prog/dotfiles/script/notify/light.sh
sudo chmod ua+x ~/prog/dotfiles/script/notify/volume.sh
sudo chmod ua+x ~/prog/dotfiles/script/vifm/vifmimg
sudo chmod ua+x ~/prog/dotfiles/script/vifm/vifmrun
sudo chmod ua+x ~/prog/dotfiles/script/intellide
sudo cp ~/prog/dotfiles/script/intellide /usr/bin/
echo "chmod +x useful scripts..."

# simplenote
chmod +x ~/Sync/script/snPasswd.sh
~/Sync/script/./snPasswd.sh
echo "setting username and password of simplenote..."

# zathura
mkdir ~/.config/zathura
cp zathurarc ~/.config/zathura/.
echo "zathurarc..."

# i3
mkdir ~/.config/i3
cp ~/prog/dotfiles/i3 ~/.config/i3/config
echo "i3 config..."

mkdir ~/.config/sway
cp ~/prog/dotfiles/sway ~/.config/sway/config
echo "sway config..."
mkdir ~/.config/swaylock
cp ~/prog/dotfiles/swaylock ~/.config/
echo "swaylock..."

# vifm
cp ~/prog/dotfiles/vifmrc ~/.config/vifm/vifmrc
cp ~/prog/dotfiles/script/vifm/vifmimg ~/.config/vifm/scripts/
cp ~/prog/dotfiles/script/vifm/vifmrun ~/.config/vifm/scripts/

mkdir ~/.cache/markdown/
mkdir ~/.cache/markdown/mkd
mkdir ~/.cache/markdown/html

# install vim instant markdown
sudo npm -g install instant-markdown-d

# video group for light
sudo usermod -a -G video $USER
