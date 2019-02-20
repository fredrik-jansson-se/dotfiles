syntax enable

" Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginList
" :PluginInstall
set nocompatible
filetype off

set rtp+=~/.fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" Sensible settings for VIM
Plugin 'tpope/vim-sensible'

" Plugin 'scrooloose/nerdtree'

" Syntax checker
Plugin 'w0rp/ale'

" Status line
Plugin 'bling/vim-airline'

Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'vim-erlang/vim-erlang-skeletons'

Plugin 'othree/xml.vim'
Plugin 'python-mode/python-mode'

" [ <space> etc
Plugin 'tpope/vim-unimpaired'
Plugin 'tbjurman/vim-lux'
Plugin 'tpope/vim-fugitive'

" comment with gc
Plugin 'tpope/vim-commentary.git'
Plugin 'fredrik-jansson-se/vim-yang'

" Haskell
Plugin 'eagletmt/ghcmod-vim.git'
Plugin 'Shougo/vimproc'

" Ag/Ack search, see Ag search below
Plugin 'mileszs/ack.vim'

" Go
Plugin 'fatih/vim-go'

" FZF
Plugin 'junegunn/fzf.vim'

" Autocomplete
Plugin 'Shougo/neocomplete.vim'

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

" Rename new_name.sh
" Chmod +x
" SudoWrite
Plugin 'tpope/vim-eunuch'

Plugin 'airblade/vim-gitgutter'

call vundle#end()

" For Vundle
filetype plugin indent on

" NERDTree
" nnoremap <C-n> :NERDTreeToggle<CR>

set hlsearch " hightligh searches
set ignorecase
set smartcase

" Status bar
set statusline=%F%m%r%h%w\ [%p%%]\ [LEN=%L]

"====[ Make the 121st column stand out ]====================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%121v', 100)

" Always use spaces over tabs
set expandtab

" Keep 4 spaces in some code
augroup java
  autocmd!
  autocmd FileType java set tabstop=4|set shiftwidth=4
augroup end

augroup html
  autocmd!
  autocmd FileType html set tabstop=4|set shiftwidth=4
augroup end

augroup sh
  autocmd!
  autocmd FileType sh set tabstop=4|set shiftwidth=4
augroup end

augroup yaml
  autocmd!
  autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 sts=2 expandtab
augroup end

augroup adoc
  autocmd!
  autocmd BufNewFile,BufRead *adoc set tw=80
augroup end

augroup javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4
augroup end

augroup json
  autocmd!
  autocmd FileType json set tabstop=4|set shiftwidth=4
augroup end

augroup Erlang
  autocmd!
  autocmd FileType erlang set tabstop=4|set shiftwidth=4
augroup end

augroup ncs.conf
  autocmd!
  au BufRead,BufNewFile ncs.conf setfiletype xml
augroup end

augroup xml
  autocmd!
  autocmd FileType xml set tabstop=2|set shiftwidth=2
  autocmd FileType xml let g:xml_syntax_folding=1
  autocmd FileType xml setlocal foldmethod=syntax
  autocmd FileType xml :syntax on
  autocmd FileType xml :%foldopen!
augroup end

augroup vim
  autocmd!
  autocmd FileType vim set tabstop=2|set shiftwidth=2
augroup end

augroup go
  autocmd!
  autocmd FileType go set tabstop=2|set shiftwidth=2|set noexpandtab
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>b <Plug>(go-build)
augroup end

augroup toml
  autocmd!
  autocmd BufRead,BufNewFile *.toml setlocal commentstring=#\ %s
augroup end

set number " show linenumbers
set nowrap " no wrapping

set formatoptions-=o "dont continue comments when pushing o/O

set backupdir=/tmp/
set directory=/tmp/

" Tab navigation
nnoremap <C-k>  :tabfirst<CR>
nnoremap <C-l>  :tabnext<CR>
if has('nvim')
  nnoremap <BS>  :tabprev<CR>
else
  nnoremap <C-h>  :tabprev<CR>
endif
nnoremap <C-j>  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

"====[ Swap : and ; to make colon commands easier to type ]======
nnoremap ; :
nnoremap : ;

" Hit ; twice to "find next"
" Using this adds a long delay to ;
noremap ;; ;

"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode ==

nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

" Fix indent of public/private/protected in classes
set cinoptions=g0

" Map F4 to paste toggle
set pastetoggle=<F4>

" Toogle cursor column with F5
nnoremap <F5> :set cursorcolumn!<CR>


" 256 colors
set t_Co=256

" Ignore whitespace in diff
if &diff
  " diff mode
  set diffopt+=iwhite
endif

""""""""""""""""""""
" Python
""""""""""""""""""""
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" " ]]            Jump on next class or function (normal, visual, operator modes)
" " [M            Jump on previous class or method (normal, visual, operator modes)
" " ]M            Jump on next class or method (normal, visual, operator modes)
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
" let g:syntastic_python_checker_args='--ignore=E501'
" let g:syntastic_python_flake8_args='--ignore=E501'
let g:ale_python_flake8_options='--ignore=E501'
let g:pymode_lint_ignore = ["E501"]


" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

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

" Haskell
augroup haskell
  " https://monicalent.com/blog/2017/11/19/haskell-in-vim/
  autocmd!
  nnoremap <Leader>ht :GhcModType<cr>
  nnoremap <Leader>htc :GhcModTypeClear<cr>
  autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>
  autocmd FileType haskell set shiftwidth=2|set tabstop=2|set smarttab|set smartindent|set autoindent
augroup end

let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:haskell_tabular = 1

"============================================================================
" Make :help appear in a full-screen tab, instead of a window
"============================================================================

"Only apply to .txt files...
augroup HelpInTabs
  autocmd!
  autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
  if &buftype == 'help'
    "Convert the help window to a tab...
    execute "normal \<C-W>T"
  endif
endfunction


"============================================================================
" Set up persistent undo (with all undo files in one directory)
"============================================================================

if has('persistent_undo')
  set undofile
endif

set undodir=$HOME/.VIM_UNDO_FILES

set undolevels=5000


"============================================================================
" Setup tab completion when finding file
"============================================================================
set wildmode=list:longest


" Use magic when searching
nnoremap / /\v

" True Color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Disable mouse
set mouse=

" Enable matchit to support % in xml
" packadd! matchit
runtime macros/matchit.vim

" Trim whitespace
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()

function! JoinWithLineAbove ()
  " appends the line above to the current line
  exe "normal! kddpkJ"
endfunction

nnoremap <silent> <C-J> :call JoinWithLineAbove()<CR>

" Syntastic
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 2
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" Ag search
" Make sure to install silver searcher (ag)
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" FZF
nnoremap <C-p> :FZF<CR>

" Allow %%/ to be expanded to current files directory, e.g. in tabedit and
" edit file
cabbr <expr> %% expand('%:p:h')

" Airline and Ale
let g:airline#extensions#ale#enabled = 1

" Rust
let g:rustfmt_autosave = 1

if executable('rls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif 

" Golang
" if executable('gopls')
" 	au User lsp_setup call lsp#register_server({
" 				\ 'name': 'gopls',
" 				\ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
" 				\ 'whitelist': ['go'],
" 				\ })
" endif
" if executable('bingo')
"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'bingo',
"         \ 'cmd': {server_info->['bingo', '-mode', 'stdio']},
"         \ 'whitelist': ['go'],
"         \ })
" endif
