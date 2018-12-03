
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

" Emmet "
let g:user_emmet_expandabbr_key = '<M-e>'
let g:user_emmet_next_key = '<M-f>'
let g:user_emmet_prev_key = '<M-r>'
let g:user_emmet_removetag_key = '<M-d>'

" Ultisnips, Completor, and SuperTab
let g:SuperTabDefaultCompletionType = "<C-n>"
let g:SuperTabContextDefaultCompletionType = "<C-n>"

let g:UltiSnipsListSnippets="<C-CR>"
let g:UltiSnipsExpandTrigger="<C-Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

if g:RUNTIME_IS_WINDOWS
  " Python installation with jedi
  let g:completor_python_binary = 'C:\\Users\\i24026\\AppData\\Local\\Programs\\Python\\Python36-32\\python.exe'
endif

" ale
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['standard'],
\   'typescript': ['prettier'],
\   'python': ['black'],
\}

let g:ale_linters = {
\   'javascript': ['standard'],
\   'typescript': ['prettier'],
\   'python': ['pylint'],
\}

let g:ale_javascript_prettier_use_local_config = 1

" format code with ,l
nnoremap <Leader>l :ALEFix<CR>

" better coloring "
colorscheme seoul256
hi Normal guibg=#1f1f1f guifg=#cccccc

