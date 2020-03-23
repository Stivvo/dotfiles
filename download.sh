#!/bin/bash

echo "creating useful dirs..."
mkdir ~/.cache ~/.cache/markdown/ ~/.cache/markdown/mkd ~/.cache/markdown/html ~/screen ~/.cache/screen ~/.config ~/.config/fish ~/.config/mako ~/.config/ranger ~/.vim ~/.config/zathura ~/.config/sway ~/.config/swaylock 
pw=$(pwd)
echo ${pw}

echo "shells..."
ln -sf ${pw}/bashrc ~/.bashrc
source ~/.bashrc
#sudo chsh -s $(whereis fish | awk '{print $2}') $(whoami)
#echo "setting default shell to fish, reboot required"
ln -sf ${pw}/fish/config.fish ~/.config/fish/config.fish
ln -sf ${pw}/Xresources ~/.Xresources
xrdb ~/.Xresources

echo "creating symlinks for programs configs..."
# single
ln -sf ${pw}/pam ~/.pam_environment  # pam environment, enable wayland on firefox
ln -sf ${pw}/mako ~/.config/mako/config
ln -sf ${pw}/zathurarc ~/.config/zathura/zathurarc
#ranger
ln -sf ${pw}/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf ${pw}/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sf ${pw}/ranger/scope.sh ~/.config/ranger/scope.sh
# vim
ln -sf ${pw}/vim/vimrc ~/.vim/vimrc
ln -sf ${pw}/vim/confPlugins ~/.vim/confPlugins
ln -sf ${pw}/vim/ftplugin ~/.vim/ftplugin
# sway
ln -sf ${pw}/sway ~/.config/sway/config
ln -sf ${pw}/swaylock ~/.config/swaylock/config

echo "git config..."
git config --global user.name Stivvo
git config --global user.email entattis15@itisvinci.com
git config --global core.editor vim

echo "procedures..."
# volume and brightness notifications files
echo 100 > /tmp/audio-notification
echo 100 > /tmp/brightness-notification
# video group for light
sudo usermod -a -G video $USER
# install vim instant markdown
sudo npm -g install instant-markdown-d

echo "oh my fish..."
# installing fish
curl -L https://get.oh-my.fish | fish
fish --command="omf install l"
