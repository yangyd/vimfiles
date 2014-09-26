
" Wild ignores
set wildignore=*.o,*~,*.pyc
set wildignore+=*.png,*.gif,*.jpg,*.jpeg,*.woff,*.otf
if has("win16") || has("win32")
  set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*\\node_modules\\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*
endif


" CtrlP "
let g:ctrlp_working_path_mode = ''
let g:ctrlp_match_window = 'top,max:20'
nnoremap <C-o> :CtrlPMRUFiles<CR>

" NerdTree and NerdTree-tabs "
let g:nerdtree_tabs_open_on_gui_startup = 0
nnoremap <F1> :NERDTreeMirrorToggle<CR>

" BufExplorer "
let g:bufExplorerDisableDefaultKeyMapping = 1

" Emmet "
let g:user_emmet_expandabbr_key = '<M-e>'
let g:user_emmet_next_key = '<M-f>'
let g:user_emmet_prev_key = '<M-r>'
let g:user_emmet_removetag_key = '<M-d>'

" Ultisnips "
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" better coloring "
colorscheme freya

