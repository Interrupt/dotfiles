return {
  {
    "vimwiki/vimwiki",
    init = function() end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("render-markdown").setup({
        file_types = { "markdown", "vimwiki" },
      })
    end,
  },
}
