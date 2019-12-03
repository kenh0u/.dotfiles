let $BASH_ENV = "~/.bash_aliases"

set nobackup
set noundofile

set encoding=utf-8
scriptencoding utf-8

colorscheme elflord
syntax enable
set number
set ruler
set list
set listchars=tab:»-,trail:-,nbsp:%,extends:»,precedes:«,eol:↲
set wrap
set display=lastline
set whichwrap=h,l,[,],<,>
set nowrapscan
set wildmenu
set novisualbell
set noerrorbells
set belloff=all
set showcmd
set laststatus=2
set splitbelow
set splitright

hi NonText ctermfg=59
hi SpecialKey ctermfg=59

set ignorecase
set smartcase
set incsearch
set hlsearch

set mouse=a
set ttymouse=xterm2
set hidden
set autoread
set history=10
set cindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set helplang=ja

nnoremap : ;
nnoremap ; :
nnoremap Y y$
nnoremap s <C-w>
nnoremap - <C-w>-
nnoremap = <C-w>+
nnoremap , <C-w><
nnoremap . <C-w>>

tnoremap <Esc><Esc> <C-w>N

:command C call system("pbcopy", @")
:command P let @"=system("pbpaste")
:command T terminal ++curwin
