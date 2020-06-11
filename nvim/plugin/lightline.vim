function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! GetLang()
    if &spell == 0
        return ''
    else
        return &spelllang
    endif
endfunction

function! GetSplitDirection()
    if &splitbelow == 1
        return '  '
    else
        return '  '
    endif
endfunction

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['readonly', 'filename', 'modified', 'gitbranch', 'gitgutter', 'splitdirection', 'language' ] ]
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
