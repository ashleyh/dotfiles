set nocompatible

" try to get some idea of which OS we're on
let g:uname = "Unknown"
if has("unix")
  let g:uname = substitute(system("uname"), "\n$", "", "")
endif

" because i can't seem to rebind capslock to escape in OSX
if g:uname == "Darwin"
  inoremap qw <Esc>
endif

set wildmode=list:longest:full
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
set tabstop=2
set shiftwidth=2
set softtabstop=2

" hide silly gui toolbar
set guioptions-=T

" set good font
if g:uname == "Linux"
  set guifont=Droid\ Sans\ Mono\ 11
elseif g:uname == "Darwin"
  set guifont=Menlo\ Regular:h11
endif

" enable mouse in terminal
set mouse=a

" quickly save
map WW :w<CR>
imap WW <Esc>:w<CR>i

" quickly indent/dedent
imap <S-Tab> <C-d>
vmap <Tab> >gv
vmap <S-Tab> <gv

" syntax
filetype plugin indent on
syntax enable

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

" exclude some unvimmable files
set wildignore+=*.class,*.o

" for some baffling reason, the default vim on OSX doesn't
" have python support
if has("python")
python <<endpython
import vim
from contextlib import contextmanager
print "hai"

# saves the cursor before running the block and restores
# it afterwards
@contextmanager
def preserve_cursor(window):
  old_cursor = window.cursor
  try:
    yield
  finally:
    window.cursor = old_cursor

# if `motion` is on a different line to the current
# line, then insert a `<CR>` before `close`
def insert_close(motion, close):
  window = vim.current.window
  with preserve_cursor(window):
    old_row, _ = window.cursor
    vim.command("keepjumps normal " + motion)
    new_row, _ = window.cursor
  if new_row < old_row:
    vim.command(r'execute "normal" "a\<CR>\<Esc>"')
  vim.command(r'execute "normal!" "a{0}\<Esc>"'.format(close))
endpython

  " the idea here is that if you type
  "    function () {
  "        something}
  " then that last } will get bumped onto a newline for you.
  inoremap } <C-o>:python insert_close("[{", "}")<CR>
  inoremap ) <C-o>:python insert_close("[(", ")")<CR>
endif
