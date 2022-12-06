local filename = nil

local function on_exit(_, code)
    vim.notify("Uploaded " .. filename .. "(" .. code .. ")")
end

function Upload(file)
    if file == nil then
        filename = vim.api.nvim_buf_get_name(0)
    else
        filename = file
    end
    if filename ~= '' then
        vim.fn.jobstart({'upload', filename }, { on_exit = on_exit })
    else
        vim.notify("Unnamed buffer cannot be uploaded.")
    end
end

vim.cmd[[ command! UploadFile lua Upload() ]]
vim.cmd[[ command! UploadFolder lua Upload(vim.fn.expand '%:h') ]]
vim.cmd[[ command! UploadRoot lua Upload(vim.loop.cwd()) ]]
-- vim.api.nvim_add_user_command('UploadFile', 'lua Upload()')
-- vim.api.nvim_add_user_command('UploadFolder', 'lua Upload(vim.fn.expand \'%:h\')')
-- vim.api.nvim_add_user_command('UploadRoot', 'lua Upload(vim.loop.cwd())')
