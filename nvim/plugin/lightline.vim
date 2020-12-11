function GetLang()
      return &spelllang
endfunction

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['readonly', 'filename', 'modified', 'gitbranch', 'gitgutter', 'language' ] ]
      \ },
      \ 'component_function': {
      \   'gitgutter': 'GitStatus',
      \   'language': 'GetLang',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
