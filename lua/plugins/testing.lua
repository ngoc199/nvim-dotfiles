return {
	{
		"rcasia/neotest-java",
		ft = "java",
		dependencies = {
			"mfussenegger/nvim-jdtls",
			"mfussenegger/nvim-dap", -- for debugging (optional)
			"rcarriga/nvim-dap-ui", -- recommended
			"theHamsta/nvim-dap-virtual-text", -- recommended
		},
	},
	{
		"marilari88/neotest-vitest",
		ft = { "ts", "js" },
	},
	{
		"nsidorenco/neotest-vstest",
		ft = "cs",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"rcasia/neotest-java",
			"marilari88/neotest-vitest",
			"nsidorenco/neotest-vstest",
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
}
