vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "File Explorer", highlight = "NvimTreeFolderName" } },
        separator_style = "slant",
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get(), -- required to set proper bg colors
}

-- vim.api.nvim_set_keymap("n", "<leader>b", "require('bufferline').go_to_buffer(vim.fn.input('Buffer: '))<CR>", { noremap = true, silent = true })
