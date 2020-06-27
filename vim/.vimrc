"""Simple
"syntax on
"filetype plugin indent on
"set tabstop=4
"set shiftwidth=4
"set expandtab
"set guifont=Ubuntu\ Mono\ 20
"set guioptions-=m
"set guioptions-=T
"set noesckeys
"set relativenumber
"colorscheme desert

"""Custom
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

"noremap <C-n> :nohl<CR>
"vnoremap <C-n> :nohl<CR>
"inoremap <C-n> :nohl<CR>

let mapleader = ";"

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" disable swap files
set nobackup
set noswapfile

"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" search settings
set hlsearch
set ignorecase
set smartcase

" main color scheme
set background=dark

let base16colorspace=256
syntax on
set t_Co=256 " 256 color mode
" colorscheme OceanicNext
"colorscheme base16-oceanicnext
colorscheme desert

