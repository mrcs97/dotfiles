vim.opt.encoding = "utf-8" -- set encoding
vim.opt.number = true -- enable line numbers
vim.opt.relativenumber = true -- relative line numbers

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.autoindent = true -- auto indentation
vim.opt.cursorline = true -- highlight line cursor is on
vim.opt.list = true       -- show tab characters and trailing whitespaces

vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- unless capital letter in search

vim.opt.hlsearch = false  -- do not highlight all matches on previous search pattern
vim.opt.incsearch = true  -- incrementally highlight searches as you type

vim.opt.termguicolors = true

vim.opt.scrolloff = 8 -- minimum number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minimum number of columns to keep above and below the cursor

-- Diagnostics
vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = ">>",
			[vim.diagnostic.severity.WARN] = "⚠",
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.opt.updatetime = 100
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, {
			focus = false,
			scope = "cursor",
		})
	end,
})