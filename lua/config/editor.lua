vim.opt.number = true -- show current line number
vim.opt.relativenumber = true -- show relative number
vim.opt.mouse = a -- enable mouse scrolling
vim.opt.scrolloff = 8

-- tab width
vim.opt.tabstop = 4 
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- tab key actions
vim.cmd('set expandtab smarttab')

-- highlight search text
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- wrap long lines to the width set by tw
vim.cmd('set wrap breakindent linebreak nolist')

-- text encoding
vim.cmd('set encoding=utf-8')

-- tab title as file name
vim.opt.title = true

vim.opt.conceallevel = 2 -- set this so we won't break indenation plugin

vim.opt.tw = 0 -- auto wrap lines that are longer than that

vim.opt.emoji = true -- support emoji

vim.opt.history = 1000 -- history limit
vim.opt.showtabline = 0 -- always show tab line

if vim.fn.has('wsl') == 1 then
    vim.api.nvim_create_autocmd('TextYankPost', {
        group = vim.api.nvim_create_augroup('Yank', { clear = true }),
        callback = function()
            vim.fn.system('clip.exe', vim.fn.getreg('"'))
        end,
    })
end

-- nertrw
vim.g.netrw_liststyle = 0

-- performance tweaks
vim.opt.cursorline = true
vim.cmd('set nocursorcolumn')
vim.opt.scrolljump = 5
vim.opt.lazyredraw = true
vim.opt.redrawtime = 10000
vim.opt.synmaxcol = 180
vim.opt.re = 2
vim.opt.updatetime = 100

-- toggle transparency
local is_transparent = 0
function Toggle_transparent()
	if is_transparent == 0 then
		vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
		vim.cmd('hi NormalNC guibg=NONE ctermbg=NONE')
		vim.cmd('hi NormalSB guibg=NONE ctermbg=NONE')
		vim.cmd('hi LineNr guibg=none ctermbg=none')
		vim.cmd('hi Folded guibg=none ctermbg=none')
		vim.cmd('hi NonText guibg=none ctermbg=none')
		vim.cmd('hi SpecialKey guibg=none ctermbg=none')
		vim.cmd('hi VertSplit guibg=none ctermbg=none')
		vim.cmd('hi SignColumn guibg=none ctermbg=none')
		vim.cmd('hi EndOfBuffer guibg=none ctermbg=none')
		is_transparent = 1
	else
		vim.cmd('set background=dark')
		is_transparent = 0
	end
end

vim.keymap.set("n", "<C-t>", Toggle_transparent)
