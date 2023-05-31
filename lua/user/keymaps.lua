-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

local function defineTextObject(sym)
    keymap("v", "i" .. sym, ":<C-u>silent! normal! T" .. sym .. "vt" .. sym .. "<CR>", opts)
    keymap("v", "a" .. sym, ":<C-u>silent! normal! F" .. sym .. "vf" .. sym .. "<CR>", opts)
    keymap("o", "i" .. sym, ":normal vi" .. sym .. "<CR>", opts)
    keymap("o", "a" .. sym, ":normal va" .. sym .. "<CR>", opts)
    keymap("n", "di" .. sym, ":normal va" .. sym .. "c" .. sym .. "<ESC>", opts)
    keymap("n", "da" .. sym, ":normal va" .. sym .. "c" .. sym .. "<ESC>", opts)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-------------------------------------------------------------------------------
-- NORMAL
-------------------------------------------------------------------------------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<C-pageup>", ":bnext<CR>", opts)
keymap("n", "<C-pagedown>", ":bprevious<CR>", opts)

-- Dismiss search highlighting
keymap("n", "<leader><space>", ":nohlsearch<CR>", opts)

-- Close all buffers, panes, etc
keymap("n", "<leader>1", ":bufdo Bdelete<CR>:only<CR>", opts)


-------------------------------------------------------------------------------
-- VISUAL
-------------------------------------------------------------------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-------------------------------------------------------------------------------
-- TEXT OBJECTS
-------------------------------------------------------------------------------
defineTextObject("#")
defineTextObject("%")
defineTextObject("*")
defineTextObject("+")
defineTextObject(",")
defineTextObject("-")
defineTextObject(".")
defineTextObject("/")
defineTextObject(":")
defineTextObject(";")
defineTextObject("<bar>")
defineTextObject("<bslash>")
defineTextObject("_")
defineTextObject("`")

function select_indent(around)
    local start_indent = vim.fn.indent(vim.fn.line('.'))
    local blank_line_pattern = '^%s*$'

    if string.match(vim.fn.getline('.'), blank_line_pattern) then
        return
    end

    if vim.v.count > 0 then
        start_indent = start_indent - vim.o.shiftwidth * (vim.v.count - 1)
        if start_indent < 0 then
            start_indent = 0
        end
    end

    local prev_line = vim.fn.line('.') - 1
    local prev_blank_line = function(line) return string.match(vim.fn.getline(line), blank_line_pattern) end
    while prev_line > 0 and (prev_blank_line(prev_line) or vim.fn.indent(prev_line) >= start_indent) do
        vim.cmd('-')
        prev_line = vim.fn.line('.') - 1
    end
    if around then
        vim.cmd('-')
    end

    vim.cmd('normal! 0V')

    local next_line = vim.fn.line('.') + 1
    local next_blank_line = function(line) return string.match(vim.fn.getline(line), blank_line_pattern) end
    local last_line = vim.fn.line('$')
    while next_line <= last_line and (next_blank_line(next_line) or vim.fn.indent(next_line) >= start_indent) do
        vim.cmd('+')
        next_line = vim.fn.line('.') + 1
    end
    if around then
        vim.cmd('+')
    end
end

for _,mode in ipairs({ 'x', 'o' }) do
    vim.api.nvim_set_keymap(mode, 'ii', ':<c-u>lua select_indent()<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap(mode, 'ai', ':<c-u>lua select_indent()<cr>', { noremap = true, silent = true })
end
