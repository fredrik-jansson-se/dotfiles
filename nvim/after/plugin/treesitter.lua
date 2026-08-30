require'nvim-treesitter'.install { 'rust', 'dockerfile' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rust', 'dockerfile' },
  callback = function()
    vim.treesitter.start()
  end,
})

