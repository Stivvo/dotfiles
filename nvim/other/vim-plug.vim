call plug#begin('~/.config/nvim/plugged')

"--dependencies
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'google/vim-maktaba'
Plug 'kana/vim-operator-user'

"--appearance
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'sheerun/vim-polyglot'

"---file
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm', { 'on': ['FloatermNew', 'FloatermToggle'] }
Plug 'dylanaraps/root.vim', { 'on': 'Root' }
Plug 'tpope/vim-vinegar'

"---motions
Plug 'terryma/vim-multiple-cursors'
Plug 'unblevable/quick-scope'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

"---git
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"---Programming
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'adelarsq/vim-matchit'
Plug 'arp242/jumpy.vim'
Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle', 'TagbarOpenAutoClose'] }
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

"---languages
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'fedorenchik/qt-support.vim', { 'for': ['c',  'cpp', 'qmake', 'qml'] }
Plug 'rhysd/vim-clang-format', { 'for': ['c',  'cpp'] }
Plug 'alvan/vim-closetag', { 'for': ['xml', 'html', 'javascript', 'php'] }

" maybe
" Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
" Plug 'ycm-core/YouCompleteMe'
" Plug 'bazelbuild/vim-bazel'
" Plug 'justmao945/vim-clang'
" Plug 'scrooloose/syntastic'
" Plug 'JessicaKMcIntosh/Vim'
" Plug 'skammer/vim-css-color'
" Plug 'shmargum/vim-sass-colors'

call plug#end()

