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
    cp ~/prog/dotfiles/config ~/.config/i3/config
    echo "i3 config..."
fi

# zathura
if [ ! -z $(ls ~/.config/ | /usr/bin/grep "zathura") ]
then
    cp zathurarc ~/.config/zathura/.
    echo "zathurarc..."
fi
