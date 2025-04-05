return {
  "folke/noice.nvim",
  opts = {
    presets = {
      lsp_doc_border = true,
      command_palette = false,
    },
    cmdline = {
      format = {
        conceal = false,
      },
    },
    views = {
      cmdline_popup = {
        position = {
          row = 0,
          col = "50%",
        },
        size = {
          width = "50%",
          height = "auto",
        },
      },
      popupmenu = {
        position = {
          row = 4,
          col = "50%",
        },
        size = {
          width = "51%",
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
      },
    },
  },
}
