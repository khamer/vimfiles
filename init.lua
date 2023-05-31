require "user.impatient"
require "user.options"
require "user.keymaps"
require "user.upload"

-- folke/lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- folke/lazy.nvim plugins
require("lazy").setup("plugins")
require("user.which-keys")

vim.cmd [[ colorscheme tokyonight-storm ]]
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = "#29a4bd" })
