return {
    "rafamadriz/friendly-snippets",
    dependencies = { "L3MON4D3/LuaSnip" },
    config = function()
        local luasnip = require("luasnip")
        luasnip.filetype_extend('vue', {'vue'})
        luasnip.filetype_extend('twig', {'twig'})
    end,
}
