return {
    "mrjones2014/legendary.nvim",
    tag = "v2.1.0",
    config = function()
        require("legendary").setup({
            which_key = {
                auto_register = true,
            },
        })
    end,
}
