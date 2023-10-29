require('github-theme').setup({
  options = {
    hide_nc_statusline = false,
    styles = {
        functions = 'italic',
        comments = 'italic',
        keywords = 'bold',
        types = 'italic,bold',
    }
  }
})
vim.cmd('colorscheme github_light')
