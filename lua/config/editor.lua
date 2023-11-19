vim.opt.number = true -- show current line number
vim.opt.relativenumber = true -- show relative number
vim.opt.mouse = a -- enable mouse scrolling
vim.opt.scrolloff = 8
vim.opt.laststatus = 2 -- always show status line

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

-- tab title as file name (comment this because it causes glitch issue on gnome-terminal on Fedora 37)
-- vim.opt.title = true

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

-- disable nertrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- performance tweaks
vim.opt.cursorline = true
vim.cmd('set nocursorcolumn')
vim.opt.scrolljump = 5
vim.opt.lazyredraw = true
vim.opt.redrawtime = 10000
vim.opt.synmaxcol = 180
vim.opt.re = 2
vim.opt.updatetime = 100
