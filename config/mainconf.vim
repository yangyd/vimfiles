
let g:RUNTIME_IS_X11 = 0
let g:RUNTIME_IS_WINDOWS = 0
let g:RUNTIME_IS_GUI = 0

if has("gui_running")
  let g:RUNTIME_IS_GUI = 1
endif

if g:RUNTIME_IS_GUI && has("x11")
  let g:RUNTIME_IS_X11 = 1
endif

if has("win32") || has("win64")
  let g:RUNTIME_IS_WINDOWS = 1
endif

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
set history=50
set langmenu=none
set winaltkeys=no
set complete-=i
set nrformats-=octal
set shiftround
set display=uhex,lastline

if g:RUNTIME_IS_X11
  set clipboard^=unnamedplus
elseif g:RUNTIME_IS_WINDOWS
  set clipboard^=unnamed
endif

let mapleader = ","
let g:mapleader = ","

set noswapfile
set nobackup
set nowritebackup

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

set noshellslash

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
set showtabline=2

set switchbuf=usetab,newtab

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

if g:RUNTIME_IS_GUI
  set guioptions=
  set t_Co=256
  set mouse=
endif

if g:RUNTIME_IS_X11
  " set guifont=Source\ Code\ Pro\ 10
  set guifont=Fira\ Mono\ OT\ 9
elseif g:RUNTIME_IS_WINDOWS
  set guifont=Consolas:h9
  set guifontwide=NSimSun:h9
endif


" File format and character encoding "

set fileformats=unix,dos,mac
set fileformat=unix

set fileencodings=utf-8
set encoding=utf-8
let &termencoding = &encoding

set ambiwidth=double


" Indent and line wrap "

set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set autoindent
set smartindent

set linebreak
set textwidth=120
set nowrap

" coloring
colorscheme darkblue
highlight Normal guibg=#2a2a2a


" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Remove trailing spaces on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

