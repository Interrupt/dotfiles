-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Make the terminal use a preset background color to match catppuccin
vim.api.nvim_set_hl(0, "TerminalWindow", { bg = "#181926" }) -- Use the catpuccin macchiato theme 'Crust' color

-- Make neo-tree's title use a dark background
vim.api.nvim_set_hl(0, "NeoTreeTitle", { fg = "#89B4FA", bg = "#181825" })
vim.api.nvim_set_hl(1, "NeoTreeWinSeparator", { fg = "#89B4FA", bg = "#181825" })

-- Only enable folding when supported
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt.foldmethod = "syntax"
    end
  end,
})
