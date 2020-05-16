nnoremap <silent> <F6> :F<Cr>
nnoremap <silent> <Leader><F6> :vsplit<Cr>:F<Cr>
nnoremap <silent> <Space><F6> :split<Cr>:F<Cr>

" Vertical split (NERDtree style).
let g:fff#split = "30vnew"
let g:fff#split_direction = "splitbelow splitright"