-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local vim = vim

vim.g.snacks_animate = false -- Turn off animations!
vim.g.lazyvim_cmp = "nvimp-cmp" -- Use cmp for completion
vim.o.scrolloff = 8 -- Set a bigger cursor gutter
vim.o.relativenumber = false -- Relative line numbers

-- switch vimwiki to markdown files
vim.g.vimwiki_list = {
  {
    -- path = "~/vimwiki",
    path = "~/Dropbox (Maestral)/Notes/vimwiki", -- sync in dropbox
    syntax = "markdown",
    ext = ".md",
  },
}

-- but not all markdown files are vimwiki
vim.g.vimwiki_global_ext = 0

-- let vimwiki files render as markdown
vim.treesitter.language.register("markdown", "vimwiki")
