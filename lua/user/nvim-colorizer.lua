local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup({
    filetypes = { "*" },
    user_default_options = {
        -- mode = "virtualtext",
        css = true,
        css_fn = true,
        tailwind = "lsp",
        sass = {
            enable = true,
        },
    },
})
