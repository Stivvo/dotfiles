noremap <silent> <Bs> :F<Cr>
noremap <silent> <Leader><Bs> :vsplit<Cr>:F<Cr>
noremap <silent> <Space><Bs> :split<Cr>:F<Cr>

" Vertical split (NERDtree style).
let g:fff#split = "30vnew"
let g:fff#split_direction = "splitbelow splitright"
