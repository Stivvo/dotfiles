noremap <silent> <Space>4 :NERDTreeToggle<Cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

