local opt = vim.opt

-- tab width
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

-- highlight search text
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- performance tweaks
opt.cursorline = true
opt.cursorcolumn = false

-- tab title as file name
opt.title = true

-- text width
opt.colorcolumn = "94"

-- support emoji
opt.emoji = true

-- handle yanking in WSL
if vim.fn.has("wsl") == 1 then
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = vim.api.nvim_create_augroup("Yank", { clear = true }),
		callback = function()
			vim.fn.system("clip.exe", vim.fn.getreg('"'))
		end,
	})
end
