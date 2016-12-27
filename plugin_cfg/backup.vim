" better backup, swap and undos storage
set directory=/tmp/vim/tmp         " directory to place swap files in
" set backup                       " make backup files
set backupdir=/tmp/vim/backups   " where to put backup files
" set undofile                     " persistent undos - undo after you re-open the file
set undodir=/tmp/vim/undos
" store yankring history file there too
let g:yankring_history_dir = '/tmp/vim/'

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
