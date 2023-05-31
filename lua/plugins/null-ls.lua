return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.code_actions.eslint_d,
                -- null_ls.builtins.code_actions.refactoring,

                null_ls.builtins.completion.luasnip,
                -- null_ls.builtins.completion.spell,

                null_ls.builtins.diagnostics.dotenv_linter,
                -- null_ls.builtins.diagnostics.eslint,
                null_ls.builtins.diagnostics.eslint_d,
                -- this is an angry plugin null_ls.builtins.diagnostics.jshint,
                null_ls.builtins.diagnostics.jsonlint,
                null_ls.builtins.diagnostics.php,
                null_ls.builtins.diagnostics.stylelint,
                -- null_ls.builtins.diagnostics.tidy,
                null_ls.builtins.diagnostics.tsc,
                null_ls.builtins.diagnostics.twigcs,

                -- null_ls.builtins.formatting.deno_fmt,
                -- null_ls.builtins.formatting.eslint,
                null_ls.builtins.formatting.eslint_d,
                null_ls.builtins.formatting.jq,
                -- null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.prettierd,
                -- null_ls.builtins.formatting.rome,
                -- null_ls.builtins.formatting.standardjs,
                -- null_ls.builtins.formatting.standardts,
                null_ls.builtins.formatting.stylua,
            },
        })
    end,
}
