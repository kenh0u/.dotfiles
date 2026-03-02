" ==========================================================
" 1. Base Settings
" ==========================================================
" Load ~/.bash_aliases to use pbcopy/pbpaste wrapper
let $BASH_ENV = "~/.bash_aliases"

set nobackup      " Do not create backup files (*~)
set noundofile    " Do not create undo files (.un~)
set hidden        " Allow switching buffers without saving
set autoread      " Automatically reload files changed outside of Vim
set history=1000  " Keep 1000 lines of command line history

" ==========================================================
" 2. Encoding & Display
" ==========================================================
set encoding=utf-8
scriptencoding utf-8
set ambiwidth=double " Prevent layout issues with ambiguous width characters (e.g. Japanese symbols)

" ==========================================================
" 3. Appearance & UI
" ==========================================================
syntax enable      " Enable syntax highlighting
set number         " Show line numbers
set ruler          " Show cursor position in the lower right corner
set showcmd        " Show incomplete commands in the lower right corner
set wildmenu       " Enhanced command-line completion
set cursorline     " Highlight the current line

" Disable all bells and flashes
set novisualbell
set noerrorbells
set belloff=all

set laststatus=2   " Always show the status line
set statusline=\ %F\ %m%r%h%w\ %=\ [%v,%l/%L][%p%%]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ 

set wrap           " Wrap long lines
set display=lastline " Show as much as possible of the last line
set list           " Show invisible characters
set listchars=tab:»-,trail:-,nbsp:%,extends:»,precedes:«,eol:↲
set showbreak=¦    " String to put at the start of lines that have been wrapped
hi NonText ctermfg=59
hi SpecialKey ctermfg=59

" ==========================================================
" 4. Search, Edit & Indentation
" ==========================================================
set ignorecase     " Ignore case in search patterns
set smartcase      " Override ignorecase if search pattern contains uppercase
set incsearch      " Show search matches as you type
set hlsearch       " Highlight search results
set nowrapscan     " Stop search at the end of the file

set mouse=a        " Enable mouse support
set cindent        " Enable C-style indentation
set smartindent    " Smart auto-indentation
set expandtab      " Use spaces instead of tabs
set tabstop=2      " Number of spaces that a <Tab> in the file counts for
set shiftwidth=2   " Number of spaces to use for each step of (auto)indent
set helplang=ja    " Use Japanese help files if available
set nf=hex         " Treat hex numbers as numbers for Ctrl-A/Ctrl-X

" ==========================================================
" 5. Key Mappings
" ==========================================================
" Disable annoying command-line window and macro recording triggers
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>
nnoremap q <Nop>
nnoremap ' :

" Swap colon and semicolon for easier typing
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" Make Y behave like D and C (yank to end of line)
nnoremap Y y$

" Allow backspace and cursor keys to cross line boundaries
set whichwrap=h,l,[,],<,>

" Toggle expandtab (Space vs Tab) with <Leader>t (Default Leader is '\')
nnoremap <Leader><Tab> :if &expandtab <Bar> set noexpandtab <Bar> echo "expandtab OFF (Using Tabs)" <Bar> else <Bar> set expandtab <Bar> echo "expandtab ON (Using Spaces)" <Bar> endif<CR>

" ==========================================================
" 6. Custom Commands
" ==========================================================
" Clipboard integration via ~/.bash_aliases pbcopy/pbpaste wrapper
:command C call system("pbcopy", @")
:command P let @"=system("pbpaste")
