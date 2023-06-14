
-- set numbers
vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background="light"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "number"
-- vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.mouse=""

vim.opt.undodir=os.getenv("HOME") .. "/.VIM_UNDO_FILES"
vim.opt.undolevels=5000
vim.opt.undofile=true

vim.g.loaded_ruby_provider=0
vim.g.loaded_node_provider=0
vim.g.loaded_perl_provider=0

--Allow %%/ to be expanded to current files directory
vim.cmd [[cabbr <expr> %% expand('%:p:h')]]

