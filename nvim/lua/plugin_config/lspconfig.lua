local lsp_servers = vim.api.nvim_get_var('lsp_servers')

-- Convert lsp_servers to a table of strings
local server_names = {}
for _, server in ipairs(lsp_servers) do
    table.insert(server_names, server.name)
end

-- Set up mason-lspconfig
require('mason').setup(
    {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        scrollbar = "║",
    }
)

require('mason-lspconfig').setup({
    ensure_installed = server_names,
})

-- LINTERS | FORMATTERS | DAP
local lsp_linters = vim.api.nvim_get_var('lsp_linters')
local lsp_dap = vim.api.nvim_get_var('lsp_dap')
local lsp_formatters = vim.api.nvim_get_var('lsp_formatters')
local all_lsp_tools = {}
for _, lsp_tool in ipairs(lsp_linters) do
    table.insert(all_lsp_tools, lsp_tool)
end
for _, lsp_tool in ipairs(lsp_dap) do
    table.insert(all_lsp_tools, lsp_tool)
end
for _, lsp_tool in ipairs(lsp_formatters) do
    table.insert(all_lsp_tools, lsp_tool)
end

require('mason-tool-installer').setup(
    {
        ensure_installed = all_lsp_tools
    }
)
-- LINTERS | FORMATTERS | DAP


-- LSP SETUP
local on_attach = function(client, bufnr)
    -- Using default Keymaps

    -- xray signature setup
    require "lsp_signature".on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        hint_prefix = " ",
        handler_opts = {
            border = "rounded"
        }
    }, bufnr)
end

-- Try to auto-setup some capabilities
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(lsp_servers) do
    require('lspconfig')[lsp.name].setup {
        settings = lsp_servers[lsp.settings],
        on_attach = on_attach,
        capabilities = lsp_capabilities,
    }

    local signs = {
        Error = " ", Warn = " ", Hint = " ", Info = " "
    }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {
            text = icon, texthl = hl, numhl = hl
        })
    end
end

-- LINTER SETUP

-- Use null-ls to help with making using linters way easier
local null_ls = require('null-ls')

-- Make some fixups to staticcheck
local staticcheck_builtin = null_ls.builtins.diagnostics.staticcheck
-- staticcheck_builtin._opts.command = "/home/ccuddigan/go/bin/staticcheck"

-- Make sure staticcheck does not tag everything as an error
staticcheck_builtin._opts.args = {
    "-f",
    "json",
    '-fail',
    'none',
    "./...",
}

null_ls.setup({
    sources = {
        staticcheck_builtin,
    },
})
