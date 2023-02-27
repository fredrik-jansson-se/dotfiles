-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Sensible settings for VIM
  use 'tpope/vim-sensible'

  -- [ <space> etc
  use 'tpope/vim-unimpaired'

  -- Git
  use 'tpope/vim-fugitive'

  -- Rename new_name.sh
  -- Chmod +x
  -- SudoWrite
  use 'tpope/vim-eunuch'

  -- Syntax checker
  use 'w0rp/ale'

  -- comment with gc
  use 'tpope/vim-commentary'

  -- Status line
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use 'othree/xml.vim'
  use 'python-mode/python-mode'

  -- Lux
  use 'tbjurman/vim-lux'

  use 'fredrik-jansson-se/vim-yang'


  -- Rust
  use 'rust-lang/rust.vim'
  use {'neoclide/coc.nvim', branch = 'release'}

  use 'ctrlpvim/ctrlp.vim'
  use 'tpope/vim-surround'

  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
end)
