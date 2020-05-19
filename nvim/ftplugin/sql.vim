set ignorecase

nnoremap <buffer> <Space>t /^[\t ]*\(create\\|insert\\|drop\)[a-z` ]*
nnoremap <buffer> <Space>c /^[\t ]*create[a-z` ]*
nnoremap <buffer> <Space>i /^[\t ]*insert[a-z` ]*
nnoremap <buffer> <Space>s /^[\t ]*select[a-z` ]*
nnoremap <buffer> <Space>q /^-- \.<left><left>

autocmd Filetype sql call jumpy#map('\c\v^\s*%(create|begin|select|insert|drop|alter)>', '\c\v^\s*%(create table)>')
