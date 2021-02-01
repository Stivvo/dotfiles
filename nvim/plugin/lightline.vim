let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['readonly', 'filename', 'modified', 'gitbranch', 'gitgutter', 'spell' ] ]
      \ },
      \ 'component_function': {
      \   'gitgutter': 'GitStatus',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
