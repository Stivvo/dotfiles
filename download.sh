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
ln -s ${pw}/vim/plugin ~/.vim/
ln -s ${pw}/vim/ftplugin ~/.vim/
ln -s ${pw}/vim/other ~/.vim/
# sway
ln -sf ${pw}/sway ~/.config/sway/config
ln -sf ${pw}/swaylock ~/.config/swaylock/config
ln -s ${pw}/waybar ~/.config/

echo "git config..."
git config --global user.name Stivvo
git config --global user.email entattis15@itisvinci.com
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

if [ ! -d ~/.config/omf ] || [ ! -d ~/.local/share/omf ]
then
    echo "oh my fish..." 
    curl -L https://get.oh-my.fish > ~/install.fish \ 
    fish ~/install.fish --path=~/.local/share/omf --config=~/.config/omf \
    fish --command="omf install l"
fi

echo "gnome-terminal themes..."
sleep 10s && ydotool key "3+1+enter" &> /dev/null &
bash -c "$(wget -qO- https://git.io/vQgMr)"

