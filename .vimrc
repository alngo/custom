"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Encoding standard
" scriptencoding utf-8
set encoding=utf-8

" Enable Mouse
set mouse=a

" Set backspace
set backspace=indent,eol,start

" Set path
set path+=**

" Set some feature and Color
color despacio
syntax on
set autoindent
set autoread
set number
set showmatch
set autochdir

" No Error Bell
set noerrorbells
set novisualbell
set tm=500

" Set Marker on file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")| exe "normal! g'\"" | endif

" Delete Trailing White Space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()

" Bracket AutoClose
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

inoremap "      ""<Left>
inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     "
inoremap ""     ""

inoremap '      ''<Left>
inoremap '<CR>  '<CR>'<Esc>O
inoremap ''     '
inoremap ''     ''

" Tab manipulation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap ta  :tab all<CR>

" AutoQuit Insert Mode
imap jj  <Esc>
imap hh  <Esc>
imap kk  <Esc>

" Line manipulation
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Panes manipulation
nnoremap <S-j> <C-W><C-J>
nnoremap <S-k> <C-W><C-K>
nnoremap <S-l> <C-W><C-L>
nnoremap <S-h> <C-W><C-H>

"Cursor Shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Show file options above the command line
set wildmenu

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" netrw config
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

" VIM PLUGIN AND EXTENSION

" Pathogen()
execute pathogen#infect()

" Plug()
call plug#begin('~/.vim/plugged')

call plug#end()
