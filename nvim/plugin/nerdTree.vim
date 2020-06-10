noremap <silent> <Space>6 :NERDTreeToggle<Cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

