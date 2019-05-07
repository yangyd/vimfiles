
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
let g:user_emmet_expandabbr_key = '<Leader>ee'
let g:user_emmet_next_key = '<Leader>en'
let g:user_emmet_prev_key = '<Leader>ep'
let g:user_emmet_removetag_key = '<Leader>ed'

" Ultisnips, Completor, and SuperTab
let g:SuperTabDefaultCompletionType = "<C-n>"
let g:SuperTabContextDefaultCompletionType = "<C-n>"

let g:UltiSnipsListSnippets="<C-CR>"
let g:UltiSnipsExpandTrigger="<M-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" Python installation with jedi
let g:completor_python_binary = 'C:\\Users\\i24026\\AppData\\Local\\Programs\\Python\\Python36-32\\python.exe'
let g:completor_gocode_binary = 'C:/local/var/go/bin/gocode.exe'

" go
" set to where you install packages with `go get`, not $GOROOT/bin
let g:go_bin_path = "C:/local/var/go/bin"
let g:go_fmt_command = "goimports"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']

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

