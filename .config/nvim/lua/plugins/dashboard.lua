local dashboard = require("dashboard")
local get_header = require("utils.headers")

dashboard.setup({
    theme = "hyper",

    config = {
        header = get_header(2),
    },
})