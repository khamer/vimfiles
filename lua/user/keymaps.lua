local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<C-pageup>", ":bnext<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<C-pagedown>", ":bprevious<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Dismiss search highlighting
keymap("n", "<leader><space>", ":nohlsearch<CR>", opts)

-- Close all buffers, panes, etc
keymap("n", "<leader>1", ":bufdo Bdelete<CR>:only<CR>", opts)

-- Insert --

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Text objects
keymap("v", "i/", ":<C-u>silent! normal! T/vt/<CR>", opts)
keymap("v", "a/", ":<C-u>silent! normal! F/vf/<CR>", opts)
keymap("v", "i_", ":<C-u>silent! normal! T_vt_<CR>", opts)
keymap("v", "a_", ":<C-u>silent! normal! F_vf_<CR>", opts)

keymap("o", "i/", ":normal vi/<CR>", {})
keymap("o", "a/", ":normal va/<CR>", {})
keymap("o", "i_", ":normal vi_<CR>", {})
keymap("o", "a_", ":normal va_<CR>", {})

keymap("n", "di/", ":normal va/c/<ESC>", {})
keymap("n", "da/", ":normal va/c/<ESC>", {})
keymap("n", "di_", ":normal va_c_<ESC>", {})
keymap("n", "da_", ":normal va_c_<ESC>", {})

-- testing
OpenDiagFloat = function ()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  vim.diagnostic.open_float({focusable = false})
end

vim.cmd("autocmd CursorHold * lua OpenDiagFloat()")
