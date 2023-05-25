vim.opt.termguicolors = true

local utils = require("bufferline.utils")
local config = require("bufferline.config")

require("bufferline").setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "Folders",
                -- highlight = "NvimTreeFolderName",
            } },
        separator_style = "slant",
        show_buffer_close_icons = false,
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get(), -- required to set proper bg colors
}

-- vim.api.nvim_set_keymap("n", "<leader>b", "require('bufferline').go_to_buffer(vim.fn.input('Buffer: '))<CR>", { noremap = true, silent = true })
