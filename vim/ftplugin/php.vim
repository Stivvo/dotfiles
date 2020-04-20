"open php
nnoremap <Space>h :!firefox --new-window 'localhost/esercizi/%'<Cr> 

function PhpHtml()
    if &filetype ==# 'html'
        set filetype=php
    else
        set filetype=html
    endif
endfunction

nnoremap <Space>p :call PhpHtml()<Cr>:echo &filetype<Cr>
