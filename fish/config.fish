fish_vi_key_bindings
set fish_greeting

source $HOME/.config/fish/common.fish

function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end
