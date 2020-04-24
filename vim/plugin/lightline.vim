function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! GetLang()
    if &spell == 0
        return ''
    else
        return &spelllang
endfunction

function! GetSplitDirection()
    if &splitbelow == 1
        return '  '
    else
        return '  '
endfunction

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified', 'gitbranch', 'gitgutter', 'splitdirection', 'language' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'component': {
      \   'gitgutter': '%{GitStatus()}',
      \   'splitdirection': '%{GetSplitDirection()}',
      \   'language': '%{GetLang()}'
      \ },
      \ }
