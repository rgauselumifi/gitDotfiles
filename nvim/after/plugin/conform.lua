require("conform").setup({
	formatters_by_ft = {
		lua = { { "stylua" } },
		javascript = { { "eslint_d" } },
		typescript = { { "eslint_d" } },
		javascriptreact = { { "eslint_d" } },
		typescriptreact = { { "eslint_d" } },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 100000,
		lsp_fallback = false,
	},
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
-- 	command = "EslintFixAll",
-- })
