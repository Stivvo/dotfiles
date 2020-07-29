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

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['readonly', 'filename', 'modified', 'gitbranch', 'gitgutter', 'language' ] ]
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
