return {
	"mfussenegger/nvim-lint",
	opts = {
		linters = {
			sqlfluff = {
				-- Tell the linter to run in the directory where your .sqlfluff file lives
				cwd = function()
					-- vim.fs.root finds the root directory containing your config
					return vim.fs.root(0, { ".sqlfluff", ".git" }) or vim.fn.getcwd()
				end,
				-- explicitly set args to ensure no rogue `--dialect=ansi` gets inherited
				args = {
					"lint",
					"--format=json",
				},
			},
		},
	},
}
