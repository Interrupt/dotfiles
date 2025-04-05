return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "OXY2DEV/markview.nvim" },
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "yaml",
        "zig",
        "go",
      },
    },
  },
  {
    "leoluz/nvim-dap-go",
    optional = true,
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "leoluz/nvim-dap-go", -- golang integration, requires delve
    },
    opts = function()
      local dap = require("dap")

      -- configure codelldb adapter
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
          args = { "--port", "${port}" },
        },
      }

      -- setup a debugger config for zig projects
      dap.configurations.zig = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
    end,
  },
}
