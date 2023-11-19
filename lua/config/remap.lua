vim.g.mapleader = " "

-- reload the source file
vim.keymap.set("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>")

-- install plugins
vim.keymap.set("n", "<leader>e", ":PlugInstall<CR>")

-- quit the buffer
vim.keymap.set("n", "<leader>q", ":bd<CR>")

-- save the file
vim.keymap.set("n", "zz", ":w<CR>")
vim.keymap.set("n", "zx", ":wq<CR>")

-- open file tree view
vim.keymap.set("n", "<F3>", ":NvimTreeToggle<CR>")

-- shift line(s)
vim.keymap.set("n", "<S-k>", ":m .-2<CR>")
vim.keymap.set("n", "<S-j>", ":m +1<CR>")
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv")

-- insert new line
vim.keymap.set("n", "<Enter>", "o<ESC>")
vim.keymap.set("n", "<S-Enter>", "O<ESC>")

-- navigate between buffers
vim.keymap.set("n", "[b", ":bprevious<CR>", {silent = true})
vim.keymap.set("n", "]b", ":bnext<CR>", {silent = true})
vim.keymap.set("n", "[B", ":bfirst<CR>", {silent = true})
vim.keymap.set("n", "]B", ":blast<CR>", {silent = true})

-- switch between splits using ctrl + {h,j,k,l}
vim.keymap.set("i", "<C-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("i", "<C-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("i", "<C-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("i", "<C-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- switch to normal mode in Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
