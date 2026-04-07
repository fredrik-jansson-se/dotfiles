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
    end,
})

vim.keymap.set('i', '<CR>', function()
    if vim.fn.pumvisible() == 1 then
      return '<C-y>'
    end
    return '<CR>'
  end, { expr = true })

-- local cmp = require('cmp')
--
-- cmp.setup({
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'buffer' },
--   },
--   snippet = {
--     expand = function(args) 
--       vim.snippet.expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--       ['<Alt-Space>'] = cmp.mapping.complete(),
--       ['<C-f>'] = cmp.mapping.scroll_docs(4),
--       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-d>'] = cmp.mapping.scroll_docs(4),
--       ['<CR>'] = cmp.mapping.confirm({select = true}),
--   }),
-- })

vim.lsp.config('ts_ls', {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath('data') ..
        '/mason/packages/vue-language-server/node_modules/@vue/language-server',
        languages = {'javascript', 'typescript', 'vue'}
      },
    }
  },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript.tsx',
  },
})
vim.lsp.enable('ts_ls')
vim.lsp.enable('vue_ls')

vim.lsp.enable('bashls')
