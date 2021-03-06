
" Cursor movement in Normal/Visual mode
noremap - 24k
noremap = 24j
noremap <M-j> 6j
noremap <M-k> 6k

noremap 9 ^
noremap 0 $
noremap <M-b> ^
noremap <M-e> $

" don't mess up the registry when deleting a single character
nnoremap x "_x

" don't mess up the registry when pasting upon selection
vnoremap <silent> p :call <SID>paste_over()<CR>

" keyword complete
inoremap <M-n> <C-n>
inoremap <M-p> <C-p>

" omni complete "
inoremap <expr><M-m> pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>"

" paste without leaving edit mode
if g:RUNTIME_IS_X11
  inoremap <C-v> <C-r>+
  cnoremap <C-v> <C-r>+
elseif g:RUNTIME_IS_WINDOWS
  inoremap <C-v> <C-r>*
  cnoremap <C-v> <C-r>*
endif

" Cursor movement in Insert/Command mode
inoremap <M-o> <Esc>o
inoremap <M-O> <Esc>O

inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>

inoremap <M-9> <Esc>^i
inoremap <M-0> <End>
inoremap <M-b> <Esc>^i
inoremap <M-e> <End>
cnoremap <M-9> <C-b>
cnoremap <M-0> <End>
cnoremap <M-b> <C-b>
cnoremap <M-e> <End>

cnoremap <M-h> <Left>
cnoremap <M-l> <Right>

" Quick exit
nnoremap <C-q> :q<CR>

" Tab switching "
nnoremap <M-Left> :tabprevious<CR>
nnoremap <M-Right> :tabnext<CR>
inoremap <M-Left> <Esc>:tabprevious<CR>
inoremap <M-Right> <Esc>:tabnext<CR>

" Window switching "
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l

" Increase/decrease the size of current window "
nnoremap <C-Up> <C-W>2>
nnoremap <C-Down> <C-W>2<LT>

" Quick help "
nnoremap <Leader>h :vertical help<Space>

" buffer control
nnoremap <Leader>ba :%bdelete<CR>
nnoremap <silent> <Leader>bd :call <SID>buffer_close()<CR>
nnoremap <Leader>bt :tab sball<CR>

" view buffer list, and type N Tab to switch
" hit Tab directly switch between two most recent buffer
nnoremap <Leader>bl :ls<CR>
nnoremap <Tab> <C-^>

" open new...
cnoremap <Leader><Space> tabedit <C-r>=expand("%:p:h")<CR>
cnoremap <Leader>u <C-\>e<SID>DeleteTillSlash()<cr>

" change to current file's dir
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Move lines up and down
nnoremap <M-Down> mz:m+<cr>`z
nnoremap <M-Up> mz:m-2<cr>`z
vnoremap <M-Down> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-Up> :m'<-2<cr>`>my`<mzgv`yo`z

" vimgrep after the selected text
vnoremap <silent> <Leader>f :call <sid>VisualSelection('f')<CR>
vnoremap <silent> <Leader>g :call <sid>VisualSelection('g')<CR>

" Vimgrep in files
nnoremap <Leader>f :vimgrep // <C-r>%<C-b><right><right><right><right><right><right><right><right><right>
nnoremap <Leader>g :vimgrep //j **/*<C-b><right><right><right><right><right><right><right><right><right>

" When you press <leader>s you can search and replace the selected text
vnoremap <silent> <Leader>s :call <sid>VisualSelection('s')<CR>


" Window size control "
nnoremap <M-4> :simalt ~x<CR>
nnoremap <M-3> :winsize 166 40<CR>
nnoremap <M-2> :winsize 120 32<CR>
nnoremap <M-1> :winsize 80 24<CR>


" auto complete of (, ", ', [ and {
inoremap ( ()<Left>
inoremap () ()
inoremap [ []<Left>
inoremap [] []
inoremap { {}<Left>
inoremap {} {}
inoremap ' ''<Left>
inoremap '' ''
inoremap " ""<Left>
inoremap "" ""

inoremap {<CR> {<CR>}<Esc>O
inoremap {<S-Enter> {<CR>}<Esc>O

" Append colon/semicolon to the end of the current line
nnoremap <M-,> myA,<Esc>`y
nnoremap <M-;> myA;<Esc>`y
nnoremap <M-:> myA:<Esc>`y
inoremap <M-,> <Esc>myA,<Esc>`ya
inoremap <M-;> <Esc>myA;<Esc>`ya
inoremap <M-:> <Esc>myA:<Esc>`ya

" Flip the case of the current word
noremap <M-c> viw~e
inoremap <M-c> <Esc>viw~ea

" Close the preview window
noremap <F5> :pclose<CR>
inoremap <F5> <Esc>:pclose<CR>a

" Quick toggling of BufExplorer and the Quickfix window
nnoremap <silent> <F2> :call <SID>QuickfixToggle()<CR>
nnoremap <F3> :cn<CR>
nnoremap <F4> :cp<CR>

" File tree panel
nnoremap <silent> <F8> :call <SID>netrw_toggle()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! s:VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction ==# 'f'
        call s:CmdLine("vimgrep /" . l:pattern . '/ <C-r>%')
    elseif a:direction ==# 'g'
        call s:CmdLine("vimgrep /" . l:pattern . '/j **/*')
    elseif a:direction ==# 's'
        call s:CmdLine("%s/" . l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Don't close window, when deleting a buffer
function! s:buffer_close()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") ==# l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! " . l:currentBufNum)
   endif
endfunction

func! s:DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd ==# g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif

    return g:cmd_edited
endfunc

func! s:CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

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

function! s:paste_over() range
  " get start and end position of selection
  " [bufnum, lnum, col, off, curswant]
  let l:pos_start = getpos("'<")
  let l:pos_end = getpos("'>")
  let l:line_len = col("$") - 1

  " delete selected text
  execute('normal! gv"_x')

  " get the cursor position after deletion
  let l:pos_after = getpos(".")

  " determine whether we should paste before or after
  " hard to explain, do some experiment
  let l:paste_op = 'p'
  if s:is_multiline_selection(l:pos_start, l:pos_end, l:line_len)
    " multi-line selection, compare line
    if l:pos_after[1] ==# l:pos_start[1]
      let l:paste_op = 'P'
    endif
  else
    " same line selection, compare col
    if l:pos_after[2] ==# l:pos_start[2]
      let l:paste_op = 'P'
    endif
  endif

  execute('normal! ' . l:paste_op)
  " call setpos('.', l:pos_before)
endfunction

function! s:is_multiline_selection(v_start, v_end, start_line_length) range
  if a:v_start[1] ==# a:v_end[1]
    " in same line, check if the whole line is in selection
    if a:v_end[2] - a:v_start[2] < a:start_line_length
      return 0
    endif
  endif
  return 1
endfunction

function! s:netrw_toggle()
  for l:bfn in s:listbfn('"NetrwTreeListing"')
    let l:bwn = bufwinnr(l:bfn)
    if l:bwn !=# -1
      execute (l:bwn . 'close')
      return
    endif
  endfor
  execute 'Vexplore'
endfunction
