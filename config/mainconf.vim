
" Basic settings "

set nocompatible
behave xterm
filetype plugin on
filetype indent on
syntax enable

set lazyredraw
set magic
set hidden
set wildmenu
set timeoutlen=500

set autoread
set clipboard+=unnamed
set history=50
set langmenu=none
set winaltkeys=no
set complete-=i
set nrformats-=octal
set shiftround
set display=uhex,lastline

let mapleader = ","
let g:mapleader = ","

set noswapfile
set nobackup
set nowritebackup

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif


" User interface "

set ruler
set number
set showcmd
set showmode
set showmatch
set matchtime=1

set cmdheight=1
set scrolloff=7
set sidescrolloff=5
set foldcolumn=1
set laststatus=2

try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
  set smarttab
catch
endtry

set title
set noerrorbells
set novisualbell
set t_vb=

set backspace=eol,start,indent
set whichwrap=b,s

set hlsearch
set incsearch
set ignorecase
set smartcase

if has("gui_running")
  set guioptions=
  set t_Co=256
  set mouse=
endif

if has("win16") || has("win32")
  set gfn=Consolas:h9
  set gfw=NSimSun:h9
endif

" File format and character encoding "

set fileformats=unix,dos,mac
set fileformat=unix

set fileencodings=utf-8
set encoding=utf-8
let &termencoding = &encoding

set ambiwidth=double


" ignore-pattern and auto commands "
if has("win16") || has("win32")
  source ~/vimfiles/config/patterns.vim
  source ~/vimfiles/config/autocmds.vim
else
  source ~/.vim/config/patterns.vim
  source ~/.vim/config/autocmds.vim
endif

