-- telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")

-- file tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")

-- comment toggle
vim.keymap.set({ "n", "v" }, "<Leader>/", ":CommentToggle<CR>")

-- terminal
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- formatting
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({
		lsp_fallback = true, -- fallback to lsp formatter
	})
end)
