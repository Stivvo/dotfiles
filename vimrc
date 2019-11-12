let mapleader =" "

"basics
filetype indent on
filetype plugin on
filetype plugin indent on
set number norelativenumber

"splits
set splitbelow splitright
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-j> <C-w>j

"tabs
":tabe <filepath> to open a tab or C-p + <filepath> + C-t
map <leader>k :tabp<Cr>
map <leader>j :tabn<Cr>

"set omnifunc=syntaxcomplete#Complete
set showmode
set showcmd
syntax on
set mouse=i
set confirm

"cursor above 8 lines from the bottom of the screen
set so=8

"text width
set ignorecase
"set hlsearch
"set incsearch
"set showmatch
set ruler
"set textwidth=80
set colorcolumn=80

"complention
set wildmenu

"indent
set smartcase
set smartindent
set expandtab
set smarttab
set shiftwidth=4

"spelling
function! SetSpell() 
    if &spell == 1
        set spell nospell
    else
        set spell spell spelllang=it
    endif
    echo &spell
endfunction
map <leader>s :call SetSpell()<Cr>

function! Save()
    if &filetype ==# 'markdown'
       :!~/prog/dotfiles/script/mark/./sh %
    endif
endfunction

"save pressing esc twice
map <Esc><Esc> :w<Cr>:call Save()<Cr>

"Set number
function! SetNumber()
    if &relativenumber == 1
        set number relativenumber norelativenumber
    else
        set number relativenumber relativenumber
    endif
endfunction
map <leader>n :call SetNumber()<Cr>
map <leader><S-n> :set nonumber norelativenumber<Cr>

"open with gedit
map <leader>g :!gedit<space>%<Cr>

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
let g:ctrlp_map = '<C-i>'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"writing text
if &filetype != 'markdown'
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
endif

if &filetype != 'text'
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
endif

