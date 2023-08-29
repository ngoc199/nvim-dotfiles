local navic = require("nvim-navic")

navic.setup {
    icons = {
        File          = "",
        Module        = " ",
        Namespace     = " ",
        Package       = "",
        Class         = " ",
        Method        = " ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = " ",
        Interface     = "",
        Function      = " ",
        Variable      = " ",
        Constant      = " ",
        String        = " ",
        Number        = "#",
        Boolean       = "◩ ",
        Array         = "",
        Object        = " ",
        Key           = " ",
        Null          = "NULL",
        EnumMember    = " ",
        Struct        = "",
        Event         = " ",
        Operator      = " ",
        TypeParameter = " ",
    }
}

local lsp = require('lsp-zero').preset('minimal')

lsp.setup()

lsp.ensure_installed({
	'tsserver',
	'eslint',
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({
        buffer = bufnr
    })
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set('n', "L", vim.lsp.buf.hover, opts)
	vim.keymap.set('n', "<C-]>", vim.lsp.buf.definition, opts)
	vim.keymap.set('n', "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', "<F2>", vim.lsp.buf.rename, opts)
	vim.keymap.set('n', "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', "gn", vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', "gb", vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', "sd", "<cmd>Telescope diagnostics<cr>", opts)
	vim.keymap.set('n', "<leader>a", vim.lsp.buf.code_action, opts)

    -- init breadcrumbs
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end)

lsp.setup()
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- `cmp` need to be setup after lsp-zero
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b'] = cmp_action.luasnip_jump_backward()
    }
})
