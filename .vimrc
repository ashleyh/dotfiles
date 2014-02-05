set nocompatible

" vundle {{{
filetype off

if exists("$GOROOT")
  set rtp+=$GOROOT/misc/vim
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/rainbow_parentheses.vim'
Bundle 'sgeb/vim-diff-fold'
Bundle 'molokai'
Bundle 'plasticboy/vim-markdown'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-indent'
Bundle 'mattn/emmet-vim'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'tpope/vim-fugitive'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/MatchTagAlways'
Bundle 'majutsushi/tagbar'
Bundle 'Yggdroot/indentLine'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ervandew/supertab'
Bundle 'ashleyh/vim-colors-solarized'
Bundle 'itchyny/lightline.vim'
Bundle 'Julian/vim-textobj-variable-segment'
Bundle 'tpope/vim-capslock'
Bundle 'suan/vim-instant-markdown'
Bundle 'ashleyh/rust.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'ashleyh/vim-textobj-nl'
Bundle 'mitsuhiko/vim-jinja'
Bundle 'PotatoesMaster/i3-vim-syntax'
Bundle 'SirVer/ultisnips'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'guns/vim-clojure-static'

filetype plugin indent on
" }}}

" status line {{{
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'solarized',
\ }
" }}}

" try to get some idea of which OS we're on
let g:uname = "Unknown"
if has("unix")
  let g:uname = substitute(system("uname"), "\n$", "", "")
endif

" set {{{
set wildmode=list:longest
set wildignorecase
set wildignore+=*.class,*.o,*.pyc,*.pyo

set showmode
set showcmd

set completeopt=longest,menuone,preview
set ignorecase

" tab settings
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" enable mouse in terminal
set mouse=a

" don't wrap lines, instead show arrows in the margin of lines
" that are too long
set nowrap
set list
set listchars=tab:▸\ ,extends:»,precedes:«

" search as you type
set incsearch

" highlight search
set hlsearch

" line numbers
set number

" use {{{ }}} to mark folds manually
set foldmethod=marker

" /g is a pain
set gdefault

" leave some space at edge of window
set scrolloff=3
set sidescrolloff=5

set virtualedit+=block

" selections from tpope/vim-sensible
set backspace=indent,eol,start
set autoread
set history=1000
set ttimeout
set ttimeoutlen=50

set cm=blowfish

let mapleader = ","
" }}}

" gui, font, colorscheme {{{
" tone down the GUI
set guioptions=e
set visualbell

" set good font
if g:uname == "Linux"
  set guifont=Droid\ Sans\ Mono\ 10.5
elseif g:uname == "Darwin"
  set guifont=Menlo\ Regular:h13
endif

" colorscheme
set background=dark
colorscheme solarized

" syntax
syntax enable
" }}}

" au {{{
augroup ash 
  au!
  au FileType scala
    \ exe "RainbowParenthesesLoadBraces" |
    \ exe "RainbowParenthesesLoadRound"  |
    \ exe "RainbowParenthesesLoadSquare"
  au FileType clojure
    \ exe "RainbowParenthesesLoadBraces" |
    \ exe "RainbowParenthesesLoadRound"  |
    \ exe "RainbowParenthesesLoadSquare"
  au FileType python setlocal shiftwidth=4 softtabstop=4
  au FileType htmldjango setlocal shiftwidth=4 softtabstop=4
  au FileType javascript setlocal nocindent
  au FileType diff setlocal foldlevel=99
  au FileType gitcommit setlocal foldmethod=manual
  au BufWritePost .vimrc
    \ if expand('%') !~# '^fugitive://' |
    \   source %                        |
    \ endif
  au WinLeave,InsertEnter *
    \ set nocursorline                 |
    \ set nocursorcolumn               |
    \ set listchars-=trail:•
  au WinEnter,InsertLeave *
    \ set cursorline                   |
    \ set cursorcolumn                 |
    \ set listchars+=trail:•
  au FileType snippets setlocal noet sw=0 sts=0
augroup END
" }}}

" backup/undo/swap files {{{
set backup
set undofile

" copy-pasta from sjl {{{
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}
" }}}

" plugin stuff {{{
" use ack.vim with ag
let g:ackprg = 'ag --nogroup --nocolor --column'

let NERDTreeIgnore=['\.pyc$']
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \ 'htmldjango' : 1,
  \}

let g:pymode_rope_completion = 0
let g:pymode_lint_checkers = [
\ 'pylint',
\ 'pep8',
\ 'mccabe',
\ 'pyflakes',
\]
let g:pymode_lint_ignore = 'C0111,C0301,E501'
let g:pymode_folding = 0
let g:pymode_doc_bind = 'M'

let g:SuperTabCrMapping = 0

let g:indentLine_char = '┆'

let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1

" ctrlp {{{
" stop ctrlp trying to be smart
let g:ctrlp_working_path_mode=''
let g:ctrlp_custom_ignore={
  \ 'dir': '\v[\/](target|\.hg|\.svn|__mycache__)$',
  \ 'file': '\v\.jar$|\.class$'
  \ }
" }}}

let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsEditSplit = 'vertical'
"}}}

" mappings {{
" quickly indent/dedent
imap <S-Tab> <C-d>
vmap <Tab> >gv
vmap <S-Tab> <gv

" browse parent directory
map g/ :e %:p:h<CR>

" i don't know why this isn't the default
nnoremap Y y$

nmap <Leader>nh :noh<CR>

" hat-tip sjl
noremap H ^
noremap L $
vnoremap L g_
noremap K :q<CR>

" note to self: map these to something useful
nmap M <nop>
nmap Q <nop>
nmap R <nop>
nmap U <nop>

noremap <Leader>y "+y
vnoremap <Leader>y "+y

noremap <Leader>p "+p

noremap <Leader>ev :exe 'vsplit ' . resolve(expand('~/.vimrc'))<CR>
noremap <Leader>es :UltiSnipsEdit<CR>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" nb set PATH in .zshenv because vim starts a non-interactive non-login shell
nnoremap <Leader>ct :!ctags<CR>

nmap <Leader>r :RainbowParenthesesToggleAll<CR>

nnoremap <Leader>pi "zyiw:Ack! -Gpy 'import\b.*\b<C-R>z\b'<CR>

nnoremap <Leader>t :CtrlPTag<CR>

nmap <C-s> :w<CR>
imap <C-s> <C-o>:w<CR>

nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gs :Gstatus<CR>
" }}}

" ideas from Damian Conway's talk {{{
call matchadd('Todo', '\%>80v.*', 1000)

nnoremap <silent> n   n:call HLNext(0.1)<cr>
nnoremap <silent> N   N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('Todo', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction
" }}}
