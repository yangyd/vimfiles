
let s:ignore_files = '
      \ ~ .o .pyc
      \ .png .gif
      \'

let s:ignore_dirs = '
      \ .git .hg .svn
      \ node_modules bower_components
      \ target classes build
      \'

let s:ignores = map(split(s:ignore_files), '"*".v:val')
let s:ignores += map(split(s:ignore_dirs),
      \  g:RUNTIME_IS_WINDOWS ? '"*\\" . v:val . "\\*"' : '"*/" . v:val . "/*"')
let &wildignore=join(s:ignores, ',')


" CtrlP "
let g:ctrlp_working_path_mode = ''
let g:ctrlp_match_window = 'top,max:20'
nnoremap <C-o> :CtrlPMRUFiles<CR>

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
colorscheme jellybeans
hi Normal guibg=#0b0b0b guifg=#cccccc

