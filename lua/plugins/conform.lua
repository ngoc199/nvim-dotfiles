return {
	"conform.nvim",
	opts = function(_, opts)
		opts.log_level = vim.log.levels.DEBUG

		opts.formatters_by_ft = opts.formatters_by_ft or {}
		opts.formatters_by_ft.lua = { "stylua" }
		opts.formatters_by_ft.python = { "isort", "black" }
		opts.formatters_by_ft.javascript = { "prettierd", "prettier", stop_after_first = true }
		opts.formatters_by_ft.typescript = { "prettierd", "prettier", stop_after_first = true }
		opts.formatters_by_ft.css = { "oxfmt", "prettierd", "prettier", stop_after_first = true }
		opts.formatters_by_ft.sql = { "sqlfluff" }

		opts.formatters = opts.formatters or {}
		opts.formatters.sqlfluff = {
			args = { "format", "-" },
			cwd = require("conform.util").root_file({ ".sqlfluff" }),
			require_cwd = true,
		}
	end,
}
