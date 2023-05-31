return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            theme = 'tokyonight',
            winbar = {
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    },
                },
            },
            inactive_winbar = {
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    },
                },
            },
        })
    end,
}
