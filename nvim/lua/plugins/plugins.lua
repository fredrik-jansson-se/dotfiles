return {
  {
    "nvim-treesitter/nvim-treesitter"
  },
  {
    'tpope/vim-sensible'
  },
  {
    -- [ <space> etc
    'tpope/vim-unimpaired'
  },
  {
    -- Git
    'tpope/vim-fugitive'
  },
  {
    -- Rename new_name.sh
    -- Chmod +x
    -- SudoWrite
    'tpope/vim-eunuch'
  },
  --  -- Lux
  --  use 'tbjurman/vim-lux'
  --  use 'fredrik-jansson-se/vim-yang'
  {
    'tpope/vim-surround'
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = { { 'nvim-lua/plenary.nvim' },
      { 'BurntSushi/ripgrep' } }
  },
  {
    { 'neovim/nvim-lspconfig' }
  },
  {
    { 'hrsh7th/nvim-cmp' }
  },
  {
    { 'hrsh7th/cmp-nvim-lsp' }
  },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    'mrcjkb/rustaceanvim',
    branch = 'master'
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
  },
  -- {
  --   "github/copilot.vim"
  -- },
}
