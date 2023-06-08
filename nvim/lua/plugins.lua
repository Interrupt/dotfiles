-- Install package manager
--    https://github.com/folke/lazy.nvimplug
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
        -- LSP Support
        {
            'neovim/nvim-lspconfig',
            event = { "BufReadPre", "BufNewFile" },
        }, -- Required
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim',         lazy = false }, -- For installing language servers
        { 'WhoIsSethDaniel/mason-tool-installer.nvim', lazy = false }, -- For installing dap, linters, formatters, etc.

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            event = { "InsertEnter", "CmdlineEnter" },
            dependencies = {
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-nvim-lua',
                'hrsh7th/cmp-nvim-lsp',
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip',
            }
        },
        { 'rafamadriz/friendly-snippets',    lazy = false },
        { 'onsails/lspkind.nvim',            lazy = false },
        { "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },
        { "nvim-tree/nvim-tree.lua",         lazy = false },
        {
            'nvim-telescope/telescope.nvim',
            version = '*',
            dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-ui-select.nvim',
                'kdheepak/lazygit.nvim',
                'voldikss/vim-floaterm',
                'debugloop/telescope-undo.nvim',
            }
        },
        {
            'folke/which-key.nvim',
            tag = 'v1.2.2',
            lazy = false
        },
        { 'nvim-lualine/lualine.nvim',           event = "VeryLazy" },
        { 'lukas-reineke/indent-blankline.nvim', lazy = false },
        { 'numToStr/Comment.nvim',               lazy = false },
        { 'ggandor/leap.nvim',                   lazy = false },
        { "akinsho/bufferline.nvim",             dependencies = "nvim-tree/nvim-web-devicons", lazy = false },
        { 'windwp/nvim-autopairs',               lazy = false },
        { 'lewis6991/gitsigns.nvim',             event = "BufEnter" },
        { 'David-Kunz/markid',                   lazy = false }, -- highlight same-name identifiers with the same colors
        {
            "folke/zen-mode.nvim",
            cmd = "ZenMode",
            config = function()
                vim.api.nvim_set_hl(0, 'ZenBg', { ctermbg = 0 })
            end
        },
        {
            "nmac427/guess-indent.nvim",
            config = function()
                require("guess-indent").setup()
            end
        },
        { "mg979/vim-visual-multi",      lazy = false }, -- better multi-line editing

        --- Themes
        { 'projekt0n/github-nvim-theme', tag = 'v0.0.7',      lazy = false },
        { 'rose-pine/neovim',            name = 'rose-pine',  lazy = false },
        { 'rebelot/kanagawa.nvim',       name = 'kanagawa',   lazy = false },
        { 'catppuccin/nvim',             name = 'catppuccin', lazy = false },
        { 'folke/tokyonight.nvim',       lazy = false },
        { 'navarasu/onedark.nvim',       lazy = false },
        { 'tiagovla/tokyodark.nvim',     lazy = false },

        --
        { 'folke/twilight.nvim',         lazy = false },
        {
            'folke/todo-comments.nvim',
            lazy = false,
            dependencies = 'nvim-lua/plenary.nvim'
        },
        { 'folke/zen-mode.nvim',                 lazy = false },
        {
            'ellisonleao/glow.nvim',
            lazy = false,
            cmd = "Glow",
            opts = {
                glow_path = "C:\\Users\\Rohit\\scoop\\shims\\glow.exe",
            },
            enabled = false,
        },
        { 'mcauley-penney/tidy.nvim',            lazy = false },
        { 'terrortylor/nvim-comment',            lazy = false },
        { 'lukas-reineke/indent-blankline.nvim', lazy = false },
        { 'akinsho/toggleterm.nvim',             lazy = false },
        { 'j-hui/fidget.nvim',                   event = "LspAttach" },
        { 'glepnir/dashboard-nvim',              lazy = false },
        {
            'rohit-kumar-j/cmake-tools.nvim',
            dependencies = {
                'nvim-tree/nvim-web-devicons',
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-ui-select.nvim',
                'mfussenegger/nvim-dap',
            },
            lazy = false
        },

        -- Organization with `.norg` files
        {
            "nvim-neorg/neorg",
            build = ":Neorg sync-parsers",
            opts = {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.norg.concealer"] = {
                        config = {
                            folds = true,
                            icon_preset = 'varied', -- basic, diamond, varied
                        },
                    },                              -- Adds pretty icons to your documents
                    -- ["core.norg.dirman"] = {      -- Manages Neorg workspaces
                    --     config = {
                    --         workspaces = {
                    --             notes = "~/notes",
                    --         },
                    --     },
                    -- },
                },
            },
            enabled = false,
            dependencies = { { "nvim-lua/plenary.nvim" } },
        },

        -- Go IDE! Also mixing in some signature helpers and linters
        {
            "fatih/vim-go",
            build = ":GoInstallBinaries",
            lazy  = false,
        },
        {
            'ray-x/lsp_signature.nvim', -- function signatures as you type!
            event = { "InsertEnter" },
            opts = {
                floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
                hint_scheme = "Comment",               -- highlight group for the virtual text
                max_width = 120,                       -- default was only 80
            },
            -- configured in lspconfig.lua!
        },
        { 'jose-elias-alvarez/null-ls.nvim', lazy = false, },
        {
            'kosayoda/nvim-lightbulb', -- code actions lightbulb icon
            lazy = false,
            config = function()
                require('nvim-lightbulb').setup({
                    autocmd = { enabled = true },
                })

                -- better icon
                vim.fn.sign_define("LightBulbSign", { text = "", texthl = "LspDiagnosticsDefaultInformation" })
            end
        },
        {
            'ahmedkhalf/project.nvim',
            lazy = false,
            config = function()
                require("project_nvim").setup {}
                require('telescope').load_extension('projects')
            end
        },

        -- Wiki!
        {
            'vimwiki/vimwiki',
            lazy = false,
        },

        -- Scrollbar
        {
            "petertriho/nvim-scrollbar",
            event = "BufReadPost",
            opts = {
                set_highlights = false,
                excluded_filetypes = {
                    "prompt",
                    "TelescopePrompt",
                    "noice",
                    "NvimTree",
                    "dashboard",
                    "alpha",
                    "lazy",
                    "mason",
                    "DressingInput",
                    "",
                },
                handlers = {
                    gitsigns = true,
                },
            },
            config = function()
                require('plugin_config.scrollbar')
            end,
        },

        -- Clipboard
        {
            "AckslD/nvim-neoclip.lua",
            requires = {
                -- you'll need at least one of these
                { 'nvim-telescope/telescope.nvim' },
                -- {'ibhagwan/fzf-lua'},
            },
            config = function()
                require('neoclip').setup()
            end,
        },

    },
    { ui = { border = 'rounded' } }
)
