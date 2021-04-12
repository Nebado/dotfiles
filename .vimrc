" I use this FZF plugin to swap between buffers & files heavily
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
  Plug 'morhetz/gruvbox'
call plug#end()

" General configurations
set ttymouse=sgr
set mouse=a
set backspace=indent,eol,start
set scrolloff=10

set tabstop=2
set shiftwidth=2
set expandtab
set number
set relativenumber

set autoindent
set autochdir

nnoremap :W<cr> :w<cr>
nnoremap <C-s> :w<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" No temporary files
set noundofile
set noswapfile
set nobackup

" Visual apperance
set shortmess+=I
set nonumber 
set laststatus=3 

set background=dark 
colorscheme gruvbox 

" FZF Config
nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-g> :Rg<cr>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let g:fzf_preview_window = ''

" Move .viminfo file to ~/.vim/cache/.viminfo
if &compatible | set nocompatible | endif
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/cache/.viminfo

" Clipboard
set clipboard=unnamed
