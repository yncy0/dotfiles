return {
  -- mini.nvim
  {
    "echasnovski/mini.nvim",
    version = false,
  },
  -- mini.files
  {
    "echasnovski/mini.files",
    version = false,
    config = function()
      require("mini.files").setup()

      vim.keymap.set("n", "<C-n>", ":lua MiniFiles.open()<CR>", {})
    end,
  },
  -- mini.icons
  {
    "echasnovski/mini.icons",
    version = false,
    config = function()
      require("mini.icons").setup({
        style = "glyph",
      })
    end,
  },
  -- mini.completion
  {
    "echasnovski/mini.completion",
    lazy = true,
    version = false,
    config = function()
      require("mini.completion").setup()
    end,
  },
  --mini.comments
  {
    "echasnovski/mini.comment",
    version = false
  },
  --mini.pairs
  {
    'echasnovski/mini.pairs',
    version = false,
    config = function ()
     require("mini.pairs").setup()
    end
  }
}
