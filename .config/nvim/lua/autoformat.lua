local vim = _G.vim
local api = vim.api
local lsp_formatter = {}

-- Schema:
-- 1: filetype
-- 2: formatter types
-- 3: formatter command
local formatters = {
    -- python = "black -q - < %f",
    python = "black %f",
    lua = lsp_formatter,
}

local state = {
    formatters = {},
    is_on = true
}

local function toggle(hint)
    if hint == nil then
        state.is_on = not state.is_on
    else
        state.is_on = hint
    end
end

local format_current_buffer = function()
    local filetype = vim.bo.filetype
    local format_type = formatters[filetype]

    -- no formatter
    if format_type == nil then
        return
    end

    -- lsp formatter
    if format_type == lsp_formatter then
        vim.lsp.buf.format()
        vim.api.nvim_command("echo 'Formatted with LSP Formatter'")
        return
    end

    -- the command based formatter
    local current_path = vim.fn.expand("%")
    local cmd = format_type:gsub("%%f", current_path)

    -- formatted contents
    local lines = vim.fn.system(cmd)
    vim.api.nvim_command("e!")
end

_G.custom = {}
_G.custom.format = format_current_buffer
vim.api.nvim_create_user_command("MyAutoFormat", "lua _G.custom.format()", {})
vim.api.nvim_create_autocmd("BufWrite", { buffer = 0, callback = format_current_buffer })

return {
    format = format_current_buffer,
    lsp_formatter = lsp_formatter,
}
