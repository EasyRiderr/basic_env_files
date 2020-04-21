set t_Co=256
syntax on
"colorscheme aucpfl
set hls
hi Search ctermbg=10 ctermfg=0
set autoindent
set mouse=a
set ts=8
set nu
set sw=8
set foldopen=all
set showbreak=>\  wrap linebreak
set splitright
set splitbelow
"set expandtab
"set tabstop=8 "Replace a tab by 8 spaces
highlight NoSpacesEOL ctermbg=red ctermfg=white
match NoSpacesEOL / \+$\|\%80v.*\|\t/
map = :tabdo match NoSpacesEOL / \+$\\|\t\\|\%80v.*/<CR>
" ctags : go to def
noremap  <C-d> <C-t>
" ctags : back from def
noremap  <C-c> <C-]>
" ctags : back from def
noremap  <C-l>  :ts <C-R><C-W><CR>
"copy word
"noremap  q yw
" delete word
noremap  s dw
" search whole word
"noremap  b y*
" vimdiff : get the difference
noremap  H do
" vimdiff go to the previous diff
noremap  J [c
" vimdiff go to the next diff
noremap  K ]c
" vimdiff put the diff
noremap  L dp
" search without case
noremap  \ /\c
" copy the selection to the mouse buffer
noremap  <C-s> :w<CR>

" map the plugin show function to
map <F1> :tabdo match NoSpacesEOL / \+$\\|\t\\|\%80v.*/<CR>:tabnew<CR>:tabdo match NoSpacesEOL / \+$\\|\t\\|\%80v.*/<CR>
map <F2> :tabprevious<CR>
map <F3> :tabnext<CR>
nnoremap <F8> :%s#\<<c-r><c-w>\>#<c-r><c-w>#gc
" unwrap
map <F9> :set nowrap!<CR>

"Insert license on header file
map <F10> :a"<CR>/* INTEL CONFIDENTIAL Copyright 2015 Intel Corporation All Rights Reserved.<CR> *<CR>* The source code contained or described herein and all documents related to<CR>* the source code ("Material") are owned by Intel Corporation or its suppliers<CR>* or licensors.<CR>* Title to the Material remains with Intel Corporation or its suppliers and<CR>* licensors.<CR>* The Material contains trade secrets and proprietary and confidential information<CR>* of Intel or its suppliers and licensors. The Material is protected by worldwide<CR>* copyright and trade secret laws and treaty provisions.<CR>* No part of the Material may be used, copied, reproduced, modified, published,<CR>* uploaded, posted, transmitted, distributed, or disclosed in any way without<CR>* Intel's prior express written permission.<CR>*<CR>* No license under any patent, copyright, trade secret or other intellectual<CR>* property right is granted to or conferred upon you by disclosure or delivery<CR>* of the Materials, either expressly, by implication, inducement, estoppel or<CR>* otherwise.<CR>*<CR>* Any license under such intellectual property rights must be express and<CR>* approved by Intel in writing.<CR>*/<Esc><C-C>

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
    let nb_spaces = (80 / 2) - 2 - (strlen(a:comment) / 2)
    if (nb_spaces * 2) + strlen(a:comment) > (80 - 4)
        let nb_space = (nb_spaces - 1)
    else
        let nb_space = nb_spaces
    endif
    execute("normal o\n\n\n\n\e")
    execute("normal a/******************************************************************************/\n\e")
    execute("normal a/*                                                                            */\n\e")
    execute("normal a/* \e".nb_spaces."i \ea".a:comment."\e".nb_space."a \ea*/\n\e")
    execute("normal a/*                                                                            */\n\e")
    execute("normal a/******************************************************************************/\n\e")
    execute("normal a\n\e")
endfunction

map <F12> :call Sexy_comment("")


"Function to add comments
function! Private_comment()
    execute("normal o\e")
    execute("normal a/******************************************************************************/\n\e")
    execute("normal a/**\n@brief\n@param\n@retval\n/\n\e")
    execute("normal a/******************************************************************************/\e")
endfunction

map ; :call Private_comment() <CR>
map <F4> :wa<CR>:!cd ~/fc_pro && make setup BUILDVARIANT=debug BOARD=DEV_REV3_BOARD && clear && make stm32_boot -j && clear && make stm32 -j<CR>
map <F5> :wa<CR>:!cd ~/fc_pro && make clean && clear && make setup BUILDVARIANT=debug BOARD=DEV_REV3_BOARD && clear && make stm32_boot -j && clear && make stm32 -j && clear<CR>:!xterm -e "cd ~/fc_pro && make flash FLASH_CONFIG=main_core_full_jtag BOARD=DEV_REV3_BOARD"&<CR>
map <F6> :wa<CR>:!cd ~/fc_pro && make clean && clear && make setup BUILDVARIANT=release BOARD=DEV_REV3_BOARD && clear && make stm32_boot -j && clear && make stm32 -j && clear<CR>:!xterm -e "cd ~/fc_pro && make flash FLASH_CONFIG=main_core_full_jtag BOARD=DEV_REV3_BOARD"&<CR>
map <F7> :wa<CR>:!cd ~/fc_pro && make setup BUILDVARIANT=debug BOARD=DEV_REV3_BOARD && make stm32_boot -j && make stm32 -j <CR>:!xterm -e "cd ~/fc_pro && make flash FLASH_CONFIG=main_core_full_jtag BOARD=DEV_REV3_BOARD"&<CR>

function! Addr_fct(addr)
    :!/home/lab/fc_pro/thunderdome/tools/toolchains/gcc-arm/bin/arm-none-eabi-addr2line -e /home/lab/fc_pro/out/current/stm32/fightclub-stm32.elf -a a:addr
endfunction

function! Addrb_fct(addr)
    :!/home/lab/fc_pro/thunderdome/tools/toolchains/gcc-arm/bin/arm-none-eabi-addr2line -e /home/lab/fc_pro/out/current/stm32_boot/fightclub-stm32_boot.elf -a a:addr
endfunction

ab FILENAME <esc>d8hi#define __FILENAME__ (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__)
ab po pr_error(LOG_MODULE_IPC, "[%s,%s:%d]", __FILENAME__, __func__, __LINE__);<esc>36hi
ab pp pr_error(LOG_MODULE_IPC, "[%s:%d]", __func__, __LINE__);<esc>22hi
ab pe pr_error(LOG_MODULE_IPC, ");<esc>2hi
ab pi pr_info(LOG_MODULE_IPC, ");<esc>2hi
ab pd pr_debug(LOG_MODULE_IPC, ");<esc>2hi
ab wh while) {<cr>}<esc>k$2hi
ab incl #include "<esc>i
ab def #define<esc>a
