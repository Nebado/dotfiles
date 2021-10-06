" Fundamentals
" ----------------------------------
set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes
set updatetime=50

" Imports
" ----------------------------------
runtime ./plug.vim
runtime ./maps.vim

" Theme
" ----------------------------------
colorscheme gruvbox
highlight Normal guibg=none

" Commands
" ----------------------------------
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup WORKFLOW
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
