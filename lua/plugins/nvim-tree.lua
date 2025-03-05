return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
      "<F3>",
      function()
        vim.cmd([[NvimTreeToggle]])
      end
      }
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
}
