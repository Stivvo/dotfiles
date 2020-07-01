"text
setlocal textwidth=100
setlocal colorcolumn=100
setlocal shiftwidth=2

let g:compile_save = 0

function CompileDocument(command, open)
    if a:command == "default"
        :w
    else
        :silent w

        if g:compile_save == 1
            let g:compile_save = 0
        else
            let g:compile_save = 1
            let g:pandoc_compiler = a:command
        endif
        echo "compileonsave: " . g:compile_save
    endif

    if g:compile_save == 1
        :silent execute "!" . g:pandoc_compiler . ' ' . resolve(expand('%:p')) . ' ' . a:open . ' &'
    endif
endfunction

" compile markdown
nnoremap <buffer> <Space>m :call CompileDocument("mark.sh", "f") <Cr>
nnoremap <buffer> <Space>p :call CompileDocument("presentation.sh", "f") <Cr>
nnoremap <buffer> <Space>e :split /tmp/marksh.txt <Cr>

nnoremap <buffer> <Esc><Esc> :nohlsearch<Cr>:call CompileDocument("default", "n")<Cr>

"useful mappings for moving around
nnoremap <buffer> <Space>h /^[#]\+ [a-z A-Z']*\c<left><left>

source ~/.config/nvim/other/markdown-preview.vim
