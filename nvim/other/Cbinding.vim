source $XDG_CONFIG_HOME/nvim/other/vim-clang-format.vim

nnoremap <silent> <buffer> <Space>s :CocCommand clangd.switchSourceHeader<Cr>

if expand(strpart(split(expand('%'), "\\.")[1], 0, 1)) == "c" "c-cpp-cc file
    nnoremap <silent> <buffer> <Space>f /^\S*\s\?\S*\s\S*\S*(.*)$<left><left><left><left><left><left><left><left>
else "h-hpp file
    nnoremap <silent> <buffer> <Space>f /^\s*\S*\s\?\S*\s\S*\S*(.*);$<left><left><left><left><left><left><left><left><left>
endif
