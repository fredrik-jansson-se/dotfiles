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
    end,
})

vim.keymap.set('i', '<CR>', function()
    if vim.fn.pumvisible() == 1 then
      return '<C-y>'
    end
    return '<CR>'
  end, { expr = true })

require("mason-lspconfig").setup {
   ensure_installed = {
    'rust_analyzer',
  },
  automatic_enable = {
    exclude = { 'rust_analyzer' }, -- rustaceanvim manages LSP setup
  },
  -- handlers = {
  --   bashls = function()
  --     require('lspconfig').bashls.setup({})
  --   end,
  --   ts_ls = function()
  --     local vue_typescript_plugin = require('mason-registry')
  --     .get_package('vue-language-server')
  --     :get_install_path()
  --     .. '/node_modules/@vue/language-server'
  --     .. '/node_modules/@vue/typescript-plugin'
  --
  --     require('lspconfig').ts_ls.setup({
  --       init_options = {
  --         plugins = {
  --           {
  --             name = "@vue/typescript-plugin",
  --             location = vue_typescript_plugin,
  --             languages = {'javascript', 'typescript', 'vue'}
  --           },
  --         }
  --       },
  --       filetypes = {
  --         'javascript',
  --         'javascriptreact',
  --         'javascript.jsx',
  --         'typescript',
  --         'typescriptreact',
  --         'typescript.tsx',
  --         'vue',
  --       },
  --     })
  --   end,
  -- },
}
-- vim.lsp.config('ts_ls', {
--   init_options = {
--     plugins = {
--       {
--         name = "@vue/typescript-plugin",
--         location = vim.fn.stdpath('data') ..
--         '/mason/packages/vue-language-server/node_modules/@vue/language-server',
--         languages = {'javascript', 'typescript', 'vue'}
--       },
--     }
--   },
--   filetypes = {
--     'javascript',
--     'javascriptreact',
--     'javascript.jsx',
--     'typescript.tsx',
--   },
-- })
vim.lsp.enable('ts_ls')
-- vim.lsp.enable('vue_ls')
--
vim.lsp.enable('bashls')

