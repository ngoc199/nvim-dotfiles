local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.setup()

lsp.ensure_installed({
	'tsserver',
	'eslint',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
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
end)

lsp.setup()
