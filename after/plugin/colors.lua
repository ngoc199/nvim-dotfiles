require('nightfox').setup({
    options = {
        hide_nc_statusline = false,
        hide_end_of_buffer = false,
        styles = {
            functions = 'italic',
            comments = 'italic',
            keywords = 'bold',
            types = 'italic,bold',
        }
    }
})
vim.cmd('colorscheme dayfox')
