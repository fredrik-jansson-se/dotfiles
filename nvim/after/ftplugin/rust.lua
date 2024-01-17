-- https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file
local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set(
  "n",
  "<leader>ac",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n",
  "<leader>oc",
  function()
    vim.cmd.RustLsp('openCargo')
  end,
  {silent = true, buffer=bufnr }
)
