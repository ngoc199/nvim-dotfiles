return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				postgres_lsp = {
					cmd = { "postgres-language-server", "lsp-proxy" },
					root_dir = function(fname)
						local util = require("lspconfig.util")
						return util.root_pattern("postgres-language-server.jsonc", "postgrestools.jsonc", ".git")(fname)
							or vim.fn.getcwd()
					end,
				},
			},
		},
	},
}
