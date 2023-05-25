local colors = require("catppuccin.palettes.mocha")

require("scrollbar").setup({
    handle = {
        color = colors.surface0,
    },
    marks = {
        Search = { color = colors.peach },
        Error = { color = colors.red },
        Warn = { color = colors.yellow },
        Info = { color = colors.green },
        Hint = { color = colors.teal },
        Misc = { color = colors.lavender },
    }
})
