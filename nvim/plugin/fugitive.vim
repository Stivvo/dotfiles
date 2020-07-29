nnoremap <silent> <Leader><Space> :vertical Git diff<Cr>

command Gdiff :Git diff
command Glo :Git log

command Add :Git add -A
command Commit :Git commit
command Commia :Git commit --amend
command Push :Git push
command Pusf :Git push -f

command Rebase :Git rebase
command Rebasi :Git rebase -i
