--KEYMAPS
local keymap = vim.api.nvim_set_keymap

keymap("i", "jk", "<esc>", { noremap = true, silent = true })
keymap("n", "<leader>w", ":set wrap!<cr>", { noremap = true, silent = false })
keymap(
	"n",
	"<leader>z",
	":vsplit ~/.config/dotfiles/nvim<CR>:lcd ~/.config/dotfiles/nvim<CR>",
	{ noremap = true, silent = true }
)
keymap("n", "<c-d>", "<c-d>zz", { noremap = true, silent = false })
keymap("n", "<c-u>", "<c-u>zz", { noremap = true, silent = false })
keymap("n", "n", "nzz", { noremap = true, silent = false })
keymap("n", "N", "Nzz", { noremap = true, silent = false })
keymap("n", "<leader>y", "\"+y", { noremap = true, silent = false })
keymap("v", "<leader>y", "\"+y", { noremap = true, silent = false })
keymap("n", "<bs>", "<c-^>", { noremap = true, silent = false })
keymap("n", "[a", ":prev<cr>", { noremap = true, silent = false })
keymap("n", "]a", ":n<cr>", { noremap = true, silent = false })
keymap("n", "[A", ":first<cr>", { noremap = true, silent = false })
keymap("n", "]A", ":last<cr>", { noremap = true, silent = false })
keymap("n", "'", "`", { noremap = true, silent = false })
keymap("v", "K", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
keymap("v", "J", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
