let g:floaterm_wintype = 'floating'
let g:floaterm_position = 'center'
let g:floaterm_autoclose = 2
let g:floaterm_gitcommit = 'floaterm'
let g:floaterm_width=0.5
let g:floaterm_height=0.6

"horizontal split
nnoremap <silent> <leader>tx :FloatermNew --height=0.4 --wintype=normal --position=bottom<CR>
tnoremap <silent> <leader>tx <C-\><C-n>:FloatermNew --height=0.4 --wintype=normal --position=bottom<CR>

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

nnoremap <Space>4 :FloatermNew! --height=0.5 --width=0.3 fff <Cr>
nnoremap <Space>5 :FloatermNew! --wintype=normal --position=right fff <Cr>

tnoremap <silent> <C-space> <C-\><C-n>
tnoremap <silent> <C-h> <C-\><C-n><C-w><C-k><C-w><C-h>
tnoremap <silent> <C-i> <C-\><C-n><C-w><C-k>

tnoremap <silent> <C-Up> <C-\><C-n>:resize +5<Cr>A
tnoremap <silent> <C-Down> <C-\><C-n>:resize -5<Cr>A
tnoremap <silent> <C-Left> <C-\><C-n>:vertical resize +10<Cr>A
tnoremap <silent> <C-Right> <C-\><C-n>:vertical resize -10<Cr>A
