let g:floaterm_wintype = 'floating'
let g:floaterm_position = 'center'
let g:floaterm_autoclose = 2
let g:floaterm_gitcommit = 'floaterm'
let g:floaterm_width=0.5
let g:floaterm_height=0.6

"horizontal split
nnoremap <silent> ¬X :FloatermNew --height=0.4 --wintype=normal --position=bottom<CR>
tnoremap <silent> ¬X <C-\><C-n>:FloatermNew --height=0.4 --wintype=normal --position=bottom<CR>

"vertical split
nnoremap <silent> ¬W :FloatermNew --wintype=normal --position=right<CR>
tnoremap <silent> ¬W <C-\><C-n>:FloatermNew --wintype=normal --position=right<CR>

nnoremap <silent> ¬T :FloatermToggle<CR>
tnoremap <silent> ¬T <C-\><C-n>:FloatermToggle<CR>

nnoremap <silent> ¬M :FloatermNew<CR>
tnoremap <silent> ¬M <C-\><C-n>:FloatermNew<CR>

nnoremap <silent> ¬P :FloatermPrev<CR>
tnoremap <silent> ¬P <C-\><C-n>:FloatermPrev<CR>

nnoremap <silent> ¬N :FloatermNext<CR>
tnoremap <silent> ¬N <C-\><C-n>:FloatermNext<CR>

nnoremap <silent> ¬K :FloatermKill<CR>
tnoremap <silent> ¬K <C-\><C-n>:FloatermKill<CR>

nnoremap <Space>6 :FloatermNew! --height=0.5 --width=0.3 fff <Cr>

tnoremap <silent> <C-space> <C-\><C-n>
tnoremap <silent> <C-h> <C-\><C-n><C-w><C-k><C-w><C-h>
tnoremap <silent> <C-u> <C-\><C-n><C-w><C-k>

tnoremap <silent> <C-Up> <C-\><C-n>:resize +5<Cr>A
tnoremap <silent> <C-Down> <C-\><C-n>:resize -5<Cr>A
tnoremap <silent> <C-Left> <C-\><C-n>:vertical resize +10<Cr>A
tnoremap <silent> <C-Right> <C-\><C-n>:vertical resize -10<Cr>A
