--KEYMAPS
local keymap = vim.api.nvim_set_keymap

keymap("i", "jk", "<esc>", { noremap = true, silent = true })
keymap("n", "<leader>w", ":set wrap!<cr>", { noremap = true, silent = false })
keymap("n", "<c-]>", "<c-]>zz", { noremap = true, silent = true })
keymap("n", "<c-t>", "<c-t>zz", { noremap = true, silent = true })
keymap("n", "<leader>s", ":Oil<cr>", { noremap = true, silent = true })
keymap("n", "<leader>b", ":b ", { noremap = true, silent = false })
keymap("n", ",b", ":ls<cr>:b ", { noremap = true, silent = false })
keymap("n", "<leader>f", ":find ", { noremap = true, silent = false })
keymap("n", "<leader>g", ":grep ", { noremap = true, silent = false })
keymap("n", "<leader>z", ":e $MYVIMRC<cr>", { noremap = true, silent = true })
keymap("n", "<leader>Z", ":so $MYVIMRC<cr>", { noremap = true, silent = true })
keymap("n", "<c-k>", ":cp<CR>", { noremap = true, silent = false })
keymap("n", "<c-j>", ":cn<CR>", { noremap = true, silent = false })
keymap("n", "[a", ":prev<cr>", { noremap = true, silent = false })
keymap("n", "]a", ":n<cr>", { noremap = true, silent = false })
keymap("n", "[A", ":first<cr>", { noremap = true, silent = false })
keymap("n", "]A", ":last<cr>", { noremap = true, silent = false })
keymap("n", "]b", ":bnext<cr>", { noremap = true, silent = false })
keymap("n", "[b", ":bprevious<cr>", { noremap = true, silent = false })
keymap("n", "<bs>", "<c-^>", { noremap = true, silent = false })
keymap("n", "<c-p>", ":lprevious<CR>", { noremap = true, silent = false })
keymap("n", "<c-n>", ":lnext<CR>", { noremap = true, silent = false })
keymap("n", "<leader>c", ":cw<cr>", { noremap = true, silent = false })
keymap("n", "<leader>l", ":lcl<cr>", { noremap = true, silent = false })
keymap("n", "'", "`", { noremap = true, silent = false })
keymap("n", "<leader>/", ":g//#<left><left>", { noremap = true, silent = false })
keymap("v", "J", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
keymap("v", "K", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })

keymap("v", "<leader>y", ":OSCYankVisual<cr>", { noremap = true, silent = false })
vim.api.nvim_set_keymap(
	"n",
	"<leader>z",
	":vsplit ~/.config/gitDotfiles/nvim<CR>:lcd ~/.config/gitDotfiles/nvim<CR>",
	{ noremap = true, silent = true }
)
keymap(
	"n",
	"<leader>m",
	":compiler tsc<cr>:silent! set makeprg=npx\\ tsc\\ --noEmit<cr>:make ",
	{ noremap = true, silent = false }
)
keymap("n", "<c-g>", ":Git", { noremap = true, silent = false })
