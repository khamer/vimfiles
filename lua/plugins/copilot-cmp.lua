return {
    "zbirenbaum/copilot-cmp",
    requires = { "zbirenbaum/copilot.lua" },
    config = function()
        require("copilot_cmp").setup({
            formatters = {
                insert_text = require("copilot_cmp.format").remove_existing
            }
        })
    end,
}
