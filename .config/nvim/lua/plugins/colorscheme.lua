local themes = {
    mfd = {
        light = "mfd",
        dark = "mfd-stealth",
    },

    kanagawa_paper = {
        light = "kanagawa-paper-canvas",
        dark = "kanagawa-paper-ink",
    },
}

require("mfd").setup({})
require("kanagawa-paper").setup({})

-- Defaults
local current_theme = "mfd"
local current_mode = "dark"

local function switch_theme()
    if current_theme == "mfd" then
        current_theme = "kanagawa_paper"
    else
        current_theme = "mfd"
    end

    vim.cmd.colorscheme(themes[current_theme][current_mode])
end

local function switch_mode()
    if current_mode == "dark" then
        current_mode = "light"
    else
        current_mode = "dark"
    end

    vim.cmd.colorscheme(themes[current_theme][current_mode])
end

-- Apply default theme
vim.cmd.colorscheme(themes[current_theme][current_mode])

-- Keymaps
vim.keymap.set("n", "<leader>cs", switch_theme)
vim.keymap.set("n", "<leader>cm", switch_mode)
