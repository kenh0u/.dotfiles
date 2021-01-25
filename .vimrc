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
set showbreak=¦
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
set showtabline=2
set tabline=%!MakeTabLine()
set statusline=\ %F\ %m%r%h%w\ %=\ [%v,%l/%L][%p%%]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ 
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
set nf=hex

nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
tnoremap <C-w>: <C-w>;
tnoremap <C-w>; <C-w>:

nnoremap Y y$
nnoremap s <C-w>
nnoremap - <C-w>-
nnoremap = <C-w>+
nnoremap , <C-w><
nnoremap . <C-w>>
nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l
nnoremap <S-Left> <C-w>h
nnoremap <S-Down> <C-w>j
nnoremap <S-Up> <C-w>k
nnoremap <S-Right> <C-w>l
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <C-n> :tabnew<Space>
nnoremap <silent> <C-t> :tabnew <bar> terminal ++curwin<CR>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

tnoremap <Esc><Esc> <C-w>N
tnoremap <S-Left> <C-w>h
tnoremap <S-Down> <C-w>j
tnoremap <S-Up> <C-w>k
tnoremap <S-Right> <C-w>l
tnoremap <silent> <C-h> <C-w>:tabprevious<CR>
tnoremap <silent> <C-Left> <C-w>:tabprevious<CR>
tnoremap <silent> <C-l> <C-w>:tabnext<CR>
tnoremap <silent> <C-Right> <C-w>:tabnext<CR>
tnoremap <silent> <C-t> <C-w>:tabnew <bar> terminal ++curwin<CR>
tnoremap <C-n> <C-w>:tabnew<Space>

:command C call system("pbcopy", @")
:command P let @"=system("pbpaste")
:command T terminal ++curwin

function! MakeTabLine()
  let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
  let sep = '|'
  let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
  let info = fnamemodify(getcwd(), ":~") . ' '
  return tabpages . '%=' . info
endfunction

function! s:tabpage_label(n)
  let bufnrs = tabpagebuflist(a:n)
  let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'

  let no = len(bufnrs)
  if no is 1
    let no = ''
  endif

  let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
  let sp = (no . mod) ==# '' ? '' : ' '

  let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]
  let fname = bufname(curbufnr)

  let label = '[ ' . no . mod . sp . fname . ' ]'

  return '%' . a:n . 'T' . hi . label . '%T%#TabLineFill#'
endfunction
