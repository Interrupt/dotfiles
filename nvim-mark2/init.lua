-- Globals
vim.api.nvim_set_var('debug', false)                    -- For debugging o/p
vim.api.nvim_set_var('copy_to_single_clipboard', false) -- Copy with y . Only tested to win32 and wsl

-------------------------------------------------
-- Global LSP Servers
vim.api.nvim_set_var('lsp_servers',
    {
        {
            name = 'lua_ls',
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                },
            },
        },
        {
            name = 'gopls',
            cmd = { "gopls", "serve" },
            filetypes = { "go", "gomod" },
            --root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    --staticcheck = true,
                },
            },
        },
        -- Add more LSP Servers here as needed!
    }
)

-- Global LSP Linters
vim.api.nvim_set_var('lsp_linters',
    {
        --'staticcheck', -- go
        'revive', -- go
        --'golangci-lint', -- go
        --'luacheck', -- lua
        --'flake8',   -- python
        --'cpplint',  -- C++
        --'jsonlint', -- json
        --'textlint', -- markdown
    }
)


-- Global LSP DAP
vim.api.nvim_set_var('lsp_dap',
    {
        -- 'debugpy', -- python
        -- 'codelldb', -- C++
        -- 'cpptools', -- C++
        -- No dap for json
        -- No dap for markdown
        -- No dap for reStructuredText
    }
)

-- Global LSP Formatters
vim.api.nvim_set_var('lsp_formatters',
    {
        --'stylua', -- lua
        --'black',        -- python
        --'clang-format', -- C++, C
        --'fixjson',      --json
        --'prettierd',    -- markdown
        -- No formatter for reStructuredText
    }
)

-------------------------------------------------
-- Global Treesitter Servers
vim.api.nvim_set_var('treesitter_servers',
    {
        'lua',
        'c',
        'cpp',
        'cmake',
        'norg',
        'vim', -- This solves syntax highlighting in {.lua} files
        'go',
    }
)

-------------------------------------------------
-- - TODO : WhichKey Tests -> LSP:l, BUFFERS:b, DAP:d

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]] -- Auto format on save
-- vim.opt.foldmethod = 'expr'                                 -- Code Folding
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'             -- Code Folding

require('os_config')
require('plugins')
require('settings')

require('plugin_config.nvim-tree')
require('plugin_config.nvim-treesitter')
require('plugin_config.telescope')
require('plugin_config.twilight')
require('plugin_config.leap')
require('plugin_config.lazygit')
require('plugin_config.gitsigns')
require('plugin_config.autopairs')
require('plugin_config.bufferline')
require('plugin_config.nvim-comment')
require('plugin_config.lualine')
require('plugin_config.zen-mode')
require('plugin_config.indent-blankline')
require('plugin_config.toggleterm')
require('plugin_config.fidget')
require('plugin_config.comment')
require('plugin_config.cmake-tools')
require('plugin_config.lspconfig')
require('plugin_config.nvim-cmp')
require('plugin_config.dashboard')
require('plugin_config.tidy')
require('plugin_config.todo-comments')
-- require('plugin_config.neorg') -- TODO: crashing?

-- Call which key last
require('plugin_config.which-key')
require('plugin_config.markid')


-- Themes
require('plugin_config.themes.catppuccin')
vim.cmd.colorscheme('catppuccin')

-- Make window borders look cleaner
vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { bg = '#1e1e2e', fg = '#1e1e2e' })
vim.opt.fillchars = {
    vertright = ' ',
}

-- Enable global statusbar
vim.opt.laststatus = 3

-- Put the filename as a winbar
vim.opt.winbar = "%=%f  "
vim.api.nvim_set_hl(0, "WinBar", { fg = '#89b4fa' })
