return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = false,
      flavour = "macchiato",
      styles = {
        comments = { "italic" },
      },
      custom_highlights = {
        NeoTreeWinSeparator = { -- To re-enable neotree's border
          -- fg = "#11111B",
          -- bg = "#1E1E2E",
          fg = "#181926",
          bg = "#24273A",
        },
      },
    },
    priority = 1000,
    lazy = false,
  },
  -- Configure LazyVim to load the catppuccin theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
      -- colorscheme = "tokyonight-moon",
    },
  },
  -- Turn off inlay hints by default
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  -- tweak the lualine setup a bit
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.theme = "horizon" -- red theme

      -- trim down the right sections
      opts.sections.lualine_x = {
        { "encoding", separator = "" },
        { "filetype", separator = "" },
      }
      opts.sections.lualine_y = {
        { "progress", padding = { left = 1, right = 1 } },
      }
      opts.sections.lualine_z = {
        { "location", padding = { left = 0, right = 1 } },
      }

      -- add the active LSP name, if any
      table.insert(opts.sections.lualine_x, {
        function()
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return ""
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name .. " "
            end
          end
          return ""
        end,
        icon = "",
        color = { fg = "#A6E3A1" },
      })
    end,
  },
  -- Give Neotree a better title bar
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options.show_buffer_close_icons = false
      opts.options.show_close_icon = false
      opts.options.offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          highlight = "NeoTreeTitle",
          text_align = "center",
        },
        {
          filetype = "snacks_layout_box",
        },
      }
    end,
  },
}
