
" moving cursor around
noremap - <S-Down>
noremap = <S-Up>
noremap 0 ^
noremap ; <End>
noremap <Space> w

" don't mess up the registry when delete with x
nnoremap x "_x

" auto complete
inoremap <M-n> <C-n>

" Windows-style paste
inoremap <C-v> <C-R>*
cnoremap <C-v> <C-R>*

" Insert mode cursor movement
inoremap <M-o> <Esc>o
inoremap <M-b> <Esc>^i
inoremap <M-;> <End>

inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>

cnoremap <M-b> <C-b>
cnoremap <M-;> <End>
cnoremap <M-h> <Left>
cnoremap <M-l> <Right>

" Quick exit
nnoremap <C-q> :q<CR>

" Tab switch "
nnoremap <M-w> :tabprevious<CR>
inoremap <M-w> <Esc>:tabprevious<CR>
nnoremap <C-Tab> :tabnext<CR>

" Window movement "
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l

" Increase/decrease the size of current window "
nnoremap <C-Up> <C-W>2>
nnoremap <C-Down> <C-W>2<LT>

" Quick help "
nnoremap <Leader>h :vertical help<Space>

" buffer control
nnoremap <Leader>bd :call <SID>BufcloseCloseIt()<CR>
nnoremap <Leader>ba :1,1000 bd!<CR>
nnoremap <Leader>bt :tab sball<CR>

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
vnoremap <silent> <Leader>g :call <sid>VisualSelection('gv', '')<CR>

" Vimgreps in the current file
nnoremap <Leader>g :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <Leader>r :call <sid>VisualSelection('replace', '')<CR>

nnoremap <Leader>c :botright cope20<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>


" Window size control "
nnoremap <M-`> :simalt ~x<CR>
nnoremap <M-1> :winsize 166 40<CR>
nnoremap <M-2> :winsize 120 32<CR>
nnoremap <M-3> :winsize 80 24<CR>


" surround selected text with...
vnoremap () <esc>`>a)<esc>`<i(<esc>
vnoremap [] <esc>`>a]<esc>`<i[<esc>
vnoremap {} <esc>`>a}<esc>`<i{<esc>
vnoremap '' <esc>`>a'<esc>`<i'<esc>
vnoremap "" <esc>`>a"<esc>`<i"<esc>

" auto complete of (, ", ', [
inoremap ( ()<Left>
inoremap () ()
inoremap { {}<Left>
inoremap {} {}
inoremap ' ''<Left>
inoremap '' ''
inoremap " ""<Left>
inoremap "" ""

inoremap {<CR> {<CR>}<Esc>O
inoremap {<S-Enter> {<CR>}<Esc>O

" append colon/semicolon at the end of line (super useful)
nnoremap <Leader>; $a;<Esc>
nnoremap <Leader>: $a:<Esc>
nnoremap <LT>: $a:<Esc>

" flip the case of previous word (super useful 2)
inoremap <M-u> <Esc>bve~<Esc>ea


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! s:VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call s:CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call s:CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
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

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

func! s:DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
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
