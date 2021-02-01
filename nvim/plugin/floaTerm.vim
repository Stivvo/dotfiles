let g:floaterm_wintype = 'floating'
let g:floaterm_position = 'center'
let g:floaterm_autoclose = 2
let g:floaterm_gitcommit = 'floaterm'
let g:floaterm_width=0.5
let g:floaterm_height=0.6

"horizontal split
nnoremap <silent> <Leader>x :FloatermNew --height=0.4 --wintype=normal --position=bottom<CR>
tnoremap <silent> <Leader>x <C-\><C-n>:FloatermNew --height=0.4 --wintype=normal --position=bottom<CR>

"vertical split
nnoremap <silent> <Leader>v :FloatermNew --wintype=normal --position=right<CR>
tnoremap <silent> <Leader>v <C-\><C-n>:FloatermNew --wintype=normal --position=right<CR>

nnoremap <silent> <Leader>t :FloatermToggle<CR>
tnoremap <silent> <Leader>t <C-\><C-n>:FloatermToggle<CR>

nnoremap <silent> <Leader>e :FloatermNew<CR>
tnoremap <silent> <Leader>e <C-\><C-n>:FloatermNew<CR>

nnoremap <silent> <Leader>p :FloatermPrev<CR>
tnoremap <silent> <Leader>p <C-\><C-n>:FloatermPrev<CR>

nnoremap <silent> <Leader>n :FloatermNext<CR>
tnoremap <silent> <Leader>n <C-\><C-n>:FloatermNext<CR>

nnoremap <silent> <Leader>k :FloatermKill<CR>
tnoremap <silent> <Leader>k <C-\><C-n>:FloatermKill<CR>

nnoremap <Space>6 :FloatermNew! --height=0.5 --width=0.3 fff <Cr>

tnoremap <silent> <C-space> <C-\><C-n>
tnoremap <silent> <C-h> <C-\><C-n><C-w><C-k><C-w><C-h>
tnoremap <silent> <C-u> <C-\><C-n><C-w><C-k>

tnoremap <silent> <C-Up> <C-\><C-n>:resize +5<Cr>A
tnoremap <silent> <C-Down> <C-\><C-n>:resize -5<Cr>A
tnoremap <silent> <C-Left> <C-\><C-n>:vertical resize +10<Cr>A
tnoremap <silent> <C-Right> <C-\><C-n>:vertical resize -10<Cr>A
