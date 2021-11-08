" git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required
" ALE
" Disable ALE LSP since we're using vim-lsp
let g:ale_disable_lsp=1

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" Sensible settings for VIM
Plugin 'tpope/vim-sensible'

" [ <space> etc
Plugin 'tpope/vim-unimpaired'

" Git
Plugin 'tpope/vim-fugitive'

" Rename new_name.sh
" Chmod +x
" SudoWrite
Plugin 'tpope/vim-eunuch'

" Syntax checker
Plugin 'w0rp/ale'

" comment with gc
Plugin 'tpope/vim-commentary.git'

" Status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'othree/xml.vim'
Plugin 'python-mode/python-mode'

" Lux
Plugin 'tbjurman/vim-lux'

Plugin 'fredrik-jansson-se/vim-yang'


" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'neoclide/coc.nvim'

" ripgrep
Plugin 'jremmen/vim-ripgrep'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'

call vundle#end()

filetype plugin indent on

" Dark mode
set background=dark


" COC
" faster triggering of e.g. CursorHold
set updatetime=300
" give more height for displaying messages
set cmdheight=2
" mix signcolumn and number column
set signcolumn=number
" For COC make the popup bg color blue
highlight CocFloating guibg=Blue

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Scroll floating windows
nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
" inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
" vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Highlight keywords in file
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <leader>em :CocCommand rust-analyzer.expandMacro<CR>

" Rust
let g:rustfmt_autosave = 1

" Disable Ex mode
nnoremap Q <Nop>

"====[ Swap : and ; to make colon commands easier to type ]======
nnoremap ; :
nnoremap : ;

"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode ==
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

" Map F4 to paste toggle
set pastetoggle=<F4>

" Toogle cursor column with F5
nnoremap <F5> :set cursorcolumn!<CR>

" Toggle line numbers
nnoremap <F6> :set number!<CR>

" Use magic when searching
nnoremap / /\v

" center at search
nnoremap n nzz
nnoremap N Nzz

" Open the location window with back-tick
nnoremap ` :CocDiagnostics<cr>:lw<cr>

" Allow %%/ to be expanded to current files directory, e.g. in tabedit and
" edit file
cabbr <expr> %% expand('%:p:h')

" Don't use ESC to exit normal mode
inoremap jk <esc>
" inoremap <esc> <Nop>

" Allow quick edit of vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Only use CtrlP for buffersearch
let g:ctrlp_cmd = 'CtrlPBuffer'


set hlsearch " highlight searches
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

set formatoptions-=o "dont continue comments when pushing o/O

" set backupdir=.vim-backup,/tmp/
set directory=~/tmp/

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
let g:airline_theme='luna'

" Airline and Ale
let g:airline#extensions#ale#enabled = 1

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

" augroup Erlang
"   autocmd!
"   autocmd FileType erlang set tabstop=4|set shiftwidth=4
" augroup end

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

" augroup Rust
"   autocmd!
"   autocmd BufReadPost *.rs setlocal filetype=rust
" augroup end

augroup haskell
  " https://monicalent.com/blog/2017/11/19/haskell-in-vim/
  autocmd!
  nnoremap <Leader>ht :GhcModType<cr>
  nnoremap <Leader>htc :GhcModTypeClear<cr>
  autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>
  autocmd FileType haskell set shiftwidth=2|set tabstop=2|set smarttab|set smartindent|set autoindent
augroup end

augroup YANG
  autocmd!
  autocmd FileType yang set expandtab
augroup end

augroup Asm
  autocmd!
  autocmd FileType asm set shiftwidth=2|set tabstop=2|set smarttab|set smartindent|set autoindent
  autocmd BufRead,BufNewFile *.asm setlocal commentstring=;\ %s
augroup end

augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap|set shiftwidth=2|set tabstop=2|set smarttab|set smartindent|set autoindent
augroup end

augroup Protobuf
  autocmd!
  autocmd FileType proto set shiftwidth=2|set tabstop=2|set smarttab|set smartindent|set autoindent
augroup end
