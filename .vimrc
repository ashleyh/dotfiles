set wildmode=list:longest:full
set showmode
set showcmd

" options for ins-completion
set completeopt=longest,menuone,preview
set ignorecase
set infercase

" make <CR> always accept a completion instead of 
" adding a newline
inoremap <expr> <CR> MaybeAcceptCompletion()

func! MaybeAcceptCompletion()
  if pumvisible()
    return "\<C-Y>"
  else
    return "\<CR>"
  endif
endfunc

" tab settings
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
filetype plugin indent on

" gui stuff
set guioptions-=T
set guifont=Droid\ Sans\ Mono\ 11

" enable mouse in terminal
set mouse=a

" quickly save
map WW :w<CR>

" quickly indent/dedent
imap <S-Tab> <C-d>
vmap <Tab> >gv
vmap <S-Tab> <gv

" syntax
filetype on
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
