return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    enable_git_status = true,
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added = "✚", -- NOTE: you can set any of these to an empty string to not show them
          deleted = "✖",
          modified = "",
          renamed = "r",
          -- Status type
          untracked = "?",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
        align = "right",
      },
    },
  },
}
