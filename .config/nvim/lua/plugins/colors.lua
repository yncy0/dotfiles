return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "latte",
        transparent_background = true,
        background = { light = "latte" }
      })

      vim.cmd.colorscheme "catppuccin"
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true
      })
      vim.o.background = "light"
      vim.cmd("colorscheme gruvbox")
    end
  }
}
