set t_Co=256
syntax on
"colorscheme aucpfl
set hls
hi Search ctermbg=10 ctermfg=0
set autoindent
set mouse=a
set ts=2
set nu
set sw=2
set foldopen=all
set showbreak=>\  wrap linebreak
set splitright
set splitbelow
"set expandtab
"set tabstop=8 "Replace a tab by 8 spaces
highlight NoSpacesEOL ctermbg=red ctermfg=white
match NoSpacesEOL / \+$\|\%100v.*\|\t/
map = :tabdo match NoSpacesEOL / \+$\\|\t\\|\%100v.*/<CR>
" ctags : go to def
noremap  <C-d> <C-t>
" ctags : back from def
noremap  <C-c> <C-]>
" ctags : back from def
noremap  <C-l>  :ts <C-R><C-W><CR>
" delete word
noremap  s dw
" search without case
noremap  \ /\c
" copy the selection to the mouse buffer
noremap  <C-s> :w<CR>

runtime pyclewn.vim

" omni completion
set nocp
filetype plugin on

au BufRead,BufNewFile *.test setfiletype c

" highlight doxygen comments
let g:load_doxygen_syntax=1
" activate doygen plugin
let g:DoxygenToolkit_commentType = "C" 
let g:DoxygenToolkit_blockHeader="***************************************************************************"
let g:DoxygenToolkit_blockFooter="***************************************************************************"

"Function to center comments
function! Sexy_comment(comment)
    let nb_spaces = (98 / 2) - 2 - (strlen(a:comment) / 2)
    if (nb_spaces * 2) + strlen(a:comment) > (98 - 4)
        let nb_space = (nb_spaces - 1)
    else
        let nb_space = nb_spaces
    endif
    execute("normal O/\e96a*\ea/\n\e")
    execute("normal a/*\e94a \ea*/\n\e")
    execute("normal a/* \e".nb_spaces."i \ea".a:comment."\e".nb_space."a \ea*/\n\e")
    execute("normal a/*\e94a \ea*/\n\e")
    execute("normal a/\e96a*\ea/\n\e")
endfunction

" map the plugin show function to
map <F1> :tabdo match NoSpacesEOL / \+$\\|\t\\|\%100v.*/<CR>:tabnew<CR>:tabdo match NoSpacesEOL / \+$\\|\t\\|\%100v.*/<CR>
map <F2> :tabprevious<CR>
map <F3> :tabnext<CR>
nnoremap <F8> :%s#\<<c-r><c-w>\>#<c-r><c-w>#gc
" unwrap
map <F9> :set nowrap!<CR>
map <F12> :call Sexy_comment("")


"Function to add comments
function! Private_comment()
    execute("normal O/**\n@brief\n@param\n@retval\n/\e")
endfunction

map ; :call Private_comment() <CR>

ab FILENAME <esc>d8hi#define __FILENAME__ (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__)
ab po pr_error(LOG_MODULE_IPC, "[%s,%s:%d]", __FILENAME__, __func__, __LINE__);<esc>36hi
ab wh while) {<cr>}<esc>k$2hi
ab incl #include "<esc>i
ab def #define<esc>a
