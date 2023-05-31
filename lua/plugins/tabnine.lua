return {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    config = function()
        require('tabnine').setup({
            disable_auto_comment=true,
            accept_keymap="<C-l>",
            dismiss_keymap = "<C-]>",
            debounce_ms = 800,
            suggestion_color = {gui = "#a080c0", cterm = 244},
            exclude_filetypes = {"TelescopePrompt"}
        })
    end,
}
