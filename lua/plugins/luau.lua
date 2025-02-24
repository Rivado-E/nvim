local function rojo_project()
	return vim.fs.root(0, function(name)
		return name:match(".+%.project%.json$")
	end)
end

-- [[ Luau filetype detection ]]
-- Automatically recognise .lua as luau files in a Roblox project
if rojo_project() then
	vim.filetype.add({
		extension = {
			lua = function(path)
				return path:match("%.nvim%.lua$") and "lua" or "luau"
			end,
		},
	})
end
local function get_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

	-- Enable manually file watcher capability, so luau-lsp will be aware of sourcemap.json changes, this
	-- is done internally in Neovim 0.10+, but only for non Linux systems
	capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

	return capabilities
end

local function get_json_schemas()
	local schemas = require("schemastore").json.schemas()

	-- Add the rojo json schema for rojo project files
	table.insert(schemas, {
		fileMatch = { "*.project.json" },
		url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
	})

	return schemas
end
-- Luau support
return {
	"lopi-py/luau-lsp.nvim",
	config = function()
		-- We call `require("luau-lsp").setup` instead of `require("lspconfig").luau_lsp.setup` because luau-lsp.nvim will
		-- add extra features to luau-lsp, so we don't need to call lspconfig's setup
		--
		-- See https://github.com/lopi-py/luau-lsp.nvim
		require("luau-lsp").setup({
			-- platform = {
			-- 	type = rojo_project() and "roblox" or "standard",
			-- },
			platform = {
				type = "roblox",
			},
			-- types = {
			-- 	roblox_security_level = "PluginSecurity",
			-- },
			plugin = {
				enabled = true,
			},
			sourcemap = {
				enabled = true,
				autogenerate = true, -- automatic generation when the server is attached
				rojo_project_file = "default.project.json",
				sourcemap_file = "sourcemap.json",
			},
			settings = {
				Lua = {
					completion = {
						enable = true,
					},
					diagnostics = {
						globals = { "game", "workspace", "script", "require", "shared", "workspace", "Enum" },
					},
				},
			},
			server = {
				capabilities = get_capabilities(),
				settings = {
					["luau-lsp"] = {
						ignoreGlobs = { "**/_Index/**", "node_modules/**" },
						completion = {
							imports = {
								enabled = true,
								ignoreGlobs = { "**/_Index/**", "node_modules/**" },
							},
						},
						require = {
							-- luau-lsp does not yet support .luaurc aliases, but we can use a helper function included in
							-- luau-lsp.nvim
							-- directoryAliases = require("luau-lsp").aliases(),
						},
					},
				},
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
