let mapleader =" "
set encoding=UTF-8
set backspace=indent,eol,start
let b:wrapText=0

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
nmap <Up> <C-w>+
nmap <Down> <C-w>-
nmap <Left> <C-w><
nmap <Right> <C-w>>

"tabs
map <leader>k :tabp<Cr>
map <leader>j :tabn<Cr>

set showmode
set showcmd
syntax on
set mouse=a
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

"save pressing ESC twice
function! Save()
    if b:wrapText == 1
        let line = line('.')
        :norm ggVGgq
        :exec line
    endif
endfunction
map <Esc><Esc> :w<Cr>:call Save()<Cr>
" compile markdown and open with firefox
map <leader>m :w<Cr>:!~/prog/dotfiles/script/mark/./sh % "f" >> /dev/null<Cr>

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
Plug 'vifm/vifm.vim'
Plug 'scrooloose/nerdtree'
"Programming
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
"Plug 'scrooloose/syntastic'
"languages
"Plug 'bazelbuild/vim-bazel'
"Plug 'justmao945/vim-clang'
Plug 'valloric/youcompleteme'
Plug 'othree/xml.vim', {'for': ['xml', 'html']}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ap/vim-css-color', {'for': 'css'} 
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"other
Plug 'airblade/vim-gitgutter'
Plug 'google/vim-maktaba'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"goyo
let g:goyo_width = 120
let g:goyo_height = 100
let g:goyo_margin_top = 1
let g:goyo_margin_bottom = 1
map <leader>f :Goyo<Cr>

"ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<F7>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"nerdtree
map <F8> :NERDTreeToggle<CR>
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

"instant markdown
let g:instant_markdown_browser = "firefox --private-window"
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_slow = 1

"virtual lines with markdown
autocmd Filetype markdown nnoremap j gj
autocmd Filetype markdown nnoremap k gk
autocmd BufRead,BufNewFile *.md,*.mkd,*.c,*.cpp,*.php,*.html,*.css,*.js
    \ setlocal textwidth=80
autocmd BufRead,BufNewFile *.md,*.mkd,*.c,*.cpp,*.php,*.html,*.css,*.js
    \ let b:wrapText=1
autocmd BufRead,BufNewFile *.md,*.mkd
    \ nnoremap ZZ :InstantMarkdownStop<Cr>:wq<Cr>
autocmd BufRead,BufNewFile *.md,*.mkd
    \ nnoremap ZQ :InstantMarkdownStop<Cr>:q!<Cr>
