
" Cursor movement in Normal/Visual mode
noremap - 24k
noremap = 24j
noremap 9 ^
noremap 0 $
noremap <Space> W

" don't mess up the registry when deleting a single character
nnoremap x "_x

" don't mess up the registry when pasting upon selection
vnoremap p "_xP

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

cnoremap <M-9> <C-b>
cnoremap <M-0> <End>
cnoremap <M-h> <Left>
cnoremap <M-l> <Right>

" Quick exit
nnoremap <C-q> :q<CR>

" Tab switch "
nnoremap <M-w> :tabprevious<CR>
inoremap <M-w> <Esc>:tabprevious<CR>
nnoremap <C-Tab> :tabnext<CR>

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
nnoremap <silent> <Leader>bd :call <SID>BufcloseCloseIt()<CR>
nnoremap <Leader>ba :1,1000 bd!<CR>
nnoremap <Leader>bt :tab sball<CR>
nnoremap <Tab> <C-^>
nnoremap <Leader>l :ls!<CR>

" open new...
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>e :<C-\>e<SID>CurrentFileDir("e")<CR>
cnoremap <Leader><Space> tabedit <C-r>=expand("%:p:h")<CR>/

cnoremap <Leader>u <C-\>e<SID>DeleteTillSlash()<cr>

" change to current file's dir
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Move a line of text using ALT+[jk]
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


" When you press gv you vimgrep after the selected text
vnoremap <silent> <Leader>f :call <sid>VisualSelection('f')<CR>
vnoremap <silent> <Leader>g :call <sid>VisualSelection('g')<CR>

" Vimgreps in the current file
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
function! s:BufcloseCloseIt()
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

