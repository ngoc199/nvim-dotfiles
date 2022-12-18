local prettier = require('prettier')

prettier.setup({
  bin = 'prettierd', -- or `prettier`
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

vim.keymap.set("n", "<leader>fm", vim.cmd('Prettier'))