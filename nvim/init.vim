"general options
set encoding=UTF-8
set backspace=indent,eol,start
let g:wrapText=0
syntax on
set mouse=a
set confirm
set so=8 "cursor above 8 lines from the bottom of the screen
set ruler
set nocompatible

"indent
set autoindent
filetype indent on
filetype plugin on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set smartindent
set expandtab
set smarttab
set shiftwidth=4

"search
set ignorecase
set smartcase
set nohlsearch
set incsearch
set showmatch
nmap <silent> <F4> :set hlsearch!<Cr>

"statusline
set wildmenu
set showmode
set showcmd
set laststatus=2
set statusline+=%f

"Plugins
call plug#begin('~/.config/nvim/plugged')
"--dependencies
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'google/vim-maktaba'
Plug 'ryanoasis/vim-devicons'
"--appearance
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
"---file
Plug 'junegunn/fzf', { 'on': 'FZF' }
Plug 'dylanaraps/fff.vim', { 'on': 'F' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'voldikss/vim-floaterm', { 'on': ['FloatermNew', 'FloatermToggle'] }
"---motions
Plug 'terryma/vim-multiple-cursors'
Plug 'unblevable/quick-scope'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
"---git
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'mhinz/vim-startify'
"---Programming
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'adelarsq/vim-matchit'
Plug 'arp242/jumpy.vim'
Plug 'majutsushi/tagbar', { 'on': ['Tagbar', 'TagbarOpenAutoClose'] }
"---languages
Plug 'shmup/vim-sql-syntax'
Plug 'vimwiki/vimwiki'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/a.vim', { 'for': ['c',  'cpp'] }
Plug 'othree/xml.vim', { 'for': ['xml', 'html'] }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'vim-scripts/dbext.vim', { 'for': 'sql' }
"maybe
"Plug 'ycm-core/YouCompleteMe'
"Plug 'bazelbuild/vim-bazel'
"Plug 'justmao945/vim-clang'
"Plug 'scrooloose/syntastic'
" Plug 'JessicaKMcIntosh/Vim'
call plug#end()

" go to last line
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"truecolor on alacritty
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
set ttymouse=xterm2

colorscheme codedark
"set guifont=JetBrainsMono\ Nerd\ Font\ Mono\ Regular\ 10
set guifont=Proggy\ Vector\ Regular\ 10
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight ColorColumn guibg=#2c2c2c
highlight CursorLine guibg=#2c2c2c

"columns
set colorcolumn=0
set cursorcolumn
highlight CursorColumn cterm=bold guibg=#2c2c2c
function SetColorColumn()
    if &colorcolumn == 0
        set colorcolumn=80
    else
        set colorcolumn=0
    endif
    echo &colorcolumn
endfunction
nnoremap <F3> :call SetColorColumn()<Cr>
nnoremap <C-F3> :set colorcolumn=

"auto formatting
function! Kformat()
    let line = line('.')
    :norm gg=G
    "to 80 char:
    ":norm ggVGgq
    :exec line
endfunction
nnoremap <F9> :call Kformat()<Cr>

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
"cycle between split directions
nnoremap <silent> <F10> :set splitbelow!<Cr>:set splitright!<Cr>
"switch from vertical to horizontal - horizontal to vertical
nnoremap <Space>j <C-w>H
nnoremap <Space>k <C-w>K

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
nnoremap <silent> <F5> :call SetSpell()<Cr>

"general mapping
nnoremap <Esc><Esc> :w<Cr>
nmap ^ @n

"change/delete if / for
nnoremap dai $?if\\|for<Cr>dt{da{
nnoremap cai $?if\\|for<Cr>dt{ca{
nnoremap cic $?if\\|for<Cr>f(ci(

"move selected text
vnoremap J :m '>+1<Cr>gv=gv
vnoremap K :m '<-2<Cr>gv=gv

"swap and delete lines above / below
nnoremap + "mddk"mP
nnoremap - "mddj"mP

"trim and join lines
noremap <Del> ddk
noremap <Leader><Enter> J
nnoremap <Space><Enter> i<Enter><Esc>

"numbers
set number norelativenumber
nnoremap <silent> <F2> :set number relativenumber!<Cr>

"clipboard
inoremap <C-v> <C-r>0
vnoremap <Space>y :'<,'> :w !wl-copy<Cr><Cr>

"tabs
nnoremap K :tabprevious<Cr>
nnoremap J :tabnext<Cr>

"move around
nnoremap E gE
nnoremap <Space>w f
nnoremap <Space>b F

