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
      win = {
        backdrop = { transparent = false, blend = 30 }, -- make bg opaque
      },
    },
  },
}
