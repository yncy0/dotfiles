-- A collection of plugins in Neovim
-- @see https://github.com/echasnovski/mini.nvim
--
-- @return {}

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
    enabled = false,
		config = function()
			require("mini.files").setup()

			vim.keymap.set("n", "<leader>n", ":lua MiniFiles.open()<CR>", {})
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
	--mini.comments
	{
		"echasnovski/mini.comment",
		version = false,
	},
}
