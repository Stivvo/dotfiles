"text
setlocal textwidth=100
setlocal colorcolumn=100
setlocal shiftwidth=2

let g:compile_save = 0

function CompileDocument(command, open)
    :silent w

    if a:command !~ "default" "pressing space+m|p
        if g:compile_save == 1
            let g:compile_save = 0
        else
            let g:compile_save = 1
            let g:pandoc_compiler = a:command
        endif
    endif

    echo "compileonsave: " . g:compile_save

    if g:compile_save == 1
        :silent execute "!" . g:pandoc_compiler . ' ' . resolve(expand('%:p')) . ' ' . a:open . ' &'
        if file_readable("/tmp/marksh.txt")
            :silent execute "! sleep 1s"
            :execute
        endif
    endif
endfunction

" compile markdown
nnoremap <buffer> <Space>m :call CompileDocument("mark.sh", "f") <Cr>
nnoremap <buffer> <Space>p :call CompileDocument("presentation.sh", "f") <Cr>
nnoremap <buffer> <Space>e :split /tmp/marksh.txt <Cr>

nnoremap <buffer> <silent> <Esc><Esc> :call CompileDocument("default", "n") <Cr>

"useful mappings for moving around
nnoremap <buffer> <Space>h /^[#]\+ [a-z A-Z']*\c<left><left>
