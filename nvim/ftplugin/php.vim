source $XDG_CONFIG_HOME/nvim/other/closeTag.vim

"open php
nnoremap <buffer> <Space>h :!firefox --new-window 'localhost/esercizi/%'<Cr>

function PhpHtml()
    if &filetype ==# 'html'
        set filetype=php
    else
        set filetype=html
    endif
endfunction

nnoremap <buffer> <Space>p :call PhpHtml()<Cr>:echo &filetype<Cr>
