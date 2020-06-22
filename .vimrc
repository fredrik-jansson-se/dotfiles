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
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

" Rename new_name.sh
" Chmod +x
" SudoWrite
Plugin 'tpope/vim-eunuch'

Plugin 'ctrlpvim/ctrlp.vim'

" Solarized
Plugin 'altercation/vim-colors-solarized.git'

call vundle#end()

source ~/dotfiles/augroup.vim
source ~/dotfiles/common.vim
source ~/dotfiles/keymaps.vim

" ALE
" Disable ALE LSP since we're using vim-lsp
let g:ale_disable_lsp=1
" let g:ale_linters = {'rust': ['analyzer']}

" nmap <buffer> K <plug>(ale_hover)
" nmap <buffer> gd <plug>(ale_go_to_definition)

" RUST
"
if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'whitelist': ['rust'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> K <plug>(lsp-hover)
  nmap <buffer> <f2> <plug>(lsp-rename)
  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for anguages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Get colors ok on white backgroup
set background=light
colorscheme solarized
