require("fzf-lua").setup({
	"default",
	winopts = {
		fullscreen = false,
		preview = {
			layout = "horizontal",
			horizontal = "right:60%",
			winopts = {},
		},
	},
	keymap = {
		fzf = {
			["ctrl-q"] = "toggle-all",
		},
	},
	files = {
		previewer = false,
	},
	buffers = {
		previewer = false,
	},
})
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>g",
	"<cmd>lua require('fzf-lua').live_grep()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>b",
	"<cmd>lua require('fzf-lua').buffers()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>Fc",
	"<cmd>lua require('fzf-lua').colorschemes()<CR>",
	{ noremap = true, silent = true }
)
