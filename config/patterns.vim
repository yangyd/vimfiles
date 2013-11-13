
" Wild ignores: compiled files and version control dirs
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
endif


" CtrlP "
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_working_path_mode = ''
nnoremap <C-m> :CtrlPMRUFiles<CR>

" NerdTree and NerdTree-tabs "
let g:nerdtree_tabs_open_on_gui_startup = 0
nnoremap <C-n> :NERDTreeMirrorToggle<CR>

" BufExplorer "
let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerDefaultHelp = 0
nnoremap <C-o> :BufExplorer<CR>

" better coloring "
try
  colorscheme peaksea
  set background=dark
catch
endtry




