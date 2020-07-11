noremap <silent> <Space>5 :NERDTreeToggle<Cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

