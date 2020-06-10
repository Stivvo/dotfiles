"instant markdown
let g:instant_markdown_browser = "firefox-developer-edition --new-window "
let g:instant_markdown_autostart = 1
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_slow = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 1

let g:previewStarted = 1
function InstantMarkdownToggle()
    if g:previewStarted == 1
        :InstantMarkdownStop
        let g:previewStarted = 0
    else
        :InstantMarkdownPreview
        let g:previewStarted = 1
    endif
endfunction
nnoremap <buffer> <silent> <leader>w :call InstantMarkdownToggle()<Cr>

nnoremap <buffer> ZZ :InstantMarkdownStop<Cr>:wq<Cr>
nnoremap <buffer> ZQ :InstantMarkdownStop<Cr>:q<Cr>

"vim-markdown
let g:vim_markdown_new_list_item_indent = 0

"virtual lines with markdown
nnoremap <buffer> j gj
nnoremap <buffer> k gk

"text
setlocal textwidth=80
set colorcolumn=80
set shiftwidth=2

" compile markdown
nnoremap <buffer> <silent> <Space>m :w<Cr>:!~/prog/dotfiles/script/mark/./sh % "f" >> /dev/null<Cr><Cr>
nnoremap <buffer> <silent> <Space>p :silent w<Cr>:!~/prog/dotfiles/script/mark/./presentation.sh % "f" & >> /dev/null<Cr><Cr>

"useful mappings for moving around
nnoremap <buffer> <Space>h /^[#]\+ [a-z A-Z']*\c<left><left>
