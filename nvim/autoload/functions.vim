function functions#SetColorColumn()
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

function functions#SetSpell()
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

function functions#SetFold()
    if &foldmethod == 'manual'
        set foldmethod=indent
        normal zM
    else
        normal zR
        set foldmethod=manual
    endif
endfunction

function functions#GetFileName()
    let @+=expand('%:p')
    echo expand('%:p')
endfunction
