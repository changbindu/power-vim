" better backup, swap and undos storage

" directory to place swap files in
set directory=$HOME/.vim/vimfiles/
" where to put backup files
set backupdir=$HOME/.vim/vimfiles/backups
" persistent undos - undo after you re-open the file
set undodir=$HOME/.vim/vimfiles//undos
" store yankring history file there too
let g:yankring_history_dir="$HOME/.vim/vimfiles/"

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif
