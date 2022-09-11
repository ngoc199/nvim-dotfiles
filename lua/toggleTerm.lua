require("toggleterm").setup{
    size = 10,
    open_mapping = [[<F4>]],
    hide_numbers = true,
    windbar = {
        enable = false,
        name_formatter = function(term)
            return term.name
        end
    },
}
