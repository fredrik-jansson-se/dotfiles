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

" Syntax checker
Plugin 'dense-analysis/ale'

" Status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Plugin 'vim-erlang/vim-erlang-runtime'
" Plugin 'vim-erlang/vim-erlang-compiler'
" Plugin 'vim-erlang/vim-erlang-omnicomplete'
" Plugin 'vim-erlang/vim-erlang-tags'
" Plugin 'vim-erlang/vim-erlang-skeletons'

Plugin 'othree/xml.vim'
Plugin 'python-mode/python-mode'

" [ <space> etc
Plugin 'tpope/vim-unimpaired'
Plugin 'tbjurman/vim-lux'
Plugin 'tpope/vim-fugitive'

" comment with gc
Plugin 'tpope/vim-commentary.git'
Plugin 'fredrik-jansson-se/vim-yang'

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'neoclide/coc.nvim'

" Rename new_name.sh
" Chmod +x
" SudoWrite
Plugin 'tpope/vim-eunuch'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tpope/vim-surround'

" Go
Plugin 'fatih/vim-go'

call vundle#end()

source ~/dotfiles/augroup.vim
source ~/dotfiles/common.vim
source ~/dotfiles/keymaps.vim

" ALE
" Disable ALE LSP since we're using vim-lsp
let g:ale_disable_lsp=1

" COC
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

nnoremap <leader>em :CocCommand rust-analyzer.expandMacro<CR>

" For COC make the popup bg color blue
highlight CocFloating ctermbg=darkblue

" Get colors ok on white backgroup
set background=dark
