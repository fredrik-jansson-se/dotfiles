local lsp_zero = require("lsp-zero")

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
      ['<Alt-Space>'] = cmp.mapping.complete(),
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<CR>'] = cmp.mapping.confirm({select = true}),
  }),
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'},
  }
})

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<leader>fb", function() vim.lsp.buf.format() end, opts)
end)

vim.g.rustaceanvim = {
  server = {
    capabilites = lsp_zero.get_capabilities()
  },
}

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {
    'rust_analyzer',
    'pylsp',
    'volar',
  },
  handlers = {
    lsp_zero.default_setup,
    rust_analyzer = lsp_zero.noop,
    volar = function()
      require('lspconfig').volar.setup({})
    end,
    -- tsserver = function()
    --   local vue_typescript_plugin = require('mason-registry')
    --   .get_package('vue-language-server')
    --   :get_install_path()
    --   .. '/node_modules/@vue/language-server'
    --   .. '/node_modules/@vue/typescript-plugin'
    --
    --   require('lspconfig').tsserver.setup({
    --     init_options = {
    --       plugins = {
    --         {
    --           name = "@vue/typescript-plugin",
    --           location = vue_typescript_plugin,
    --           languages = {'javascript', 'typescript', 'vue'}
    --         },
    --       }
    --     },
    --     filetypes = {
    --       'javascript',
    --       'javascriptreact',
    --       'javascript.jsx',
    --       'typescript',
    --       'typescriptreact',
    --       'typescript.tsx',
    --       'vue',
    --     },
    --   })
    -- end,
  },
})


