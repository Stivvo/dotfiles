"cycle trough no column, 80, 98, 120 char
function functions#ToggleColorColumn()
    if &colorcolumn == 120
        set colorcolumn=0
        echo "--"
    else
        if &colorcolumn == 0
            set colorcolumn=80
        elseif &colorcolumn == 80
            set colorcolumn=98
        elseif &colorcolumn == 98
            set colorcolumn=120
        endif
        echo &colorcolumn
    endif
endfunction

"cycle trough no spell, it, eng
function functions#ToggleSpell()
    if &spell == 0
        set spell spelllang=it
    else
        if &spelllang ==# 'it'
            set spell spelllang=en
        else
            set nospell spelllang=
        endif
    endif
endfunction

"enable and set folding
function functions#ToggleFold()
    if &foldmethod == 'manual'
        set foldmethod=indent
        normal zM
    else
        normal zR
        set foldmethod=manual
    endif
endfunction

"copy the current file name to the clipboard
function functions#GetFileName()
    let @+=expand('%:p')
    echo expand('%:p')
endfunction
