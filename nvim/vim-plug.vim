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
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

"---git
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'mhinz/vim-startify'
Plug 'rhysd/git-messenger.vim'

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

"---languages
Plug 'shmup/vim-sql-syntax'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/a.vim', { 'for': ['c',  'cpp'] }
Plug 'alvan/vim-closetag', { 'for': ['xml', 'html', 'javascript', 'php'] }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'vim-scripts/dbext.vim', { 'for': 'sql' }

"maybe
"Plug 'ycm-core/YouCompleteMe'
"Plug 'bazelbuild/vim-bazel'
"Plug 'justmao945/vim-clang'
"Plug 'scrooloose/syntastic'
"Plug 'JessicaKMcIntosh/Vim'

call plug#end()

