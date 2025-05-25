return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },  
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "eslint",
          "prettier",
          "tailwindcss",
          "ts_ls",
          "vue_ls"
        }
      })

      vim.lsp.enable('lua_ls')
      vim.lsp.enable('eslint' )
      vim.lsp.enable('gdscript' )
      vim.lsp.enable('prettier')
      vim.lsp.enable('tailwindcss' )
      vim.lsp.enable('ts_ls' )
      vim.lsp.enable('vue_ls' )


      vim.lsp.config('lua_ls', {})
      vim.lsp.config('eslint', {})
      vim.lsp.config('gdscript', {})
      vim.lsp.config('prettier', {})
      vim.lsp.config('tailwindcss', {})
      vim.lsp.config('ts_ls', {})
      vim.lsp.config('vue_ls', {})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition , {})
      vim.keymap.set({ 'n' }, '<leader>ca' , vim.lsp.buf.code_action, {})


    end
  },
}
