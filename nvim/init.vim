syntax on
set expandtab
set shiftwidth=4
set ai
set number
set hlsearch
set ruler
highlight Comment ctermfg=green

" USE SPACE AS LEADER
let mapleader = " "
let g:mapleader = " "

" ENABLE AUTOSAVE ON VIM STARTUP
let g:auto_save = 0

" DOWN IS REALLY THE NEXT LINE
nnoremap j gj
nnoremap k gk
nnoremap J <Nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPLIT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" OPEN SPLITS
nmap vs :vsplit<cr>
nmap sp :split<cr>

" RESIZE SPLIT
let g:winresizer_enable=1
let g:winresizer_start_key = '<C-w>r'

" QUICK MOVE SPLIT NAVIGATION
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUFFERS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" BUFFERS NAVIGATIONS
map <S-Right> :bnext<CR>
map <S-Left>  :bprevious<CR>
map <S-l> :bnext<CR>
map <S-h>  :bprevious<CR>

" Quick close buffers
nmap <C-x> :Bdelete<CR>

" MY CUSTOM REMAPS 
nmap <C-f> :Ex<CR>
