#!/bin/sh

mkdir $HOME/.local/script
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

echo "Reading environment variables..."
$HOME/.local/script/variables.sh

echo "creating useful dirs..."
mkdir $XDG_CACHE_HOME $XDG_CACHE_HOME/markdown/ $XDG_CACHE_HOME/monitor $XDG_CONFIG_HOME $XDG_CONFIG_HOME/fish $XDG_CONFIG_HOME/mako $XDG_CONFIG_HOME/nvim $XDG_CONFIG_HOME/zathura $XDG_CONFIG_HOME/swaylock $XDG_CONFIG_HOME/yambar $XDG_CONFIG_HOME/imv $XDG_CONFIG_HOME/alacritty $XDG_CACHE_HOME/shot

echo "shells..."
ln -sf ${PWD}/bashrc $HOME/.bashrc
ln -sf ${PWD}/fish/config.fish $XDG_CONFIG_HOME/fish/config.fish
ln -sf ${PWD}/fish/common.fish $XDG_CONFIG_HOME/fish/common.fish

echo "creating symlinks for programs configs..."
ln -sf ${PWD}/mako $XDG_CONFIG_HOME/mako/config
ln -sf ${PWD}/zathurarc $XDG_CONFIG_HOME/zathura/zathurarc
ln -sf ${PWD}/imv $XDG_CONFIG_HOME/imv/config
ln -sf ${PWD}/alacritty.yml $XDG_CONFIG_HOME/alacritty/alacritty.yml

echo "sway..."
ln -sf ${PWD}/swaylock $XDG_CONFIG_HOME/swaylock/config
ln -sf ${PWD}/waybar $XDG_CONFIG_HOME/
ln -sf ${PWD}/yambar.yml $XDG_CONFIG_HOME/yambar/config.yml
sed 's+\[0\]+\[4\]+g' $XDG_CONFIG_HOME/yambar/config.yml > $XDG_CONFIG_HOME/yambar/config2.yml

echo "git config..."
git config --global user.name Stivvo
git config --global user.email stivvo01@gmail.com
git config --global core.editor "nvim"
git config --global credential.helper "cache --timeout=14400"
git config --global pull.rebase false
git config --global core.excludesFile "$HOME/.gitignore"
git config --global init.defaultBranch master
ln -sf ${PWD}/gitignore $HOME/.gitignore

echo "volume and brightness notifications files..."
echo 100 > /tmp/audio-notification
echo 100 > /tmp/brightness-notification

echo "nvim..."
ln -sf ${PWD}/nvim/init.vim $XDG_CONFIG_HOME/nvim/init.vim
ln -sf ${PWD}/nvim/plugin $XDG_CONFIG_HOME/nvim/
ln -sf ${PWD}/nvim/ftplugin $XDG_CONFIG_HOME/nvim/
ln -sf ${PWD}/nvim/autoload $XDG_CONFIG_HOME/nvim/
ln -sf ${PWD}/nvim/other $XDG_CONFIG_HOME/nvim/
./nvim/installplugs.sh start
./nvim/installplugs.sh opt

if [ ! -d $XDG_CONFIG_HOME/omf ] || [ ! -d $XDG_DATA_HOME/omf ]
then
    echo "oh my fish..."
	curl -L https://get.oh-my.fish | fish
    fish --command="omf install l"
fi
