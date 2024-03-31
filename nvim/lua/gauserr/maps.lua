--KEYMAPS
local keymap = vim.api.nvim_set_keymap

keymap("i", "jk", "<esc>", { noremap = true, silent = true })

-- keymap("n", "<leader>c", ":lcl<cr>:ccl<cr>", { noremap = true, silent = true })
-- keymap("n", "<leader>b", ":b ", { noremap = true, silent = false })
-- keymap("n", "<leader>f", ":find ", { noremap = true, silent = false })
-- keymap("n", "<leader>g", ":grep ", { noremap = true, silent = false })
keymap("n", "<leader>G", ":Git ", { noremap = true, silent = false })
keymap(
	"n",
	"<leader>m",
	":compiler tsc<cr>:silent! set makeprg=npx\\ tsc\\ --noEmit<cr>:make ",
	{ noremap = true, silent = false }
)
keymap("n", "<leader>q", ":cw<cr>", { noremap = true, silent = false })
keymap("n", "<leader>w", ":set wrap!<cr>", { noremap = true, silent = false })
keymap(
	"n",
	"<leader>z",
	":vsplit ~/.config/gitDotfiles/nvim<CR>:lcd ~/.config/gitDotfiles/nvim<CR>",
	{ noremap = true, silent = true }
)
keymap("n", "<leader>/", ":g//#<left><left>", { noremap = true, silent = false })
keymap("n", "<c-]>", "<c-]>", { noremap = true, silent = true })
keymap("n", "<c-t>", "<c-t>", { noremap = true, silent = true })
keymap("n", "<c-k>", ":cp<CR>", { noremap = true, silent = false })
keymap("n", "<c-j>", ":cn<CR>", { noremap = true, silent = false })
-- keymap("n", "<c-p>", ":lprevious<CR>", { noremap = true, silent = false })
-- keymap("n", "<c-n>", ":lnext<CR>", { noremap = true, silent = false })
keymap("n", "<c-d>", "<c-d>zz", { noremap = true, silent = false })
keymap("n", "<c-u>", "<c-u>zz", { noremap = true, silent = false })
keymap("n", "n", "nzz", { noremap = true, silent = false })
keymap("n", "N", "Nzz", { noremap = true, silent = false })
keymap("n", "<bs>", "<c-^>", { noremap = true, silent = false })
keymap("n", ",b", ":ls<cr>:b ", { noremap = true, silent = false })
keymap("n", "[p", ":prev<cr>", { noremap = true, silent = false })
keymap("n", "]p", ":n<cr>", { noremap = true, silent = false })
keymap("n", "[P", ":first<cr>", { noremap = true, silent = false })
keymap("n", "]P", ":last<cr>", { noremap = true, silent = false })
keymap("n", "]b", ":bnext<cr>", { noremap = true, silent = false })
keymap("n", "[b", ":bprevious<cr>", { noremap = true, silent = false })
keymap("n", "'", "`", { noremap = true, silent = false })
keymap("n", "[b", ":bprevious<cr>", { noremap = true, silent = false })
keymap("n", "[b", ":bprevious<cr>", { noremap = true, silent = false })

keymap("v", "<leader>y", ":OSCYankVisual<cr>", { noremap = true, silent = false })
keymap("v", "K", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
keymap("v", "J", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
keymap("t", "jk", "<C-\\><C-N>", { noremap = true, silent = true })
