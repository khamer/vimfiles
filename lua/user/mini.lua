local function requireSetup(name, config)
    local status_ok, plugin = pcall(require, name)
    if not status_ok then
        return
    end
    return plugin.setup(config)
end

requireSetup("mini.cursorword")
requireSetup("mini.ai")
requireSetup("mini.indentscope", { symbol = '▏' })
requireSetup("mini.surround")
requireSetup("mini.trailspace")

vim.api.nvim_set_var('miniindentscope_disable', true)
