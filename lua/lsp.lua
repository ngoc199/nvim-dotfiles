-- LSP
require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        vim.keymap.set('n', "L", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set('n', "<C-]>", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set('n', "gt", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set('n', "<F2>", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set('n', "gi", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set('n', "gn", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set('n', "gb", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set('n', "sd", "<cmd>Telescope diagnostics<cr>", {buffer=0})
        vim.keymap.set('n', "<leader>a", vim.lsp.buf.code_action, {buffer=0})
    end
}
require'lspconfig'.emmet_ls.setup{}
require'lspconfig'.cssmodules_ls.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        vim.keymap.set('n', "<C-]>", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set('n', "gt", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set('n', "<F2>", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set('n', "gi", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set('n', "gn", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set('n', "gb", vim.diagnostic.goto_prev, {buffer=0})
    end
}
require'lspconfig'.eslint.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.prismals.setup{}
require'lspconfig'.vuels.setup{}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.cucumber_language_server.setup{
    settings = {
        cucumber = {
            features = { "**/*.feature" },
            glue = { "**/*.steps.ts", "**/*.step.ts" }
        }
    },
    on_attach = function(client, bufnr)
        vim.keymap.set('n', "<C-]>", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set('n', "gn", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set('n', "gb", vim.diagnostic.goto_prev, {buffer=0})
    end
}

-- Autocomplete
vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' }, -- For vsnip users.
  -- { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'ultisnips' }, -- For ultisnips users.
  -- { name = 'snippy' }, -- For snippy users.
}, {
  { name = 'buffer' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
