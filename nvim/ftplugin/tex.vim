packadd $XDG_CONFIG_HOME/nvim/pack/plugins/opt/vimtex

"virtual lines as normal lines
nnoremap <buffer> j gj
nnoremap <buffer> k gk

"text width
setlocal textwidth=80
let g:wrapText=1

"vimtex
nnoremap <buffer> <Space>o :VimtexTocOpen<Cr>
nnoremap <buffer> <Space>t :VimtexTocToggle<Cr>
nnoremap <buffer> <Space>m :VimtexCompile<Cr>
