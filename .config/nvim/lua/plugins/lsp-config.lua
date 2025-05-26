return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "eslint",
          "tailwindcss",
          "ts_ls",
          "vue_ls",
        },
        automatic_installation = true,
      })

      vim.lsp.enable({'vue_ls', 'ts_ls'})

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })
      vim.lsp.config("eslint", {
        capabilities = capabilities,
      })
      vim.lsp.config("gdscript", {
        capabilities = capabilities,
      })
      vim.lsp.config("prettier", {
        capabilities = capabilities,
      })
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
      })
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("vue_ls", {
        capabilities = capabilities,
      })
      vim.lsp.config("vuels", {
        capabilities = capabilities,
      })
      --      vim.api.nvim_create_autocmd("LspAttach", {
      --        group = vim.api.nvim_create_augroup("my.lsp", {}),
      --        callback = function(args)
      --          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      --          if
      --              not client:supports_method("textDocument/willSaveWaitUntil")
      --              and client:supports_method("textDocument/formatting")
      --          then
      --            vim.api.nvim_create_autocmd("BufWritePre", {
      --              group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
      --              buffer = args.buf,
      --              callback = function()
      --                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
      --              end,
      --            })
      --          end
      --        end,
      --      })
      vim.diagnostic.config({
        virtual_text = true, -- shows inline errors
        signs = true,    -- signs in sign column
        underline = true, -- underlines error lines
        update_in_insert = false,
        severity_sort = true,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
