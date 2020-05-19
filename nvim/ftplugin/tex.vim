"virtual lines as normal lines
nnoremap <buffer> j gj
nnoremap <buffer> k gk

"text width
setlocal textwidth=80
let g:wrapText=1

"vimtex
nnoremap <buffer> <Space>o :VimtexTocOpen<Cr>
nnoremap <buffer> <Space>t :VimtexTocToggle<Cr>
autocmd VimEnter * VimtexCompile
