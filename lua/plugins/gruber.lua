return {
	"blazkowolf/gruber-darker.nvim",
	priority = 1000,

	config = function()
		require("gruber-darker").setup({
			transparent = true, -- removes the background
			italic = {
				strings = false,
			},
			underline = false, -- disables underline fonts
			-- bold = false, -- disables bold fonts
		})
	end,
}
