return {
	{
		"echasnovski/mini.nvim",
		version = false,
	},
	{
		"echasnovski/mini.files",
		version = false,
		config = function()
			require("mini.files").setup()

			vim.keymap.set("n", "<C-n>", ":lua MiniFiles.open()<CR>", {})
		end,
	},
}
