local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup{
    pickers = {
        find_files = {
            hidden = true,
        }
    },
	defaults = {
        file_ignore_patterns = { ".git/" },
		mappings = {
			n = {
				["q"] = actions.close
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			}
		},
	},
}

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<C-p>", builtin.git_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)

