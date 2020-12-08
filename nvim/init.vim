"general options
let mapleader="`"
set mouse=a
set confirm
set so=8 "cursor above 8 lines from the bottom of the screen
filetype plugin indent on

"indent
set smartindent
set noexpandtab
set softtabstop=0 "use tabs over spaces
set shiftwidth=4 "width of automatic indentation
set tabstop=4 "width of tab

"search
set ignorecase
set showmatch

source ~/.config/nvim/other/vim-plug.vim

if exists('ena_gui')
	source ~/.config/nvim/other/gui.vim
endif

"remember last line and undos
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set undofile
set undodir=$HOME/.local/undonvim

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"general mappings
nnoremap <silent> <Esc><Esc> :w<Cr>:nohlsearch<Cr>
nnoremap ^ @m
nnoremap Y y$
nnoremap cw dwi
nnoremap <Space>y :let @+=expand('%:p')<Cr>:echo expand('%:p')<Cr>

"change/delete if/for
nnoremap dai $?if\\|for<Cr>dt{da{
nnoremap cai $?if\\|for<Cr>dt{ca{
nnoremap cic $?if\\|for<Cr>f(ci(

"move selected text
vnoremap J :m '>+1<Cr>gv=gv
vnoremap K :m '<-2<Cr>gv=gv

"trim and join lines
vnoremap <Enter> J
noremap <Leader><Enter> J
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

"numbers
set number relativenumber
nnoremap <silent> <Space><Leader> :set number relativenumber!<Cr>

"columns
set colorcolumn=0
	function SetColorColumn()
		if &colorcolumn == 120
        set colorcolumn=0
        echo "--"
    else
        if &colorcolumn == 0
            set colorcolumn=80
        elseif &colorcolumn == 80
            set colorcolumn=98
        elseif &colorcolumn == 98
            set colorcolumn=120
        endif
        echo &colorcolumn
    endif
endfunction
noremap <Space>1 :call SetColorColumn()<Cr>

"spelling
function SetSpell()
    if &spell == 0
        set spell spelllang=it
    else
        if &spelllang ==# 'it'
            set spell spelllang=en
        else
            set nospell
        endif
    endif
endfunction
noremap <silent> <Space>2 :call SetSpell()<Cr>

"auto formatting
function! Kformat()
    let line = line('.')
    :norm gg=G
    :exec line
endfunction
noremap <Space>3 :call Kformat()<Cr>

"netrw vertical split
nnoremap <Space>4 :Vex<Cr>:vertical resize 80<Cr>

"switch between splits
set splitbelow splitright
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
"split resizing
nnoremap <silent> <S-Up> :resize +5<Cr>
nnoremap <silent> <S-Down> :resize -5<Cr>
nnoremap <silent> <S-Left> :vertical resize +5<Cr>
nnoremap <silent> <S-Right> :vertical resize -5<Cr>
nnoremap <silent> <Up> :resize +10<Cr>
nnoremap <silent> <Down> :resize -10<Cr>
nnoremap <silent> <Left> :vertical resize +10<Cr>
nnoremap <silent> <Right> :vertical resize -10<Cr>
nnoremap <silent> <C-Up> :resize +20<Cr>
nnoremap <silent> <C-Down> :resize -20<Cr>
nnoremap <silent> <C-Left> :vertical resize +20<Cr>
nnoremap <silent> <C-Right> :vertical resize -20<Cr>
