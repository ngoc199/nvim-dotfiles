require("toggleterm").setup{
    size = 20,
    hide_numbers = true,
    windbar = {
        enable = false,
        name_formatter = function(term)
            return term.name
        end
    },
}
