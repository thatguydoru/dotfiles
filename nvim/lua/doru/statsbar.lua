local ctp_feline = require('catppuccin.groups.integrations.feline')

ctp_feline.setup({
    assets = {
        right_separator = "",
        left_separator = ""
    }
})

require("feline").setup({
	components = ctp_feline.get(),
})
