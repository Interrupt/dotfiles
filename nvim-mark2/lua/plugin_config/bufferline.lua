vim.opt.termguicolors = true

local utils = require("bufferline.utils")
local config = require("bufferline.config")

require("bufferline").setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "File Explorer", highlight = "NvimTreeFolderName" } },
        separator_style = "slant",
        custom_areas = {
            left = function()
                local item_count = config:is_tabline() and utils.get_tab_count() or utils.get_buf_count()
                if item_count > 0 then
                    return { { text = "▕", bg = '#1e1e2e', fg = '#313244' } }
                else
                    return
                end
            end
            ,
        },
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get(), -- required to set proper bg colors
}

-- vim.api.nvim_set_keymap("n", "<leader>b", "require('bufferline').go_to_buffer(vim.fn.input('Buffer: '))<CR>", { noremap = true, silent = true })
