" simple recursive grep
" both recursive grep commands with internal or external (fast) grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
" mappings to call them
nmap <leader>R :RecurGrep 
nmap <leader>r :RecurGrepFast 
" mappings to call them with the default word as search text
nmap <leader>wR :RecurGrep <cword><CR>
nmap <leader>wr :RecurGrepFast <cword><CR>

" CtrlP ------------------------------

" file finder mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" search from git root if possible
let g:ctrlp_working_path_mode = 'ra'
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|pyo|o)$',
  \ }
" tags (symbols) in current file finder mapping
nmap <leader>g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap <leader>G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap <leader>f :CtrlPLine<CR>
" files finder mapping
nmap <leader>p :CtrlP<CR>
nmap <leader>p. :CtrlP .<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap <leader>wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap <leader>wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap <leader>wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap <leader>we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap <leader>pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>

" ctags ------------------------------
" use command 'ctags -R .' to generate tags file first
set tags=tags;/

" Cscope ------------------------------
" use command 'cscope -Rbq -f xxx.out' to generate db first
if has("cscope") 
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
        silent! cs add cscope.out
    "else search cscope.out elsewhere
    else
        let cscope_file=findfile("cscope.out",".;")
        let cscope_pre=matchstr(cscope_file,".*/") 
        if !empty(cscope_file) && filereadable(cscope_file)
            silent! exe "cs add" cscope_file cscope_pre
        endif
    endif
endif

" s: Find this C symbol
nmap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
" g: Find this definition
nmap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
" c: Find functions calling this function
nmap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
" t: Find this text string
nmap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
" e: Find this egrep pattern
nmap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
" f: Find this file
nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
" i: Find files #including this file
nmap <leader>fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" d: Find functions called by this function
nmap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>

