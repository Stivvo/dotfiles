#!/bin/dash

export EDITOR=nvim
export BROWSER=firefox
export PAGER="less -R"
export LD_LIBRARY_PATH=/usr/local/lib:/lib:/usr/lib:/usr/bin/lib
export PATH=/home/stefano/.local/bin:/home/stefano/.local/script:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DESKTOP_DIR=$HOME/Desktop
export XDG_DOWNLOAD_DIR=$HOME/Scaricati
export XDG_TEMPLATES_DIR=$HOME/Modelli
export XDG_PUBLICSHARE_DIR=$HOME/Pubblici
export XDG_DOCUMENTS_DIR=$HOME/Documenti
export XDG_MUSIC_DIR=$HOME/Musica
export XDG_PICTURES_DIR=$HOME/Immagini
export XDG_VIDEOS_DIR=$HOME/Video

export FFF_FILE_FORMAT=" %f"
export FFF_MARK_FORMAT=" > \%f*"
export FFF_OPENER=xdg-open
export FFF_CD_ON_EXIT=1

export FFF_COL1=2
export FFF_COL2=5
export FFF_COL3=5
export FFF_COL4=6
export FFF_COL5=0
export FFF_LS_COLORS=1

export FFF_FAV1=$XDG_DOCUMENTS_DIR/repo/prog
export FFF_FAV2=$XDG_DOCUMENTS_DIR/scuola
export FFF_FAV3=$XDG_DOCUMENTS_DIR/Sync
export FFF_FAV4=$XDG_DOCUMENTS_DIR/Sync/dotfiles/script
export FFF_FAV5=$XDG_PICTURES_DIR/wallpapers
export FFF_FAV6=$XDG_PICTURES_DIR/screen
export FFF_FAV7=$XDG_DOWNLOAD_DIR
export FFF_FAV8=$XDG_VIDEOS_DIR/remote
export FFF_FAV9=/run/media/stefano

export MANGOHUD_DLSYM=1
export MANGOHUD=1

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND=${FZF_DEFAULT_COMMAND}

if [ "$1" = "1" ]
then
	export MOZ_ENABLE_WAYLAND=1
	export QT_QPA_PLATFORM=wayland
elif [ "$1" = "2" ]
then
	export MOZ_ENABLE_WAYLAND=0
	export QT_QPA_PLATFORM=xcb
fi

$2 $3 $4
