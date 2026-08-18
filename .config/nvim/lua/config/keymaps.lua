-- <leader> = space
vim.g.mapleader = " "

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<CR>") -- next
vim.keymap.set("n", "<leader>p", ":bp<CR>") -- previous
vim.keymap.set("n", "<leader>x", ":bd<CR>") -- delete

-- window navigation
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>") -- vertical split
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>") -- horizontal split

vim.keymap.set("n", "<C-a>", "<C-w>h") -- move to left window
vim.keymap.set("n", "<C-d>", "<C-w>l") -- move to right window
vim.keymap.set("n", "<C-s>", "<C-w>j") -- move to lower window
vim.keymap.set("n", "<C-w>", "<C-w>k") -- move to upper window

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yank to clipboard

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

---------- plugin specific keymaps ----------

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
