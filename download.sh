#!/bin/bash

echo "shells..."
ln -s bashrc ~/.bashrc
source ~/.bashrc
#sudo chsh -s $(whereis fish | awk '{print $2}') $(whoami)
#echo "setting default shell to fish, reboot required"
ln -s fish ~/.config/fish
ln -s Xresources ~/.Xresources
xrdb ~/.Xresources

echo "creating symlinks for programs configs..."
ln -s mako ~/.config/mako
ln -s pam ~/.pam_environment  # pam environment, enable wayland on firefox
ln -s vim ~/.vim/
ln -s zathura ~/.config/zathura
# sway
ln -s sway ~/.config/sway
ln -s swaylock ~/.config/swaylock
ln -s ranger ~/.config/ranger

echo "git config..."
git config --global user.name Stivvo
git config --global user.email entattis15@itisvinci.com
git config --global core.editor vim

echo "creating useful dirs..."
mkdir ~/.cache/markdown/
mkdir ~/.cache/markdown/mkd
mkdir ~/.cache/markdown/html
mkdir ~/screen
mkdir ~/.cache/screen

echo "procedures..."
# volume and brightness notifications files
echo 100 > /tmp/audio-notification
echo 100 > /tmp/brightness-notification
# install all packages
sudo pacman -S --needed trizen
trizen -S --needed < packages.txt
# video group for light
sudo usermod -a -G video $USER
# install vim instant markdown
sudo npm -g install instant-markdown-d

echo "oh my fish..."
# installing fish
curl -L https://get.oh-my.fish | fish
fish --command="omf install l"
