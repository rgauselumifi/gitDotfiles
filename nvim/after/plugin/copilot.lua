require("CopilotChat").setup({
	debug = true,
})
vim.keymap.set({ "n", "v" }, "<leader>Cc", "<cmd>CopilotChatToggle<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>Ct", "<cmd>CopilotChatTests<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>Ce", "<cmd>CopilotChatExplain<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>Cf", "<cmd>CopilotChatFix<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>Co", "<cmd>CopilotChatOptimize<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>Cd", ":CopilotChatFixDiagnostic ", { noremap = true, silent = false })
vim.keymap.set({ "n", "v" }, "<leader>Cs", "<cmd>CopilotChatCommitStaged<cr>", { noremap = true, silent = true })
