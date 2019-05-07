
" path separator
let s:sep = exists('+shellslash') && !&shellslash ? '\' : '/'

" find out our 'config' directory from the runtimepath
let s:cfgdir = filter(map(filter(split(&runtimepath, ','), "v:val !~# 'after$'"),
      \                   "join([expand(v:val), 'config'], s:sep)"),
      \               'isdirectory(v:val)')[0]


call plug#begin()
Plug 'w0rp/ale'
Plug 'maralla/completor.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'mhartington/oceanic-next'
Plug 'junegunn/seoul256.vim'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-expand-region'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
call plug#end()


for s:cfgfile in ['mainconf.vim', 'keymaps.vim', 'extra.vim']
  execute 'source ' . join([s:cfgdir, s:cfgfile], s:sep)
endfor

