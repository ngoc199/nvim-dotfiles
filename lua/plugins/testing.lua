return {
	{
		"rcasia/neotest-java",
	},
	{
		"marilari88/neotest-vitest",
	},
	{
		"nsidorenco/neotest-vstest",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = {
				["neotest-java"] = {
					junit_jar = nil, -- default: auto-detected
					jvm_args = { "-Xmx512m" }, -- custom JVM arguments
					incremental_build = true, -- recompile only changed files
					disable_update_notifications = false, -- show JUnit update prompts
					test_classname_patterns = { "^.*Tests?$", "^.*IT$", "^.*Spec$" },
				},
				["neotest-vstest"] = {},
				["neotest-vitest"] = {},
			},
		},
	},
	{
		"mr-u0b0dy/crazy-coverage.nvim",
		ft = { "cs", "fsharp" },
		config = function()
			local root_dir = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
			if vim.v.shell_error ~= 0 then
				root_dir = vim.fn.getcwd()
			end
			local function get_coverage_dirs()
				local abs_dirs = vim.fn.globpath(root_dir, "**/TestResults", true, true)
				local rel_dirs = {}
				for _, abs_path in ipairs(abs_dirs) do
					local rel_path = abs_path:sub(#root_dir + 2)
					table.insert(rel_dirs, rel_path)
				end
				local dirs = rel_dirs
				table.insert(dirs, "TestResults")
				table.insert(dirs, ".")
				table.insert(dirs, "build/coverage")
				table.insert(dirs, "coverage")

				return dirs
			end
			require("crazy-coverage").setup({
				coverage_dirs = get_coverage_dirs(),
			})
		end,
	},
}
