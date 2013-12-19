
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
nnoremap <F5> :NERDTreeMirrorToggle<CR>

" BufExplorer "
let g:bufExplorerDisableDefaultKeyMapping = 1

" Emmet "
let g:user_emmet_expandabbr_key = '<M-m><M-m>'
let g:user_emmet_next_key = '<M-m><Tab>'
let g:user_emmet_removetag_key = '<M-m>d'

" Ultisnips "
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" better coloring "
colorscheme freya


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


" Quick toggling of the BufExplorer and the Quickfix window "

nnoremap <silent> <F2> :call <SID>QuickfixToggle()<CR>
nnoremap <F3> :cn<CR>
nnoremap <F4> :cp<CR>

nnoremap <silent> ; :call <SID>BufExplrToggle()<CR>

function! s:listbfn(expr)
  redir => l:foo
  silent! ls!
  redir END
  let l:bar = filter(split(l:foo, '\n'), 'v:val =~# ' . a:expr)
  return map(l:bar, 'str2nr(matchstr(v:val, "\\d\\+"))')
endfunction

function! s:QuickfixToggle()
  for l:bfn in s:listbfn('"\\[Quickfix List\\]"')
    if bufwinnr(l:bfn) !=# -1
      cclose
      return
    endif
  endfor

  let l:oldwn = winnr()
  botright copen 16
  if l:oldwn !=# winnr()
    wincmd p
  endif
endfunction

function! s:BufExplrToggle()
  let l:wn = winnr()
  for l:bfn in s:listbfn('"\\[BufExplorer\\]"')
    if bufwinnr(l:bfn) ==# l:wn
      normal q
      return
    endif
  endfor
  execute 'BufExplorer'
endfunction

