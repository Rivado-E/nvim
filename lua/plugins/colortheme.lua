return {
	"Rivado-e/vivid",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("my_vivid")
		disable_background = true
		transparent = true -- removes the background
	end,
}
