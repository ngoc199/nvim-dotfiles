local formatter = require("formatter")

formatter.setup(
  {
    logging = true,
    filetype = {
      typescriptreact = {
        -- prettierd
        function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      typescript = {
        -- prettierd
        function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
        -- linter
        -- function()
        --   return {
        --     exe = "eslint",
        --     args = {
        --       "--stdin-filename",
        --       vim.api.nvim_buf_get_name(0),
        --       "--fix",
        --       "--cache"
        --     },
        --     stdin = false
        --   }
        -- end
      },
      javascript = {
        -- prettierd
        function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      javascriptreact = {
        -- prettierd
        function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      json = {
        -- prettierd
        function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

vim.keymap.set("n", "<leader>fm", vim.cmd("Format"))
vim.keymap.set("n", "<leader>fM", vim.cmd("FormatWrite"))
