-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

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

  -- Lux
  use 'tbjurman/vim-lux'

  use 'fredrik-jansson-se/vim-yang'

  use 'tpope/vim-surround'

  use {
    'nvim-telescope/telescope.nvim', branch = 'master',
    requires = { {'nvim-lua/plenary.nvim'},
      {'BurntSushi/ripgrep'} }
  }

  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}
  use{ 'mrcjkb/rustaceanvim', branch = 'master' }

  use { "catppuccin/nvim", as = "catppuccin" }

  use { 'Julian/lean.nvim' }

end)
