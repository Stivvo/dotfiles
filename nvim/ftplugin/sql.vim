set ignorecase

nnoremap <Space>t /^[\t ]*\(create\\|insert\\|drop\)[a-z` ]*
nnoremap <Space>c /^[\t ]*create[a-z` ]*
nnoremap <Space>i /^[\t ]*insert[a-z` ]*
nnoremap <Space>s /^[\t ]*select[a-z` ]*
nnoremap <Space>q /^-- \.<left><left>

autocmd Filetype sql call jumpy#map('\c\v^\s*%(create|begin|select|insert|drop|alter)>')
