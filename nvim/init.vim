"general options
let mapleader="`"
set mouse=a
set confirm
set so=6 "cursor above 6 lines from the bottom of the screen

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
	"truecolor on alacritty
	set termguicolors
	colorscheme codedark
	highlight Normal ctermbg=none
	highlight NonText ctermbg=none
	hi htmlBold gui=bold
	hi htmlItalic gui=italic
endif

"remember last line and undos
au BufReadPost * normal g'"
set undofile
set undodir=$HOME/.local/undonvim
set noswapfile

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"general mappings
nnoremap <silent> <Esc> :w<Cr>:nohlsearch<Cr>
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

"buffers
nnoremap <silent> <PageDown> :bprevious<Cr>
nnoremap <silent> <PageUp> :bNext<Cr>
nnoremap <silent> \k :bprevious<Cr>
nnoremap <silent> \j :bNext<Cr>
nnoremap <silent> \l :tabNext<Cr>
nnoremap <silent> \h :tabprevious<Cr>

"multiple change
nnoremap cn *``cgn
nnoremap cN *``cgN

"numbered mappings
set number relativenumber
nnoremap <silent> <Space><Leader> :set number relativenumber!<Cr>
nnoremap <Space>1 :call functions#ToggleColorColumn()<Cr>
nnoremap <silent> <Space>2 :call functions#ToggleSpell()<Cr>
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
