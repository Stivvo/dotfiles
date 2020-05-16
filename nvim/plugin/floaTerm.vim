let g:floaterm_wintype = 'normal'
let g:floaterm_position = 'right'
let g:floaterm_autoclose = 2

"horizontal split
nnoremap <silent> <leader>tx :FloatermNew --wintype=normal --position=bottom<CR>
tnoremap <silent> <leader>tx <C-\><C-n>:FloatermNew --wintype=normal --position=bottom<CR>

"vertical split
nnoremap <silent> <leader>tv :FloatermNew --wintype=normal --position=right<CR>
tnoremap <silent> <leader>tv <C-\><C-n>:FloatermNew --wintype=normal --position=right<CR>

"toggle
nnoremap <silent> <leader>tt :FloatermToggle<CR>
tnoremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>

"commands

nnoremap <silent> <leader>tp :FloatermPrev<CR>
tnoremap <silent> <leader>tp <C-\><C-n>:FloatermPrev<CR>

nnoremap <silent> <leader>tn :FloatermNext<CR>
tnoremap <silent> <leader>tn <C-\><C-n>:FloatermNext<CR>

nnoremap <silent> <leader>tk :FloatermKill<CR>
tnoremap <silent> <leader>tk <C-\><C-n>:FloatermKill<CR>
