set nocompatible

call pathogen#infect()

" vundle {{{
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Lokaltog/powerline'

filetype plugin indent on
" }}}

" powerline {{{
" wtf is with this, seriously?
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
" }}}


" try to get some idea of which OS we're on
let g:uname = "Unknown"
if has("unix")
  let g:uname = substitute(system("uname"), "\n$", "", "")
endif

set wildmode=list:longest
set wildignorecase
set wildignore+=*.class,*.o,*.pyc,*.pyo

set showmode
set showcmd

" options for ins-completion
set completeopt=longest,menuone,preview
set ignorecase

" make <CR> always accept a completion instead of 
" adding a newline
inoremap <expr> <CR> MaybeAcceptCompletion()

" tab to show ins-completionmenu
inoremap <expr> <Tab> MaybeShowCompletions()

" accept completion if ins-completionemnu is visible
func! MaybeAcceptCompletion()
  if pumvisible()
    return "\<C-Y>"
  else
    return "\<CR>"
  endif
endfunc

" highlight fist completion of ins-completionmenu is visible
" (so <Tab><Enter> works)
func! MaybeHighlightFirstEntry()
  if pumvisible()
    return "\<Down>"
  else
    return ""
  endif
endfunc

" <Tab> handler: either show ins-completionmenu or highlight
" next completion
func! MaybeShowCompletions()
  if pumvisible()
    return "\<C-N>"
  else
    if col(".") > indent(line(".")) + 1
      " we're after a non-blank character, show the menu and
      " highlight the first entry
      return "\<C-N>\<C-R>=MaybeHighlightFirstEntry()\<CR>"
    else
      " the user probably just wants to indent...
      return "\<Tab>"
    endif
  endif
endfunc

" tab settings
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" ...except python
autocmd FileType python setlocal shiftwidth=4 softtabstop=4

" try to rescue javascript indent
autocmd FileType javascript setlocal nocindent

" hide silly gui toolbar
set guioptions-=T

" set good font
if g:uname == "Linux"
  set guifont=Droid\ Sans\ Mono\ 10.5
elseif g:uname == "Darwin"
  set guifont=Menlo\ Regular:h13
endif

" enable mouse in terminal
set mouse=a

" quickly indent/dedent
imap <S-Tab> <C-d>
vmap <Tab> >gv
vmap <S-Tab> <gv

" syntax
syntax enable
let syntastic_enable_signs=1
let syntastic_auto_loc_list=1
let syntastic_mode_map = { 'passive_filetypes': ['scala'] }

" colorscheme
set background=dark
colorscheme solarized

" don't wrap lines, instead show arrows in the margin of lines
" that are too long
set nowrap
set listchars=extends:»,precedes:«

" search as you type
set incsearch

" highlight search
set hlsearch

" line numbers
set number

" column 80 marker
set colorcolumn=80

" use {{{ }}} to mark folds manually
set foldmethod=marker

" stop ctrlp trying to be smart
let g:ctrlp_working_path_mode=''
let g:ctrlp_custom_ignore={
  \ 'dir': '\v[\/](target|\.hg|\.svn|__mycache__)$',
  \ 'file': '\v\.jar$|\.class$'
  \ }

" browse parent directory
map g/ :e %:p:h<CR>

" /g is a pain
set gdefault

" use ack.vim with ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" leave some space at edge of window
set scrolloff=3
set sidescrolloff=5

" i don't know why this isn't the default
nnoremap Y y$

nmap <Leader>nh :noh<CR>
