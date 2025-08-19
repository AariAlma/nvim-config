return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.clangd.setup({ capabilities = capabilities })
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
