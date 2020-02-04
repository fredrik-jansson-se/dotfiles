let g:deoplete#enable_at_startup = 1

" For Vundle
filetype plugin indent on

set hlsearch " hightligh searches
set ignorecase
set smartcase

" Hidden allows for changed buffers in the background
set hidden

" Always use spaces over tabs
set expandtab

set number " show linenumbers
set nowrap " no wrapping

" Set split right, this will make the focus on the right hand split
set splitright

" set wildmode=list:longest:full
set wildmode=list:full

" Disable mouse
set mouse=

" Enable True Color
set termguicolors
" if !has("nvim")
"   let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
"   let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
" endif

set formatoptions-=o "dont continue comments when pushing o/O

set backupdir=/tmp/
set directory=/tmp/

" Ignore whitespace in diff
if &diff
  " diff mode
  set diffopt+=iwhite
endif

"============================================================================
" Set up persistent undo (with all undo files in one directory)
"============================================================================

if has('persistent_undo')
  set undofile
endif

set undodir=$HOME/.VIM_UNDO_FILES

set undolevels=5000

" Trim whitespace
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()

" --- PYTHON
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_options_max_line_length = 150
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint = {'max_line_length': g:pymode_options_max_line_length}
let g:ale_python_flake8_options='--ignore=E501'
let g:pymode_lint_ignore = ["E501"]

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Remove ws on save
let g:pymode_trim_whitespaces = 1

let g:pymode_options = 1

" Airline
" let g:airline_theme='light'
let g:airline_theme='dark'

" Airline and Ale
let g:airline#extensions#ale#enabled = 1

" Rust
let g:rustfmt_autosave = 1
