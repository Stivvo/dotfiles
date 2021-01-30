"general options
let mapleader="`"
set mouse=a
set confirm
set so=6 "cursor above 8 lines from the bottom of the screen
silent! helptags ALL

"indent
set smartindent
set noexpandtab
set softtabstop=0 "use tabs over spaces
set shiftwidth=4 "width of automatic indentation
set tabstop=4 "width of tab

"search
set ignorecase
set showmatch

if $COLORTERM == 'truecolor'
	source $XDG_CONFIG_HOME/nvim/other/gui.vim
endif

"remember last line and undos
au BufReadPost * | silent! exe "normal! g'\"" |
set undofile
set undodir=$HOME/.local/undonvim

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"general mappings
nnoremap <silent> <Esc><Esc> :w<Cr>:nohlsearch<Cr>
nnoremap ^ @m
nnoremap Y y$
nnoremap cw dwi
nnoremap <Space>y :call functions#GetFileName()<Cr>
nnoremap <silent> <Space>d :bdelete<Cr>

"change/delete if/for
nnoremap dai $?if\\|for<Cr>dt{da{
nnoremap cai $?if\\|for<Cr>dt{ca{
nnoremap cic $?if\\|for<Cr>f(ci(

"move selected text
vnoremap J :m '>+1<Cr>gv=gv
vnoremap K :m '<-2<Cr>gv=gv

"trim and join lines
vnoremap <Enter> J
nnoremap <Leader><Enter> J
nnoremap <Space><Enter> i<Enter><Esc>

"buffers
nnoremap <silent> K :bprevious<Cr>
nnoremap <silent> J :bNext<Cr>

"move from space to space
nnoremap <Space>w f<Space>
nnoremap <Space>b F<Space>

"multiple change
nnoremap cn *``cgn
nnoremap cN *``cgN

"numbered mappings
set number relativenumber
nnoremap <silent> <Space><Leader> :set number relativenumber!<Cr>
noremap <Space>1 :call functions#ToggleColorColumn()<Cr>
set nospell spelllang=
noremap <silent> <Space>2 :call functions#ToggleSpell()<Cr>
nnoremap <silent><Space>3 :call functions#ToggleFold()<Cr>
nnoremap <Space>4 :Vex<Cr>
nnoremap <silent><Space>5 :call functions#ToggleFaster()<Cr>

"switch between splits
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

"split resizing
nnoremap <silent> <Up> :resize +9<Cr>
nnoremap <silent> <Down> :resize -9<Cr>
nnoremap <silent> <Left> :vertical resize +9<Cr>
nnoremap <silent> <Right> :vertical resize -9<Cr>
nnoremap <silent> <C-Up> :resize +20<Cr>
nnoremap <silent> <C-Down> :resize -20<Cr>
nnoremap <silent> <C-Left> :vertical resize +20<Cr>
nnoremap <silent> <C-Right> :vertical resize -20<Cr>
