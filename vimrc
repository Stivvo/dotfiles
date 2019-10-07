let mapleader =" "

"basics
filetype plugin on
set number norelativenumber
filetype indent on

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
set mouse=a
set confirm

"cursor above 8 lines from the bottom of the screen
set so=8

"text width
set ignorecase
"set hlsearch
"set incsearch
"set showmatch
set ruler
set textwidth=80
set colorcolumn=80

"complention
set wildmenu

"indent
set smartcase
set smartindent
set expandtab
set smarttab
set shiftwidth=4

"shortcuts

"save pressing esc twice
map <Esc><Esc> :w<Cr>
"set numbers
map <leader>n :set number norelativenumber<Cr>
map <leader>r :set number relativenumber<Cr>
"open with gedit
map <leader>g :!gedit<space>%<Cr>
"compile markdown
map <leader>m :!~/prog/dotfiles/script/mark/mark.sh<space>'<c-r>%'<Cr>
"macro
map <space> @q
"copypaste
map <leader>p "+p
map <leader>y "+y

"plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'terryma/vim-multiple-cursors'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'justmao945/vim-clang'
Plug 'kien/ctrlp.vim'
call plug#end()

"goyo
let g:goyo_width = 120
let g:goyo_height = 100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
map <C-f> :Goyo<Cr>

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

