let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}

"pick one of the default styles
" let g:clang_format#code_style="mozilla"

"pick one of the default styles as fallback
" let g:clang_format#enable_fallback_style=1

"use .clang_format file
let g:clang_format#detect_style_file=1

"format on save
let g:clang_format#auto_format=1

"format with gq
let g:clang_format#auto_formatexpr=1

autocmd FileType c,cpp ClangFormatAutoEnable
