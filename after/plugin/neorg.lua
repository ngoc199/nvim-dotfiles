require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    work = "~/Documents/notes/work",
                    home = "~/Documents/notes/home",
                }
            }
        }
    }
}
