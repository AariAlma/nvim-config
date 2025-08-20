return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		require("mason").setup({
			PATH = "prepend",
		})
		-- Clangd
		lspconfig.clangd.setup({
			cmd = {
				"clangd",
				"--background-index",
				"--pch-storage=memory",
				"--all-scopes-completion",
				"--pretty",
				"--header-insertion=never",
				"-j=4",
				"--header-insertion-decorators",
				"--function-arg-placeholders",
				"--completion-style=detailed",
			},
			filetypes = { "c", "cpp", "objc", "objcpp" },
			root_dir = require("lspconfig").util.root_pattern("src"),
			init_option = { fallbackFlags = { "-std=c++2a" } },
			capabilities = capabilities,
			single_file_support = true,
		})
		-- Lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }, -- Recognize 'vim' as a global variable
					},
					workspace = {
						library = {
							vim.api.nvim_get_runtime_file("", true),
							"${3rd}/love2d/library",
						}, -- Include Neovim runtime files
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,
}
