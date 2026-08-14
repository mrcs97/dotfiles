vim.g.ayucolor = "dark"
-- vim.cmd.colorscheme("ayu") -- set color theme (ayu-theme/ayu-vim)
-- vim.cmd.colorscheme("ayu-dark") -- set color theme (shatur/neovim-ayu)
vim.cmd.colorscheme("cendre")

require("bufferline").setup({}) -- bufferline
require("nvim-autopairs").setup({}) -- autopairs
require("gitsigns").setup({}) -- gitsigns

require("nvim_comment").setup({ create_mappings = false }) --comment

-- dashboard
local header_path = "/lua/plugins/test.txt"
require("dashboard").setup({
	config = {
		header = vim.fn.readfile(vim.fn.stdpath("config") .. header_path),
	},
})
-- https://emojicombos.com/dot-art-generator

-- terminal
require("toggleterm").setup({
	direction = "float",
	float_opts = {
		border = "curved",
	},
})

-- lua line
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

-- tree
require("nvim-tree").setup({})

-- blink.cmp
require("blink.cmp").setup({
	keymap = {
		preset = "default",

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
})

-- LSP
require("mason").setup({})
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"pyright",
		"bashls",
	},
})

vim.lsp.enable({
	"clangd",
	"pyright",
	"bashls",
})

-- Treesitter
require("nvim-treesitter").setup({})

require("nvim-treesitter").install({
	"c",
	"cpp",
	"lua",
	"python",
	"bash",
})

-- formatting
require("conform").setup({
	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
		python = { "black" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		lua = { "stylua" },
	},

	-- format on save (:w)
	format_on_save = {
		timeout_ms = 100,
		lsp_fallback = true,
	},
})
