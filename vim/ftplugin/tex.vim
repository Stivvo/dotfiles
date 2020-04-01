"virtual lines as normal lines
nnoremap j gj
nnoremap k gk

"text width
setlocal textwidth=80
let g:wrapText=1

"vimtex
nmap <leader>o :VimtexTocOpen<Cr>
nmap <leader>t :VimtexTocToggle<Cr>
autocmd VimEnter * VimtexCompile

