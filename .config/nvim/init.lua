---@diagnostic disable: undefined-global

require("config.lazy")
local telescope = require("telescope.builtin")

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.expandtab = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.guicursor = "a:block"
vim.g.ayucolor = "dark"
vim.cmd.colorscheme("ayu")

-- ###### COMPLETION ###### --

require("blink.cmp").setup({
	keymap = {
		preset = "default",

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
})

-- ###### LSP ###### --

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("clangd", {})
vim.lsp.config("pyright", {})
vim.lsp.config("bashls", {})

-- ###### DIAGNOSTIC ###### --

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

-- ###### FORMATTING ###### --

require("conform").setup({
	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
		python = { "black" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		lua = { "stylua" },
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- ###### LUALINE ###### --

require("lualine").setup({
	options = { theme = "auto", section_separators = "", component_separators = "" },
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "diagnostics", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

-- ###### KEYMAPS ###### --

-- LSP

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- FORMATTING

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
	})
end)

-- DIAGNOSTIC

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- FILE EXPLORER

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- TELESCOPE

vim.keymap.set("n", "<leader>ff", telescope.find_files)
vim.keymap.set("n", "<leader>fg", telescope.live_grep)
vim.keymap.set("n", "<leader>fb", telescope.buffers)
vim.keymap.set("n", "<leader>fh", telescope.help_tags)

-- TERMINAL

vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
