require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		javascript = { { "eslint_d", "prettierd", "prettier" } },
		javascriptreact = { { "eslint_d", "prettierd", "prettier" } },
		typescript = { { "eslint_d", "prettierd", "prettier" } },
		typescriptreact = { { "eslint_d", "prettierd", "prettier" } },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 100000,
		lsp_fallback = true,
	},
})
