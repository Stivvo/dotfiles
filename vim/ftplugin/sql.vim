set ignorecase

nmap <leader>t /^[\t ]*\(create\\|insert\\|drop\)[a-z` ]*
nmap <leader>c /^[\t ]*create[a-z` ]*
nmap <leader>i /^[\t ]*insert[a-z` ]*
nmap <leader>q /^-- \.<left><left>

autocmd Filetype sql call jumpy#map('\c\v^\s*%(create|begin|select|insert|drop|alter)>')
