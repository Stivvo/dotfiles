function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! GetLang()
    if &spell == 0
        return ''
    else
        return &spelllang
endfunction

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified', 'gitbranch', 'gitgutter', 'language' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'component': {
      \   'gitgutter': '%{GitStatus()}',
      \   'language': '%{GetLang()}'
      \ },
      \ }
