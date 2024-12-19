return {
	"olivercederborg/poimandres.nvim",

	init = function()
		vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "none" })
		vim.api.nvim_set_hl(0, "LspreferenceRead", { bg = "none" })
		vim.cmd.hi("Visual guibg=#404040")
		vim.cmd.hi("LspReferenceRead guibg=#404040")
		vim.cmd.hi("LspReferenceText  guibg=#404040")
	end,
}
