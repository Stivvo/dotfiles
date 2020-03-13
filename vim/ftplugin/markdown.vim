"instant markdown
let g:instant_markdown_browser = "brave "
"let g:instant_markdown_autostart = 1
"let g:instant_markdown_autoscroll = 1
"let g:instant_markdown_slow = 1
"let g:instant_markdown_port = 8888
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'

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

" autocmd VimEnter * !firefox-developer-edition --new-window "http://127.0.0.1:8888/"

