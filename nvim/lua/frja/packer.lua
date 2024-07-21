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

  -- Syntax checker
  -- use 'w0rp/ale'

  -- Lux
  use 'tbjurman/vim-lux'

  use 'fredrik-jansson-se/vim-yang'

  use 'tpope/vim-surround'

  use {
    'nvim-telescope/telescope.nvim', branch = 'master',
    requires = { {'nvim-lua/plenary.nvim'},
      {'BurntSushi/ripgrep'} }
  }
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
    requires = {
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},

      { 'mrcjkb/rustaceanvim',
        branch = 'master' }
	  }
  }

  use { "catppuccin/nvim", as = "catppuccin" }

end)
