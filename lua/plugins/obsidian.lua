return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- Optional
		"hrsh7th /nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter",
	},
	config = function()
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/Null/",
				},
			},
		}
		require("obsidian").setup(opts)
	end,
}
