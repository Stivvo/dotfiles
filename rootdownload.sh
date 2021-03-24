#!/bin/sh

echo "run this script as root"
cp ${PWD}/doas.conf /etc/
cp ${PWD}/sddm.conf /etc/
chsh -s $(whereis fish | awk '{print $2}') $USER
echo "reboot is required to change the default shell"

echo "pacman config..."
cp ${PWD}/pacman/mirrorlist /etc/pacman.d/mirrorlist
cp ${PWD}/pacman/makepkg.conf /etc/makepkg.conf
cp ${PWD}/pacman/pacman.conf /etc/pacman.conf
cp ${PWD}/pacman/mirrorlist-rankmirrors.conf /etc/pacman.d/mirrorlist-rankmirrors.conf

echo "corectrl configuration..."
cp polkit /etc/polkit-1/rules.d/90-corectrl.rules