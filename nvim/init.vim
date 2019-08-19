" git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set rtp+=~/.config/nvim/bundle/Vundle.vim
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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'othree/xml.vim'
Plugin 'python-mode/python-mode'

" [ <space> etc
Plugin 'tpope/vim-unimpaired'
Plugin 'tbjurman/vim-lux'
Plugin 'tpope/vim-fugitive'

" comment with gc
Plugin 'tpope/vim-commentary.git'
Plugin 'fredrik-jansson-se/vim-yang'

" Ag/Ack search, see Ag search below
Plugin 'mileszs/ack.vim'

" Go
Plugin 'fatih/vim-go'

" Autocomplete
Plugin 'Shougo/deoplete.nvim'

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'autozimu/LanguageClient-neovim'

" Rename new_name.sh
" Chmod +x
" SudoWrite
Plugin 'tpope/vim-eunuch'

call vundle#end()

filetype plugin indent on

let g:deoplete#enable_at_startup = 1

" Get colors ok on white backgroup
set background=light

source ~/dotfiles/augroup.vim
source ~/dotfiles/common.vim
source ~/dotfiles/keymaps.vim

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

noremap <silent> H :call LanguageClient_textDocument_hover()<CR>

