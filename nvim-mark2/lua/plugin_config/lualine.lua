local lualine = require("lualine")

local cmake = require("cmake-tools")
local icons = require("plugin_config.icons")

-- Credited to [evil_lualine](https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua)
local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local colors = {
    catppuccin_mocha = {
        bg       = "#1E1E2E",
        fg       = "#CDD6F4",
        yellow   = "#F9E2AF",
        cyan     = "#7fdbca",
        darkblue = "#89B4FA",
        green    = "#A6E3A1",
        orange   = "#e3d18a",
        violet   = "#a9a1e1",
        magenta  = "#ae81ff",
        blue     = "#89B4FA",
        red      = "#F38BA8",
    }
}

colors = colors.catppuccin_mocha;

local config = {
    options = {
        icons_enabled = true,
        theme = 'horizon',
        -- section_separators = '',
        component_separators = '|',
        disabled_filetypes = { "alpha", "dashboard", "Outline" },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {
        "nvim-tree"
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end


ins_right {
    -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = { fg = colors.green },
}


-- Now don't forget to initialize lualine
lualine.setup(config)
