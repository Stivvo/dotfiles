"general options
set mouse=a
set confirm
set so=8 "cursor above 8 lines from the bottom of the screen
filetype plugin indent on

"indent
set smartindent
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=-1

"search
set ignorecase
set showmatch

source ~/.config/nvim/vim-plug.vim

" go to last line
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"truecolor on alacritty
set termguicolors
colorscheme codedark
"set guifont=Proggy\ Vector\ Regular\ 10
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight ColorColumn guibg=#2c2c2c
highlight CursorLine guibg=#2c2c2c
hi htmlBold gui=bold
hi htmlItalic gui=italic

"columns
set colorcolumn=0
set cursorcolumn
highlight CursorColumn cterm=bold guibg=#2c2c2c
function SetColorColumn()
    if &colorcolumn == 120
        set colorcolumn=0
        echo "--"
    else
        if &colorcolumn == 80
            set colorcolumn=120
        else
            set colorcolumn=80
        endif
        echo &colorcolumn
    endif
endfunction
noremap <Space>2 :call SetColorColumn()<Cr>

"auto formatting
function! Kformat()
    let line = line('.')
    :norm gg=G
    "to 80 char:
    ":norm ggVGgq
    :exec line
endfunction
noremap <Space>5 :call Kformat()<Cr>

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
noremap <silent> <Space>4 :set splitbelow!<Cr>:set splitright!<Cr>
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
noremap <silent> <Space>3 :call SetSpell()<Cr>

"general mapping
nnoremap <silent> <Esc><Esc> :w<Cr>:nohlsearch<Cr>
nmap ^ @m

"change/delete if / for
nnoremap dai $?if\\|for<Cr>dt{da{
nnoremap cai $?if\\|for<Cr>dt{ca{
nnoremap cic $?if\\|for<Cr>f(ci(

"move selected text
vnoremap J :m '>+1<Cr>gv=gv
vnoremap K :m '<-2<Cr>gv=gv

"swap and delete lines above / below
nnoremap + "gddk"gP
nnoremap - "gddj"gP

"trim and join lines
noremap <Del> ddk
noremap <Leader><Enter> J
nnoremap <Space><Enter> i<Enter><Esc>
nnoremap Y y$

"numbers
set number relativenumber
nnoremap <silent> <Space>1 :set number relativenumber!<Cr>

"clipboard
inoremap <C-v> <C-r>0
vnoremap <Space>y :'<,'> :w !wl-copy<Cr><Cr>

"tabs
nnoremap <silent> K :tabprevious<Cr>
nnoremap <silent> J :tabnext<Cr>

"move around
nnoremap <Space>w f<Space>
nnoremap <Space>b F<Space>

"multiple change
nnoremap cn *``cgn
nnoremap cN *``cgN

