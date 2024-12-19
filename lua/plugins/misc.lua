-- Standalone plugins with less than 10 lines of config go here
return {
	{
		"xiyaowong/transparent.nvim",
		config = function()
			opts = {
				exclude_groups = { "CursorLine" },
			}
			require("transparent").setup(opts)
		end,
	},
	{ "danielo515/nvim-treesitter-reason" },
	{
		"crispgm/nvim-tabline",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
	},
	{ "numToStr/Comment.nvim", opts = {} },
	{
		-- autoclose tags
		"windwp/nvim-ts-autotag",
	},
	{
		-- detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			opts = {
				mappings = {
					{ "<leader>c", group = "[C]ode" },
					{ "<leader>c_", hidden = true },
					{ "<leader>d", group = "[D]ocument" },
					{ "<leader>d_", hidden = true },
					{ "<leader>h", group = "Git [H]unk" },
					{ "<leader>h_", hidden = true },
					{ "<leader>r", group = "[R]ename" },
					{ "<leader>r_", hidden = true },
					{ "<leader>s", group = "[S]earch" },
					{ "<leader>s_", hidden = true },
					{ "<leader>t", group = "[T]oggle" },
					{ "<leader>t_", hidden = true },
					{ "<leader>w", group = "[W]orkspace" },
					{ "<leader>w_", hidden = true },
					{ "<leader>h", desc = "Git [H]unk", mode = "v" },
				},

				win = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				},
			}
			require("which-key").setup(opts)
		end,
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- high-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
