" Disable Ex mode
nnoremap Q <Nop>

" Tab navigation
nnoremap <C-k>  :tabfirst<CR>
nnoremap <C-l>  :tabnext<CR>
nnoremap <C-h>  :tabprev<CR>
nnoremap <C-j>  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap td  :tabclose<CR>

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

function! JoinWithLineAbove ()
  " appends the line above to the current line
  exe "normal! kddpkJ"
endfunction

nnoremap <silent> <C-J> :call JoinWithLineAbove()<CR>

" Allow %%/ to be expanded to current files directory, e.g. in tabedit and
" edit file
cabbr <expr> %% expand('%:p:h')

" Don't use ESC to exit normal mode
inoremap jk <esc>
inoremap <esc> <Nop>

" Allow quick edit of vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
