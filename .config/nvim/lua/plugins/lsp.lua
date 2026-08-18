-- Completion
local blink = require("blink.cmp")

blink.setup({
	keymap = {
		preset = "default",

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
})

-- LSP
require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"pyright",
		"bashls",
	},
})

vim.lsp.config("*", {
	capabilities = blink.get_lsp_capabilities(),
})

vim.lsp.enable({
	"clangd",
	"pyright",
	"bashls",
})

-- Treesitter
local treesitter = require("nvim-treesitter")

treesitter.setup({})

treesitter.install({
	"c",
	"cpp",
	"lua",
	"python",
	"bash",
})

-- Formatting
local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
		python = { "black" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		lua = { "stylua" },
	},

	format_on_save = {
		timeout_ms = 100,
		lsp_fallback = true,
	},
})

vim.keymap.set("n", "<leader>f", function()
	conform.format({
		async = true,
		lsp_fallback = true,
	})
end)