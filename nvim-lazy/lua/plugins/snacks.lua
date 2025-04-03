return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      win = {
        wo = {
          winhighlight = "Normal:TerminalWindow,WinBar:NeoTreeTitle", -- use our darker background
          winbar = " Terminal", -- simple winbar
        },
      },
    },
    zen = {
      win = { backdrop = { transparent = false, blend = 90 } }, -- make bg opaque
    },
    picker = {
      layout = {
        layout = {
          backdrop = false, -- turn off background dimming
        },
      },
    },
  },
}
