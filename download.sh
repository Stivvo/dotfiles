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
mkdir ~/.config/zathura
cp zathurarc ~/.config/zathura/.
echo "zathurarc..."

# commands
sudo chsh -s $(whereis fish | awk '{print $2}') $(whoami)
echo "setting default shell to fish, reboot required"

# git config
git config --global user.name Stivvo
git config --global user.email entattis15@itisvinci.com
git config --global core.editor vim
echo "git config..."

# scripts
chmod +x ~/prog/dotfiles/script/mark/mark.sh
chmod +x ~/prog/dotfiles/script/screen/screen.sh
chmod +x ~/prog/dotfiles/script/update.sh
chmod +x ~/prog/dotfiles/script/background/sh
echo "chmod +x useful scripts..."

# simplenote
chmod +x ~/Sync/script/snPasswd.sh
~/Sync/script/./snPasswd.sh
echo "setting username and password of simplenote..."

# i3
if [ ! -z $(ls ~/.config/ | /usr/bin/grep "i3") ]
then
    echo "i3 config..."
    cp ~/prog/dotfiles/i3 ~/.config/i3/config
fi

# sway
if [ ! -z $(ls ~/.config/ | /usr/bin/grep "sway") ]
then
    echo "sway config..."
    cp ~/prog/dotfiles/sway ~/.config/i3/config
fi
