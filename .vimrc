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

" Haskell
" Plugin 'eagletmt/ghcmod-vim.git'
" Plugin 'Shougo/vimproc'

" Ag/Ack search, see Ag search below
" Plugin 'mileszs/ack.vim'

" Go
" Plugin 'fatih/vim-go'

" FZF
" Plugin 'junegunn/fzf.vim'

" Autocomplete
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'roxma/nvim-yarp'
" Plugin 'roxma/vim-hug-neovim-rpc'

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

" Rename new_name.sh
" Chmod +x
" SudoWrite
Plugin 'tpope/vim-eunuch'

Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

source ~/dotfiles/augroup.vim
source ~/dotfiles/common.vim
source ~/dotfiles/keymaps.vim

" RUST
"
if executable('rls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for anguages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Get colors ok on white backgroup
set background=dark
