let g:markdown_preview_auto=1
let g:markdown_preview_no_default_mapping=1

let g:previewStarted = 1
function InstantMarkdownToggle()
    if g:previewStarted == 1
        :StartMarkdownPreview
        let g:previewStarted = 0
    else
        :StopMarkdownPreview
        let g:previewStarted = 1
    endif
endfunction
nnoremap <buffer> <silent> <leader>w :call InstantMarkdownToggle()<Cr>

"text
setlocal textwidth=80
set colorcolumn=80
set shiftwidth=2

" compile markdown
nnoremap <buffer> <silent> <Space>m :w<Cr>:!mark.sh %<Cr>
nnoremap <buffer> <silent> <Space>p :silent w<Cr>:!~/prog/dotfiles/script/mark/./presentation.sh % "f" & >> /dev/null<Cr><Cr>

"useful mappings for moving around
nnoremap <buffer> <Space>h /^[#]\+ [a-z A-Z']*\c<left><left>
