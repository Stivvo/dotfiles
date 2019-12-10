let mapleader =" "

"go to last line
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"indent
set autoindent
filetype indent on
filetype plugin on
filetype plugin indent on
function! Kformat()
    let line = line('.')
    :norm gg=G
    :exec line
endfunction
map <F5> :call Kformat()<Cr>

"splits
set splitbelow splitright
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-j> <C-w>j

"tabs
map <leader>k :tabp<Cr>
map <leader>j :tabn<Cr>

set showmode
set showcmd
syntax on
set mouse=i
set confirm

"cursor above 8 lines from the bottom of the screen
set so=8

"text width
set ignorecase
set ruler
"set textwidth=80
set colorcolumn=80

"search
set nohlsearch
set incsearch
set showmatch
map <F4> :set hlsearch!<Cr>

"completion
set wildmenu

"indent
set smartcase
set smartindent
set expandtab
set smarttab
set shiftwidth=4

"spelling
function SetSpell() 
    if &spell == 0
        set spell spelllang=it
    else
        if &spelllang ==# 'it'
            set nospell
            set spell spelllang=en
        else
            set nospell
        endif
    endif
endfunction
map <F6> :call SetSpell()<Cr>

function Save(browser)
    f!
    if &filetype ==# 'markdown'
        if a:browser ==# 'yes'
            !~/prog/dotfiles/script/mark/./sh % "f" >> /dev/null
        else
            !~/prog/dotfiles/script/mark/./sh % >> /dev/null
        endif
    endif
endfunction

"save pressing ESC twice
map <Esc><Esc> :w<Cr>:call Save('no')<Cr>
" compile markdown and open with firefox
map <leader>m :w<Cr>:call Save('yes')<Cr>

"numbers
set number norelativenumber
map <F2> :set number! norelativenumber<Cr>
map <F3> :set number relativenumber!<Cr>

"open php
map <leader>h :!firefox --new-window 'localhost/esercizi/%'<Cr>

"macro
map <space> @q

"Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
"utility
Plug 'junegunn/goyo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/ctrlp.vim'
"Programming
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
"languages
Plug 'bazelbuild/vim-bazel'
Plug 'justmao945/vim-clang'
Plug 'othree/xml.vim'
"Git
Plug 'airblade/vim-gitgutter'
"other
Plug 'google/vim-maktaba'
"unused
"Plug 'vimwiki/vimwiki'
call plug#end()

"goyo
let g:goyo_width = 120
let g:goyo_height = 100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
map <leader>f :Goyo<Cr>

"ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<F7>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"virtual lines with markdown
autocmd Filetype markdown nnoremap j gj
autocmd Filetype markdown nnoremap k gk
