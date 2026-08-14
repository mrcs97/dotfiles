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
	-- { "ayu-theme/ayu-vim" },
	-- { "shatur/neovim-ayu" },
	{ "nvimdev/dashboard-nvim", event = "VimEnter", lazy = false, dependencies = "nvim-tree/nvim-web-devicons" },
	{ "aejkatappaja/cendre" },
	{ "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-tree/nvim-tree.lua", version = "*", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "terrortylor/nvim-comment" },
	{ "akinsho/toggleterm.nvim", version = "*" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "lewis6991/gitsigns.nvim" },
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
	{ "neovim/nvim-lspconfig" }, -- Neovim LSP API
	{ "mason-org/mason.nvim" }, -- LSP installer, etc.
	{ "mason-org/mason-lspconfig.nvim" }, -- Neovim-Mason bridge
	{ "saghen/blink.cmp", version = "1.*", dependencies = "rafamadriz/friendly-snippets" },
	{ "stevearc/conform.nvim" }, -- Formatting
	{ "windwp/nvim-autopairs", event = "InsertEnter" }, -- (){}[]
	{ "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" }, -- Better parsing and syntaxing
})
