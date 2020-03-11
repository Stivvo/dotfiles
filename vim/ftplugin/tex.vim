"virtual lines as normal lines
nnoremap j gj
nnoremap k gk

"text width
setlocal textwidth=80
let g:wrapText=1

"vimtex
nmap <F9> :VimtexTocOpen<Cr>
nmap <C-F9> :VimtexTocToggle<Cr>
autocmd VimEnter * VimtexCompile

