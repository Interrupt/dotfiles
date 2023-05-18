require("catppuccin").setup({
    term_colors = true,
    -- integrations = {
    --     bufferline = true,
    -- }
})

-- Make the terminal use a preset background color
vim.api.nvim_set_hl(0, 'TerminalWindow', { bg = '#11111b' }) -- Use the catpuccin mocha theme 'Crust' color
vim.api.nvim_create_augroup("_terminal", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    command = "setlocal winhighlight=Normal:TerminalWindow",
    group = "_terminal",
})

-- Give nvim-tree a better separator
--vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { bg = '#1e1e2e', fg = '#313244' })
vim.opt.fillchars = {
    -- vert = "▕",
    vert = "▏",
}
