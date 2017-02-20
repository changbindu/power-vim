" ============================================================================
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" Plugins from github repos:

" Better file browser
Plugin 'scrooloose/nerdtree'
" A plugin of NERDTree showing git status flags
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Code commenter
Plugin 'scrooloose/nerdcommenter'
Plugin 'mrtazz/DoxygenToolkit.vim'
" Class/module browser
Plugin 'majutsushi/tagbar'
" Code and files fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'ivan-cukic/vim-ctrlp-cscope'
Plugin 'hari-rangarajan/CCTree'
" Git integration
Plugin 'motemen/git-vim'
" Tab list panel
Plugin 'kien/tabman.vim'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Terminal Vim with 256 colors colorscheme
Plugin 'fisadev/fisa-vim-colorscheme'
" Surround
Plugin 'tpope/vim-surround'
" Autoclose
Plugin 'Townk/vim-autoclose'
" Indent text object
Plugin 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plugin 'python-mode/python-mode'
" Better autocompletion
Plugin 'Shougo/neocomplete.vim'
" A common extensible interface for searching and displaying lists
" of information from within vim.
" Plugin 'Shougo/denite.nvim'
" a fast, as-you-type, fuzzy-search code completion engine for Vim
" Plugin 'Valloric/YouCompleteMe'
" Snippets manager (SnipMate), dependencies, and snippets repo
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
" Git/mercurial/others diff icons on the side of the file lines
Plugin 'mhinz/vim-signify'
" Automatically sort python imports
Plugin 'fisadev/vim-isort'
" Drag visual blocks arround
Plugin 'fisadev/dragvisuals.vim'
" Window chooser
Plugin 't9md/vim-choosewin'
" Python and other languages code checker
Plugin 'scrooloose/syntastic'
" Paint css colors with the real color
Plugin 'lilydjwg/colorizer'
" smart cscope helper for vim
" Plugin 'vim-scripts/cscope.vim'
" Search results counter
Plugin 'IndexedSearch'
" XML/HTML tags navigation
Plugin 'matchit.zip'
" Gvim colorscheme
Plugin 'Wombat'
" Yank history navigation
Plugin 'YankRing.vim'
" log view
Plugin 'vim-scripts/oops_trace.vim'
" ascii draw
"Plugin 'vim-scripts/DrawIt'
"Plugin 'vim-scripts/sketch.vim'


" ===========================================================================
" Below plugins are mostly used, uncomment them to enable

" Consoles as buffers
" Plugin 'rosenfeld/conque-term'

" Python and PHP Debugger
" Plugin 'fisadev/vim-debug.vim'

" Extension to ctrlp, for fuzzy command finder
" Plugin 'fisadev/vim-ctrlp-cmdpalette'

" Zen coding
" Plugin 'mattn/emmet-vim'

" Code snippets engine for Vim
" Plugin 'drmingdrmer/xptemplate'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" ============================================================================
" Install plugins the first time vim runs

if iCanHazVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    :PluginInstall
endif

" ============================================================================
" Vim settings and mappings, You can edit them as you wish
let mapleader = ","

" allow plugins by file type (required for plugins!)
filetype plugin indent on

" tabs and spaces handling
set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" remember last position
au BufWinLeave * silent mkview
au BufWinEnter * silent loadview

" highlight current line
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" right margin
set colorcolumn=81

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" show line numbers
set nu

" set folding
set foldmethod=syntax
augroup OpenAllFoldsOnFileOpen
	autocmd!
	autocmd BufRead * normal zR
augroup END

" show our help doc
nmap <F2> :tabnew ~/.vim/tips.md<CR>
" formate c code
nmap <F5> :%!astyle --mode=c --style=linux<CR>

" past mode swticher
set pastetoggle=<F6>

" tab navigation mappings
map <C-S-Right> :tabnext<CR>
imap <C-S-Right> <ESC>:tabnext<CR>
map <C-S-Left> :tabprevious<CR>
imap <C-S-Left> <ESC>:tabprevious<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" spell checking
set spelllang=en_us
hi clear SpellBad
map <silent> <C-S> :set spell!<CR>

autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit
	\ hi clear SpellBad | hi SpellBad cterm=underline |
	\ hi clear SpellCap | hi link SpellCap SpellBad |
	\ hi clear SpellLocal | hi link SpellLocal SpellBad |
	\ hi clear SpellRare | hi link SpellRare SpellBad

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview

" save as sudo
ca w!! w !sudo tee "%"

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
    colorscheme fisa
else
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.


" Tagbar ----------------------------- 

" toggle tagbar display
map <F4> :TagbarToggle<CR>
autocmd FileType * nested :call tagbar#autoopen()
let g:tagbar_autofocus = 0
let g:tagbar_compact = 1
let g:tagbar_autoclose = 0
let g:tagbar_autopreview = 0
let g:tagbar_sort = 0
let g:tagbar_autoshowtag = 1


" Vim-debug ------------------------------

" disable default mappings, have a lot of conflicts with other plugins
let g:vim_debug_disable_mappings = 1


" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0


" TabMan ------------------------------

" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'


" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}


" DragVisuals ------------------------------

" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()


" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1


" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'light'
let g:airline#extensions#whitespace#enabled = 0


" NERDTree ----------------------------- 

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap <leader>t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


" Other plugin configs ------------------------

source ~/.vim/plugin_cfg/backup.vim
" grep, CtrlP, Cscope
source ~/.vim/plugin_cfg/search.vim
source ~/.vim/plugin_cfg/python-mode.vim
source ~/.vim/plugin_cfg/neocomplete.vim
"source ~/.vim/plugin_cfg/youcompleteme.vim
source ~/.vim/plugin_cfg/highlight.vim
source ~/.vim/plugin_cfg/log.vim
