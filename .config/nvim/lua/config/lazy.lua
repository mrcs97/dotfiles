local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Themes
	{ "kungfusheep/mfd.nvim", lazy = false },
	{ "srcery-colors/srcery-vim" },

	-- Features
	{ "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-tree/nvim-tree.lua", version = "*", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "terrortylor/nvim-comment" },
	{ "akinsho/toggleterm.nvim", version = "*" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "lewis6991/gitsigns.nvim" },

	-- Session
	{ "folke/persistence.nvim", event = "BufReadPre" },

	-- LSP & Fromatting
	{ "neovim/nvim-lspconfig" },
	{ "mason-org/mason.nvim" },
	{ "mason-org/mason-lspconfig.nvim" },
	{ "saghen/blink.cmp", version = "1.*", dependencies = "rafamadriz/friendly-snippets" },
	{ "stevearc/conform.nvim" },
	{ "windwp/nvim-autopairs", event = "InsertEnter" },
	{ "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },
})
