local which_key = require("which-key")

-------------------------------------------------------------------------------
-- NORMAL
-------------------------------------------------------------------------------
which_key.register({
    [" "] = { "<cmd>nohlsearch<cr>", "Clear Search" },
    ["1"] = { "<cmd>bufdo bdelete<cr>", "Close all files" },

    a = { "<cmd>Alpha<cr>", "Dashboard" },
    b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers", },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files", },
    F = { "<cmd>lua require('telescope.builtin').find_files({ no_ignore = true })<cr>", "Find files (All)" },
    p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    q = { "<cmd>q!<CR>", "Quit" },
    r = { "<cmd>UploadFile<cr>", "Rsync File" },
    w = { "<cmd>w!<CR>", "Save" },

    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
        e = { "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactor" },
        f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
        k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    },
    s = {
        name = "Search",
        g = { "<cmd>Telescope live_grep theme=ivy<cr>", "Live grep" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
    },

    t = {
        name = "Terminal",
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
        t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    },
}, {
    mode = "n",
    prefix = "<leader>",
    silent = true,
    noremap = true,
    nowait = true,
})

which_key.register({
    j = { "<Esc><cmd>'<,'>!python -m json.tool<CR>", "Format JSON" },
}, {
    mode = "v",
    prefix = "<leader>",
    silent = true,
    noremap = true,
    nowait = true,
})
