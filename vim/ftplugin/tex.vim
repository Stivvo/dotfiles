"virtual lines as normal lines
nnoremap j gj
nnoremap k gk

"text width
setlocal textwidth=80
let g:wrapText=1

"vimtex
nmap <Space>o :VimtexTocOpen<Cr>
nmap <Space>t :VimtexTocToggle<Cr>
autocmd VimEnter * VimtexCompile

