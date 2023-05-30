-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
--
local vim = vim
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Common remaps
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = false })

vim.api.nvim_set_keymap('n', '<S-Up>', '<cmd>resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', '<cmd>resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Left>', '<cmd>vertical resize +2<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Right>', '<cmd>vertical resize -2<CR>', { silent = true })

-- Better terminal navigation
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>h', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>j', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>l', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

-- Stay in visual mode after indenting
vim.api.nvim_set_keymap('v', '<', "<gv", { silent = true })
vim.api.nvim_set_keymap('v', '>', ">gv", { silent = true })

-- Moving visual mode selections up and down
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move between tabs
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })


-- Fix common typos
vim.cmd([[
    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qall qall
]])


-- [[ Setting options ]]
-- See `:help vim.o`

-- Set a cursor gutter
vim.o.scrolloff = 8

-- Set highlight on search
vim.o.hlsearch = false
vim.o.splitright = true
vim.o.splitbelow = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = false

-- Enable mouse mode
vim.o.mouse = 'a'

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Hide command bar when not in use
vim.o.cmdheight = 0

-- Toggle folds with 'zc' in normal mode
function toggle_fold()
    local foldlevel = vim.fn.foldlevel('.')
    if foldlevel == 0 then
        vim.cmd('normal! zc')
    else
        vim.cmd('normal! za')
    end
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "normal zx",
})
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldnestmax = 10
vim.opt.foldlevel = 99

vim.api.nvim_set_keymap('n', 'zc', ':lua toggle_fold()<CR>', { noremap = true, silent = true })



-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.g.mkdp_auto_start = 1
vim.g.mkdp_browser = 'brave' -- markdown preview
vim.g.mkdp_theme = 'light'   -- markdown preview

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Open terminals in insert mode
vim.api.nvim_create_autocmd('TermOpen', {
    pattern = 'term://*',
    callback = function()
        vim.cmd.startinsert()
    end
})

-- Disable line numbers in terminals
vim.api.nvim_create_autocmd('TermOpen', {
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
})

-- Close nvim-tree if it was the last thing open in a tab
--[[
local function tab_win_closed(winnr)
    local api = require "nvim-tree.api"
    local tabnr = vim.api.nvim_win_get_tabpage(winnr)
    local bufnr = vim.api.nvim_win_get_buf(winnr)
    local buf_info = vim.fn.getbufinfo(bufnr)[1]
    local tab_wins = vim.tbl_filter(function(w) return w ~= winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
    local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
    if buf_info.name:match(".*NvimTree_%d*$") then -- close buffer was nvim tree
        -- Close all nvim tree on :q
        if not vim.tbl_isempty(tab_bufs) then    -- and was not the last window (not closed automatically by code below)
            api.tree.close()
        end
    else                                                  -- else closed buffer was normal buffer
        if #tab_bufs == 1 then                            -- if there is only 1 buffer left in the tab
            local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
            if last_buf_info.name:match(".*NvimTree_%d*$") then -- and that buffer is nvim tree
                vim.schedule(function()
                    if #vim.api.nvim_list_wins() == 1 then -- if its the last buffer in vim
                        vim.cmd "quit"                    -- then close all of vim
                    else                                  -- else there are more tabs open
                        vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
                    end
                end)
            end
        end
    end
end

vim.api.nvim_create_autocmd("WinClosed", {
    callback = function()
        local winnr = tonumber(vim.fn.expand("<amatch>"))
        vim.schedule_wrap(tab_win_closed(winnr))
    end,
    nested = true
})
]]
--
