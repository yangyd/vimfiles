
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
let g:ctrlp_match_window = 'top,max:20'
nnoremap <C-m> :CtrlPMRUFiles<CR>

" NerdTree and NerdTree-tabs "
let g:nerdtree_tabs_open_on_gui_startup = 0
nnoremap <C-n> :NERDTreeMirrorToggle<CR>

" BufExplorer "
let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerDefaultHelp = 0
nnoremap <C-o> :BufExplorer<CR>

" Emmet "
let g:user_emmet_expandabbr_key = '<M-m><M-m>'
let g:user_emmet_next_key = '<M-m><Tab>'
let g:user_emmet_removetag_key = '<M-m>d'

" Ultisnips "
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" better coloring "
try
  colorscheme peaksea
  set background=dark
catch
endtry


" Auto Commands "

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


