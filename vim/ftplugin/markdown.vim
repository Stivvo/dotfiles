"instant markdown
let g:instant_markdown_browser = "firefox-developer-edition --new-window "
let g:instant_markdown_autostart = 1
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_slow = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 1

nnoremap ZZ :InstantMarkdownStop<Cr>:wq<Cr>
noremap ZQ :InstantMarkdownStop<Cr>:q<Cr>

"vim-markdown
let g:vim_markdown_new_list_item_indent = 0

"virtual lines with markdown
nnoremap j gj 
nnoremap k gk

"text
setlocal textwidth=80
let g:wrapText=1

" compile markdown and open with firefox
map <leader>m :w<Cr>:!~/prog/dotfiles/script/mark/./sh % "f" >> /dev/null<Cr>

"useful mappings for moving around
nnoremap <leader>h /^[#]\+ [a-z A-Z]*
