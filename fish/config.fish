fish_vi_key_bindings
set fish_greeting

source $HOME/.config/fish/common.fish

if test $DESKTOP_SESSION = "LXDE"
    setxkbmap it
    xset s off
    xset -dpms
    export XDG_CURRENT_DESKTOP=lxde
    export MOZ_ENABLE_WAYLAND=0
    export QT_QPA_PLATFORM=xcb
else if test $DESKTOP_SESSION = "/usr/share/wayland-sessions/sway"
    export XDG_CURRENT_DESKTOP=sway
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland
end

function f
    fff $argv
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end
