-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Split window
-- keymap.set("n", "ss", ":split<Return>", opts)
-- keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Resize window with Shift+arrow keys
keymap.set("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Moving visual mode selections up and down with Ctrl
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- dap debugger mappings
keymap.set({ "n", "v" }, "<F3>", "<cmd>lua require('dapui').toggle()<CR>", { silent = true, desc = "DAP toggle UI" })
keymap.set({ "n", "v" }, "<F4>", "<cmd>lua require('dap').pause()<CR>", { silent = true, desc = "DAP pause (thread)" })
keymap.set({ "n", "v" }, "<F5>", "<cmd>lua require('dap').continue()<CR>", { silent = true, desc = "DAP launch" })
keymap.set({ "n", "v" }, "<F6>", "<cmd>lua require('dap').step_into()<CR>", { silent = true, desc = "DAP step into" })
keymap.set({ "n", "v" }, "<F7>", "<cmd>lua require('dap').step_over()<CR>", { silent = true, desc = "DAP step over" })
keymap.set({ "n", "v" }, "<F8>", "<cmd>lua require('dap').step_out()<CR>", { silent = true, desc = "DAP step out" })
keymap.set({ "n", "v" }, "<F9>", "<cmd>lua require('dap').step_back()<CR>", { silent = true, desc = "DAP step back" })

-- dashboard
keymap.set({ "n" }, "<leader>;", "<cmd>lua Snacks.dashboard()<CR>", { desc = "Dashboard" })

-- Set some new which-key groups
local wk = require("which-key")
local mappings = {
  -- Vimwiki
  { "<leader>W", group = "Vimwiki" },
  { "<leader>Wi", "<cmd>:VimwikiIndex<CR>", desc = "Open Index" },
  { "<leader>Wn", "<cmd>:VimwikiNextLink<CR>", desc = "Next Link" },
  { "<leader>Wp", "<cmd>:VimwikiPrevLink<CR>", desc = "Prevous Link" },
}

wk.add(mappings)
