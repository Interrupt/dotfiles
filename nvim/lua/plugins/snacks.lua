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
    dashboard = {
      preset = {
        header = table.concat({
          [[⠀⠀⠀⣾⣿⣿⣿⣿⣦⡀⢸⣿⣿⣿⣿⠃⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢸⣿⣿⣿⣿⡄⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⡿⢁⣿⣿⣿⣿⡇⠀⣸⣿⣿⣿⣿⣷⣄⠀⢀⣴⣿⣿⣿⣿⡟]],
          [[⠀⠀⠀⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠟⠸⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠀⠀⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠇⠘⠿⠿⠿⠿⠇⠀⠀⠀⠰⠿⠿⠿⠿⠿⠟⠀⠸⠿⠿⠿⠿⠀⠀⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠇]],
          [[⠀⠀⣴⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⠀⢠⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⡆⠀⣰⣶⣶⣶⡶⠀⠀⠀⣶⣶⣶⣶⡆⠀⣶⣶⣶⣶⣶⠀⢀⣶⣶⣶⣶⣶⡶⠀⠀⠀⣶⣶⣶⣶⡆⠀⢰⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⠀]],
          [[⠀⢰⣿⣿⣿⣿⠉⠻⣿⣿⣿⣿⣿⡟⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⣿⣿⣿⣿⠇⠀⠀⢸⣿⣿⣿⣿⠀⠀⢸⣿⣿⣿⣿⣧⣾⣿⣿⣿⣿⠟⠁⠀⠀⢸⣿⣿⣿⣿⠁⠀⣿⣿⣿⣿⠇⠙⢿⣿⠟⢹⣿⣿⣿⣿⡇⠀]],
          [[⠀⣾⣿⣿⣿⡟⠀⠀⢸⣿⣿⣿⣿⠃⢠⣿⣿⣿⣿⡿⠉⠉⠉⠉⠉⠉⠀⢸⣿⣿⣿⡿⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⢸⣿⣿⣿⣿⠀⠀⠈⠁⠀⣼⣿⣿⣿⡿⠀⠀]],
          [[⢠⣿⣿⣿⣿⠁⠀⠀⣿⣿⣿⣿⡿⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢸⣿⣿⣿⣷⣶⣶⣾⣿⣿⣿⡟⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⣸⣿⣿⣿⣿⠁⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⢰⣿⣿⣿⣿⠇⠀⠀]],
          [[⣼⣿⣿⣿⡏⠀⠀⢸⣿⣿⣿⣿⡇⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡟⠀⢸⣿⣿⣿⣿⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⠀⠀⠀]],
        }, "\n"),
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", padding = 1 },
        { title = "Recent Files", section = "recent_files", padding = 1 },
        { title = "Projects", section = "projects", padding = 1 },
        { section = "startup" },
      },
    },
  },
}
