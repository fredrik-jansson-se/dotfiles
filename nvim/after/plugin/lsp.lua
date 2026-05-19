-- Disable LSP logging
vim.lsp.log.set_level(vim.log.levels.OFF)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
      local opts = {buffer = ev.buf}
      vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<leader>fb', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if client and client:supports_method('textDocument/inlayHint') then
        vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
      end
      vim.keymap.set('n', '<leader>ih', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }))
      end, opts)

    end,
})

vim.keymap.set('i', '<CR>', function()
    if vim.fn.pumvisible() == 1 then
      return '<C-y>'
    end
    return '<CR>'
  end, { expr = true })

vim.lsp.enable('ts_ls')
vim.lsp.enable('bashls')
