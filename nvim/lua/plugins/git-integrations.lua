return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", {})
			vim.keymap.set("n", "<leader>go", ":GBrowse<CR>", {})
		end,
	},
	{
		"tpope/vim-rhubarb",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>glb", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
}
