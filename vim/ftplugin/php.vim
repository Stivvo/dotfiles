"open php
map <leader>h :!firefox --new-window 'localhost/esercizi/%'<Cr> 

function PhpHtml()
    if &filetype ==# 'html'
        set filetype=php
    else
        set filetype=html
    endif
endfunction

map <leader>s :call PhpHtml()<Cr>:echo &filetype<Cr>
