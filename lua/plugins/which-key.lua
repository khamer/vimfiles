return {
    "folke/which-key.nvim",
    config = function()
        vim.opt.timeout = true
        vim.opt.timeoutlen = 300
        require("which-key").setup({
            -- your configuration here
        })
    end,
}
