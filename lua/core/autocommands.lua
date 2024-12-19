vim.diagnostic.config({ underline = false, update_in_insert = true, virtual_text = false })


-- yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- yank highlight
vim.api.nvim_create_autocmd("ColorScheme", {
	desc = "apply colorscheme hi tweaks",
	callback = function()
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "Fidget", { bg = "none" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "#252525"})



		vim.cmd.hi("Visual guibg=#404040")
		vim.cmd.hi("LspReferenceRead guibg=#404040")
		vim.cmd.hi("LspReferenceText  guibg=#404040")
		vim.cmd.hi("LspReferenceWrite  guibg=#404040")
	end,
})

vim.filetype.add({
	extension = {
		re = "reason", -- Sets the filetype for .re files to Reason
	},
})

-- local function rojo_project()
-- 	return vim.fs.root(0, function(name)
-- 		return name:match(".+%.project%.json$")
-- 	end)
-- end
--
-- -- [[ Luau filetype detection ]]
-- -- Automatically recognise .lua as luau files in a Roblox project
-- if rojo_project() then
-- 	vim.filetype.add({
-- 		extension = {
-- 			lua = function(path)
-- 				return path:match("%.nvim%.lua$") and "lua" or "luau"
-- 			end,
-- 		},
-- 	})
-- end
-- local function get_capabilities()
-- 	local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
--
-- 	-- Enable manually file watcher capability, so luau-lsp will be aware of sourcemap.json changes, this
-- 	-- is done internally in Neovim 0.10+, but only for non Linux systems
-- 	capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
--
-- 	return capabilities
-- end
--
-- local function get_json_schemas()
-- 	local schemas = require("schemastore").json.schemas()
--
-- 	-- Add the rojo json schema for rojo project files
-- 	table.insert(schemas, {
-- 		fileMatch = { "*.project.json" },
-- 		url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
-- 	})
--
-- 	return schemas
-- end
--
-- -- -- Setup lua-ls for your neovim config
-- -- require("lspconfig").lua_ls.setup({
-- -- 	capabilities = get_capabilities(),
-- -- })
