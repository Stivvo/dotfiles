"instant markdown
let g:instant_markdown_browser = ""
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_slow = 1
let g:instant_markdown_port = 8888
nnoremap ZZ :InstantMarkdownStop<Cr>:wq<Cr>
noremap ZQ :InstantMarkdownStop<Cr>:q<Cr>

"virtual lines with markdown
nnoremap j gj 
nnoremap k gk

"text
setlocal textwidth=80
let g:wrapText=1

" compile markdown and open with firefox
map <leader>m :w<Cr>:!~/prog/dotfiles/script/mark/./sh % "f" >> /dev/null<Cr>

autocmd VimEnter * !firefox-developer-edition --new-window "http://127.0.0.1:8888/"

