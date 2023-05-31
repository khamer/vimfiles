return {
    "David-Kunz/cmp-npm",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('cmp-npm').setup()
    end,
}
