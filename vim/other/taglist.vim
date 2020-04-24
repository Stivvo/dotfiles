let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1

nmap <Space>o :let Tlist_Close_On_Select = 1<Cr>:TlistOpen<Cr>
nmap <Space>t :let Tlist_Close_On_Select = 0<Cr>:TlistToggle<Cr>
