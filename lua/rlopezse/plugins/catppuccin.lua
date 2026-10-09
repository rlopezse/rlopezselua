return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        no_bold = true,
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },
}
