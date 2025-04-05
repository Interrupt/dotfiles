return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "vimwiki" },
        icon_provider = "mini", -- "mini" or "devicons"
      },
    },
  },
  -- Following dependencies are comming from lazyvim markdown extra
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
}
