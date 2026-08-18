

require("bufferline").setup({}) -- bufferline
require("nvim-autopairs").setup({}) -- autopairs
require("gitsigns").setup({}) -- gitsigns
require("nvim-tree").setup({})
require("nvim_comment").setup({ create_mappings = false }) --comment

vim.api.nvim_create_autocmd("FileType", {
	pattern = "dashboard",
	callback = function()
		vim.keymap.set("n", "q", "<cmd>qa<cr>", {
			buffer = true,
			silent = true,
		})
	end,
})

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

