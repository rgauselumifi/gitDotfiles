require("oil").setup({
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
	},
})
vim.keymap.set("n", "<leader>s", "<cmd>lua require('oil').open()<cr>", { noremap = true, silent = true })
