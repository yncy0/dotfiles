return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
          "tailwindcss",
          "ts_ls",
          "vue_ls"
        },
        automatic_installation = true
      })

      vim.lsp.enable({
        'lua_ls',
        'eslint',
        'gdscript',
        'prettier',
        'tailwindcss',
        'ts_ls',
        'vue_ls'
      })

      vim.lsp.config('lua_ls', {
        capabilities = capabilities
      })
      vim.lsp.config('eslint', {
        capabilities = capabilities

      })
      vim.lsp.config('gdscript', {
        capabilities = capabilities
      })
      vim.lsp.config('prettier', {
        capabilities = capabilities
      })
      vim.lsp.config('tailwindcss', {
        capabilities = capabilities
      })
      vim.lsp.config('ts_ls', {
        capabilities = capabilities
      })
      vim.lsp.config('vue_ls', {
        capabilities = capabilities
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition , {})
      vim.keymap.set({ 'n' }, '<leader>ca' , vim.lsp.buf.code_action, {})

    end
  },
}
