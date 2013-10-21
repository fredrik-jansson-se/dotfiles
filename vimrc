syntax on

set nocompatible 

filetype plugin indent on  " required for vundle

set hlsearch " highlight search results
set is " incsearch, i.e. show partial matches when typing

" Indent 4 spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set number " show linenumbers

set backupdir=/tmp/
set directory=/tmp/

set bs=2 " handle backspace

" Tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
