let g:floaterm_wintype = 'floating'
let g:floaterm_position = 'bottomright'
let g:floaterm_autoclose = 2
let g:floaterm_gitcommit = 'floaterm'
let g:floaterm_width=0.45
let g:floaterm_height=0.5

"horizontal split
nnoremap <silent> <leader>tx :FloatermNew --wintype=normal --position=bottom<CR>
tnoremap <silent> <leader>tx <C-\><C-n>:FloatermNew --wintype=normal --position=bottom<CR>

"vertical split
nnoremap <silent> <leader>tv :FloatermNew --wintype=normal --position=right<CR>
tnoremap <silent> <leader>tv <C-\><C-n>:FloatermNew --wintype=normal --position=right<CR>

nnoremap <silent> <leader>tt :FloatermToggle<CR>
tnoremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>

nnoremap <silent> <leader>tm :FloatermNew<CR>
tnoremap <silent> <leader>tm <C-\><C-n>:FloatermNew<CR>

nnoremap <silent> <leader>tp :FloatermPrev<CR>
tnoremap <silent> <leader>tp <C-\><C-n>:FloatermPrev<CR>

nnoremap <silent> <leader>tn :FloatermNext<CR>
tnoremap <silent> <leader>tn <C-\><C-n>:FloatermNext<CR>

nnoremap <silent> <leader>tk :FloatermKill<CR>
tnoremap <silent> <leader>tk <C-\><C-n>:FloatermKill<CR>

nnoremap + :FloatermNew! --height=0.5 --width=0.3 fff <Cr>
nnoremap <Space>5 :FloatermNew! --wintype=normal --position=right fff <Cr>
