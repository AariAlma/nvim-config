return {
	"stevearc/conform.nvim",
	config = function()
		vim.g.disable_autoformat = false
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat then
					return
				end
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end,
			notify_on_error = true,
		})

		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({ async = true, lsp_format = "never" })
		end, { desc = "Format File" })
	end,
}
