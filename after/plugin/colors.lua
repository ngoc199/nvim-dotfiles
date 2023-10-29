require('github-theme').setup({
    styles = {
        functions = "italic",
    },
    darken = {
        sidebars = {"qf", "vista_kind", "terminal", "packer"},
    }
})

require('lualine').setup()

vim.cmd('colorscheme github_light')
